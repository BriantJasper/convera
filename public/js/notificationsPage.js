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

    // Mark all as read functionality
    const markAllReadBtn = document.querySelector(".mark-all-read");
    if (markAllReadBtn) {
        markAllReadBtn.addEventListener("click", function () {
            const unreadNotifications = document.querySelectorAll(
                ".notification-item.unread"
            );
            unreadNotifications.forEach((notification) => {
                notification.classList.remove("unread");
                const indicator =
                    notification.querySelector(".unread-indicator");
                if (indicator) {
                    indicator.remove();
                }
            });
            alert("All notifications marked as read!");
        });
    }

    // Filter functionality
    const filterBtns = document.querySelectorAll(".filter-btn");
    filterBtns.forEach((btn) => {
        btn.addEventListener("click", function () {
            filterBtns.forEach((b) => b.classList.remove("active"));
            this.classList.add("active");

            const filterType = this.getAttribute("data-filter");
            filterNotifications(filterType);
        });
    });

    function filterNotifications(filterType) {
        const notifications = document.querySelectorAll(".notification-item");

        notifications.forEach((notification) => {
            if (filterType === "all") {
                notification.style.display = "block";
            } else {
                const notificationType = notification.getAttribute("data-type");
                if (filterType === "likes" && notificationType === "like") {
                    notification.style.display = "block";
                } else if (
                    filterType === "comments" &&
                    notificationType === "comment"
                ) {
                    notification.style.display = "block";
                } else if (
                    filterType === "follows" &&
                    notificationType === "follow"
                ) {
                    notification.style.display = "block";
                } else if (
                    filterType === "mentions" &&
                    notificationType === "mention"
                ) {
                    notification.style.display = "block";
                } else {
                    notification.style.display = "none";
                }
            }
        });
    }

    // Notification click functionality
    const notificationItems = document.querySelectorAll(".notification-item");
    notificationItems.forEach((item) => {
        item.addEventListener("click", function (e) {
            // Don't trigger if clicking on action buttons
            if (e.target.classList.contains("notification-action")) {
                return;
            }

            // Mark as read
            this.classList.remove("unread");
            const indicator = this.querySelector(".unread-indicator");
            if (indicator) {
                indicator.remove();
            }

            // Show notification details
            const notificationText =
                this.querySelector(".notification-text").textContent;
            alert(
                `Opening notification: ${notificationText.substring(0, 50)}...`
            );
        });
    });

    // Notification action buttons
    const actionBtns = document.querySelectorAll(".notification-action");
    actionBtns.forEach((btn) => {
        btn.addEventListener("click", function (e) {
            e.stopPropagation();
            const action = this.textContent.trim();
            const notificationItem = this.closest(".notification-item");

            switch (action) {
                case "View Post":
                case "View":
                    alert("Opening post...");
                    break;
                case "Reply":
                    alert("Opening reply dialog...");
                    break;
                case "Follow Back":
                    this.textContent = "Following";
                    this.classList.remove("accept-btn");
                    this.classList.add("view-btn");
                    break;
                case "View Profile":
                    alert("Opening user profile...");
                    break;
                case "View Comment":
                    alert("Opening comment thread...");
                    break;
                case "View Analytics":
                    alert("Opening post analytics...");
                    break;
                case "Accept":
                    this.textContent = "Accepted";
                    this.style.backgroundColor = "#10b981";
                    const declineBtn =
                        notificationItem.querySelector(".decline-btn");
                    if (declineBtn) {
                        declineBtn.style.display = "none";
                    }
                    break;
                case "Decline":
                    notificationItem.style.opacity = "0.5";
                    setTimeout(() => {
                        notificationItem.remove();
                    }, 500);
                    break;
            }

            // Mark notification as read
            notificationItem.classList.remove("unread");
            const indicator =
                notificationItem.querySelector(".unread-indicator");
            if (indicator) {
                indicator.remove();
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

    // Auto-mark notifications as read when scrolling
    const observer = new IntersectionObserver((entries) => {
        entries.forEach((entry) => {
            if (
                entry.isIntersecting &&
                entry.target.classList.contains("unread")
            ) {
                setTimeout(() => {
                    entry.target.classList.remove("unread");
                    const indicator =
                        entry.target.querySelector(".unread-indicator");
                    if (indicator) {
                        indicator.remove();
                    }
                }, 2000); // Mark as read after 2 seconds of being visible
            }
        });
    });

    notificationItems.forEach((item) => {
        observer.observe(item);
    });
});
