@extends('partials.main')

@section('import-css')
    <link rel="stylesheet" href="{{ asset('css/styles.css') }}" />
    <link rel="stylesheet" href="{{ asset('css/neuromorphism.css') }}" />
    <link rel="stylesheet" href="{{ asset('css/post-buttons.css') }}" />
    <link rel="stylesheet" href="{{ asset('css/comments.css') }}" />
    <link rel="stylesheet" href="{{ asset('css/notification.css') }}" />
    <style>
        .notification {
            position: fixed;
            top: 20px;
            right: 20px;
            padding: 15px 25px;
            background: #1a2332;
            color: white;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            display: flex;
            align-items: center;
            justify-content: space-between;
            z-index: 1000;
            transform: translateX(120%);
            transition: transform 0.3s ease-in-out;
        }

        .notification.show {
            transform: translateX(0);
        }

        .notification .close-btn {
            background: none;
            border: none;
            color: white;
            cursor: pointer;
            margin-left: 15px;
            font-size: 20px;
        }

        .notification .message {
            margin-right: 10px;
        }
    </style>
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
                <div class="post-author">{{ $post->user?->name ?? 'Deleted User' }}</div>
                <div class="post-time">
                    {{ $post->created_at?->diffForHumans() ?? 'Unknown time' }} in
                    <a
                        href="{{ route('communities.show', $post->community->id) }}">{{ $post->community?->name ?? 'Deleted Community' }}</a>
                </div>
            </div>
            <div class="post-actions-container">
                @if (Auth::check() && Auth::id() !== $post->user_id)
                    <button class="follow-btn not-following" id="followBtn">
                        Follow
                    </button>
                @endif
                @if (Auth::check() && Auth::id() === $post->user_id)
                    <div class="post-actions-menu relative">
                        <button class="dot-menu-btn">
                            <i class="fa fa-ellipsis-v"></i>
                        </button>
                        <div class="dropdown-menu hidden">
                            <a href="#" class="save-post">
                                <i class="fa fa-bookmark"></i> Save
                            </a>
                            <a href="{{ route('posts.edit', $post->slug) }}" class="edit-post">
                                <i class="fa fa-edit"></i> Edit
                            </a>
                            <a href="#" class="delete-post" data-post-id="{{ $post->id }}"
                                data-post-slug="{{ $post->slug }}">
                                <i class="fa fa-trash"></i> Delete
                            </a>
                            <a href="#" class="hide-post">
                                <i class="fa fa-eye-slash"></i> Hide
                            </a>
                            <a href="#" class="report-post">
                                <i class="fa fa-flag"></i> Report
                            </a>
                        </div>
                    </div>
                @endif
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
                <button><i class="fa fa-share"></i> Share</button>
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
                <div class="comment" data-comment-id="{{ $comment->id }}">
                    <img src="{{ $comment->user?->avatar ?? asset('images/users.png') }}"
                        alt="{{ $comment->user?->name ?? 'Deleted User' }}" class="comment-profile-img" />
                    <div class="comment-content">
                        <div class="comment-header">
                            <span class="comment-user">{{ $comment->user?->name ?? 'Deleted User' }}</span>
                            <span
                                class="comment-time">{{ $comment->created_at?->diffForHumans() ?? 'Unknown time' }}</span>
                        </div>
                        <div class="comment-text">
                            <p>{{ $comment->content }}</p>
                        </div>
                        <div class="comment-footer">
                            @if ($comment->replies->count() > 0)
                                <button class="toggle-replies">View replies {{ $comment->replies->count() }}</button>
                            @endif
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
                    <div class="replies hidden">
                        @foreach ($comment->replies as $reply)
                            <div class="reply">
                                <img src="{{ $reply->user?->avatar ?? asset('images/users.png') }}"
                                    alt="{{ $reply->user?->name ?? 'Deleted User' }}" class="comment-profile-img" />
                                <div>
                                    <strong>{{ $reply->user?->name ?? 'Deleted User' }}</strong> {{ $reply->content }}
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
    <script src="{{ asset('js/home.js') }}"></script>
    <script src="{{ asset('js/notification.js') }}"></script>
    <script src="{{ asset('js/post.js') }}"></script>
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
