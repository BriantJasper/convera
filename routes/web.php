<?php

use App\Models\Post;
use App\Models\Tag;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\TagController;
use App\Http\Controllers\PostController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\Auth\GoogleController;
use App\Http\Controllers\CommunityController;
use App\Http\Controllers\CommentController;

Route::get('/', function () {
    return view('home', [
        'title' => 'Home',
        'posts' => Post::all(),
    ]);
})->name('home');

Route::get('/tags/{tag}', [TagController::class, 'show'])->name('tags.show');

Route::get('/communities/{community}', [CommunityController::class, 'show'])->name('communities.show');

Route::get('/dashboard', function () {
    return view('dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware('auth')->group(function () {
    // Profiles Routes
    Route::get('/profile', [ProfileController::class, 'index'])->name('profile.index');
    Route::get('/profile/edit', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');

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

    // Post routes
    Route::post('/posts', [PostController::class, 'store'])->name('posts.store');
    Route::get('/posts/create', [PostController::class, 'create'])->name('posts.create');
    Route::get('/posts/{post:slug}/edit', [PostController::class, 'edit'])->name('posts.edit');
    Route::put('/posts/{post:slug}', [PostController::class, 'update'])->name('posts.update');
    Route::delete('/posts/{post:slug}', [PostController::class, 'destroy'])->name('posts.destroy');

    // Like routes
    Route::post('/posts/{post}/like', [PostController::class, 'toggleLike'])->name('posts.like');
    Route::post('/comments/{comment}/like', [CommentController::class, 'toggleLike'])->name('comments.like');

    // Comment routes
    Route::post('/posts/{post}/comments', [CommentController::class, 'store'])->name('comments.store');
    Route::post('/comments/{comment}/replies', [CommentController::class, 'storeReply'])->name('comments.reply');
});

// Public post routes
Route::get('/posts/{post:slug}', [PostController::class, 'show'])->name('posts.show');

// Community search API route
Route::get('/api/communities/search', [PostController::class, 'searchCommunities'])->name('api.communities.search');

require __DIR__ . '/auth.php';


