@extends('partials.main')
<link rel="stylesheet" href="{{ asset('css/settings.css') }}">
@section('import-css')
@endsection




@section('main-content')
    <div class="settings-container">
        <!-- Settings Sidebar -->
        <div class="settings-sidebar">
            <nav class="settings-nav">
                <a href="#" class="settings-nav-item active" data-section="account">
                    <i class="fa fa-user"></i>
                    <span>Account</span>
                </a>
                <a href="#" class="settings-nav-item" data-section="privacy">
                    <i class="fa fa-shield-alt"></i>
                    <span>Privacy</span>
                </a>
                <a href="#" class="settings-nav-item" data-section="notifications">
                    <i class="fa fa-bell"></i>
                    <span>Notifications</span>
                </a>
                <a href="#" class="settings-nav-item" data-section="appearance">
                    <i class="fa fa-palette"></i>
                    <span>Appearance</span>
                </a>
                <a href="#" class="settings-nav-item" data-section="security">
                    <i class="fa fa-lock"></i>
                    <span>Security</span>
                </a>
            </nav>
        </div>

        <!-- Settings Content -->
        <div class="settings-content">
            <!-- Account Settings -->
            <div class="settings-section active" id="account">
                <h2 class="section-title">
                    <i class="fa fa-user"></i>
                    Account Settings
                </h2>

                <form action="{{ route('settings.profile.update') }}" method="POST" enctype="multipart/form-data">
                    @csrf
                    @method('PUT')
                    <div class="setting-group">
                        <div class="profile-upload">
                            <img src="{{ $user->avatar ? asset($user->avatar) : asset('images/default-avatar.png') }}"
                                alt="Profile" class="profile-preview" id="profilePreview" />
                            <div>
                                <button type="button" class="upload-btn">
                                    <i class="fa fa-camera"></i>
                                    Change Photo
                                </button>
                                <input type="file" name="avatar" id="profileUpload" style="display: none"
                                    accept="image/*" />
                            </div>
                        </div>

                        <div class="setting-item">
                            <div class="setting-info">
                                <div class="setting-label">Full Name</div>
                                <div class="setting-description">
                                    Your display name on Convera
                                </div>
                            </div>
                            <div class="setting-control">
                                <input type="text" name="name" class="input-field @error('name') is-invalid @enderror"
                                    value="{{ old('name', $user->name) }}" />
                                @error('name')
                                    <div class="error-message">{{ $message }}</div>
                                @enderror
                            </div>
                        </div>

                        <div class="setting-item">
                            <div class="setting-info">
                                <div class="setting-label">Email</div>
                                <div class="setting-description">Your email address</div>
                            </div>
                            <div class="setting-control">
                                <input type="email" name="email"
                                    class="input-field @error('email') is-invalid @enderror"
                                    value="{{ old('email', $user->email) }}" />
                                @error('email')
                                    <div class="error-message">{{ $message }}</div>
                                @enderror
                            </div>
                        </div>

                        <div class="setting-item">
                            <div class="setting-info">
                                <div class="setting-label">Bio</div>
                                <div class="setting-description">
                                    Tell others about yourself
                                </div>
                            </div>
                            <div class="setting-control">
                                <textarea name="bio" class="input-field @error('bio') is-invalid @enderror" rows="3"
                                    style="width: 300px; resize: vertical">{{ old('bio', $user->bio) }}</textarea>
                                @error('bio')
                                    <div class="error-message">{{ $message }}</div>
                                @enderror
                            </div>
                        </div>

                        <div class="setting-item">
                            <div class="setting-info">
                                <div class="setting-label">Work</div>
                                <div class="setting-description">Your current work or profession</div>
                            </div>
                            <div class="setting-control">
                                <input type="text" name="work" class="input-field @error('work') is-invalid @enderror"
                                    value="{{ old('work', $user->work) }}" />
                                @error('work')
                                    <div class="error-message">{{ $message }}</div>
                                @enderror
                            </div>
                        </div>

                        <div class="setting-item">
                            <div class="setting-info">
                                <div class="setting-label">Education</div>
                                <div class="setting-description">Your educational background</div>
                            </div>
                            <div class="setting-control">
                                <input type="text" name="education"
                                    class="input-field @error('education') is-invalid @enderror"
                                    value="{{ old('education', $user->education) }}" />
                                @error('education')
                                    <div class="error-message">{{ $message }}</div>
                                @enderror
                            </div>
                        </div>

                        <div class="setting-item">
                            <div class="setting-info">
                                <div class="setting-label">Location</div>
                                <div class="setting-description">Where you're based</div>
                            </div>
                            <div class="setting-control">
                                <input type="text" name="location"
                                    class="input-field @error('location') is-invalid @enderror"
                                    value="{{ old('location', $user->location) }}" />
                                @error('location')
                                    <div class="error-message">{{ $message }}</div>
                                @enderror
                            </div>
                        </div>

                        <div class="setting-item">
                            <div class="setting-info">
                                <div class="setting-label">Website</div>
                                <div class="setting-description">
                                    Your personal website or portfolio
                                </div>
                            </div>
                            <div class="setting-control">
                                <input type="url" name="website"
                                    class="input-field @error('website') is-invalid @enderror"
                                    value="{{ old('website', $user->website) }}" />
                                @error('website')
                                    <div class="error-message">{{ $message }}</div>
                                @enderror
                            </div>
                        </div>

                        <button type="submit" class="btn-primary">Save Changes</button>
                    </div>
                </form>
            </div>

            <!-- Privacy Settings -->
            <div class="settings-section" id="privacy">
                <h2 class="section-title">
                    <i class="fa fa-shield-alt"></i>
                    Privacy Settings
                </h2>

                <div class="setting-group">
                    <div class="setting-item">
                        <div class="setting-info">
                            <div class="setting-label">Profile Visibility</div>
                            <div class="setting-description">
                                Who can see your profile
                            </div>
                        </div>
                        <div class="setting-control">
                            <select class="select-field">
                                <option value="public">Public</option>
                                <option value="followers">Followers Only</option>
                                <option value="private">Private</option>
                            </select>
                        </div>
                    </div>

                    <div class="setting-item">
                        <div class="setting-info">
                            <div class="setting-label">Show Online Status</div>
                            <div class="setting-description">
                                Let others see when you're online
                            </div>
                        </div>
                        <div class="setting-control">
                            <div class="toggle-switch active">
                                <div class="toggle-slider"></div>
                            </div>
                        </div>
                    </div>

                    <div class="setting-item">
                        <div class="setting-info">
                            <div class="setting-label">Allow Direct Messages</div>
                            <div class="setting-description">
                                Who can send you messages
                            </div>
                        </div>
                        <div class="setting-control">
                            <select class="select-field">
                                <option value="everyone">Everyone</option>
                                <option value="followers">Followers Only</option>
                                <option value="none">No One</option>
                            </select>
                        </div>
                    </div>

                    <div class="setting-item">
                        <div class="setting-info">
                            <div class="setting-label">Show Activity Status</div>
                            <div class="setting-description">
                                Show your activity in posts and comments
                            </div>
                        </div>
                        <div class="setting-control">
                            <div class="toggle-switch active">
                                <div class="toggle-slider"></div>
                            </div>
                        </div>
                    </div>

                    <div class="setting-item">
                        <div class="setting-info">
                            <div class="setting-label">Search Engine Indexing</div>
                            <div class="setting-description">
                                Allow search engines to index your profile
                            </div>
                        </div>
                        <div class="setting-control">
                            <div class="toggle-switch">
                                <div class="toggle-slider"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Notification Settings -->
            <div class="settings-section" id="notifications">
                <h2 class="section-title">
                    <i class="fa fa-bell"></i>
                    Notification Settings
                </h2>

                <div class="setting-group">
                    <div class="setting-item">
                        <div class="setting-info">
                            <div class="setting-label">Push Notifications</div>
                            <div class="setting-description">
                                Receive notifications on your device
                            </div>
                        </div>
                        <div class="setting-control">
                            <div class="toggle-switch active">
                                <div class="toggle-slider"></div>
                            </div>
                        </div>
                    </div>

                    <div class="setting-item">
                        <div class="setting-info">
                            <div class="setting-label">Email Notifications</div>
                            <div class="setting-description">
                                Receive notifications via email
                            </div>
                        </div>
                        <div class="setting-control">
                            <div class="toggle-switch active">
                                <div class="toggle-slider"></div>
                            </div>
                        </div>
                    </div>

                    <div class="setting-item">
                        <div class="setting-info">
                            <div class="setting-label">Likes and Reactions</div>
                            <div class="setting-description">
                                When someone likes your posts
                            </div>
                        </div>
                        <div class="setting-control">
                            <div class="toggle-switch active">
                                <div class="toggle-slider"></div>
                            </div>
                        </div>
                    </div>

                    <div class="setting-item">
                        <div class="setting-info">
                            <div class="setting-label">Comments</div>
                            <div class="setting-description">
                                When someone comments on your posts
                            </div>
                        </div>
                        <div class="setting-control">
                            <div class="toggle-switch active">
                                <div class="toggle-slider"></div>
                            </div>
                        </div>
                    </div>

                    <div class="setting-item">
                        <div class="setting-info">
                            <div class="setting-label">New Followers</div>
                            <div class="setting-description">
                                When someone follows you
                            </div>
                        </div>
                        <div class="setting-control">
                            <div class="toggle-switch active">
                                <div class="toggle-slider"></div>
                            </div>
                        </div>
                    </div>

                    <div class="setting-item">
                        <div class="setting-info">
                            <div class="setting-label">Mentions</div>
                            <div class="setting-description">
                                When someone mentions you
                            </div>
                        </div>
                        <div class="setting-control">
                            <div class="toggle-switch active">
                                <div class="toggle-slider"></div>
                            </div>
                        </div>
                    </div>

                    <div class="setting-item">
                        <div class="setting-info">
                            <div class="setting-label">Direct Messages</div>
                            <div class="setting-description">
                                When you receive a new message
                            </div>
                        </div>
                        <div class="setting-control">
                            <div class="toggle-switch active">
                                <div class="toggle-slider"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Appearance Settings -->
            <div class="settings-section" id="appearance">
                <h2 class="section-title">
                    <i class="fa fa-palette"></i>
                    Appearance Settings
                </h2>

                <div class="setting-group">
                    <div class="setting-item">
                        <div class="setting-info">
                            <div class="setting-label">Theme</div>
                            <div class="setting-description">
                                Choose your preferred theme
                            </div>
                        </div>
                        <div class="setting-control">
                            <select class="select-field">
                                <option value="dark" selected>Dark</option>
                                <option value="light">Light</option>
                                <option value="auto">Auto</option>
                            </select>
                        </div>
                    </div>

                    <div class="setting-item">
                        <div class="setting-info">
                            <div class="setting-label">Font Size</div>
                            <div class="setting-description">
                                Adjust text size for better readability
                            </div>
                        </div>
                        <div class="setting-control">
                            <select class="select-field">
                                <option value="small">Small</option>
                                <option value="medium" selected>Medium</option>
                                <option value="large">Large</option>
                            </select>
                        </div>
                    </div>

                    <div class="setting-item">
                        <div class="setting-info">
                            <div class="setting-label">Reduce Motion</div>
                            <div class="setting-description">
                                Minimize animations and transitions
                            </div>
                        </div>
                        <div class="setting-control">
                            <div class="toggle-switch">
                                <div class="toggle-slider"></div>
                            </div>
                        </div>
                    </div>

                    <div class="setting-item">
                        <div class="setting-info">
                            <div class="setting-label">High Contrast</div>
                            <div class="setting-description">
                                Increase contrast for better visibility
                            </div>
                        </div>
                        <div class="setting-control">
                            <div class="toggle-switch">
                                <div class="toggle-slider"></div>
                            </div>
                        </div>
                    </div>

                    <div class="setting-item">
                        <div class="setting-info">
                            <div class="setting-label">Language</div>
                            <div class="setting-description">
                                Choose your preferred language
                            </div>
                        </div>
                        <div class="setting-control">
                            <select class="select-field">
                                <option value="en" selected>English</option>
                                <option value="id">Bahasa Indonesia</option>
                                <option value="es">Español</option>
                                <option value="fr">Français</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Security Settings -->
            <div class="settings-section" id="security">
                <h2 class="section-title">
                    <i class="fa fa-lock"></i>
                    Security Settings
                </h2>

                <div class="setting-group">
                    <div class="setting-item">
                        <div class="setting-info">
                            <div class="setting-label">Change Password</div>
                            <div class="setting-description">
                                Update your account password
                            </div>
                        </div>
                        <div class="setting-control">
                            <button class="btn-primary">Change Password</button>
                        </div>
                    </div>

                    <div class="setting-item">
                        <div class="setting-info">
                            <div class="setting-label">Two-Factor Authentication</div>
                            <div class="setting-description">
                                Add an extra layer of security
                            </div>
                        </div>
                        <div class="setting-control">
                            <div class="toggle-switch">
                                <div class="toggle-slider"></div>
                            </div>
                        </div>
                    </div>

                    <div class="setting-item">
                        <div class="setting-info">
                            <div class="setting-label">Login Alerts</div>
                            <div class="setting-description">
                                Get notified of new login attempts
                            </div>
                        </div>
                        <div class="setting-control">
                            <div class="toggle-switch active">
                                <div class="toggle-slider"></div>
                            </div>
                        </div>
                    </div>

                    <div class="setting-item">
                        <div class="setting-info">
                            <div class="setting-label">Active Sessions</div>
                            <div class="setting-description">
                                Manage your active login sessions
                            </div>
                        </div>
                        <div class="setting-control">
                            <button class="btn-primary">View Sessions</button>
                        </div>
                    </div>

                    <div class="setting-item">
                        <div class="setting-info">
                            <div class="setting-label">Download Your Data</div>
                            <div class="setting-description">
                                Get a copy of your account data
                            </div>
                        </div>
                        <div class="setting-control">
                            <button class="btn-primary">Request Download</button>
                        </div>
                    </div>
                </div>

                <div class="danger-zone">
                    <h3>Danger Zone</h3>
                    <p>
                        These actions are irreversible. Please proceed with caution.
                    </p>
                    <div class="setting-item">
                        <div class="setting-info">
                            <div class="setting-label">Deactivate Account</div>
                            <div class="setting-description">
                                Temporarily disable your account
                            </div>
                        </div>
                        <div class="setting-control">
                            <button class="btn-danger">Deactivate</button>
                        </div>
                    </div>
                    <div class="setting-item">
                        <div class="setting-info">
                            <div class="setting-label">Delete Account</div>
                            <div class="setting-description">
                                Permanently delete your account and all data
                            </div>
                        </div>
                        <div class="setting-control">
                            <button class="btn-danger" id="deleteAccountBtn">Delete Account</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection



@section('import-js')
    <script src="{{ asset('js/settings.js') }}"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Handle avatar upload preview
            const profileUpload = document.getElementById('profileUpload');
            const profilePreview = document.getElementById('profilePreview');
            const uploadBtn = document.querySelector('.upload-btn');

            uploadBtn.addEventListener('click', () => {
                profileUpload.click();
            });

            profileUpload.addEventListener('change', function(e) {
                if (this.files && this.files[0]) {
                    const reader = new FileReader();
                    reader.onload = function(e) {
                        profilePreview.src = e.target.result;
                    }
                    reader.readAsDataURL(this.files[0]);
                }
            });

            // Handle form submission
            const form = document.querySelector('form');
            form.addEventListener('submit', function(e) {
                e.preventDefault();

                const formData = new FormData(this);

                fetch(this.action, {
                        method: 'POST',
                        body: formData,
                        headers: {
                            'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').content
                        }
                    })
                    .then(response => response.json())
                    .then(data => {
                        if (data.success) {
                            // Show success notification
                            const notification = document.createElement('div');
                            notification.className = 'notification success';
                            notification.innerHTML = `
                            <div class="notification-content">
                                <i class="fa fa-check-circle"></i>
                                <span>${data.message}</span>
                            </div>
                            <button class="notification-close">&times;</button>
                        `;
                            document.body.appendChild(notification);

                            // Remove notification after 3 seconds
                            setTimeout(() => {
                                notification.remove();
                            }, 3000);

                            // Handle close button
                            notification.querySelector('.notification-close').addEventListener('click',
                                () => {
                                    notification.remove();
                                });
                        }
                    })
                    .catch(error => {
                        console.error('Error:', error);
                    });
            });
        });
    </script>
@endsection
