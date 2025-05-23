<?php

use App\Models\Post;
use App\Models\Tag;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\TagController;
use App\Http\Controllers\PostController;
use App\Http\Controllers\ProfileController;

Route::get('/', function () {
    return view('home', [
        'title' => 'Home',
        'posts' => Post::all(),
    ]);
});

Route::get('/posts/{id}/{slug}', [PostController::class, 'show']);

Route::get('/tags/{tag}', [TagController::class, 'show']);

Route::get('/dashboard', function () {
    return view('dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');

    // Create Post Route
    Route::get('/posts/create', function () {
        return view('post.create', [
            'title' => 'Create Post',
        ]);
    });
    Route::post('/posts/create', [PostController::class, 'store']);
});
require __DIR__ . '/auth.php';
