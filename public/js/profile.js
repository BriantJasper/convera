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

  // Tab functionality
  const tabBtns = document.querySelectorAll(".tab-btn");
  const tabContents = document.querySelectorAll(".tab-content");

  tabBtns.forEach((btn) => {
    btn.addEventListener("click", function () {
      const targetTab = this.getAttribute("data-tab");

      // Remove active class from all tabs and contents
      tabBtns.forEach((b) => b.classList.remove("active"));
      tabContents.forEach((c) => c.classList.remove("active"));

      // Add active class to clicked tab and corresponding content
      this.classList.add("active");
      document.getElementById(targetTab).classList.add("active");
    });
  });


  // Share Profile button
  const shareBtn = document.querySelector(".share-btn");
  if (shareBtn) {
    shareBtn.addEventListener("click", function () {
      alert("Share Profile feature coming soon!");
    });
  }

  // Stats click functionality
  const statItems = document.querySelectorAll(".stat-item");
  statItems.forEach((item) => {
    item.addEventListener("click", function () {
      const label = this.querySelector(".stat-label").textContent;
      alert(`Viewing ${label.toLowerCase()}...`);
    });
  });

  // Post card actions
  const postActions = document.querySelectorAll(".post-card .action-btn");
  postActions.forEach((btn) => {
    btn.addEventListener("click", function () {
      alert("Post options coming soon!");
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

  // Post card hover effects
  const postCards = document.querySelectorAll(".post-card");
  postCards.forEach((card) => {
    card.addEventListener("mouseenter", function () {
      this.style.transform = "translateY(-4px)";
    });

    card.addEventListener("mouseleave", function () {
      this.style.transform = "translateY(-2px)";
    });
  });
});