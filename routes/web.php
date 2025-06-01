<?php

use App\Models\Tag;
use App\Models\Post;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\TagController;
use App\Http\Controllers\PostController;
use App\Http\Controllers\CommentController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\MessagesController;
use App\Http\Controllers\SettingsController;
use App\Http\Controllers\CommunityController;
use App\Http\Controllers\Auth\GoogleController;
use App\Http\Controllers\UserFollowController;

Route::get('/', function () {
    return view('home', [
        'title' => 'Home',
        'posts' => Post::all(),
    ]);
})->name('home');

Route::get('/explore', function () {
    return view('explore', [
        'title' => 'Explore',
        'posts' => Post::all(),
    ]);
})->name('explore');

Route::get('/communities', [CommunityController::class, 'index'])->name('community.index');

Route::middleware('auth')->group(function () {
    // Community creation routes - these must come BEFORE the {community} route
    Route::get('/communities/create', [CommunityController::class, 'create'])->name('communities.create');
    Route::post('/communities', [CommunityController::class, 'store'])->name('communities.store');

    // Profiles Routes
    Route::get('/settings', [SettingsController::class, 'index'])->name('settings');
    Route::get('/profile', [ProfileController::class, 'index'])->name('profile.index');
    Route::get('/profile/edit', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');

    // Notifications Routes
    Route::get('/notifications', function () {
        return view('notifications', [
            'title' => 'Notifications'
        ]);
    })->name('notifications');

    // Messages Routes
    Route::get('/messages', [MessagesController::class, 'index'])->name('messages');

    // Post routes
    Route::post('/posts', [PostController::class, 'store'])->name('posts.store');
    Route::get('/posts/create', [PostController::class, 'create'])->name('posts.create');
    Route::get('/posts/{post:slug}/edit', [PostController::class, 'edit'])->name('posts.edit');
    Route::put('/posts/{post:slug}', [PostController::class, 'update'])->name('posts.update');
    Route::delete('/posts/{post:slug}', [PostController::class, 'destroy'])->name('posts.destroy');


    Route::post('/posts/{post}/save', [PostController::class, 'save'])->name('posts.save');
    Route::get('/posts/{post}/check-saved', [PostController::class, 'checkSaved'])->name('posts.check-saved');
    Route::get('/saved-posts', [PostController::class, 'savedPost'])->name('posts.saved');
    // Like routes
    Route::post('/posts/{post}/like', [PostController::class, 'toggleLike'])->name('posts.like');
    Route::post('/comments/{comment}/like', [CommentController::class, 'toggleLike'])->name('comments.like');

    // Follow routes
    Route::post('/follow/{user_id}', [UserFollowController::class, 'toggleFollow'])->name('user.follow');

    // Community routes
    Route::post('/communities/{community}/join', [CommunityController::class, 'join'])->name('communities.join');

    // Comment routes
    Route::post('/posts/{post}/comments', [CommentController::class, 'store'])->name('comments.store');
    Route::post('/comments/{comment}/replies', [CommentController::class, 'storeReply'])->name('comments.reply');

    // Settings routes
    Route::get('/settings', [SettingsController::class, 'index'])->name('settings');
    Route::put('/settings/profile', [SettingsController::class, 'updateProfile'])->name('settings.profile.update');
    Route::delete('/settings/account', [SettingsController::class, 'deleteAccount'])->name('settings.account.delete');
});

// Public community routes - these must come AFTER the create routes
Route::get('/communities/{community}', [CommunityController::class, 'show'])->name('communities.show');

Route::get('/tags/{tag}', [TagController::class, 'show'])->name('tags.show');

Route::get('/dashboard', function () {
    return view('dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

// Public post routes
Route::get('/posts/{post:slug}', [PostController::class, 'show'])->name('posts.show');

// Community search API route
Route::get('/api/communities/search', [PostController::class, 'searchCommunities'])->name('api.communities.search');

require __DIR__ . '/auth.php';
