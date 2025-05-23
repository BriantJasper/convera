<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="/images/logo-full.png" />
    <title>Convera | {{ $title }}</title>
    <link rel="stylesheet" href="/css/styles.css">
    <link rel="stylesheet" href="/css/neumorphism.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    @yield('import-css')
</head>

<body>
    @include('partials.navbar')

    <div class="container">
        @include('partials.sidebar')
        <div id="authModal" class="modal-overlay hidden">
            <div class="auth-card">
                <button class="close-modal" id="closeAuthModal">&times;</button>
                <div class="auth-icon">
                    <i class="fa fa-user"></i>
                </div>
                <div class="tab-content" id="loginForm">
                    <h2 class="auth-title">Welcome Back</h2>
                    <div class="auth-subtitle">Sign in to your account</div>
                    <form>
                        <div class="form-group">
                            <label for="login-email">Email</label>
                            <input type="email" id="login-email" placeholder="Enter your email" required />
                        </div>
                        <div class="form-group">
                            <label for="login-password">Password</label>
                            <input type="password" id="login-password" placeholder="Enter your password" required />
                        </div>
                        <div class="form-options">
                            <label class="checkbox">
                                <input type="checkbox" id="remember" />
                                <span>Remember me</span>
                            </label>
                            <a href="#" class="forgot-password">Forgot password?</a>
                        </div>
                        <button type="submit" class="btn-primary">Sign In</button>
                        <div class="social-login">
                            <div class="divider-container">
                                <div class="divider-line"></div>
                                <span class="divider-text">Or continue with</span>
                                <div class="divider-line"></div>
                            </div>

                            <button type="button" class="btn btn-google"
                                style="
                    width: 80px;
                    height: 35px;
                    background-color: #1a2332;
                    color: #ffffff;
                    border: none;
                    border-radius: 12px;
                    font-size: 18px;
                    font-weight: bold;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    box-shadow: 6px 6px 12px #121a26, -6px -6px 12px #222c3e;
                    transition: all 0.2s ease-in-out;
                    margin: 12px auto 10px auto; /* Tambahkan jarak ke atas */
                  ">
                                <i class="fab fa-google" style="font-size: 15px"></i>
                            </button>
                        </div>
                    </form>
                    <div class="auth-switch">
                        Don't have an account?
                        <a href="#" id="showRegister" class="auth-link">Sign up</a>
                    </div>
                </div>
                <div class="tab-content hidden" id="registerForm">
                    <h2 class="auth-title">Create an account</h2>
                    <div class="auth-subtitle">
                        Already have an account?
                        <a href="#" id="showLogin" class="auth-link">Log in</a>
                    </div>
                    <form>
                        <div class="form-group">
                            <label for="reg-email">Email</label>
                            <input type="email" id="reg-email" placeholder="Enter your email" required />
                        </div>
                        <div class="form-group">
                            <label for="reg-password">Password</label>
                            <input type="password" id="reg-password" placeholder="Enter your password" required />
                        </div>
                        <div class="terms-container">
                            <label class="terms-label">
                                <input type="checkbox" id="reg-terms" required />
                                <span>I agree to the
                                    <a href="#" class="terms-link">Terms & Conditions</a></span>
                            </label>
                        </div>
                        <button type="submit" class="btn-primary">Create account</button>
                    </form>
                </div>
            </div>
        </div>
        @yield('container')
    </div>

    @yield('import-js')
    <script src="/js/script.js"></script>
    <script src="/js/auth.js"></script>
    <script src="/js/authModal.js"></script>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            const loginBtn = document.getElementById("loginBtn");
            const authModal = document.getElementById("authModal");
            const closeAuthModal = document.getElementById("closeAuthModal");
            const loginForm = document.getElementById("loginForm");
            const registerForm = document.getElementById("registerForm");
            const showRegister = document.getElementById("showRegister");
            const showLogin = document.getElementById("showLogin");

            loginBtn.addEventListener("click", function() {
                authModal.classList.remove("hidden");
                loginForm.classList.remove("hidden");
                registerForm.classList.add("hidden");
            });

            closeAuthModal.addEventListener("click", function() {
                authModal.classList.add("hidden");
            });

            showRegister.addEventListener("click", function(e) {
                e.preventDefault();
                loginForm.classList.add("hidden");
                registerForm.classList.remove("hidden");
            });

            showLogin.addEventListener("click", function(e) {
                e.preventDefault();
                registerForm.classList.add("hidden");
                loginForm.classList.remove("hidden");
            });

            authModal.addEventListener("click", function(e) {
                if (e.target === authModal) {
                    authModal.classList.add("hidden");
                }
            });

            const followButtons = document.querySelectorAll(".follow-btn");
            followButtons.forEach((button) => {
                button.addEventListener("click", function() {
                    const isFollowing = this.classList.contains("following");

                    if (isFollowing) {
                        this.classList.remove("following");
                        this.classList.add("not-following");
                        this.textContent = "Follow";
                    } else {
                        this.classList.remove("not-following");
                        this.classList.add("following");
                        this.textContent = "Following";
                    }
                });
            });

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
</body>

</html>
