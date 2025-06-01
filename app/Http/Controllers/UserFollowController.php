<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\UserFollow;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Http\Requests\StoreUserFollowRequest;
use App\Http\Requests\UpdateUserFollowRequest;

class UserFollowController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreUserFollowRequest $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(UserFollow $userFollow)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(UserFollow $userFollow)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateUserFollowRequest $request, UserFollow $userFollow)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(UserFollow $userFollow)
    {
        //
    }

    public function toggleFollow(Request $request, $user_id)
    {
        try {
            $user = Auth::user();
            $followedUser = User::findOrFail($user_id);

            if ($user->isFollowing($followedUser)) {
                // Unfollow
                $user->following()->detach($followedUser->id);
                return response()->json([
                    'status' => 'unfollowed',
                    'message' => 'Unfollowed successfully'
                ]);
            } else {
                // Follow
                $user->following()->attach($followedUser->id);
                return response()->json([
                    'status' => 'followed',
                    'message' => 'Followed successfully'
                ]);
            }
        } catch (\Exception $e) {
            return response()->json([
                'status' => 'error',
                'message' => 'An error occurred while processing your request'
            ], 500);
        }
    }
}
