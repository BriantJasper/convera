<div id="authModal" class="modal-overlay hidden">
    <div class="auth-card">
        <button class="close-modal" id="closeAuthModal">&times;</button>
        <div class="auth-icon">
            <i class="fa fa-user"></i>
        </div>
        <div class="tab-content" id="loginForm">
            <h2 class="auth-title">Welcome Back</h2>
            <div class="auth-subtitle">Sign in to your account</div>
            <form method="POST" action="{{ route('login') }}">
                @csrf
                <div class="form-group">
                    <x-input-label for="login-email" :value="__('Email')" />
                    <x-text-input type="email" name="email" :value="old('email')" id="login-email"
                        placeholder="Enter your email" required autofocus autocomplete="username" />
                    <x-input-error :messages="$errors->get('email')" class="mt-2" />
                </div>
                <div class="form-group">
                    <label for="login-password">Password</label>
                    <input type="password" name="password" id="login-password" placeholder="Enter your password"
                        required />
                </div>
                <div class="form-options">
                    <label class="checkbox">
                        <input type="checkbox" name="remember" id="remember" />
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
