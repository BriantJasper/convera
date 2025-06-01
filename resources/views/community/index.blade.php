@extends('partials.main')
<link rel="stylesheet" href="{{ asset('css/communities.css') }}">
@section('import-css')
@endsection

@section('main-content')
    <div class="communities-container">
        <div class="communities-header">
            <h1 class="communities-title">
                <i class="fa fa-users"></i>
                Communities
            </h1>
            @auth
                <a href="{{ route('communities.create') }}" class="create-community-btn">
                    <i class="fa fa-plus"></i>
                    Create Community
                </a>
            @else
                <button class="create-community-btn" onclick="showAuthModal()">
                    <i class="fa fa-plus"></i>
                    Create Community
                </button>
            @endauth
        </div>

        <div class="communities-filters">
            <button class="filter-btn active">All</button>
            <button class="filter-btn">My Communities</button>
            <button class="filter-btn">Technology</button>
            <button class="filter-btn">Design</button>
            <button class="filter-btn">Business</button>
            <button class="filter-btn">Science</button>
            <button class="filter-btn">Arts</button>
        </div>

        @if ($communities->count() > 0)
            @foreach ($communities as $community)
                <div class="community-card">
                    <div class="community-header">
                        <img src="{{ !empty($community->avatar) ? asset($community->avatar) : asset('images/default-community.png') }}"
                            alt="{{ $community->name }}" class="community-avatar" />
                        <div class="community-info">
                            <div class="community-name">
                                {{ $community->name }}
                                @if ($community->is_verified)
                                    <i class="fa fa-check-circle verified-badge"></i>
                                @endif
                            </div>
                            <div class="community-meta">
                                <span>{{ $community->members_count ?? 0 }} members</span>
                                <span>•</span>
                                <span>{{ $community->is_private ? 'Private' : 'Public' }}</span>
                            </div>
                        </div>
                    </div>
                    <p class="community-description">
                        {{ $community->description }}
                    </p>
                    <div class="community-topics">
                        @foreach ($community->tags as $tag)
                            <span class="community-topic">#{{ $tag->name }}</span>
                        @endforeach
                    </div>
                    <div class="community-footer">
                        @if (auth()->check() && $community->isMember(auth()->user()))
                            <button class="joined-btn" data-community-id="{{ $community->id }}">Joined</button>
                        @else
                            <button class="join-btn" data-community-id="{{ $community->id }}">Join Community</button>
                        @endif
                        <div class="community-stats">
                            <div class="stat">
                                <i class="fa fa-users"></i>
                                <span class="members-count">{{ $community->members_count ?? 0 }}</span>
                            </div>
                            @if ($community->is_trending)
                                <div class="stat">
                                    <i class="fa fa-fire"></i>
                                    <span>Trending</span>
                                </div>
                            @endif
                        </div>
                    </div>
                </div>
            @endforeach
        @else
            <div class="empty-state">
                <i class="fa fa-users"></i>
                <h3>No Communities Found</h3>
                <p>
                    Join communities to connect with like-minded people and share your
                    interests.
                </p>
                @auth
                    <a href="{{ route('communities.create') }}" class="create-community-btn">
                        <i class="fa fa-plus"></i>
                        Create Your First Community
                    </a>
                @else
                    <button class="create-community-btn" onclick="showAuthModal()">
                        <i class="fa fa-plus"></i>
                        Create Your First Community
                    </button>
                @endauth
            </div>
        @endif
    </div>
@endsection

@section('import-js')
    <script src="{{ asset('js/communities.js') }}"></script>
@endsection
