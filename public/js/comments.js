document.addEventListener("DOMContentLoaded", function () {
  console.log("Comments JS loaded");

  const toggleRepliesButtons = document.querySelectorAll(".toggle-replies");
  console.log("Number of reply toggle buttons found:", toggleRepliesButtons.length);

  toggleRepliesButtons.forEach((btn) => {
    btn.addEventListener("click", function () {
      console.log("Reply toggle button clicked");
      const comment = this.closest(".comment");
      const replies = comment.nextElementSibling;
      
      console.log("Comment element found:", !!comment);
      console.log("Next element sibling found:", !!replies);
      console.log("Next element has 'replies' class:", replies?.classList.contains("replies"));
      
      if (replies && replies.classList.contains("replies")) {
        replies.classList.toggle("hidden");
        this.textContent = replies.classList.contains("hidden")
          ? "View replies " + (replies.querySelectorAll(".reply").length || "")
          : "Hide replies";
        console.log("Replies visibility toggled");
      } else {
        console.error("No valid replies container found for this comment");
      }
    });
  });

  const commentBtn = document.querySelector(".comment-btn");
  const cancelBtn = document.querySelector(".cancel-btn");
  const commentInput = document.querySelector(".comment-input-box textarea");
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
        <img src="https://via.placeholder.com/40" alt="Your Profile" class="comment-profile-img" />
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
  } else {
    console.error("One or more comment form elements not found");
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