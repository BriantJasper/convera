<header>
    <div class="logo">
        <a href="/">
            <img src="/images/logo.png" alt="logo" style="height: 60px;">
        </a>
    </div>

    <div class="search-container">
        <input type="text" placeholder="Search...">
        <button><i class="fa fa-search"></i></button>
    </div>

    <div class="header-icons">
        @auth
            <a href="#"><i class="fa fa-bell"></i></a>
            <a href="#"><i class="fa fa-envelope"></i></a>

            <a href="#" class="profile-img">
                <img src="{{ Auth::user()->profile_picture ?? 'https://via.placeholder.com/32' }}" alt="Profile">
            </a>

            <form action="{{ route('logout') }}" method="POST" style="display: inline;">
                @csrf
                <button type="submit" style="background: none; border: none; color: white; cursor: pointer;">
                    Logout
                </button>
            </form>
        @endauth

        @guest
        <button id="loginBtn" class="btn btn-primary">Login</button>
            <a href="{{ route('register') }}">Register</a>
        @endguest
    </div>
</header>
