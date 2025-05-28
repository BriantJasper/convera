   <div id="authModal" class="modal-overlay hidden">
       <style>
           .error-message {
               color: #ff4444;
               font-size: 0.85rem;
               margin-top: 5px;
               padding-left: 5px;
           }

           .is-invalid {
               border-color: #ff4444 !important;
           }

           .is-invalid:focus {
               box-shadow: 0 0 0 2px rgba(255, 68, 68, 0.2) !important;
           }
       </style>
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
                       <label for="login-email">Email</label>
                       <input type="email" name="email" id="login-email" placeholder="Enter your email"
                           autocomplete="email" required />
                   </div>
                   <div class="form-group">
                       <label for="login-password">Password</label>
                       <input type="password" name="password" id="login-password" placeholder="Enter your password"
                           required class="@error('password') is-invalid @enderror" autocomplete="current-password" />
                       @error('password')
                           <div class="error-message">{{ $message }}</div>
                       @enderror
                   </div>
                   <div class="form-options">
                       <label class="checkbox">
                           <input type="checkbox" id="remember" name="remember" />
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

                       <a href="{{ route('google.login') }}" class="btn btn-google"
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
                  margin: 12px auto 10px auto;
                  text-decoration: none;
                ">
                           <i class="fab fa-google" style="font-size: 15px"></i>
                       </a>
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
               <form method="POST" action="{{ route('register') }}">
                   @csrf
                   <div class="form-group">
                       <label for="reg-email">Email</label>
                       <input type="email" id="reg-email" name="email" placeholder="Enter your email" required
                           class="@error('email') is-invalid @enderror" value="{{ old('email') }}" />
                       @error('email')
                           <div class="error-message">{{ $message }}</div>
                       @enderror
                   </div>
                   <div class="form-group">
                       <label for="reg-password">Password</label>
                       <input type="password" id="reg-password" name="password" placeholder="Enter your password"
                           required class="@error('password') is-invalid @enderror" />
                       @error('password')
                           <div class="error-message">{{ $message }}</div>
                       @enderror
                   </div>
                   <div class="form-group">
                       <label for="reg-password-confirm">Confirm Password</label>
                       <input type="password" id="reg-password-confirm" name="password_confirmation"
                           placeholder="Confirm your password" required />
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
