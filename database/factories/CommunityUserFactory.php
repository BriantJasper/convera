<?php

namespace Database\Factories;

use App\Models\User;
use App\Models\Community;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\CommunityUser>
 */
class CommunityUserFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'community_id' => Community::factory(),
            'user_id'      => User::factory(),
            'role'         => $this->faker->randomElement(['member', 'mod', 'owner']),
            'joined_at'    => $this->faker->dateTimeBetween('-1 year', 'now'),
        ];
    }
}
