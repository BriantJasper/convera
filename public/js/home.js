document.addEventListener("DOMContentLoaded", function () {
    const loginBtn = document.getElementById("loginBtn");
    const authModal = document.getElementById("authModal");
    const closeAuthModal = document.getElementById("closeAuthModal");
    const loginForm = document.getElementById("loginForm");
    const registerForm = document.getElementById("registerForm");
    const showRegister = document.getElementById("showRegister");
    const showLogin = document.getElementById("showLogin");

    // Only add auth-related event listeners if the elements exist
    if (loginBtn && authModal) {
        loginBtn.addEventListener("click", function () {
            authModal.classList.remove("hidden");
            if (loginForm) loginForm.classList.remove("hidden");
            if (registerForm) registerForm.classList.add("hidden");
        });
    }

    if (closeAuthModal && authModal) {
        closeAuthModal.addEventListener("click", function () {
            authModal.classList.add("hidden");
        });
    }

    if (showRegister && loginForm && registerForm) {
        showRegister.addEventListener("click", function (e) {
            e.preventDefault();
            loginForm.classList.add("hidden");
            registerForm.classList.remove("hidden");
        });
    }

    if (showLogin && loginForm && registerForm) {
        showLogin.addEventListener("click", function (e) {
            e.preventDefault();
            registerForm.classList.add("hidden");
            loginForm.classList.remove("hidden");
        });
    }

    if (authModal) {
        authModal.addEventListener("click", function (e) {
            if (e.target === authModal) {
                authModal.classList.add("hidden");
            }
        });
    }

    // Post actions menu functionality
    document.body.addEventListener("click", function (e) {
        // Handle dot menu button click
        if (e.target.closest(".dot-menu-btn")) {
            e.preventDefault();
            e.stopPropagation();

            const btn = e.target.closest(".dot-menu-btn");
            const menu = btn.parentElement.querySelector(".dropdown-menu");

            // Close all other menus first
            document
                .querySelectorAll(".dropdown-menu")
                .forEach(function (otherMenu) {
                    if (otherMenu !== menu) {
                        otherMenu.classList.add("hidden");
                    }
                });

            // Toggle the clicked menu
            if (menu) {
                menu.classList.toggle("hidden");
            }
        }

        // Handle menu item clicks
        if (e.target.closest(".dropdown-menu a")) {
            e.preventDefault();
            e.stopPropagation();
            const link = e.target.closest(".dropdown-menu a");

            // Handle different menu actions
            if (link.classList.contains("delete-post")) {
                const postId = link.dataset.postId;
                if (confirm("Are you sure you want to delete this post?")) {
                    // Add delete functionality here
                    console.log("Deleting post:", postId);
                }
            } else if (link.classList.contains("hide-post")) {
                // Add hide functionality here
                console.log("Hiding post");
            } else if (link.classList.contains("report-post")) {
                // Add report functionality here
                console.log("Reporting post");
            }
        }

        // Close menu when clicking outside
        if (!e.target.closest(".post-actions-menu")) {
            document
                .querySelectorAll(".dropdown-menu")
                .forEach(function (menu) {
                    menu.classList.add("hidden");
                });
        }
    });

    // Prevent menu from closing when clicking inside it
    document.querySelectorAll(".dropdown-menu").forEach(function (menu) {
        menu.addEventListener("click", function (e) {
            e.stopPropagation();
        });
    });

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
                // Here you would implement actual search functionality
                searchInput.value = "";
            }
        }
    }

    // Header icons functionality - removed preventDefault to allow navigation

    // Post creation functionality
    const createPostInput = document.querySelector(".create-post input");
    const postActionButtons = document.querySelectorAll(".post-actions button");

    if (createPostInput) {
        createPostInput.addEventListener("focus", function () {
            this.placeholder = "What's on your mind?";
        });

        createPostInput.addEventListener("blur", function () {
            this.placeholder = "Create a post...";
        });
    }

    // Like button functionality
    const likeButtons = document.querySelectorAll(
        ".engagement-action button:first-child"
    );
    likeButtons.forEach((button) => {
        button.addEventListener("click", function () {
            const countElement = this.nextElementSibling;
            let count = countElement.textContent;

            let numericCount = parseFloat(count.replace("K", ""));
            if (count.includes("K")) {
                numericCount *= 1000;
            }

            if (!this.classList.contains("liked")) {
                this.classList.add("liked");
                this.querySelector("i").style.color = "#3b82f6";
            } else {
                this.classList.remove("liked");
                this.querySelector("i").style.color = "";
            }

            if (numericCount >= 1000) {
                countElement.textContent =
                    (numericCount / 1000).toFixed(1) + "K";
            } else {
                countElement.textContent = numericCount;
            }
        });
    });

    // Sidebar follow buttons
    const sidebarFollowBtns = document.querySelectorAll(".sidebar .follow-btn");
    sidebarFollowBtns.forEach((btn) => {
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
