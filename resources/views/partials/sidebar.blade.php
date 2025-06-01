      <div class="sidebar">
          <nav class="main-nav">
              <a href="{{ route('home') }}" class="nav-item {{ $title == 'Home' ? 'active' : '' }}">
                  <i class="fa fa-home"></i>
                  <span>Home</span>
              </a>
              <a href="{{ route('explore') }}" class="nav-item">
                  <i class="fa fa-compass"></i>
                  <span>Explore</span>
              </a>
              <a href="{{ route('community.index') }}" class="nav-item">
                  <i class="fa fa-users"></i>
                  <span>Communities</span>
              </a>
              <a href="{{ route('posts.saved') }}" class="nav-item {{ $title == 'Saved Posts' ? 'active' : '' }}"
                  id="savedPostsLink">
                  <i class="fa fa-bookmark"></i>
                  <span>Saved</span>
              </a>
              <a href="{{ route('settings') }}" class="nav-item" id="settingsLink">
                  <i class="fa fa-cog"></i>
                  <span>Settings</span>
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
                      <img src="{{ asset('images/users.png') }}" alt="Emma Wilson" />
                      <div class="user-details">
                          <span class="username">Emma Wilson</span>
                          <span class="user-role">Designer</span>
                      </div>
                  </div>
                  <button class="follow-btn">Follow</button>
              </div>
              <div class="user-suggestion">
                  <div class="user-info">
                      <img src="{{ asset('images/users.png') }}" alt="Mike Johnson" />
                      <div class="user-details">
                          <span class="username">Mike Johnson</span>
                          <span class="user-role">Developer</span>
                      </div>
                  </div>
                  <button class="follow-btn">Follow</button>
              </div>
          </div>
      </div>
