<?php

namespace Database\Factories;

use App\Models\Tag;
use App\Models\User;
use App\Models\Category;
use App\Models\Community;
use Illuminate\Support\Str;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Post>
 */
class PostFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        $title = $this->faker->sentence;
        return [
            'user_id' => User::factory(),
            'community_id' => Community::factory(),
            'title' => $title,
            'slug' => Str::slug($title),
            'content' => $this->faker->paragraphs(3, true),
            'image' => $this->faker->imageUrl(640, 480, 'technics', true),
            'link' => $this->faker->url,
            'category_id' => Category::query()->inRandomOrder()->value('id'),
            'edited_at' => $this->faker->optional()->dateTimeBetween('-1 week', 'now'),
        ];
    }
}
