<?php

namespace Database\Factories;

use App\Models\Tag;
use App\Models\User;
use Illuminate\Support\Str;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Community>
 */
class CommunityFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        $name = $this->faker->unique()->words(2, true); // e.g. "Tech Lounge"

        $tagsList = ['programming', 'gaming', 'design', 'news', 'support', 'technology', 'development', 'marketing'];
        return [
            'name' => ucfirst($name),
            'slug' => Str::slug($name),
            'description' => $this->faker->paragraph,
            'rules' => $this->faker->optional()->paragraphs(2, true),
            'user_id' => User::inRandomOrder()->first()->id,
        ];
    }

    public function configure()
    {
        return $this->afterCreating(function ($community) {
            // Attach 1 to 3 random tags to the community
            $tags = Tag::inRandomOrder()->take(rand(1, 3))->pluck('id');
            $community->tags()->attach($tags);
        });
    }
}
