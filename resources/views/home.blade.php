@extends('partials.main')

@section('import-css')
    <link rel="stylesheet" href="{{ asset('css/styles.css') }}" />
    <link rel="stylesheet" href="{{ asset('css/neuromorphism.css') }}" />
@endsection
@section('container')
    @include('components.auth');
    <div class="main-content">
        <div class="create-post">
            <img src="https://via.placeholder.com/40" alt="Your Profile" class="post-profile-img">
            <div class="post-input">
                <a href="/posts/create">
                    <input type="text" placeholder="Create a post...">
                </a>
            </div>
            <div class="post-actions">
                <button><i class="fa fa-image"></i></button>
                <button><i class="fa fa-link"></i></button>
            </div>
        </div>

        <div class="posts-feed">
            @foreach ($posts as $post)
                <div class="post">
                    <div class="post-header">
                        <img src="https://via.placeholder.com/40" alt="John Doe" class="post-profile-img">
                        <div class="post-info">
                            <div class="post-author">{{ $post->user->name }}</div>
                            <div class="post-time">2 hours ago</div>
                        </div>
                    </div>
                    <div class="post-content">
                        <a href="/posts/{{ $post->id }}/{{ $post->slug }}">
                            <p>{{ $post->content }}</p>
                        </a>

                        <div class="post-tags">
                            @foreach ($post->tags as $tag)
                                <a href="/tags/{{ $tag->slug }}" class="hashtag">#{{ $tag->name }}</a>
                            @endforeach
                        </div>
                    </div>
                    <div class="post-engagement">
                        <div class="engagement-action">
                            <button><i class="fa fa-thumbs-up"></i></button>
                            <span>{{ $post->likes->count() }}</span>
                        </div>
                        <div class="engagement-action">
                            <button><i class="fa fa-comment"></i></button>
                            <span>{{ $post->comments->count() }}</span>
                        </div>
                        <div class="engagement-action">
                            <button><i class="fa fa-share"></i> Share</button>
                        </div>
                    </div>
                </div>
            @endforeach
        </div>
    </div>
@endsection
