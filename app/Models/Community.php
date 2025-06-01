<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Community extends Model
{
    /** @use HasFactory<\Database\Factories\CommunityFactory> */
    use HasFactory;

    protected $fillable = [
        'name',
        'slug',
        'description',
        'rules',
        'user_id',
        'avatar',
        'is_private',
        'is_verified',
        'is_trending'
    ];

    protected $casts = [
        'is_private' => 'boolean',
        'is_verified' => 'boolean',
        'is_trending' => 'boolean'
    ];

    public function tags()
    {
        return $this->belongsToMany(Tag::class, 'community_tags');
    }

    public function members()
    {
        return $this->belongsToMany(User::class, 'community_users')
            ->withPivot('role', 'joined_at')
            ->withTimestamps();
    }

    public function posts()
    {
        return $this->hasMany(Post::class);
    }

    public function owner()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function isMember(User $user): bool
    {
        return $this->members()->where('user_id', $user->id)->exists();
    }

    public function getMembersCountAttribute()
    {
        return $this->members()->count();
    }
}
