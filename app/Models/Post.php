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
use Illuminate\Database\Eloquent\SoftDeletes;

class Post extends Model
{
    /** @use HasFactory<\Database\Factories\PostFactory> */
    use HasFactory, SoftDeletes;

    protected $fillable = [
        'title',
        'content',
        'user_id',
        'community_id',
        'slug',
        'image',
        'link',
        'category_id'
    ];

    protected $casts = [
        'edited_at' => 'datetime',
    ];

    public function tags()
    {
        return $this->belongsToMany(Tag::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function category()
    {
        return $this->belongsTo(Category::class);
    }

    public function community()
    {
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

    public function isLikedBy(User $user): bool
    {
        return $this->likes()->where('user_id', $user->id)->exists();
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
