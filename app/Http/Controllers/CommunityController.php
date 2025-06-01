<?php

namespace App\Http\Controllers;

use App\Models\Community;
use App\Models\Tag;
use App\Http\Requests\StoreCommunityRequest;
use App\Http\Requests\UpdateCommunityRequest;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

class CommunityController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $communities = Community::with(['tags', 'members', 'owner'])
            ->withCount('members')
            ->latest()
            ->get();

        return view('community.index', [
            'communities' => $communities,
            'title' => 'Communities',
        ]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('community.create', [
            'title' => 'Create Community'
        ]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreCommunityRequest $request)
    {
        try {
            $data = $request->validated();

            // Handle avatar upload
            if ($request->hasFile('avatar')) {
                $avatarPath = $request->file('avatar')->store('community-avatars', 'public');
                $data['avatar'] = $avatarPath;
            }

            // Generate slug from name
            $slug = Str::slug($data['name']);

            // Create the community
            $community = Community::create([
                'name' => $data['name'],
                'slug' => $slug,
                'description' => $data['description'],
                'avatar' => $data['avatar'] ?? null,
                'is_private' => $request->has('is_private'),
                'user_id' => auth()->id()
            ]);

            // Handle tags
            if (!empty($data['tags'])) {
                $tags = array_map('trim', explode(',', $data['tags']));
                foreach ($tags as $tagName) {
                    $tag = Tag::firstOrCreate(['name' => $tagName]);
                    $community->tags()->attach($tag->id);
                }
            }

            // Add creator as a member with admin role
            $community->members()->attach(auth()->id(), [
                'role' => 'owner',
                'joined_at' => now()
            ]);

            return redirect()->route('community.index')
                ->with('notification', 'Community created successfully!')
                ->with('notificationType', 'success');
        } catch (\Exception $e) {
            return back()->withInput()
                ->with('notification', 'Failed to create community: ' . $e->getMessage())
                ->with('notificationType', 'error');
        }
    }

    /**
     * Display the specified community.
     */
    public function show(Community $community)
    {
        $community->load(['posts.user', 'posts.comments', 'posts.reactions']);

        return view('community.show', [
            'title' => $community->name,
            'community' => $community
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Community $community)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateCommunityRequest $request, Community $community)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Community $community)
    {
        //
    }

    /**
     * Join or leave a community.
     */
    public function join(Community $community)
    {
        $user = auth()->user();

        if ($community->isMember($user)) {
            $community->members()->detach($user->id);
            $message = 'Left community successfully';
            $isMember = false;
        } else {
            $community->members()->attach($user->id, [
                'role' => 'member',
                'joined_at' => now()
            ]);
            $message = 'Joined community successfully';
            $isMember = true;
        }

        if (request()->wantsJson()) {
            return response()->json([
                'message' => $message,
                'isMember' => $isMember,
                'membersCount' => $community->members_count
            ]);
        }

        return back()->with('success', $message);
    }
}
