@extends('partials.main')

@section('import-css')
    <link rel="stylesheet" href="css/profile.css">
@endsection

@section('main-content')
    <div class="profile-container">
        <!-- Profile Header -->
        <div class="profile-header">
            <div class="profile-cover"></div>
            <div class="profile-info">
                <img src="{{ $user->avatar ? asset($user->avatar) : asset('images/users.png') }}" alt="{{ $user->name }}"
                    class="profile-avatar" />
                <div class="profile-details">
                    <div class="profile-name">
                        {{ $user->name }}
                        {{-- <i class="fa fa-check-circle verified-badge"></i> --}}
                    </div>
                    <div class="profile-username">@<span>{{ explode('@', $user->email)[0] }}</span></div>
                    <div class="profile-bio">

                        {{ $user->bio ?? 'No bio available.' }}

                        @if (Auth::user() && Auth::user()->id === $user->id)
                            <button class="action-btn edit-btn" onclick="window.location='{{ route('profile.edit') }}'">
                                <i class="fa fa-edit"></i>
                                {{ $user->bio ? 'Edit Bio' : 'Add Your Bio' }}
                            </button>
                        @endif
                    </div>
                    <div class="profile-stats">
                        <div class="stat-item">
                            <div class="stat-number">{{ $user->posts->count() }}</div>
                            <div class="stat-label">Posts</div>
                        </div>
                        <div class="stat-item">
                            <div class="stat-number">{{ $user->followers->count() }}</div>
                            <div class="stat-label">Followers</div>
                        </div>
                        <div class="stat-item">
                            <div class="stat-number">{{ $user->following->count() }}</div>
                            <div class="stat-label">Following</div>
                        </div>
                        <div class="stat-item">
                            <div class="stat-number">{{ $user->totalLikesReceived() }}</div>
                            <div class="stat-label">Likes</div>
                        </div>
                    </div>
                </div>
                <div class="profile-actions">
                    @if (Auth::user() && Auth::user()->id === $user->id)
                        <button class="action-btn edit-btn" onclick="window.location='{{ route('profile.edit') }}'">
                            <i class="fa fa-edit"></i>
                            Edit Profile
                        </button>
                    @endif
                    <button class="action-btn share-btn">
                        <i class="fa fa-share"></i>
                        Share
                    </button>
                </div>
            </div>
        </div>

        <!-- Profile Tabs -->
        <div class="profile-tabs">
            <button class="tab-btn active" data-tab="posts">Posts</button>
            <button class="tab-btn" data-tab="media">Media</button>
            <button class="tab-btn" data-tab="likes">Likes</button>
            <button class="tab-btn" data-tab="about">About</button>
        </div>

        <!-- Posts Tab -->
        <div class="tab-content active" id="posts">
            <div class="posts-grid">
                @forelse ($posts as $post)
                    <div class="post-card">
                        <div class="post-card-header">
                            <div class="post-date">{{ $post->created_at->diffForHumans() }}</div>
                            {{-- <button class="action-btn">
                                <i class="fa fa-ellipsis-h"></i>
                            </button> --}}
                        </div>
                        <div class="post-card-content">
                            {{ $post->content }}
                        </div>
                        @if ($post->image)
                            <img src="{{ asset($post->image) }}" alt="Post Image" class="post-card-image" />
                        @endif
                        <div class="post-card-stats">
                            <span>❤️ {{ $post->likes->count() }} likes</span>
                            <span>💬 {{ $post->comments->count() }} comments</span>
                            {{-- <span>🔄 12 shares</span> --}}
                        </div>
                    </div>
                @empty
                    <p>No posts found.</p>
                @endforelse
            </div>
        </div>

        <!-- Media Tab -->
        <div class="tab-content" id="media">
            <div class="posts-grid">
                @forelse ($mediaPosts as $post)
                    <div class="post-card">
                        @if ($post->image)
                            <img src="{{ asset($post->image) }}" alt="Post Image" class="post-card-image" />
                        @endif
                        <div class="post-card-stats">
                            <span>❤️ {{ $post->likes->count() }} likes</span>
                            <span>💬 {{ $post->comments->count() }} comments</span>
                        </div>
                    </div>
                @empty
                    <p>No media posts found.</p>
                @endforelse
            </div>
        </div>

        <!-- Likes Tab -->
        <div class="tab-content" id="likes">
            <div class="posts-grid">
                @forelse ($likedPosts as $post)
                    <div class="post-card">
                        <div class="post-card-header">
                            <div class="post-date">Liked {{ $post->created_at->diffForHumans() }}</div>
                        </div>
                        <div class="post-card-content">
                            {{ $post->content }}
                        </div>
                        @if ($post->image)
                            <img src="{{ asset($post->image) }}" alt="Post Image" class="post-card-image" />
                        @endif
                        <div class="post-card-stats">
                            <span>By <a href="{{ route('profile.index', $post->user) }}"
                                    class="text-blue-500 hover:underline">@<span>{{ explode('@', $post->user->email)[0] }}</span></a></span>
                            <span>❤️ {{ $post->likes->count() }} likes</span>
                        </div>
                    </div>
                @empty
                    <p>No liked posts found.</p>
                @endforelse
            </div>
        </div>

        <!-- About Tab -->
        <div class="tab-content" id="about">
            <div class="about-section">

                @if ($user->work || (Auth::user() && Auth::user()->id === $user->id))
                    {{-- Work --}}
                    <div class="about-item">
                        <div class="about-icon">
                            <i class="fa fa-briefcase"></i>
                        </div>
                        <div class="about-info flex-grow">
                            <h4>Work</h4>
                            <p>{{ $user->work ?? 'No work information added.' }}</p>
                        </div>
                        @if (Auth::user() && Auth::user()->id === $user->id)
                            <button class="action-btn edit-btn" onclick="window.location='{{ route('profile.edit') }}'">
                                <i class="fa fa-edit"></i>
                                {{ $user->work ? 'Edit Work' : 'Add Your Work' }}
                            </button>
                        @endif
                    </div>
                @endif

                @if ($user->education || (Auth::user() && Auth::user()->id === $user->id))
                    {{-- Education --}}
                    <div class="about-item">
                        <div class="about-icon">
                            <i class="fa fa-graduation-cap"></i>
                        </div>
                        <div class="about-info flex-grow">
                            <h4>Education</h4>
                            <p>{{ $user->education ?? 'No education information added.' }}</p>
                        </div>
                        @if (Auth::user() && Auth::user()->id === $user->id)
                            <button class="action-btn edit-btn" onclick="window.location='{{ route('profile.edit') }}'">
                                <i class="fa fa-edit"></i>
                                {{ $user->education ? 'Edit Education' : 'Add Your Education' }}
                            </button>
                        @endif
                    </div>
                @endif

                @if ($user->location || (Auth::user() && Auth::user()->id === $user->id))
                    {{-- Location --}}
                    <div class="about-item">
                        <div class="about-icon">
                            <i class="fa fa-map-marker-alt"></i>
                        </div>
                        <div class="about-info flex-grow">
                            <h4>Location</h4>
                            <p>{{ $user->location ?? 'No location information added.' }}</p>
                        </div>
                        @if (Auth::user() && Auth::user()->id === $user->id)
                            <button class="action-btn edit-btn" onclick="window.location='{{ route('profile.edit') }}'">
                                <i class="fa fa-edit"></i>
                                {{ $user->location ? 'Edit Location' : 'Add Your Location' }}
                            </button>
                        @endif
                    </div>
                @endif

                @if ($user->created_at)
                    {{-- Joined --}}
                    <div class="about-item">
                        <div class="about-icon">
                            <i class="fa fa-calendar"></i>
                        </div>
                        <div class="about-info flex-grow">
                            <h4>Joined</h4>
                            <p>{{ $user->created_at->format('F Y') }}</p>
                        </div>
                        {{-- No edit button for Joined date --}}
                    </div>
                @endif

                @if ($user->website || (Auth::user() && Auth::user()->id === $user->id))
                    {{-- Website --}}
                    <div class="about-item">
                        <div class="about-icon">
                            <i class="fa fa-link"></i>
                        </div>
                        <div class="about-info flex-grow">
                            <h4>Website</h4>
                            <p>{{ $user->website ? $user->website  : 'No website added.' }}
                            </p>
                        </div>
                        @if (Auth::user() && Auth::user()->id === $user->id)
                            <button class="action-btn edit-btn" onclick="window.location='{{ route('profile.edit') }}'">
                                <i class="fa fa-edit"></i>
                                {{ $user->website ? 'Edit Website' : 'Add Your Website' }}
                            </button>
                        @endif
                    </div>
                @endif
            </div>
        </div>
    </div>
@endsection

@section('import-js')
    <script src="js/profile.js"></script>
@endsection
