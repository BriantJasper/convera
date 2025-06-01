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
                alert(`Searching for: "${query}"`);
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

            // Filter content based on selection
            const filterType = this.textContent.toLowerCase();
            filterContent(filterType);
        });
    });

    function filterContent(filterType) {
        const cards = document.querySelectorAll(".explore-card");

        cards.forEach((card) => {
            if (filterType === "all") {
                card.style.display = "block";
            } else {
                const cardType = card
                    .querySelector(".card-meta")
                    .textContent.toLowerCase();
                if (
                    cardType.includes(filterType) ||
                    filterType === "trending"
                ) {
                    card.style.display = "block";
                } else {
                    card.style.display = "none";
                }
            }
        });
    }

    // Action button functionality
    const actionBtns = document.querySelectorAll(".action-btn");
    actionBtns.forEach((btn) => {
        btn.addEventListener("click", function () {
            const originalText = this.textContent;
            const originalColor = this.style.backgroundColor;

            if (originalText.includes("Join")) {
                this.textContent = "Joined!";
                this.style.backgroundColor = "#10b981";

                setTimeout(() => {
                    this.textContent = "Leave Community";
                    this.style.backgroundColor = "#ef4444";
                }, 2000);
            } else if (originalText.includes("Follow")) {
                this.textContent = "Following!";
                this.style.backgroundColor = "#10b981";

                setTimeout(() => {
                    this.textContent = "Unfollow";
                    this.style.backgroundColor = "#6b7280";
                }, 2000);
            } else if (originalText.includes("Register")) {
                this.textContent = "Registered!";
                this.style.backgroundColor = "#10b981";

                setTimeout(() => {
                    this.textContent = "View Event";
                    this.style.backgroundColor = "#3b82f6";
                }, 2000);
            } else {
                this.textContent = "Done!";
                this.style.backgroundColor = "#10b981";

                setTimeout(() => {
                    this.textContent = originalText;
                    this.style.backgroundColor = originalColor;
                }, 2000);
            }
        });
    });

    // Secondary button functionality
    const secondaryBtns = document.querySelectorAll(".secondary-btn");
    secondaryBtns.forEach((btn) => {
        btn.addEventListener("click", function () {
            const originalText = this.textContent;

            if (originalText.includes("Follow Topic")) {
                this.textContent = "Following!";
                this.style.backgroundColor = "#10b981";
                this.style.color = "white";

                setTimeout(() => {
                    this.textContent = "Unfollow Topic";
                    this.style.backgroundColor = "#6b7280";
                }, 2000);
            } else {
                this.textContent = "Viewed!";
                this.style.backgroundColor = "#10b981";
                this.style.color = "white";

                setTimeout(() => {
                    this.textContent = originalText;
                    this.style.backgroundColor = "#1f2937";
                    this.style.color = "#9ca3af";
                }, 2000);
            }
        });
    });

    // Follow button functionality in sidebar
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

    // Card tag functionality
    const cardTags = document.querySelectorAll(".card-tag");
    cardTags.forEach((tag) => {
        tag.addEventListener("click", function () {
            const tagText = this.textContent;
            alert(`Searching for content tagged with: ${tagText}`);
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

    // Card hover effects
    const exploreCards = document.querySelectorAll(".explore-card");
    exploreCards.forEach((card) => {
        card.addEventListener("mouseenter", function () {
            this.style.transform = "translateY(-4px)";
        });

        card.addEventListener("mouseleave", function () {
            this.style.transform = "translateY(-2px)";
        });
    });
});
