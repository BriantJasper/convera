@extends('partials.main')

@section('import-css')
    <link rel="stylesheet" href="{{ asset('css/savedPost.css') }}">
    <link rel="stylesheet" href="{{ asset('css/post-buttons.css') }}">
    <link rel="stylesheet" href="{{ asset('css/comments.css') }}">
    <link rel="stylesheet" href="{{ asset('css/notification.css') }}">
@endsection

@section('main-content')
    @auth
        <meta name="csrf-token" content="{{ csrf_token() }}">
    @endauth

    <div class="explore-header">
        <h1 class="explore-title">
            <i class="fa fa-bookmark"></i>
            Saved Posts
        </h1>
        <p class="explore-subtitle">
            Your saved posts in one place
        </p>
    </div>

    <div class="posts-feed">
        @forelse ($savedPosts as $post)
            <div class="post" data-post-id="{{ $post->id }}">
                <div class="post-header">
                    <img src="{{ $post->user->avatar ?? asset('images/users.png') }}" alt="{{ $post->user->name }}"
                        class="post-profile-img" />
                    <div class="post-info">
                        <div class="post-author">{{ $post->user->name }}</div>
                        <div class="post-time">
                            {{ $post->created_at->diffForHumans() }} in
                            <a href="{{ route('communities.show', $post->community->id) }}">
                                {{ $post->community->name }}
                            </a>
                        </div>
                    </div>
                    <div class="post-actions-container">
                        @auth
                            <button
                                class="follow-btn {{ auth()->user() && auth()->user()->isFollowing($post->user) ? 'following' : 'not-following' }}"
                                data-post-id="{{ $post->id }}">
                                {{ auth()->user() && auth()->user()->isFollowing($post->user) ? 'Following' : 'Follow' }}
                            </button>
                        @else
                            <button class="follow-btn" onclick="showAuthModal()">
                                Follow
                            </button>
                        @endauth

                        <div class="post-actions-menu relative">
                            <button class="dot-menu-btn">
                                <i class="fa fa-ellipsis-v"></i>
                            </button>
                            <div class="dropdown-menu hidden">
                                @auth
                                    <a href="#" class="save-post-btn saved" data-post-id="{{ $post->id }}">
                                        <i class="fa fa-bookmark fa-solid" style="color: #3b82f6;"></i> Saved
                                    </a>
                                @else
                                    <a href="#" class="save-post-btn" onclick="showAuthModal()">
                                        <i class="fa fa-bookmark"></i> Save
                                    </a>
                                @endauth

                                @if (auth()->user() && auth()->user()->id === $post->user_id)
                                    <a href="{{ route('posts.edit', $post->slug) }}" class="edit-post">
                                        <i class="fa fa-edit"></i> Edit
                                    </a>
                                    <a href="#" class="delete-post" data-post-id="{{ $post->id }}"
                                        data-post-slug="{{ $post->slug }}">
                                        <i class="fa fa-trash"></i> Delete
                                    </a>
                                @endif
                                <a href="#" class="hide-post">
                                    <i class="fa fa-eye-slash"></i> Hide
                                </a>
                                @auth
                                    <a href="#" class="report-post">
                                        <i class="fa fa-flag"></i> Report
                                    </a>
                                @else
                                    <a href="#" class="report-post" onclick="showAuthModal()">
                                        <i class="fa fa-flag"></i> Report
                                    </a>
                                @endauth
                            </div>
                        </div>
                    </div>
                </div>

                <div class="post-content">
                    <a href="{{ route('posts.show', $post->slug) }}">
                        <p>{{ $post->content }}</p>
                        @if ($post->tags->count() > 0)
                            <div class="post-tags">
                                @foreach ($post->tags as $tag)
                                    <a href="{{ route('tags.show', $tag->name) }}"
                                        class="hashtag">#{{ $tag->name }}</a>
                                @endforeach
                            </div>
                        @endif
                    </a>
                </div>

                <div class="post-engagement">
                    <div class="engagement-action">
                        @auth
                            <button
                                class="reaction-btn {{ auth()->user() && $post->isLikedBy(auth()->user()) ? 'liked' : '' }}"
                                data-post-id="{{ $post->id }}">
                                <i class="fa fa-thumbs-up"></i>
                            </button>
                        @else
                            <button class="reaction-btn" onclick="showAuthModal()">
                                <i class="fa fa-thumbs-up"></i>
                            </button>
                        @endauth
                        <span class="like-count">{{ $post->likes->count() }}</span>
                    </div>
                    <div class="engagement-action">
                        @auth
                            <button class="toggle-comments-btn" data-post-id="{{ $post->id }}">
                                <i class="fa fa-comment"></i>
                            </button>
                        @else
                            <button class="toggle-comments-btn" onclick="showAuthModal()">
                                <i class="fa fa-comment"></i>
                            </button>
                        @endauth
                        <span>{{ $post->comments->count() }}</span>
                    </div>
                    <div class="engagement-action">
                        <button class="share-btn" data-post-id="{{ $post->id }}">
                            <i class="fa fa-share"></i> Share
                        </button>
                    </div>
                </div>
            </div>

            <div class="comment-section hidden" data-post-id="{{ $post->id }}">
                @if (Auth::check())
                    <div class="comment-form">
                        <img src="{{ Auth::user()->avatar ?? asset('images/users.png') }}" alt="{{ Auth::user()->name }}"
                            class="comment-profile-img" />
                        <div class="comment-input-box">
                            <textarea class="neu-input" placeholder="Write a comment..."></textarea>
                            <div class="comment-actions">
                                <button class="neu-btn cancel-btn">Cancel</button>
                                <button class="neu-btn comment-btn">Comment</button>
                            </div>
                        </div>
                    </div>
                @endif

                <div class="comments-list">
                    @foreach ($post->comments as $comment)
                        <div class="comment" data-comment-id="{{ $comment->id }}">
                            <img src="{{ $comment->user->avatar ?? asset('images/users.png') }}"
                                alt="{{ $comment->user->name }}" class="comment-profile-img" />
                            <div class="comment-content">
                                <div class="comment-header">
                                    <span class="comment-user">{{ $comment->user->name }}</span>
                                    <span class="comment-time">{{ $comment->created_at->diffForHumans() }}</span>
                                </div>
                                <div class="comment-text">
                                    <p>{{ $comment->content }}</p>
                                </div>
                                <div class="comment-footer">
                                    <div class="comment-actions">
                                        @if ($comment->replies->count() > 0)
                                            <button class="toggle-replies">View replies
                                                {{ $comment->replies->count() }}</button>
                                        @endif
                                        <button class="reply-trigger">Reply</button>
                                    </div>
                                    <div class="engagement-action">
                                        @auth
                                            <button
                                                class="reaction-btn {{ auth()->user() && $comment->isLikedBy(auth()->user()) ? 'liked' : '' }}"
                                                data-comment-id="{{ $comment->id }}">
                                                <i class="fa fa-thumbs-up"></i>
                                            </button>
                                        @else
                                            <button class="reaction-btn" onclick="showAuthModal()">
                                                <i class="fa fa-thumbs-up"></i>
                                            </button>
                                        @endauth
                                        <span class="like-count">{{ $comment->likes->count() }}</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        @if ($comment->replies->count() > 0)
                            <div class="replies hidden" data-comment-id="{{ $comment->id }}">
                                @foreach ($comment->replies as $reply)
                                    <div class="reply">
                                        <img src="{{ $reply->user->avatar ?? asset('images/users.png') }}"
                                            alt="{{ $reply->user->name }}" class="comment-profile-img" />
                                        <div>
                                            <strong>{{ $reply->user->name }}</strong> {{ $reply->content }}
                                        </div>
                                    </div>
                                @endforeach
                            </div>
                        @endif
                    @endforeach
                </div>
            </div>
        @empty
            <div class="no-posts card">
                <p>You haven't saved any posts yet.</p>
                <a href="{{ route('home') }}" class="neu-btn">Explore Posts</a>
            </div>
        @endforelse
    </div>

    <x-modal id="deleteModal" title="Delete Post"
        message="Are you sure you want to delete this post? This action cannot be undone and all comments and reactions will be permanently removed."
        confirmText="Delete Post" cancelText="Cancel" type="danger" />
@endsection

@section('import-js')
    <script src="{{ asset('js/post-buttons.js') }}"></script>
    <script src="{{ asset('js/post-interactions.js') }}"></script>
    <script src="{{ asset('js/notification.js') }}"></script>
    <script type="module" src="{{ asset('js/modal.js') }}"></script>
@endsection
