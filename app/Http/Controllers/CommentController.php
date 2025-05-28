<?php

namespace App\Http\Controllers;

use App\Models\Comment;
use App\Models\Post;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
use App\Http\Requests\StoreCommentRequest;

class CommentController extends Controller
{
    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreCommentRequest $request, Post $post)
    {
        $comment = $post->comments()->create([
            'content' => $request->content,
            'user_id' => Auth::id()
        ]);

        // Load the user relationship for the response
        $comment->load('user');

        return response()->json([
            'success' => true,
            'comment' => $comment
        ]);
    }

    public function storeReply(Request $request, Comment $comment)
    {
        $request->validate([
            'content' => 'required|string|max:1000'
        ]);

        $reply = $comment->replies()->create([
            'content' => $request->content,
            'user_id' => Auth::id(),
            'post_id' => $comment->post_id
        ]);

        return response()->json([
            'success' => true,
            'reply' => $reply->load('user')
        ]);
    }

    public function toggleLike(Comment $comment)
    {
        try {
            $user = Auth::user();

            if (!$user) {
                return response()->json([
                    'success' => false,
                    'message' => 'User not authenticated'
                ], 401);
            }

            Log::info('Toggling like for comment', [
                'comment_id' => $comment->id,
                'user_id' => $user->id
            ]);

            // Check if user already liked this comment
            $existingLike = $comment->likes()->where('user_id', $user->id)->first();

            if ($existingLike) {
                // Unlike the comment
                $existingLike->delete();
                $liked = false;
                Log::info('Comment unliked', ['comment_id' => $comment->id, 'user_id' => $user->id]);
            } else {
                // Like the comment
                $comment->likes()->create([
                    'user_id' => $user->id,
                    'type' => 'like' // Add this if your likes table has a type column
                ]);
                $liked = true;
                Log::info('Comment liked', ['comment_id' => $comment->id, 'user_id' => $user->id]);
            }

            // Get updated like count
            $likesCount = $comment->likes()->count();

            return response()->json([
                'success' => true,
                'liked' => $liked,
                'likes_count' => $likesCount,
            ]);
        } catch (\Exception $e) {
            Log::error('Error toggling comment like', [
                'comment_id' => $comment->id,
                'user_id' => Auth::id(),
                'error' => $e->getMessage(),
                'trace' => $e->getTraceAsString()
            ]);

            return response()->json([
                'success' => false,
                'message' => 'An error occurred while processing your request.',
            ], 500);
        }
    }
}
