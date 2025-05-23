<div class="sidebar">
    <nav class="main-nav">
        <a href="/" class="nav-item {{ $title == 'Home' ? 'active' : '' }}">
            <i class="fa fa-home"></i>
            <span>Home</span>
        </a>
        <a href="#" class="nav-item {{ $title == 'Explore' ? 'active' : '' }}">
            <i class="fa fa-compass"></i>
            <span>Explore</span>
        </a>
        <a href="#" class="nav-item {{ $title == 'Communities' ? 'active' : '' }}">
            <i class="fa fa-users"></i>
            <span>Communities</span>
        </a>
        <a href="#" class="nav-item {{ $title == 'Saved' ? 'active' : '' }}">
            <i class="fa fa-bookmark"></i>
            <span>Saved</span>
        </a>
    </nav>

    <div class="sidebar-section">
        <h3>Trending Topics</h3>
        <div class="trending-topics">
            <a href="#" class="hashtag">#Technology</a>
            <a href="#" class="hashtag">#Photography</a>
            <a href="#" class="hashtag">#Design</a>
            <a href="#" class="hashtag">#Programming</a>
        </div>
    </div>

    <div class="sidebar-section">
        <h3>Suggested Users</h3>
        <div class="user-suggestion">
            <div class="user-info">
                <img src="https://via.placeholder.com/36" alt="Emma Wilson">
                <div class="user-details">
                    <span class="username">Emma Wilson</span>
                    <span class="user-role">Designer</span>
                </div>
            </div>
            <button class="follow-btn">Follow</button>
        </div>
        <div class="user-suggestion">
            <div class="user-info">
                <img src="https://via.placeholder.com/36" alt="Mike Johnson">
                <div class="user-details">
                    <span class="username">Mike Johnson</span>
                    <span class="user-role">Developer</span>
                </div>
            </div>
            <button class="follow-btn">Follow</button>
        </div>
    </div>
</div>
