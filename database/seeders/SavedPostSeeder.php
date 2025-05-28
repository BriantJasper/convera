<?php

namespace Database\Seeders;

use App\Models\User;
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
        User::all()->each(function (User $user) {
            $postIds = \App\Models\Post::inRandomOrder()
                ->take(rand(1, 5))
                ->pluck('id')
                ->toArray();
            $user->savedPosts()->syncWithoutDetaching($postIds);
        });
    }
}
