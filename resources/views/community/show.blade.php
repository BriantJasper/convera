@extends('partials.main')

@section('import-css')
    <link rel="stylesheet" href="{{ asset('css/styles.css') }}" />
    <link rel="stylesheet" href="{{ asset('css/neuromorphism.css') }}" />
    <link rel="stylesheet" href="{{ asset('css/post-buttons.css') }}" />
@endsection

@section('container')
    <div class="main-content">
        <div class="community-header card">
            <h1 class="community-title">{{ $community->name }}</h1>
            @if ($community->description)
                <p class="community-description">{{ $community->description }}</p>
            @endif

            @if (Auth::check() && Auth::id() !== $community->user_id)
                <button
                    class="neu-btn follow-btn {{ Auth::user()->isFollowing($community->user) ? 'following' : 'not-following' }}">
                    {{ Auth::user()->isFollowing($community->user) ? 'Following' : 'Follow' }}
                </button>
            @endif
        </div>

        @if ($community->rules)
            <div class="community-rules card">
                <h2>Community Rules</h2>
                <div class="rules-content">
                    {!! nl2br(e($community->rules)) !!}
                </div>
            </div>
        @endif

        <div class="posts-container">
            @forelse($community->posts as $post)
                <div class="post card" data-post-id="{{ $post->id }}">
                    <div class="post-header">
                        <img src="{{ $post->user?->avatar ?? 'https://via.placeholder.com/40' }}"
                            alt="{{ $post->user?->name ?? 'Deleted User' }}" class="post-profile-img" />
                        <div class="post-info">
                            <div class="post-author">{{ $post->user?->name ?? 'Deleted User' }}</div>
                            <div class="post-time">
                                {{ $post->created_at?->diffForHumans() ?? 'Unknown time' }}
                            </div>
                        </div>
                    </div>

                    <h2 class="post-title">
                        <a href="{{ route('posts.show', ['id' => $post->id, 'slug' => $post->slug]) }}">
                            {{ $post->title }}
                        </a>
                    </h2>

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
                            <button
                                class="reaction-btn {{ Auth::check() && $post->isLikedBy(Auth::user()) ? 'liked' : '' }}"
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
                            <button><i class="fa fa-share"></i> Share</button>
                        </div>
                        <div class="engagement-action">
                            <button
                                class="save-post-btn {{ Auth::check() && $post->savedBy->contains(Auth::id()) ? 'saved' : '' }}"
                                data-post-id="{{ $post->id }}">
                                <i class="fa fa-bookmark"></i> Save
                            </button>
                        </div>
                    </div>
                </div>
            @empty
                <div class="no-posts card">
                    <p>No posts in this community yet.</p>
                    @if (Auth::check())
                        <a href="{{ route('posts.create') }}" class="neu-btn">Create First Post</a>
                    @endif
                </div>
            @endforelse
        </div>
    </div>
@endsection

@section('import-js')
    <script src="{{ asset('js/post-buttons.js') }}"></script>
@endsection
