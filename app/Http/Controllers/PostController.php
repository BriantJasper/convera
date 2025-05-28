<?php

namespace App\Http\Controllers;

use App\Models\Post;
use App\Models\Community;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
use App\Http\Requests\StorePostRequest;
use App\Http\Requests\UpdatePostRequest;

class PostController extends Controller
{

    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return view('posts', [
            'title' => 'Posts',
            'posts' => Post::all()
        ]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('post.create', [
            'title' => 'Create Post',
            'communities' => Community::all()
        ]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'title' => 'required|string|max:255',
            'content' => 'required|string',
            'community_id' => 'required|exists:communities,id',
        ]);

        $slug = Str::slug($request->title);

        // Ensure slug uniqueness
        $count = 1;
        while (Post::where('slug', $slug)->exists()) {
            $slug = Str::slug($request->title) . '-' . $count;
            $count++;
        }

        $post = Post::create([
            'title' => $request->title,
            'content' => $request->content,
            'user_id' => Auth::id(),
            'community_id' => $request->community_id,
            'slug' => $slug
        ]);

        return redirect()->route('posts.show', ['post' => $post->slug])
            ->with('success', 'Post created successfully!');
    }

    /**
     * Display the specified resource.
     */
    public function show(Post $post)
    {
        $post->load(['user', 'community', 'tags', 'comments.user', 'comments.replies.user', 'reactions']);

        return view('post.index', [
            'title' => $post->title,
            'post' => $post
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Post $post)
    {
        // Check if user is authorized to edit this post
        if ($post->user_id !== Auth::id()) {
            return redirect()->route('posts.show', ['id' => $post->id, 'slug' => $post->slug])
                ->with('error', 'You are not authorized to edit this post.');
        }

        return view('post.edit', [
            'title' => 'Edit Post',
            'post' => $post,
            'communities' => Community::all()
        ]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Post $post)
    {
        // Check if user is authorized to update this post
        if ($post->user_id !== Auth::id()) {
            return redirect()->route('posts.show', $post->slug)
                ->with('error', 'You are not authorized to update this post.');
        }

        $request->validate([
            'title' => 'required|string|max:255',
            'content' => 'required|string',
            'community_id' => 'required|exists:communities,id',
        ]);

        $slug = Str::slug($request->title);

        // Ensure slug uniqueness, excluding current post
        $count = 1;
        while (Post::where('slug', $slug)->where('id', '!=', $post->id)->exists()) {
            $slug = Str::slug($request->title) . '-' . $count;
            $count++;
        }

        $post->update([
            'title' => $request->title,
            'content' => $request->content,
            'community_id' => $request->community_id,
            'slug' => $slug,
            'edited_at' => now()
        ]);

        return redirect()->route('posts.show', $post->slug)
            ->with('success', 'Post updated successfully!');
    }

    /**
     * Remove the specified resource in storage.
     */
    public function destroy(Post $post)
    {
        // Check if user is authorized to delete this post
        if ($post->user_id !== Auth::id()) {
            return response()->json([
                'success' => false,
                'message' => 'You are not authorized to delete this post.'
            ], 403);
        }

        try {
            $post->delete();
            return response()->json([
                'success' => true,
                'message' => 'Post deleted successfully!',
                'redirect' => route('home')
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'An error occurred while deleting the post.'
            ], 500);
        }
    }

    public function toggleLike(Post $post)
    {
        $user = \Illuminate\Support\Facades\Auth::user();

        if ($post->isLikedBy($user)) {
            $post->likes()->where('user_id', $user->id)->delete();
            $liked = false;
        } else {
            $post->likes()->create([
                'user_id' => $user->id,
                'type' => 'like'
            ]);
            $liked = true;
        }

        return response()->json([
            'success' => true,
            'liked' => $liked,
            'likes_count' => $post->likes()->count()
        ]);
    }

    public function searchCommunities(Request $request)
    {
        $search = $request->input('search');

        $communities = Community::where('name', 'like', "%{$search}%")
            ->select('id', 'name')
            ->limit(10)
            ->get();

        return response()->json($communities);
    }
}
