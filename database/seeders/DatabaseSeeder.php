<?php

namespace Database\Seeders;

use App\Models\Tag;
// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use App\Models\Post;
use App\Models\User;
use App\Models\Comment;
use App\Models\Category;
use App\Models\Reaction;
use App\Models\Community;
use App\Models\CommunityUser;
use App\Models\SavedPost;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        User::factory()->count(10)->create();
        $this->call(CategorySeeder::class);
        $this->call(TagSeeder::class);
        $this->call(CommunitySeeder::class);
        $this->call(PostSeeder::class);
        $this->call(CommentSeeder::class);
        $this->call(ReactionSeeder::class);
        $this->call(SavedPostSeeder::class);
        $this->call(CommunityUserSeeder::class);


    }
}
