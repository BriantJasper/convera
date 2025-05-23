<?php

namespace App\Models;

use App\Models\Tag;
use App\Models\User;
use App\Models\Comment;
use App\Models\Category;
use App\Models\Reaction;
use App\Models\Community;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Post extends Model
{
    /** @use HasFactory<\Database\Factories\PostFactory> */
    use HasFactory;

    public function tags()
    {
        return $this->belongsToMany(Tag::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function categories()
    {
        return $this->hasMany(Category::class);
    }

    public function community() {
        return $this->belongsTo(Community::class);
    }

    public function reactions()
    {
        return $this->hasMany(Reaction::class);
    }

    public function likes()
    {
        return $this->hasMany(Reaction::class)->where('type', 'like');
    }


    public function comments()
    {
        return $this->hasMany(Comment::class);
    }

    public function savedBy()
    {
        return $this->belongsToMany(
            User::class,
            'saved_posts',
            'post_id',
            'user_id'
        )->withTimestamps();
    }
}
