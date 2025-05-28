<?php

namespace Database\Factories;

use App\Models\Post;
use App\Models\User;
use App\Models\SavedPost;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\SavedPost>
 */
class SavedPostFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        do {
            $userId = User::inRandomOrder()->value('id');
            $postId = Post::inRandomOrder()->value('id');
        } while (
            SavedPost::where('user_id', $userId)
            ->where('post_id', $postId)
            ->exists()
        );

        return [
            'user_id'    => $userId,
            'post_id'    => $postId,
        ];
    }

    public function withUser(User $user): Factory
    {
        return $this->state(fn() => [
            'user_id' => $user->id,
        ]);
    }
}
