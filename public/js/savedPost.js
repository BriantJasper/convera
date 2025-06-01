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
                alert(`Searching saved items for: "${query}"`);
                searchInput.value = "";
            }
        }
    }

    // Header icons functionality - removed preventDefault to allow navigation

    // Enhanced filter functionality
    const filterBtns = document.querySelectorAll(".filter-btn");
    filterBtns.forEach((btn) => {
        btn.addEventListener("click", function () {
            filterBtns.forEach((b) => b.classList.remove("active"));
            this.classList.add("active");

            const filterType = this.textContent.toLowerCase();
            filterSavedItems(filterType);
        });
    });

    function filterSavedItems(filterType) {
        const posts = document.querySelectorAll(".post");

        posts.forEach((post) => {
            if (filterType === "all") {
                post.style.display = "block";
            } else {
                const postContent = post.textContent.toLowerCase();
                const hasImage = post.querySelector(".post-image");
                const hasLink = post.querySelector("a");

                let shouldShow = false;

                switch (filterType) {
                    case "posts":
                        shouldShow = !hasImage && !hasLink;
                        break;
                    case "articles":
                        shouldShow =
                            postContent.includes("article") ||
                            postContent.includes("guide");
                        break;
                    case "resources":
                        shouldShow =
                            postContent.includes("resource") ||
                            postContent.includes("collection");
                        break;
                    case "videos":
                        shouldShow = postContent.includes("video") || hasImage;
                        break;
                    case "links":
                        shouldShow = hasLink || postContent.includes("link");
                        break;
                }

                post.style.display = shouldShow ? "block" : "none";
            }
        });
    }

    // Dropdown menu functionality
    const dotMenuBtns = document.querySelectorAll(".dot-menu-btn");
    dotMenuBtns.forEach((btn) => {
        btn.addEventListener("click", function (e) {
            e.stopPropagation();
            const dropdown = this.nextElementSibling;

            // Close all other dropdowns
            document.querySelectorAll(".dropdown-menu").forEach((menu) => {
                if (menu !== dropdown) {
                    menu.classList.add("hidden");
                }
            });

            // Toggle current dropdown
            dropdown.classList.toggle("hidden");
        });
    });

    // Close dropdowns when clicking outside
    document.addEventListener("click", function () {
        document.querySelectorAll(".dropdown-menu").forEach((menu) => {
            menu.classList.add("hidden");
        });
    });

    // Enhanced dropdown menu actions
    const dropdownLinks = document.querySelectorAll(".dropdown-menu a");
    dropdownLinks.forEach((link) => {
        link.addEventListener("click", function (e) {
            e.preventDefault();
            const action = this.className;
            const postElement = this.closest(".post");
            const postTitle =
                postElement
                    .querySelector(".post-content p")
                    .textContent.substring(0, 50) + "...";

            switch (action) {
                case "save-post":
                    if (this.textContent.includes("Unsave")) {
                        if (confirm("Remove this item from saved?")) {
                            postElement.style.opacity = "0.5";
                            setTimeout(() => {
                                postElement.remove();
                            }, 500);
                            alert("Item removed from saved!");
                        }
                    } else {
                        alert("Item saved!");
                    }
                    break;
                case "edit-post":
                    alert("Redirecting to edit page...");
                    break;
                case "delete-post":
                    if (confirm("Are you sure you want to delete this post?")) {
                        postElement.remove();
                        alert("Post deleted!");
                    }
                    break;
                case "hide-post":
                    postElement.style.display = "none";
                    alert("Post hidden from your feed");
                    break;
                case "report-post":
                    alert(
                        "Post reported. Thank you for helping keep our community safe."
                    );
                    break;
            }

            // Close dropdown
            this.closest(".dropdown-menu").classList.add("hidden");
        });
    });

    // Follow button functionality
    const followBtns = document.querySelectorAll(".follow-btn");
    followBtns.forEach((btn) => {
        btn.addEventListener("click", function () {
            if (this.classList.contains("not-following")) {
                this.textContent = "Following";
                this.classList.remove("not-following");
                this.classList.add("following");
                this.style.backgroundColor = "#10b981";
            } else {
                this.textContent = "Follow";
                this.classList.remove("following");
                this.classList.add("not-following");
                this.style.backgroundColor = "";
            }
        });
    });

    // Enhanced engagement button functionality
    const engagementBtns = document.querySelectorAll(
        ".engagement-action button"
    );
    engagementBtns.forEach((btn) => {
        btn.addEventListener("click", function () {
            // Add click animation
            this.style.transform = "scale(0.95)";
            setTimeout(() => {
                this.style.transform = "scale(1)";
            }, 150);

            // Handle different engagement types
            const icon = this.querySelector("i");
            const countElement = this.nextElementSibling;

            if (icon && icon.classList.contains("fa-thumbs-up")) {
                // Like functionality
                let count = parseInt(
                    countElement.textContent
                        .replace("K", "000")
                        .replace(".", "")
                );

                if (!this.classList.contains("liked")) {
                    count += 1;
                    this.classList.add("liked");
                    icon.style.color = "#3b82f6";
                } else {
                    count -= 1;
                    this.classList.remove("liked");
                    icon.style.color = "";
                }

                if (count >= 1000) {
                    countElement.textContent = (count / 1000).toFixed(1) + "K";
                } else {
                    countElement.textContent = count;
                }
            } else if (icon && icon.classList.contains("fa-comment")) {
                // Comment functionality
                alert("Comments feature coming soon!");
            } else if (this.textContent.includes("Share")) {
                // Share functionality
                alert("Share feature coming soon!");
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
    const hashtags = document.querySelectorAll(".hashtag, .post-tags a");
    hashtags.forEach((hashtag) => {
        hashtag.addEventListener("click", function (e) {
            e.preventDefault();
            const tag = this.textContent;
            alert(`Searching for posts with ${tag}`);
        });
    });

    // Post image click functionality
    const postImages = document.querySelectorAll(".post-image img");
    postImages.forEach((img) => {
        img.addEventListener("click", function () {
            alert("Opening image in full view...");
        });
    });

    // Empty state button functionality
    const exploreBtn = document.querySelector(".explore-btn");
    if (exploreBtn) {
        exploreBtn.addEventListener("click", function (e) {
            e.preventDefault();
            window.location.href = "explore.html";
        });
    }

    // Post author click functionality
    const postAuthors = document.querySelectorAll(".post-author");
    postAuthors.forEach((author) => {
        author.addEventListener("click", function () {
            const authorName = this.textContent;
            alert(`Opening ${authorName}'s profile...`);
        });
    });

    // Post profile image click functionality
    const postProfileImgs = document.querySelectorAll(".post-profile-img");
    postProfileImgs.forEach((img) => {
        img.addEventListener("click", function () {
            const authorName = this.alt || "User";
            alert(`Opening ${authorName}'s profile...`);
        });
    });
});
