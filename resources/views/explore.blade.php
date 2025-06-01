@extends('partials.main')
<link rel="stylesheet" href="{{ asset('css/explore.css') }}">
@section('import-css')
@endsection




@section('main-content')
    <div class="explore-header">
        <h1 class="explore-title">
            <i class="fa fa-compass"></i>
            Explore
        </h1>
        <p class="explore-subtitle">
            Discover trending content, communities, and people
        </p>
    </div>

    <div class="explore-filters">
        <button class="filter-btn active">All</button>
        <button class="filter-btn">Trending</button>
        <button class="filter-btn">Communities</button>
        <button class="filter-btn">Topics</button>
        <button class="filter-btn">People</button>
        <button class="filter-btn">Events</button>
    </div>

    <div class="explore-grid">
        <!-- Tech Community Card -->
        <div class="explore-card">
            <div class="card-header">
                <div class="card-icon">
                    <i class="fa fa-users"></i>
                </div>
                <div class="card-info">
                    <h3>Tech Enthusiasts</h3>
                    <div class="card-meta">Community • 2.5k members</div>
                </div>
            </div>
            <p class="card-description">
                Join our community of tech lovers sharing the latest innovations
                and discussions about technology, programming, and digital trends.
            </p>
            <div class="card-tags">
                <span class="card-tag">#Technology</span>
                <span class="card-tag">#Programming</span>
                <span class="card-tag">#Innovation</span>
            </div>
            <div class="card-footer">
                <div class="card-stats">
                    <div class="stat">
                        <i class="fa fa-fire"></i>
                        <span>Trending</span>
                    </div>
                    <div class="stat">
                        <i class="fa fa-comments"></i>
                        <span>Active</span>
                    </div>
                </div>
                <button class="action-btn">Join Community</button>
            </div>
        </div>

        <!-- Popular Topic Card -->
        <div class="explore-card">
            <div class="card-header">
                <div class="card-icon">
                    <i class="fa fa-hashtag"></i>
                </div>
                <div class="card-info">
                    <h3>#WebDevelopment</h3>
                    <div class="card-meta">Topic • 1.2k posts today</div>
                </div>
            </div>
            <p class="card-description">
                Explore the latest trends and discussions in web development, from
                frameworks to best practices.
            </p>
            <div class="card-tags">
                <span class="card-tag">#JavaScript</span>
                <span class="card-tag">#React</span>
                <span class="card-tag">#CSS</span>
            </div>
            <div class="card-footer">
                <div class="card-stats">
                    <div class="stat">
                        <i class="fa fa-fire"></i>
                        <span>Hot</span>
                    </div>
                    <div class="stat">
                        <i class="fa fa-chart-line"></i>
                        <span>Growing</span>
                    </div>
                </div>
                <button class="action-btn secondary-btn">Follow Topic</button>
            </div>
        </div>

        <!-- Featured Person Card -->
        <div class="explore-card">
            <div class="card-header">
                <div class="card-icon">
                    <i class="fa fa-user"></i>
                </div>
                <div class="card-info">
                    <h3>Sarah Johnson</h3>
                    <div class="card-meta">Developer • 15k followers</div>
                </div>
            </div>
            <p class="card-description">
                Senior Software Engineer | Open Source Contributor | Tech Speaker
                sharing insights about modern development.
            </p>
            <div class="card-tags">
                <span class="card-tag">#OpenSource</span>
                <span class="card-tag">#Speaker</span>
                <span class="card-tag">#Mentor</span>
            </div>
            <div class="card-footer">
                <div class="card-stats">
                    <div class="stat">
                        <i class="fa fa-star"></i>
                        <span>Featured</span>
                    </div>
                    <div class="stat">
                        <i class="fa fa-code"></i>
                        <span>Active</span>
                    </div>
                </div>
                <button class="action-btn">Follow</button>
            </div>
        </div>

        <!-- Event Card -->
        <div class="explore-card">
            <div class="card-header">
                <div class="card-icon">
                    <i class="fa fa-calendar"></i>
                </div>
                <div class="card-info">
                    <h3>Tech Conference 2024</h3>
                    <div class="card-meta">Event • 500 attending</div>
                </div>
            </div>
            <p class="card-description">
                Join us for the biggest tech conference of the year with amazing
                speakers and networking opportunities.
            </p>
            <div class="card-tags">
                <span class="card-tag">#Conference</span>
                <span class="card-tag">#Networking</span>
                <span class="card-tag">#Tech</span>
            </div>
            <div class="card-footer">
                <div class="card-stats">
                    <div class="stat">
                        <i class="fa fa-clock"></i>
                        <span>2 days left</span>
                    </div>
                    <div class="stat">
                        <i class="fa fa-map-marker"></i>
                        <span>Online</span>
                    </div>
                </div>
                <button class="action-btn">Register</button>
            </div>
        </div>

        <!-- Resource Card -->
        <div class="explore-card">
            <div class="card-header">
                <div class="card-icon">
                    <i class="fa fa-book"></i>
                </div>
                <div class="card-info">
                    <h3>Learning Resources</h3>
                    <div class="card-meta">Collection • 10k downloads</div>
                </div>
            </div>
            <p class="card-description">
                Curated collection of the best learning resources for developers,
                from beginner to advanced level.
            </p>
            <div class="card-tags">
                <span class="card-tag">#Learning</span>
                <span class="card-tag">#Resources</span>
                <span class="card-tag">#Free</span>
            </div>
            <div class="card-footer">
                <div class="card-stats">
                    <div class="stat">
                        <i class="fa fa-star"></i>
                        <span>Top Rated</span>
                    </div>
                    <div class="stat">
                        <i class="fa fa-download"></i>
                        <span>Popular</span>
                    </div>
                </div>
                <button class="action-btn secondary-btn">View Collection</button>
            </div>
        </div>

        <!-- Project Card -->
        <div class="explore-card">
            <div class="card-header">
                <div class="card-icon">
                    <i class="fa fa-code-branch"></i>
                </div>
                <div class="card-info">
                    <h3>Open Source Projects</h3>
                    <div class="card-meta">Repository • 500+ projects</div>
                </div>
            </div>
            <p class="card-description">
                Discover trending open source projects and contribute to the
                community. Find your next project to contribute to.
            </p>
            <div class="card-tags">
                <span class="card-tag">#OpenSource</span>
                <span class="card-tag">#GitHub</span>
                <span class="card-tag">#Contribute</span>
            </div>
            <div class="card-footer">
                <div class="card-stats">
                    <div class="stat">
                        <i class="fa fa-fire"></i>
                        <span>Trending</span>
                    </div>
                    <div class="stat">
                        <i class="fa fa-users"></i>
                        <span>Active</span>
                    </div>
                </div>
                <button class="action-btn secondary-btn">Explore Projects</button>
            </div>
        </div>
    </div>
@endsection



@section('import-js')
    <script src="{{ asset('js/explore.js') }}"></script>
@endsection
