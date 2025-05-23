<?php

namespace Database\Factories;

use App\Models\Post;
use App\Models\User;
use App\Models\Comment;
use App\Models\Reaction;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Reaction>
 */
class ReactionFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        // keep trying random combos until we find one that isn't taken yet
        do {
            $userId = User::inRandomOrder()->value('id');
            $postId = Post::inRandomOrder()->value('id');
        } while (Reaction::where('user_id', $userId)
            ->where('post_id', $postId)
            ->exists()
        );

        return [
            'user_id' => $userId,
            'post_id' => $postId,
            'comment_id' => null,
            'type' => $this->faker->randomElement(['like', 'dislike']),
        ];
    }

    public function forComment(): Factory
    {
        do {
            $userId    = User::inRandomOrder()->value('id');
            $commentId = Comment::inRandomOrder()->value('id');
        } while (Reaction::where('user_id', $userId)
            ->where('comment_id', $commentId)
            ->exists()
        );

        return $this->state(fn() => [
            'user_id'    => $userId,
            'post_id'    => null,
            'comment_id' => $commentId,
        ]);
    }
}
