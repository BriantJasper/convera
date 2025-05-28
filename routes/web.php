<?php

use App\Models\Post;
use App\Models\Tag;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\TagController;
use App\Http\Controllers\PostController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\Auth\GoogleController;

Route::get('/', function () {
    return view('home', [
        'title' => 'Home',
        'posts' => Post::all(),
    ]);
})->name('home');

Route::get('/posts/{id}/{slug}', [PostController::class, 'show'])->name('posts.show');

Route::get('/tags/{tag}', [TagController::class, 'show'])->name('tags.show');

Route::get('/dashboard', function () {
    return view('dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware('auth')->group(function () {
    // Profiles Routes
    Route::get('/profile', [ProfileController::class, 'index'])->name('profile.index');
    Route::get('/profile/edit', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');

    // Post Route
    Route::get('/post/create', [PostController::class, 'create'])->name('posts.create');

    // Notifications Routes
    Route::get('/notifications', function () {
        return view('notifications.index', [
            'title' => 'Notifications'
        ]);
    })->name('notifications');

    // Messages Routes
    Route::get('/messages', function () {
        return view('messages.index', [
            'title' => 'Messages'
        ]);
    })->name('messages');

    // Create Post Route
    Route::get('/posts/create', function () {
        return view('post.create', [
            'title' => 'Create Post',
        ]);
    });
    Route::post('/posts/create', [PostController::class, 'store']);

});
require __DIR__ . '/auth.php';
