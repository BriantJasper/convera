document.addEventListener("DOMContentLoaded", function () {
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
                alert(`Searching communities for: "${query}"`);
                searchInput.value = "";
            }
        }
    }

    // Header icons functionality - removed preventDefault to allow navigation

    // Filter functionality
    const filterBtns = document.querySelectorAll(".filter-btn");
    filterBtns.forEach((btn) => {
        btn.addEventListener("click", function () {
            filterBtns.forEach((b) => b.classList.remove("active"));
            this.classList.add("active");

            const filterType = this.textContent.toLowerCase();
            filterCommunities(filterType);
        });
    });

    function filterCommunities(filterType) {
        const communityCards = document.querySelectorAll(".community-card");

        communityCards.forEach((card) => {
            if (filterType === "all") {
                card.style.display = "block";
            } else if (filterType === "my communities") {
                // Show only joined communities
                const isJoined = card.querySelector(".joined-btn");
                card.style.display = isJoined ? "block" : "none";
            } else {
                // Filter by topic
                const topics = card.querySelectorAll(".community-topic");
                let hasMatchingTopic = false;

                topics.forEach((topic) => {
                    if (topic.textContent.toLowerCase().includes(filterType)) {
                        hasMatchingTopic = true;
                    }
                });

                card.style.display = hasMatchingTopic ? "block" : "none";
            }
        });
    }

    // Join/Leave Community button functionality
    const joinButtons = document.querySelectorAll(".join-btn, .joined-btn");
    joinButtons.forEach((button) => {
        button.addEventListener("click", async function (e) {
            // Check if user is authenticated
            const isAuthenticated =
                document.querySelector('form[action*="logout"]') !== null;

            if (!isAuthenticated) {
                e.preventDefault();
                showAuthModal();
                return;
            }

            const communityId = this.dataset.communityId;
            const communityName = this.closest(".community-card")
                .querySelector(".community-name")
                .textContent.trim();
            const isJoined = this.classList.contains("joined-btn");

            // Show loading state
            const originalText = this.textContent;
            this.textContent = isJoined ? "Leaving..." : "Joining...";

            try {
                const response = await fetch(
                    `/communities/${communityId}/join`,
                    {
                        method: "POST",
                        headers: {
                            "X-CSRF-TOKEN": document.querySelector(
                                'meta[name="csrf-token"]'
                            ).content,
                            Accept: "application/json",
                            "Content-Type": "application/json",
                        },
                        credentials: "same-origin",
                    }
                );

                const data = await response.json();

                if (data.isMember) {
                    this.classList.remove("join-btn");
                    this.classList.add("joined-btn");
                    this.textContent = "Joined";
                    showNotification.success(
                        `Successfully joined ${communityName}!`
                    );
                } else {
                    this.classList.remove("joined-btn");
                    this.classList.add("join-btn");
                    this.textContent = "Join Community";
                    showNotification.info(`Left ${communityName}`);
                }

                // Update members count
                const membersCount =
                    this.closest(".community-card").querySelector(
                        ".members-count"
                    );
                if (membersCount) {
                    membersCount.textContent = data.membersCount;
                }
            } catch (error) {
                console.error("Error:", error);
                this.textContent = originalText;

                if (error.message === "CSRF token not found") {
                    showNotification.error(
                        "Session expired. Please refresh the page and try again."
                    );
                } else if (error.name !== "TypeError") {
                    showNotification.error(
                        "An error occurred. Please try again."
                    );
                }
            }
        });
    });

    // Community topic functionality
    const communityTopics = document.querySelectorAll(".community-topic");
    communityTopics.forEach((topic) => {
        topic.addEventListener("click", function () {
            const topicText = this.textContent;
            alert(`Searching for communities with topic: ${topicText}`);
        });
    });

    // Sidebar follow buttons
    const followBtns = document.querySelectorAll(".follow-btn");
    followBtns.forEach((btn) => {
        btn.addEventListener("click", function () {
            if (this.textContent === "Follow") {
                this.textContent = "Following";
            } else {
                this.textContent = "Follow";
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

    // Community card hover effects
    const communityCards = document.querySelectorAll(".community-card");
    communityCards.forEach((card) => {
        card.addEventListener("mouseenter", function () {
            this.style.transform = "translateY(-4px)";
        });

        card.addEventListener("mouseleave", function () {
            this.style.transform = "translateY(-2px)";
        });
    });

    // Community stats click functionality
    const stats = document.querySelectorAll(".stat");
    stats.forEach((stat) => {
        stat.addEventListener("click", function () {
            const statType = this.querySelector("span").textContent;
            const communityName = this.closest(".community-card")
                .querySelector(".community-name")
                .textContent.trim();

            if (statType.includes("k") || statType.includes("K")) {
                alert(`${communityName} has ${statType} members`);
            } else {
                alert(
                    `${communityName} is currently ${statType.toLowerCase()}`
                );
            }
        });
    });

    // Community avatar click functionality
    const communityAvatars = document.querySelectorAll(".community-avatar");
    communityAvatars.forEach((avatar) => {
        avatar.addEventListener("click", function () {
            const communityName = this.closest(".community-card")
                .querySelector(".community-name")
                .textContent.trim();
            alert(`Opening ${communityName} profile page...`);
        });
    });
});
