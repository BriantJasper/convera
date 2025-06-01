<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;

class Tag extends Model
{
    /** @use HasFactory<\Database\Factories\TagFactory> */
    use HasFactory;

    protected $fillable = ['name', 'slug'];

    protected static function boot()
    {
        parent::boot();

        static::creating(function ($tag) {
            $tag->slug = Str::slug($tag->name);
        });
    }

    public function getRouteKeyName()
    {
        return 'slug';
    }

    public function communities()
    {
        return $this->belongsToMany(Community::class);
    }

    public function posts()
    {
        return $this->belongsToMany(Post::class);
    }
}
