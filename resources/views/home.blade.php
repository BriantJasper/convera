@extends('partials.main')

@section('import-css')
    <link rel="stylesheet" href="css/comments.css" />
    <link rel="stylesheet" href="css/neumorphism.css" />
    <link rel="stylesheet" href="css/post-buttons.css" />
    <link rel="stylesheet" href="css/home.css" />
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
    @if (session('success'))
        <div class="notification" id="notification">
            <span class="message">{{ session('success') }}</span>
            <button class="close-btn" onclick="dismissNotification()">&times;</button>
        </div>
    @endif

    @if (session('openModal'))
        <script>
            document.body.setAttribute('data-open-modal', '{{ session('openModal') }}');
        </script>
    @endif

    <div class="create-post">
        <img src="{{ Auth::user()->avatar ?? asset('images/users.png') }}" alt="{{ Auth::user()->name ?? 'user-profile' }}"
            class="post-profile-img" />
        <div class="post-input">
            @auth
                <a href="{{ route('posts.create') }}">
                    <input type="text" placeholder="Create a post..." />
                </a>
            @else
                <button type="button" id="createPostBtn" class="post-input-btn">
                    <input type="text" placeholder="Create a post..." readonly />
                </button>
            @endauth
        </div>
        <div class="post-actions">
            @auth
                <button onclick="window.location.href='{{ route('posts.create') }}'">
                    <i class="fa fa-image"></i>
                </button>
                <button onclick="window.location.href='{{ route('posts.create') }}'">
                    <i class="fa fa-link"></i>
                </button>
            @else
                <button type="button" id="createPostBtn">
                    <i class="fa fa-image"></i>
                </button>
                <button type="button" id="createPostBtn">
                    <i class="fa fa-link"></i>
                </button>
            @endauth
        </div>
    </div>

    <div class="posts-feed">
        @foreach ($posts as $post)
            <div class="post" data-post-id="{{ $post->id }}">
                <div class="post-header">
                    <img src="{{ $post->user->avatar ?? asset('images/users.png') }}" alt="{{ $post->user->name }}"
                        class="post-profile-img" />

                    <div class="post-info">
                        <div class="post-author">{{ $post->user->name }}</div>
                        <div class="post-time">{{ $post->created_at->diffForHumans() }}</div>
                    </div>

                    <div class="post-actions-container">
                        <button
                            class="follow-btn {{ auth()->user() && auth()->user()->isFollowing($post->user) ? 'following' : 'not-following' }}"
                            data-post-id="{{ $post->id }}">
                            {{ auth()->user() && auth()->user()->isFollowing($post->user) ? 'Following' : 'Follow' }}
                        </button>
                        <div class="post-actions-menu relative">
                            <button class="dot-menu-btn">
                                <i class="fa fa-ellipsis-v"></i>
                            </button>
                            <div class="dropdown-menu hidden">
                                <a href="#" class="save-post">
                                    <i class="fa fa-bookmark"></i> Save
                                </a>
                                @if (auth()->user() && auth()->user()->id === $post->user_id)
                                    <a href="{{ route('posts.edit', $post->id) }}" class="edit-post">
                                        <i class="fa fa-edit"></i> Edit
                                    </a>
                                    <a href="#" class="delete-post" data-post-id="{{ $post->id }}">
                                        <i class="fa fa-trash"></i> Delete
                                    </a>
                                @endif
                                <a href="#" class="hide-post">
                                    <i class="fa fa-eye-slash"></i> Hide
                                </a>
                                <a href="#" class="report-post">
                                    <i class="fa fa-flag"></i> Report
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <a href="{{ route('posts.show', ['id' => $post->id, 'slug' => $post->slug]) }}">
                    <div class="post-content">
                        <p>{{ $post->content }}</p>
                        @if ($post->tags->count() > 0)
                            <div class="post-tags">
                                @foreach ($post->tags as $tag)
                                    <a href="{{ route('tags.show', $tag->name) }}"
                                        class="hashtag">#{{ $tag->name }}</a>
                                @endforeach
                            </div>
                        @endif
                    </div>
                </a>
                <div class="post-engagement">
                    <div class="engagement-action">
                        <button class="like-btn {{ auth()->user() && $post->isLikedBy(auth()->user()) ? 'liked' : '' }}"
                            data-post-id="{{ $post->id }}">
                            <i class="fa fa-thumbs-up"></i>
                        </button>
                        <span>{{ $post->likes->count() }}</span>
                    </div>
                    <div class="engagement-action">
                        <button class="toggle-comments-btn" data-post-id="{{ $post->id }}">
                            <i class="fa fa-comment"></i>
                        </button>
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
                <div class="comment-form">
                    <img src="https://via.placeholder.com/40" alt="Your Profile" class="comment-profile-img" />
                    <div class="comment-input-box">
                        <textarea class="neu-input" placeholder="Write a comment..."></textarea>
                        <div class="comment-actions">
                            <button class="neu-btn cancel-btn">Cancel</button>
                            <button class="neu-btn comment-btn">Comment</button>
                        </div>
                    </div>
                </div>

                <div class="comments-list">
                    @foreach ($post->comments as $comment)
                        <div class="comment">
                            <img src="https://via.placeholder.com/40" alt="User" class="comment-profile-img" />
                            <div class="comment-content">
                                <div class="comment-header">
                                    <span class="comment-user">{{ $comment->user->name }}</span>
                                    <span class="comment-time">{{ $comment->created_at->diffForHumans() }}</span>
                                </div>
                                <div class="comment-text">
                                    <p>
                                        {{ $comment->content }}
                                    </p>
                                </div>
                                <div class="comment-footer">
                                    <button class="toggle-replies">View replies 2</button>
                                    <div class="like-count">👍 {{ $comment->likes->count() }}</div>
                                </div>
                            </div>
                        </div>
                    @endforeach
                    <div class="replies hidden">
                        <div class="reply">
                            <img src="https://via.placeholder.com/30" alt="Reply User" class="comment-profile-img" />
                            <div><strong>reply_user</strong> Reply comment here.</div>
                        </div>
                        <div class="reply">
                            <img src="https://via.placeholder.com/30" alt="Reply User" class="comment-profile-img" />
                            <div><strong>another_user</strong> Another reply here.</div>
                        </div>
                    </div>
                </div>
            </div>
        @endforeach
    </div>
@endsection

@section('import-js')
    <script src="js/home.js"></script>
    <script src="js/auth.js"></script>
    <script src="js/post-buttons.js"></script>
@endsection
