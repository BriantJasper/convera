document.addEventListener("DOMContentLoaded", function () {
  const dotButtons = document.querySelectorAll(".dot-button");

  dotButtons.forEach((button) => {
    button.addEventListener("click", () => {
      const postId = button.getAttribute("data-post-id");
      const dropdown = document.getElementById(`dropdown-${postId}`);
      if (dropdown) {
        dropdown.classList.toggle("hidden");
      }
    });
  });
});

document.addEventListener("DOMContentLoaded", function () {
  console.log("Post Interactions JS loaded");

  const followButtons = document.querySelectorAll(".follow-btn");
  console.log(`Found ${followButtons.length} follow buttons`);

  followButtons.forEach((button) => {
    button.addEventListener("click", function () {
      console.log("Follow button clicked");
      const isFollowing = this.classList.contains("following");

      if (isFollowing) {
        this.classList.remove("following");
        this.classList.add("not-following");
        this.textContent = "Follow";
        console.log("User unfollowed");
      } else {
        this.classList.remove("not-following");
        this.classList.add("following");
        this.textContent = "Following";
        console.log("User followed");
      }
    });
  });

  const dotMenuButtons = document.querySelectorAll(
    "button:has(.fa-ellipsis-v), .dot-menu-btn"
  );
  if (dotMenuButtons.length === 0) {
    const allButtons = document.querySelectorAll("button");
    const ellipsisButtons = Array.from(allButtons).filter((btn) => {
      return btn.innerHTML.includes("fa-ellipsis-v");
    });
    console.log(`Found ${ellipsisButtons.length} ellipsis buttons as fallback`);

    ellipsisButtons.forEach((button) => {
      button.classList.add("dot-menu-btn");
      setupDotMenuButton(button);
    });
  } else {
    console.log(`Found ${dotMenuButtons.length} dot menu buttons`);
    dotMenuButtons.forEach((button) => {
      setupDotMenuButton(button);
    });
  }

  function setupDotMenuButton(button) {
    button.addEventListener("click", function (e) {
      console.log("Dot menu button clicked");
      e.stopPropagation();

      document.querySelectorAll(".dropdown-menu").forEach((menu) => {
        if (
          menu !== this.nextElementSibling &&
          menu !== this.parentElement.querySelector(".dropdown-menu")
        ) {
          menu.classList.add("hidden");
        }
      });

      const menu =
        this.nextElementSibling ||
        this.parentElement.querySelector(".dropdown-menu");
      if (menu) {
        menu.classList.toggle("hidden");
        console.log("Dropdown menu toggled");
      } else {
        console.error("No dropdown menu found for this button");
      }
    });
  }

  document.addEventListener("click", function (e) {
    const menus = document.querySelectorAll(".dropdown-menu");
    const buttons = document.querySelectorAll(
      ".dot-menu-btn, button:has(.fa-ellipsis-v)"
    );

    let clickedOnMenu = false;
    menus.forEach((menu) => {
      if (menu.contains(e.target)) clickedOnMenu = true;
    });

    let clickedOnButton = false;
    buttons.forEach((button) => {
      if (button.contains(e.target)) clickedOnButton = true;
    });

    if (!clickedOnMenu && !clickedOnButton) {
      menus.forEach((menu) => {
        menu.classList.add("hidden");
      });
    }
  });

  const menuItems = document.querySelectorAll(".dropdown-menu a");
  menuItems.forEach((item) => {
    item.addEventListener("click", function (e) {
      e.preventDefault();
      console.log(`Menu item clicked: ${this.textContent.trim()}`);

      this.closest(".dropdown-menu").classList.add("hidden");

      if (this.classList.contains("save-post")) {
        alert("Post saved!");
      } else if (this.classList.contains("edit-post")) {
        const postId =
          this.closest(".post")?.getAttribute("data-post-id") || "";
        window.location.href = `pages/posts/edit.html?postId=${encodeURIComponent(
          postId
        )}`;
      } else if (this.classList.contains("delete-post")) {
        if (confirm("Are you sure you want to delete this post?")) {
          console.log("Post would be deleted");
        }
      } else if (this.classList.contains("hide-post")) {
        alert("Post hidden from your feed");
      } else if (this.classList.contains("report-post")) {
        const postId =
          this.closest(".post")?.getAttribute("data-post-id") || "unknown";
        window.location.href = `pages/report/report.html?postId=${encodeURIComponent(
          postId
        )}`;
      }
    });
  });

  const toggleCommentBtns = document.querySelectorAll(".show-comments-btn");
  toggleCommentBtns.forEach((btn) => {
    const commentSection = btn.nextElementSibling?.classList.contains(
      "comment-section"
    )
      ? btn.nextElementSibling
      : document.querySelector(".comment-section");

    if (btn && commentSection) {
      btn.addEventListener("click", function () {
        console.log("Comment toggle button clicked!");
        commentSection.classList.toggle("hidden");
        this.textContent = commentSection.classList.contains("hidden")
          ? "💬 Show Comments"
          : "💬 Hide Comments";
        console.log("Comment section visibility toggled");
      });
      console.log("Comment toggle event listener added for button:", btn);
    }
  });

  const inlineCommentButtons = document.querySelectorAll(
    ".toggle-comments-btn"
  );

  inlineCommentButtons.forEach((btn) => {
    btn.addEventListener("click", function () {
      const postId = this.dataset.postId;
      const commentSection = document.querySelector(
        `.comment-section[data-post-id="${postId}"]`
      );
      const showBtn = document.querySelector(
        `.show-comments-btn[data-post-id="${postId}"]`
      );

      if (commentSection) {
        commentSection.classList.toggle("hidden");

        if (showBtn) {
          showBtn.textContent = commentSection.classList.contains("hidden")
            ? "💬 Show Comments"
            : "💬 Hide Comments";
        }
      }
    });
  });

  inlineCommentButtons.forEach((btn) => {
    btn.addEventListener("click", function () {
      console.log("Inline comment button clicked");

      const postCard = this.closest(".post");
      const showBtn = postCard?.querySelector(".show-comments-btn");
      const commentSection = postCard?.nextElementSibling;

      if (commentSection?.classList.contains("comment-section")) {
        commentSection.classList.toggle("hidden");

        if (showBtn) {
          showBtn.textContent = commentSection.classList.contains("hidden")
            ? "💬 Show Comments"
            : "💬 Hide Comments";
        }
      }
    });
  });

  const toggleRepliesButtons = document.querySelectorAll(".toggle-replies");
  console.log(
    "Number of reply toggle buttons found:",
    toggleRepliesButtons.length
  );

  toggleRepliesButtons.forEach((btn) => {
    btn.addEventListener("click", function () {
      console.log("Reply toggle button clicked");
      const comment = this.closest(".comment");
      const replies = comment.nextElementSibling;

      console.log("Comment element found:", !!comment);
      console.log("Next element sibling found:", !!replies);
      console.log(
        "Next element has 'replies' class:",
        replies?.classList.contains("replies")
      );

      if (replies && replies.classList.contains("replies")) {
        replies.classList.toggle("hidden");
        const replyCount = replies.querySelectorAll(".reply").length;
        this.textContent = replies.classList.contains("hidden")
          ? `View replies ${replyCount ? replyCount : ""}`
          : "Hide replies";
        console.log("Replies visibility toggled");
      } else {
        console.error("No valid replies container found for this comment");
      }
    });
  });

  const commentBtns = document.querySelectorAll(".comment-btn");
  console.log("Comment buttons found:", commentBtns.length);

  commentBtns.forEach((commentBtn) => {
    const cancelBtn = commentBtn.parentElement.querySelector(".cancel-btn");
    const commentInput =
      commentBtn
        .closest(".comment-actions")
        ?.parentElement?.querySelector("textarea") ||
      commentBtn.closest(".comment-form")?.querySelector("textarea");
    const commentsList = document.querySelector(".comments-list");

    console.log("Comment button found:", !!commentBtn);
    console.log("Cancel button found:", !!cancelBtn);
    console.log("Comment input found:", !!commentInput);
    console.log("Comments list found:", !!commentsList);

    if (commentBtn && commentInput && commentsList) {
      commentBtn.addEventListener("click", function () {
        console.log("Comment button clicked");
        const commentText = commentInput.value.trim();
        if (commentText === "") {
          console.log("Comment text is empty, not adding");
          return;
        }

        const newComment = document.createElement("div");
        newComment.className = "comment";
        newComment.innerHTML = `
            <img src="/api/placeholder/40/40" alt="Your Profile" class="comment-profile-img" />
            <div class="comment-content">
              <div class="comment-header">
                <span class="comment-user">You</span>
                <span class="comment-time">just now</span>
              </div>
              <div class="comment-text">
                <p>${commentText}</p>
              </div>
              <div class="comment-footer">
                <div class="like-count">👍 0</div>
              </div>
            </div>
          `;
        commentsList.prepend(newComment);
        commentInput.value = "";
        console.log("New comment added successfully");
      });
      console.log("Comment button event listener added");
    }

    if (cancelBtn && commentInput) {
      cancelBtn.addEventListener("click", function () {
        console.log("Cancel button clicked");
        commentInput.value = "";
        console.log("Comment input cleared");
      });
      console.log("Cancel button event listener added");
    }
  });

  console.log("Post Interactions JS initialization complete");
});
