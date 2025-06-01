@extends('partials.main')

@section('import-css')
    <link rel="stylesheet" href="{{ asset('css/post-buttons.css') }}" />
    <link rel="stylesheet" href="{{ asset('css/comments.css') }}" />
@endsection

@section('main-content')
    @auth
        <meta name="csrf-token" content="{{ csrf_token() }}">
    @endauth

    @if (session('success'))
        <div class="notification" data-type="success" style="display: none;">
            <span class="message">{{ session('success') }}</span>
        </div>
    @endif

    @if (session('error'))
        <div class="notification" data-type="error" style="display: none;">
            <span class="message">{{ session('error') }}</span>
        </div>
    @endif

    <div class="post-detail card" data-post-id="{{ $post->id }}">
        <div class="post-header">
            <img src="{{ $post->user?->avatar ?? asset('images/users.png') }}"
                alt="{{ $post->user?->name ?? 'Deleted User' }}" class="post-profile-img" />
            <div class="post-info">
                <div class="post-author" data-user-id="{{ $post->user?->id }}">{{ $post->user?->name ?? 'Deleted User' }}
                </div>
                <div class="post-time">
                    {{ $post->created_at?->diffForHumans() ?? 'Unknown time' }} in
                    <a
                        href="{{ route('communities.show', $post->community->id) }}">{{ $post->community?->name ?? 'Deleted Community' }}</a>
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
                    <button class="follow-btn auth-required" onclick="showAuthModal()">
                        Follow
                    </button>
                @endauth
            </div>
        </div>

        <h1 class="post-title">{{ $post->title }}</h1>

        <div class="post-content">
            {!! nl2br(e($post->content)) !!}
        </div>

        @if ($post->tags->count() > 0)
            <div class="post-tags">
                @foreach ($post->tags as $tag)
                    <a href="{{ route('tags.show', $tag) }}" class="hashtag">#{{ $tag->name }}</a>
                @endforeach
            </div>
        @endif

        <div class="post-engagement">
            <div class="engagement-action">
                @auth
                    <button class="reaction-btn {{ Auth::check() && $post->isLikedBy(Auth::user()) ? 'liked' : '' }}"
                        data-post-id="{{ $post->id }}">
                        <i class="fa fa-thumbs-up"></i>
                    </button>
                @else
                    <button class="reaction-btn" onclick="showAuthModal()">
                        <i class="fa fa-thumbs-up"></i>
                    </button>
                @endauth
                <span>{{ $post->likes->count() }}</span>
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
            <div class="engagement-action">
                @auth
                    <button class="save-post-btn {{ Auth::check() && $post->savedBy->contains(Auth::id()) ? 'saved' : '' }}"
                        data-post-id="{{ $post->id }}">
                        <i class="fa fa-bookmark"></i> Save
                    </button>
                @else
                    <button class="save-post-btn" onclick="showAuthModal()">
                        <i class="fa fa-bookmark"></i> Save
                    </button>
                @endauth
            </div>
        </div>
    </div>

    <button class="neu-btn show-comments-btn">Show Comments</button>

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
                <div class="comment">
                    <img src="{{ $comment->user?->avatar ?? asset('images/users.png') }}" alt="User"
                        class="comment-profile-img" />
                    <div class="comment-content">
                        <div class="comment-header">
                            <span class="comment-user">{{ $comment->user?->name ?? 'Deleted User' }}</span>
                            <span
                                class="comment-time">{{ $comment->created_at?->diffForHumans() ?? 'Unknown time' }}</span>
                        </div>
                        <div class="comment-text">
                            <p>
                                {{ $comment->content }}
                            </p>
                        </div>
                        <div class="comment-footer">
                            <div class="comment-actions">
                                @if ($comment->replies->count() > 0)
                                    <button class="toggle-replies">View replies {{ $comment->replies->count() }}</button>
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
                                <img src="{{ $reply->user?->avatar ?? asset('images/users.png') }}" alt="Reply User"
                                    class="comment-profile-img" />
                                <div><strong>{{ $reply->user?->name ?? 'Deleted User' }}</strong> {{ $reply->content }}
                                </div>
                            </div>
                        @endforeach
                    </div>
                @endif
            @endforeach
        </div>
    </div>

    <x-modal id="deleteModal" title="Delete Post"
        message="Are you sure you want to delete this post? This action cannot be undone and all comments and reactions will be permanently removed."
        confirmText="Delete Post" cancelText="Cancel" type="danger" />
@endsection

@section('import-js')
    <script src="{{ asset('js/post-buttons.js') }}"></script>
    <script src="{{ asset('js/post-interactions.js') }}"></script>
    <script type="module" src="{{ asset('js/modal.js') }}"></script>
    <script type="module">
        import {
            initPostDelete
        } from '{{ asset('js/post-delete.js') }}';
        document.addEventListener('DOMContentLoaded', function() {
            initPostDelete();
        });
    </script>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            // Remove duplicate comment toggle functionality
            function dismissNotification() {
                const notification = document.getElementById('notification');
                if (notification) {
                    notification.classList.remove('show');
                    setTimeout(() => {
                        notification.remove();
                    }, 300);
                }
            }

            // Show notification when page loads
            document.addEventListener('DOMContentLoaded', function() {
                const notification = document.getElementById('notification');
                if (notification) {
                    setTimeout(() => {
                        notification.classList.add('show');
                    }, 100);
                }
            });
        });
    </script>
@endsection
