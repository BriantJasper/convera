<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Comment extends Model
{
    /** @use HasFactory<\Database\Factories\CommentFactory> */
    use HasFactory;

    public function configure()
    {
        return $this->afterCreating(function ($comment) {
            // Create a reply for the comment if needed
            $comment->replies()->create(Comment::factory()->make()->toArray());
        });
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }
    public function post()
    {
        return $this->belongsTo(Post::class);
    }
    public function likes()
    {
        return $this->hasMany(Reaction::class)->where('type', 'like');
    }
}
