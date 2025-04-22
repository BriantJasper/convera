<?php

namespace Database\Seeders;

use App\Models\CommunityUser;
use Illuminate\Database\Seeder;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;

class CommunityUserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        CommunityUser::factory()->count(5)->create();
    }
}
