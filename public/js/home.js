document.addEventListener("DOMContentLoaded", function () {
    const loginBtn = document.getElementById("loginBtn");
    const authModal = document.getElementById("authModal");
    const closeAuthModal = document.getElementById("closeAuthModal");
    const loginForm = document.getElementById("loginForm");
    const registerForm = document.getElementById("registerForm");
    const showRegister = document.getElementById("showRegister");
    const showLogin = document.getElementById("showLogin");

    loginBtn.addEventListener("click", function () {
        authModal.classList.remove("hidden");
        loginForm.classList.remove("hidden");
        registerForm.classList.add("hidden");
    });

    closeAuthModal.addEventListener("click", function () {
        authModal.classList.add("hidden");
    });

    showRegister.addEventListener("click", function (e) {
        e.preventDefault();
        loginForm.classList.add("hidden");
        registerForm.classList.remove("hidden");
    });

    showLogin.addEventListener("click", function (e) {
        e.preventDefault();
        registerForm.classList.add("hidden");
        loginForm.classList.remove("hidden");
    });

    authModal.addEventListener("click", function (e) {
        if (e.target === authModal) {
            authModal.classList.add("hidden");
        }
    });

    const followButtons = document.querySelectorAll(".follow-btn");
    followButtons.forEach((button) => {
        button.addEventListener("click", function () {
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

    document.body.addEventListener("click", function (e) {
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

    document.body.addEventListener("click", function (e) {
        if (e.target.closest(".dot-menu-btn")) {
            var btn = e.target.closest(".dot-menu-btn");
            document
                .querySelectorAll(".dropdown-menu")
                .forEach(function (menu) {
                    menu.classList.add("hidden");
                });
            var menu = btn.parentElement.querySelector(".dropdown-menu");
            if (menu) {
                menu.classList.toggle("hidden");
            }
            e.stopPropagation();
        }
    });

    document.body.addEventListener("click", function (e) {
        document.querySelectorAll(".dropdown-menu").forEach(function (menu) {
            menu.classList.add("hidden");
        });
    });

    document.querySelectorAll(".dropdown-menu").forEach(function (menu) {
        menu.addEventListener("click", function (e) {
            e.stopPropagation();
        });
    });

    // Share functionality
    const shareModal = document.getElementById("shareModal");
    const closeShareModal = document.getElementById("closeShareModal");
    const shareLink = document.getElementById("shareLink");
    const copyLinkBtn = document.getElementById("copyLinkBtn");
    let currentPostId = null;

    // Share button click handler
    document.body.addEventListener("click", function (e) {
        if (e.target.closest(".share-btn")) {
            const btn = e.target.closest(".share-btn");
            currentPostId = btn.getAttribute("data-post-id");

            // Generate post URL
            const postUrl = `${window.location.origin}${window.location.pathname}#post-${currentPostId}`;
            shareLink.value = postUrl;

            shareModal.classList.remove("hidden");
            e.stopPropagation();
        }
    });

    // Close share modal
    closeShareModal.addEventListener("click", function () {
        shareModal.classList.add("hidden");
    });

    // Close modal when clicking outside
    shareModal.addEventListener("click", function (e) {
        if (e.target === shareModal) {
            shareModal.classList.add("hidden");
        }
    });

    // Copy link functionality
    copyLinkBtn.addEventListener("click", function () {
        shareLink.select();
        shareLink.setSelectionRange(0, 99999); // For mobile devices

        try {
            document.execCommand("copy");

            // Visual feedback
            const originalText = copyLinkBtn.innerHTML;
            copyLinkBtn.innerHTML = '<i class="fa fa-check"></i>';
            copyLinkBtn.classList.add("copy-success");

            setTimeout(() => {
                copyLinkBtn.innerHTML = originalText;
                copyLinkBtn.classList.remove("copy-success");
            }, 2000);
        } catch (err) {
            console.error("Failed to copy: ", err);
        }
    });

    // Share platform handlers
    document.querySelectorAll(".share-option").forEach(function (btn) {
        btn.addEventListener("click", function () {
            const platform = this.getAttribute("data-platform");
            const postUrl = shareLink.value;
            const postText = getPostText(currentPostId);

            let shareUrl = "";

            switch (platform) {
                case "facebook":
                    shareUrl = `https://www.facebook.com/sharer/sharer.php?u=${encodeURIComponent(
                        postUrl
                    )}`;
                    break;
                case "twitter":
                    shareUrl = `https://twitter.com/intent/tweet?url=${encodeURIComponent(
                        postUrl
                    )}&text=${encodeURIComponent(postText)}`;
                    break;
                case "linkedin":
                    shareUrl = `https://www.linkedin.com/sharing/share-offsite/?url=${encodeURIComponent(
                        postUrl
                    )}`;
                    break;
                case "whatsapp":
                    shareUrl = `https://wa.me/?text=${encodeURIComponent(
                        postText + " " + postUrl
                    )}`;
                    break;
                case "telegram":
                    shareUrl = `https://t.me/share/url?url=${encodeURIComponent(
                        postUrl
                    )}&text=${encodeURIComponent(postText)}`;
                    break;
                case "email":
                    shareUrl = `mailto:?subject=${encodeURIComponent(
                        "Check out this post"
                    )}&body=${encodeURIComponent(postText + "\n\n" + postUrl)}`;
                    break;
            }

            if (shareUrl) {
                window.open(shareUrl, "_blank", "width=600,height=400");
            }
        });
    });

    // Helper function to get post text
    function getPostText(postId) {
        const post = document.querySelector(`[data-post-id="${postId}"]`);
        if (post) {
            const contentElement = post.querySelector(".post-content p");
            return contentElement
                ? contentElement.textContent.trim()
                : "Check out this post!";
        }
        return "Check out this post!";
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

    postActionButtons.forEach((button) => {
        button.addEventListener("click", function () {
            // This redirects to create post page as already implemented
            window.location.href = "pages/posts/create.html";
        });
    });

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
                numericCount += 1;
                this.classList.add("liked");
                this.querySelector("i").style.color = "#3b82f6";
            } else {
                numericCount -= 1;
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
