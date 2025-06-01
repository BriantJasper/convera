document.addEventListener("DOMContentLoaded", function () {
    // Login button functionality
    const loginBtn = document.getElementById("loginBtn");
    if (loginBtn) {
        loginBtn.addEventListener("click", function () {
            alert("Login functionality coming soon!");
        });
    }

    // Search functionality
    const searchInput = document.querySelector(".search-container input");
    const searchButton = document.querySelector(".search-container button");

    if (searchButton && searchInput) {
        searchButton.addEventListener("click", function () {
            performSearch();
        });

        searchInput.addEventListener("keypress", function (e) {
            if (e.key === "Enter") {
                performSearch();
            }
        });

        function performSearch() {
            const query = searchInput.value.trim();
            if (query) {
                alert(`Searching for: "${query}"`);
                searchInput.value = "";
            }
        }
    }

    // Message input functionality
    const messageInput = document.getElementById("messageInput");
    const sendBtn = document.getElementById("sendBtn");
    const chatMessages = document.getElementById("chatMessages");
    const typingIndicator = document.getElementById("typingIndicator");

    // Auto-resize textarea
    messageInput.addEventListener("input", function () {
        this.style.height = "auto";
        this.style.height = this.scrollHeight + "px";

        // Enable/disable send button
        sendBtn.disabled = this.value.trim() === "";
    });

    // Send message on Enter (Shift+Enter for new line)
    messageInput.addEventListener("keypress", function (e) {
        if (e.key === "Enter" && !e.shiftKey) {
            e.preventDefault();
            sendMessage();
        }
    });

    // Send button click
    sendBtn.addEventListener("click", sendMessage);

    function sendMessage() {
        const message = messageInput.value.trim();
        if (message === "") return;

        // Create sent message
        const messageDiv = document.createElement("div");
        messageDiv.className = "message sent";
        messageDiv.innerHTML = `
      <img src="../src/profile.jpg" alt="You" class="message-avatar" />
      <div class="message-content">
        <p class="message-text">${message}</p>
        <div class="message-time">${getCurrentTime()}</div>
      </div>
    `;

        chatMessages.appendChild(messageDiv);
        messageInput.value = "";
        messageInput.style.height = "auto";
        sendBtn.disabled = true;

        // Scroll to bottom
        chatMessages.scrollTop = chatMessages.scrollHeight;

        // Show typing indicator
        setTimeout(() => {
            typingIndicator.style.display = "flex";
            chatMessages.scrollTop = chatMessages.scrollHeight;
        }, 1000);

        // Simulate response
        setTimeout(() => {
            typingIndicator.style.display = "none";
            simulateResponse();
        }, 3000);
    }

    function simulateResponse() {
        const responses = [
            "That's a great point!",
            "I completely agree with you.",
            "Thanks for sharing that!",
            "Interesting perspective!",
            "Let me think about that.",
            "Sounds good to me!",
        ];

        const randomResponse =
            responses[Math.floor(Math.random() * responses.length)];

        const messageDiv = document.createElement("div");
        messageDiv.className = "message received";
        messageDiv.innerHTML = `
      <img src="https://via.placeholder.com/32" alt="Sarah" class="message-avatar" />
      <div class="message-content">
        <p class="message-text">${randomResponse}</p>
        <div class="message-time">${getCurrentTime()}</div>
      </div>
    `;

        chatMessages.appendChild(messageDiv);
        chatMessages.scrollTop = chatMessages.scrollHeight;
    }

    function getCurrentTime() {
        const now = new Date();
        return now.toLocaleTimeString([], {
            hour: "2-digit",
            minute: "2-digit",
        });
    }

    // Conversation switching
    const conversationItems = document.querySelectorAll(".conversation-item");
    conversationItems.forEach((item) => {
        item.addEventListener("click", function () {
            // Remove active class from all items
            conversationItems.forEach((conv) =>
                conv.classList.remove("active")
            );

            // Add active class to clicked item
            this.classList.add("active");

            // Remove unread status
            this.classList.remove("unread");
            const unreadBadge = this.querySelector(".unread-badge");
            if (unreadBadge) {
                unreadBadge.remove();
            }

            // Update chat header
            const userName =
                this.querySelector(".conversation-name").textContent;
            const userAvatar = this.querySelector(".conversation-avatar").src;

            document.querySelector(".chat-user-details h3").textContent =
                userName;
            document.querySelector(".chat-avatar").src = userAvatar;

            // Clear chat messages and load conversation
            loadConversation(this.dataset.user);
        });
    });

    function loadConversation(userId) {
        // Clear current messages
        chatMessages.innerHTML = "";

        // Load different conversation based on user
        const conversations = {
            sarah: [
                {
                    type: "received",
                    text: "Hey! I saw your latest post about web development trends. Really insightful!",
                    time: "10:30 AM",
                },
                {
                    type: "sent",
                    text: "Thanks! I'm glad you found it helpful. I've been researching this topic for a while.",
                    time: "10:32 AM",
                },
                {
                    type: "received",
                    text: "That sounds like a great idea! Let's discuss it further. Do you have time for a quick call this afternoon?",
                    time: "10:35 AM",
                },
            ],
            mike: [
                {
                    type: "received",
                    text: "Hey! I saw your latest post about React hooks. Could you explain the useEffect dependency array?",
                    time: "9:45 AM",
                },
                {
                    type: "sent",
                    text: "Sure! The dependency array tells React when to re-run the effect. If you pass an empty array, it only runs once.",
                    time: "9:47 AM",
                },
            ],
            emma: [
                {
                    type: "received",
                    text: "Thanks for the feedback on my design! I really appreciate your insights.",
                    time: "Yesterday",
                },
                {
                    type: "sent",
                    text: "You're welcome! Your design skills are really impressive. Keep up the great work!",
                    time: "Yesterday",
                },
            ],
            alex: [
                {
                    type: "received",
                    text: "Are you available for a quick call tomorrow? I'd like to discuss the project timeline.",
                    time: "2:30 PM",
                },
            ],
            lisa: [
                {
                    type: "received",
                    text: "The project looks amazing! Great work 👏",
                    time: "Yesterday",
                },
                {
                    type: "sent",
                    text: "Thank you so much! It was a team effort.",
                    time: "Yesterday",
                },
            ],
        };

        const messages = conversations[userId] || [];
        messages.forEach((msg) => {
            const messageDiv = document.createElement("div");
            messageDiv.className = `message ${msg.type}`;
            messageDiv.innerHTML = `
        <img src="${
            msg.type === "sent"
                ? "../src/profile.jpg"
                : "https://via.placeholder.com/32"
        }" alt="${
                msg.type === "sent" ? "You" : "User"
            }" class="message-avatar" />
        <div class="message-content">
          <p class="message-text">${msg.text}</p>
          <div class="message-time">${msg.time}</div>
        </div>
      `;
            chatMessages.appendChild(messageDiv);
        });

        // Add typing indicator
        const typingDiv = document.createElement("div");
        typingDiv.className = "message received";
        typingDiv.id = "typingIndicator";
        typingDiv.style.display = "none";
        typingDiv.innerHTML = `
      <img src="https://via.placeholder.com/32" alt="User" class="message-avatar" />
      <div class="typing-indicator">
        <div class="typing-dots">
          <div class="typing-dot"></div>
          <div class="typing-dot"></div>
          <div class="typing-dot"></div>
        </div>
      </div>
    `;
        chatMessages.appendChild(typingDiv);

        chatMessages.scrollTop = chatMessages.scrollHeight;
    }

    // Conversation search
    const conversationSearch = document.querySelector(".search-input");
    conversationSearch.addEventListener("input", function () {
        const query = this.value.toLowerCase();
        conversationItems.forEach((item) => {
            const name = item
                .querySelector(".conversation-name")
                .textContent.toLowerCase();
            const preview = item
                .querySelector(".conversation-preview")
                .textContent.toLowerCase();

            if (name.includes(query) || preview.includes(query)) {
                item.style.display = "block";
            } else {
                item.style.display = "none";
            }
        });
    });

    // New message button
    const newMessageBtn = document.querySelector(".new-message-btn");
    newMessageBtn.addEventListener("click", function () {
        alert("New message functionality coming soon!");
    });

    // Chat action buttons
    const chatActionBtns = document.querySelectorAll(".chat-action-btn");
    chatActionBtns.forEach((btn) => {
        btn.addEventListener("click", function () {
            const icon = this.querySelector("i").className;
            if (icon.includes("phone")) {
                alert("Starting voice call...");
            } else if (icon.includes("video")) {
                alert("Starting video call...");
            } else if (icon.includes("info")) {
                alert("Opening user info...");
            }
        });
    });

    // Input action buttons
    const inputActionBtns = document.querySelectorAll(".input-action-btn");
    inputActionBtns.forEach((btn) => {
        btn.addEventListener("click", function () {
            const icon = this.querySelector("i").className;
            if (icon.includes("paperclip")) {
                alert("File attachment coming soon!");
            } else if (icon.includes("smile")) {
                alert("Emoji picker coming soon!");
            }
        });
    });

    // Sidebar follow buttons
    const followBtns = document.querySelectorAll(".follow-btn");
    followBtns.forEach((btn) => {
        btn.addEventListener("click", function () {
            if (this.textContent === "Follow") {
                this.textContent = "Following";
                this.style.backgroundColor = "#10b981";
            } else {
                this.textContent = "Follow";
                this.style.backgroundColor = "";
            }
        });
    });

    // Hashtag functionality
    const hashtags = document.querySelectorAll(".hashtag");
    hashtags.forEach((hashtag) => {
        hashtag.addEventListener("click", function (e) {
            e.preventDefault();
            const tag = this.textContent;
            alert(`Searching for posts with ${tag}`);
        });
    });
});
