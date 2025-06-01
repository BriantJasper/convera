@extends('partials.main')
<link rel="stylesheet" href="{{ asset('css/messages.css') }}">
@section('import-css')
@endsection




@section('main-content')
    <div class="messages-container">
        <!-- Conversations Panel -->
        <div class="conversations-panel">
            <div class="conversations-header">
                <h2 class="conversations-title">
                    <i class="fa fa-envelope"></i>
                    Messages
                </h2>
                <button class="new-message-btn">
                    <i class="fa fa-plus"></i>
                </button>
            </div>

            <div class="conversations-search">
                <input type="text" class="search-input" placeholder="Search conversations..." />
            </div>

            <div class="conversations-list">
                <!-- Active Conversation -->
                <div class="conversation-item active" data-user="sarah">
                    <div class="conversation-content">
                        <img src="https://via.placeholder.com/45" alt="Sarah Johnson" class="conversation-avatar" />
                        <div class="conversation-details">
                            <div class="conversation-header">
                                <span class="conversation-name">Sarah Johnson</span>
                                <span class="conversation-time">2m</span>
                            </div>
                            <div class="conversation-preview">
                                That sounds like a great idea! Let's discuss it further...
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Unread Conversation -->
                <div class="conversation-item unread" data-user="mike">
                    <div class="unread-badge"></div>
                    <div class="conversation-content">
                        <img src="https://via.placeholder.com/45" alt="Mike Chen" class="conversation-avatar" />
                        <div class="conversation-details">
                            <div class="conversation-header">
                                <span class="conversation-name">Mike Chen</span>
                                <span class="conversation-time">15m</span>
                            </div>
                            <div class="conversation-preview">
                                Hey! I saw your latest post about React hooks...
                            </div>
                        </div>
                    </div>
                </div>

                <!-- More Conversations -->
                <div class="conversation-item" data-user="emma">
                    <div class="conversation-content">
                        <img src="https://via.placeholder.com/45" alt="Emma Wilson" class="conversation-avatar" />
                        <div class="conversation-details">
                            <div class="conversation-header">
                                <span class="conversation-name">Emma Wilson</span>
                                <span class="conversation-time">1h</span>
                            </div>
                            <div class="conversation-preview">
                                Thanks for the feedback on my design!
                            </div>
                        </div>
                    </div>
                </div>

                <div class="conversation-item" data-user="alex">
                    <div class="conversation-content">
                        <img src="https://via.placeholder.com/45" alt="Alex Rodriguez" class="conversation-avatar" />
                        <div class="conversation-details">
                            <div class="conversation-header">
                                <span class="conversation-name">Alex Rodriguez</span>
                                <span class="conversation-time">3h</span>
                            </div>
                            <div class="conversation-preview">
                                Are you available for a quick call tomorrow?
                            </div>
                        </div>
                    </div>
                </div>

                <div class="conversation-item" data-user="lisa">
                    <div class="conversation-content">
                        <img src="https://via.placeholder.com/45" alt="Lisa Zhang" class="conversation-avatar" />
                        <div class="conversation-details">
                            <div class="conversation-header">
                                <span class="conversation-name">Lisa Zhang</span>
                                <span class="conversation-time">1d</span>
                            </div>
                            <div class="conversation-preview">
                                The project looks amazing! Great work 👏
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Chat Panel -->
        <div class="chat-panel">
            <div class="chat-header">
                <div class="chat-user-info">
                    <img src="https://via.placeholder.com/40" alt="Sarah Johnson" class="chat-avatar" />
                    <div class="chat-user-details">
                        <h3>Sarah Johnson</h3>
                        <p class="chat-user-status">Online</p>
                    </div>
                </div>
                <div class="chat-actions">
                    <button class="chat-action-btn">
                        <i class="fa fa-phone"></i>
                    </button>
                    <button class="chat-action-btn">
                        <i class="fa fa-video"></i>
                    </button>
                    <button class="chat-action-btn">
                        <i class="fa fa-info-circle"></i>
                    </button>
                </div>
            </div>

            <div class="chat-messages" id="chatMessages">
                <!-- Received Message -->
                <div class="message received">
                    <img src="https://via.placeholder.com/32" alt="Sarah" class="message-avatar" />
                    <div class="message-content">
                        <p class="message-text">
                            Hey! I saw your latest post about web development trends.
                            Really insightful!
                        </p>
                        <div class="message-time">10:30 AM</div>
                    </div>
                </div>

                <!-- Sent Message -->
                <div class="message sent">
                    <img src="../src/profile.jpg" alt="You" class="message-avatar" />
                    <div class="message-content">
                        <p class="message-text">
                            Thanks! I'm glad you found it helpful. I've been researching
                            this topic for a while.
                        </p>
                        <div class="message-time">10:32 AM</div>
                    </div>
                </div>

                <!-- Received Message -->
                <div class="message received">
                    <img src="https://via.placeholder.com/32" alt="Sarah" class="message-avatar" />
                    <div class="message-content">
                        <p class="message-text">
                            That sounds like a great idea! Let's discuss it further. Do
                            you have time for a quick call this afternoon?
                        </p>
                        <div class="message-time">10:35 AM</div>
                    </div>
                </div>

                <!-- Typing Indicator -->
                <div class="message received" id="typingIndicator" style="display: none">
                    <img src="https://via.placeholder.com/32" alt="Sarah" class="message-avatar" />
                    <div class="typing-indicator">
                        <div class="typing-dots">
                            <div class="typing-dot"></div>
                            <div class="typing-dot"></div>
                            <div class="typing-dot"></div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="chat-input-container">
                <div class="chat-input-wrapper">
                    <textarea class="chat-input" placeholder="Type a message..." rows="1" id="messageInput"></textarea>
                    <div class="chat-input-actions">
                        <button class="input-action-btn">
                            <i class="fa fa-paperclip"></i>
                        </button>
                        <button class="input-action-btn">
                            <i class="fa fa-smile"></i>
                        </button>
                        <button class="send-btn" id="sendBtn" disabled>
                            <i class="fa fa-paper-plane"></i>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection



@section('import-js')
    <script src="{{ asset('js/messages.js') }}"></script>
@endsection
