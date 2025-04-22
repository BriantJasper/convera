<?php

namespace Database\Seeders;

use App\Models\Reaction;
use Illuminate\Database\Seeder;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;

class ReactionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Reaction::factory()->count(50)->create();  // Reactions to posts
        Reaction::factory()->forComment()->count(50)->create();  // Reactions to comments
    }
}
