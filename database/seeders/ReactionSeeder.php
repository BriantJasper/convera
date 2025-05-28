<?php

namespace Database\Seeders;

use App\Models\Post;
use App\Models\User;
use App\Models\Reaction;
use Illuminate\Support\Arr;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;

class ReactionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // 1) pull all existing IDs
        $userIds = User::pluck('id')->all();
        $postIds = Post::pluck('id')->all();

        // 2) build up a list of unique rows
        $rows = [];
        $seen = []; // track "user-post" strings

        // number of reactions
        $targetCount = 150;
        while (count($rows) < $targetCount) {
            $u = Arr::random($userIds);
            $p = Arr::random($postIds);
            $key = "{$u}-{$p}";

            // skip if already used
            if (in_array($key, $seen, true)) {
                continue;
            }

            $seen[] = $key;
            $rows[] = [
                'user_id'    => $u,
                'post_id'    => $p,
                'comment_id' => null,
                'type'       => Arr::random(['like', 'dislike']),
                'created_at' => now(),
                'updated_at' => now(),
            ];
        }

        // 3) bulk‐insert (no dup errors, because we guaranteed uniqueness)
        DB::table('reactions')->insert($rows);
    }
}
