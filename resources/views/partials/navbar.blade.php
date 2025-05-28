    <header class="neu-navbar"
        style="
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding: 0 24px;
        height: 68px;
        background: linear-gradient(145deg, #1c2534, #192230);
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
      ">
        <div style="display: flex; align-items: center">
            <div class="logo" style="display: flex; align-items: center; margin-left: -30px">
                <a href="{{ route('home') }}">
                    <img src="{{ asset('images/logo.png') }}" alt="logo"
                        style="
                height: 100px;
                width: 100px;
                object-fit: contain;
                border-radius: 14px;
              " />
                </a>
            </div>
            <div class="search-container" style="max-width: 320px; object-fit: contain">
                <input type="text" placeholder="Search..." />
                <button><i class="fa fa-search"></i></button>
            </div>
        </div>
        <div class="header-icons">
            @auth
                <a href="{{ route('notifications') }}" class="notification-icon"><i class="fa fa-bell"></i></a>
                <a href="{{ route('messages') }}" class="message-icon"><i class="fa fa-envelope"></i></a>
                <a href="{{ route('profile.index') }}" class="profile-img">
                    <img src="{{ Auth::user()->avatar ?? asset('images/users.png') }}" alt="{{ Auth::user()->name }}"
                        style="width: 40px; height: 40px; border-radius: 50%; object-fit: cover;" />
                </a>
                <form method="POST" action="{{ route('logout') }}" style="display: inline;">
                    @csrf
                    <button type="submit" class="btn"
                        style="
                        display: flex;
                        justify-content: center;
                        align-items: center;
                        padding: 0.5rem 1.5rem;
                        background: linear-gradient(145deg, #dc3545, #c82333);
                        color: #fff;
                        box-shadow: 4px 4px 8px rgba(0, 0, 0, 0.3),
                            -2px -2px 8px rgba(255, 99, 71, 0.1);
                        border-radius: 30px;
                        font-size: 1rem;
                        font-weight: 500;
                        border: none;
                        transition: all 0.2s ease;
                        cursor: pointer;
                        height: 40px;
                        min-width: 80px;
                        object-fit: contain;
                    ">
                        Logout
                    </button>
                </form>
            @else
                <button id="loginBtn" class="btn"
                    style="
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    padding: 0.5rem 1.5rem;
                    background: linear-gradient(145deg, #2563eb, #1e56d4);
                    color: #fff;
                    box-shadow: 4px 4px 8px rgba(0, 0, 0, 0.3),
                        -2px -2px 8px rgba(48, 108, 240, 0.1);
                    border-radius: 30px;
                    font-size: 1rem;
                    font-weight: 500;
                    border: none;
                    transition: all 0.2s ease;
                    cursor: pointer;
                    height: 40px;
                    min-width: 80px;
                    object-fit: contain;
                    ">
                    Login
                </button>
            @endauth
        </div>
    </header>
