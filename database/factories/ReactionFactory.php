<?php

namespace Database\Factories;

use App\Models\Post;
use App\Models\User;
use App\Models\Comment;
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
        return [
            'user_id' => User::factory(),
            'post_id' => Post::factory(),
            'comment_id' => null,
            'type' => $this->faker->randomElement(['like', 'dislike']),
        ];
    }

    public function forComment(): Factory
    {
        return $this->state(function () {
            return [
                'post_id' => null,
                'comment_id' => Comment::factory(),
            ];
        });
    }
}
