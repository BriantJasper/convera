@extends('partials.main')
<link rel="stylesheet" href="{{ asset('css/notificationsPage.css') }}">
@section('import-css')
@endsection




@section('main-content')
    <div class="notifications-container">
        <!-- Notifications Header -->
        <div class="notifications-header">
            <h1 class="notifications-title">
                <i class="fa fa-bell"></i>
                Notifications
            </h1>
            <button class="mark-all-read">Mark All as Read</button>
        </div>

        <!-- Notifications Filters -->
        <div class="notifications-filters">
            <button class="filter-btn active" data-filter="all">All</button>
            <button class="filter-btn" data-filter="likes">Likes</button>
            <button class="filter-btn" data-filter="comments">Comments</button>
            <button class="filter-btn" data-filter="follows">Follows</button>
            <button class="filter-btn" data-filter="mentions">Mentions</button>
        </div>

        <!-- Notifications List -->
        <div class="notifications-list">
            <!-- Like Notification -->
            <div class="notification-item unread" data-type="like">
                <div class="unread-indicator"></div>
                <div class="notification-content">
                    <div class="notification-icon like">
                        <i class="fa fa-heart"></i>
                    </div>
                    <div class="notification-details">
                        <div class="notification-text">
                            <strong>Sarah Johnson</strong> and
                            <strong>23 others</strong> liked your post about web
                            development trends.
                        </div>
                        <div class="notification-meta">
                            <div class="notification-time">
                                <i class="fa fa-clock"></i>
                                <span>2 minutes ago</span>
                            </div>
                            <div class="notification-actions">
                                <button class="notification-action view-btn">
                                    View Post
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Comment Notification -->
            <div class="notification-item unread" data-type="comment">
                <div class="unread-indicator"></div>
                <div class="notification-content">
                    <img src="https://via.placeholder.com/40" alt="Mike Chen" class="notification-avatar" />
                    <div class="notification-details">
                        <div class="notification-text">
                            <strong>Mike Chen</strong> commented on your post: "Great
                            insights! I especially loved the part about React hooks."
                        </div>
                        <div class="notification-meta">
                            <div class="notification-time">
                                <i class="fa fa-clock"></i>
                                <span>15 minutes ago</span>
                            </div>
                            <div class="notification-actions">
                                <button class="notification-action view-btn">
                                    Reply
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Follow Notification -->
            <div class="notification-item unread" data-type="follow">
                <div class="unread-indicator"></div>
                <div class="notification-content">
                    <img src="https://via.placeholder.com/40" alt="Emma Wilson" class="notification-avatar" />
                    <div class="notification-details">
                        <div class="notification-text">
                            <strong>Emma Wilson</strong> started following you.
                        </div>
                        <div class="notification-meta">
                            <div class="notification-time">
                                <i class="fa fa-clock"></i>
                                <span>1 hour ago</span>
                            </div>
                            <div class="notification-actions">
                                <button class="notification-action accept-btn">
                                    Follow Back
                                </button>
                                <button class="notification-action view-btn">
                                    View Profile
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Mention Notification -->
            <div class="notification-item" data-type="mention">
                <div class="notification-content">
                    <div class="notification-icon mention">
                        <i class="fa fa-at"></i>
                    </div>
                    <div class="notification-details">
                        <div class="notification-text">
                            <strong>Alex Rodriguez</strong> mentioned you in a comment:
                            "@johndoe what do you think about this approach?"
                        </div>
                        <div class="notification-meta">
                            <div class="notification-time">
                                <i class="fa fa-clock"></i>
                                <span>3 hours ago</span>
                            </div>
                            <div class="notification-actions">
                                <button class="notification-action view-btn">
                                    View Comment
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- System Notification -->
            <div class="notification-item" data-type="system">
                <div class="notification-content">
                    <div class="notification-icon system">
                        <i class="fa fa-info-circle"></i>
                    </div>
                    <div class="notification-details">
                        <div class="notification-text">
                            Your post "Understanding React Hooks" has reached
                            <strong>1,000 views</strong>! 🎉
                        </div>
                        <div class="notification-meta">
                            <div class="notification-time">
                                <i class="fa fa-clock"></i>
                                <span>6 hours ago</span>
                            </div>
                            <div class="notification-actions">
                                <button class="notification-action view-btn">
                                    View Analytics
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- More Like Notifications -->
            <div class="notification-item" data-type="like">
                <div class="notification-content">
                    <img src="https://via.placeholder.com/40" alt="David Kim" class="notification-avatar" />
                    <div class="notification-details">
                        <div class="notification-text">
                            <strong>David Kim</strong> liked your comment on "Future of
                            AI in Web Development".
                        </div>
                        <div class="notification-meta">
                            <div class="notification-time">
                                <i class="fa fa-clock"></i>
                                <span>1 day ago</span>
                            </div>
                            <div class="notification-actions">
                                <button class="notification-action view-btn">View</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Follow Request -->
            <div class="notification-item" data-type="follow">
                <div class="notification-content">
                    <img src="https://via.placeholder.com/40" alt="Lisa Zhang" class="notification-avatar" />
                    <div class="notification-details">
                        <div class="notification-text">
                            <strong>Lisa Zhang</strong> wants to follow you.
                        </div>
                        <div class="notification-meta">
                            <div class="notification-time">
                                <i class="fa fa-clock"></i>
                                <span>2 days ago</span>
                            </div>
                            <div class="notification-actions">
                                <button class="notification-action accept-btn">
                                    Accept
                                </button>
                                <button class="notification-action decline-btn">
                                    Decline
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Empty State (Hidden by default) -->
        <div class="empty-state" style="display: none">
            <i class="fa fa-bell-slash"></i>
            <h3>No Notifications</h3>
            <p>You're all caught up! New notifications will appear here.</p>
        </div>
    </div>
@endsection



@section('import-js')
    <script src="{{ asset('js/notificationsPage.js') }}"></script>
@endsection
