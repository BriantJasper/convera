<?php

namespace Database\Seeders;

use App\Models\SavedPost;
use Illuminate\Database\Seeder;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;

class SavedPostSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        SavedPost::factory()->count(30)->create(); // User's Saved Post

    }
}
