@extends('partials.main')

@section('import-css')
    <link rel="stylesheet" href="css/comments.css" />
    <link rel="stylesheet" href="css/neumorphism.css" />
    <link rel="stylesheet" href="css/post-buttons.css" />
    <link rel="stylesheet" href="css/home.css" />
    <link rel="stylesheet" href="{{ asset('css/notification.css') }}" />
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
                                <a href="#" class="report-post">
                                    <i class="fa fa-flag"></i> Report
                                </a>
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
                <div class="comment-form">
                    <img src="{{ Auth::user()->avatar ?? asset('images/users.png') }}" alt="Your Profile"
                        class="comment-profile-img" />
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
                            <img src="{{ $comment->user->avatar ?? asset('images/users.png') }}" alt="User"
                                class="comment-profile-img" />
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
                    @endforeach
                    <div class="replies hidden">
                        <div class="reply">
                            <img src="{{ asset('images/users.png') }}" alt="Reply User" class="comment-profile-img" />
                            <div><strong>reply_user</strong> Reply comment here.</div>
                        </div>
                        <div class="reply">
                            <img src="{{ asset('images/users.png') }}" alt="Reply User" class="comment-profile-img" />
                            <div><strong>another_user</strong> Another reply here.</div>
                        </div>
                    </div>
                </div>
            </div>
        @endforeach
    </div>

    <x-modal id="deleteModal" title="Delete Post"
        message="Are you sure you want to delete this post? This action cannot be undone and all comments and reactions will be permanently removed."
        confirmText="Delete Post" cancelText="Cancel" type="danger" />
@endsection

@section('import-js')
    <script src="js/home.js"></script>
    <script src="js/auth.js"></script>
    <script src="js/post-buttons.js"></script>
    <script src="js/post-interactions.js"></script>
    <script src="{{ asset('js/notification.js') }}"></script>

    {{-- Remove the type="module" from these scripts --}}
    <script src="{{ asset('js/modal.js') }}"></script>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Handle notifications from sessionStorage
            const notification = sessionStorage.getItem('notification');
            const notificationType = sessionStorage.getItem('notificationType');

            if (notification) {
                // Remove existing notifications
                const existingNotifications = document.querySelectorAll('.notification');
                existingNotifications.forEach(n => n.remove());

                const notificationDiv = document.createElement('div');
                notificationDiv.className = `notification ${notificationType}`;
                notificationDiv.innerHTML = `<span class="message">${notification}</span>`;
                document.body.appendChild(notificationDiv);

                // Show the notification
                setTimeout(() => {
                    notificationDiv.style.display = 'block';
                    notificationDiv.classList.add('show');
                }, 100);

                // Auto-hide after 3 seconds
                setTimeout(() => {
                    notificationDiv.classList.remove('show');
                    setTimeout(() => notificationDiv.remove(), 300);
                }, 3000);

                // Clear the notification from sessionStorage
                sessionStorage.removeItem('notification');
                sessionStorage.removeItem('notificationType');
            }
        });
    </script>
@endsection
