@extends('partials.main')

@section('import-css')
    <link rel="stylesheet" href="{{ asset('css/styles.css') }}" />
    <link rel="stylesheet" href="{{ asset('css/neuromorphism.css') }}" />
    <link rel="stylesheet" href="{{ asset('css/post-buttons.css') }}" />
    <link rel="stylesheet" href="{{ asset('css/comments.css') }}" />
@endsection

@section('container')
    <div class="main-content">
        <div class="post-detail card">
            <div class="post-header">
                <img src="https://via.placeholder.com/40" alt="John Doe" class="post-profile-img" />
                <div class="post-info">
                    <div class="post-author">{{ $post->user->name }}</div>
                    <div class="post-time">
                        2 hours ago in <a href="#">Technology</a>
                    </div>
                </div>
                <div class="post-actions-container">
                    <button class="follow-btn not-following" id="followBtn">
                        Follow
                    </button>
                    <div class="post-actions-menu relative">
                        <button class="dot-menu-btn">
                            <i class="fa fa-ellipsis-v"></i>
                        </button>
                        <div class="dropdown-menu hidden">
                            <a href="#" class="save-post">
                                <i class="fa fa-bookmark"></i> Save
                            </a>
                            <a href="#" class="edit-post">
                                <i class="fa fa-edit"></i> Edit
                            </a>
                            <a href="#" class="delete-post">
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
                </div>
            </div>

            <h1 class="post-title">{{ $post->title }}</h1>

            <div class="post-content">
                <p>
                    {{ $post->content }}
                </p>
            </div>

            <div class="post-tags">
                @foreach ($post->tags as $tag)
                    <a href="/tags/{{ $tag->slug }}" class="hashtag">#{{ $tag->name }}</a>
                @endforeach
            </div>

            <div class="post-engagement">
                <div class="engagement-action">
                    <button><i class="fa fa-thumbs-up"></i></button>
                    <span>{{ $post->likes->count() }}</span>
                </div>
                <div class="engagement-action">
                    <button class="toggle-comments-btn" data-post-id="1">
                        <i class="fa fa-comment"></i>
                    </button>
                    <span>{{ $post->comments->count() }}</span>
                </div>
                <div class="engagement-action">
                    <button><i class="fa fa-share"></i> Share</button>
                </div>
                <div class="engagement-action">
                    <button><i class="fa fa-bookmark"></i> Save</button>
                </div>
            </div>
        </div>

        <button class="neu-btn show-comments-btn">Show Comments</button>

        <div class="comment-section hidden" data-post-id="1">
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
                            <span class="comment-time">2h ago</span>
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
    </div>
@endsection

@section('import-js')
    <script src="{{ asset('js/comments.js') }}"></script>
    <script src="{{ asset('js/CommentSection.js') }}"></script>
    <script src="{{ asset('js/post-buttons.js') }}"></script>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            document.body.addEventListener("click", function(e) {
                if (e.target.closest(".toggle-comments-btn")) {
                    var btn = e.target.closest(".toggle-comments-btn");
                    var postId = btn.getAttribute("data-post-id");
                    var commentSection = document.querySelector(
                        '.comment-section[data-post-id="' + postId + '"]'
                    );
                    if (commentSection) {
                        commentSection.classList.toggle("hidden");
                    }
                    e.stopPropagation();
                }
            });

            document.body.addEventListener("click", function(e) {
                if (e.target.closest(".dot-menu-btn")) {
                    var btn = e.target.closest(".dot-menu-btn");
                    document
                        .querySelectorAll(".dropdown-menu")
                        .forEach(function(menu) {
                            menu.classList.add("hidden");
                        });
                    var menu = btn.parentElement.querySelector(".dropdown-menu");
                    if (menu) {
                        menu.classList.toggle("hidden");
                    }
                    e.stopPropagation();
                }
            });

            document.body.addEventListener("click", function(e) {
                document.querySelectorAll(".dropdown-menu").forEach(function(menu) {
                    menu.classList.add("hidden");
                });
            });

            document.querySelectorAll(".dropdown-menu").forEach(function(menu) {
                menu.addEventListener("click", function(e) {
                    e.stopPropagation();
                });
            });
        });
    </script>
@endsection
