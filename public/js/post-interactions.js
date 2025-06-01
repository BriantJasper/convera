document.addEventListener("DOMContentLoaded", function () {
    // Handle post likes
    document
        .querySelectorAll(".reaction-btn[data-post-id]")
        .forEach((button) => {
            button.addEventListener("click", async function (e) {
                e.preventDefault();

                // Check if user is authenticated
                if (!document.querySelector('meta[name="csrf-token"]')) {
                    const authModal = document.getElementById("authModal");
                    const loginForm = document.getElementById("loginForm");
                    const registerForm =
                        document.getElementById("registerForm");

                    if (authModal) {
                        authModal.classList.remove("hidden");
                        loginForm.classList.remove("hidden");
                        registerForm.classList.add("hidden");
                        document.body.style.overflow = "hidden";
                    }
                    return;
                }

                const postId = this.dataset.postId;
                const likeCount = this.nextElementSibling;

                try {
                    const response = await fetch(`/posts/${postId}/like`, {
                        method: "POST",
                        headers: {
                            "Content-Type": "application/json",
                            "X-CSRF-TOKEN": document.querySelector(
                                'meta[name="csrf-token"]'
                            ).content,
                        },
                    });

                    const data = await response.json();

                    if (data.success) {
                        // Update like count
                        likeCount.textContent = data.likes_count;

                        // Toggle liked class
                        if (data.liked) {
                            this.classList.add("liked");
                        } else {
                            this.classList.remove("liked");
                        }
                    }
                } catch (error) {
                    console.error("Error:", error);
                }
            });
        });

    // Handle comment submission
    document.body.addEventListener("click", async function (e) {
        if (e.target.closest(".comment-btn")) {
            e.preventDefault();
            const button = e.target.closest(".comment-btn");
            const commentForm = button.closest(".comment-form");
            const textarea = commentForm.querySelector("textarea");
            const content = textarea.value.trim();
            const postId =
                commentForm.closest(".comment-section").dataset.postId;

            if (!content) return;

            // Disable the button to prevent multiple submissions
            button.disabled = true;
            button.textContent = "Posting...";

            try {
                const response = await fetch(`/posts/${postId}/comments`, {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/json",
                        "X-CSRF-TOKEN": document.querySelector(
                            'meta[name="csrf-token"]'
                        ).content,
                    },
                    body: JSON.stringify({ content }),
                });

                const data = await response.json();

                if (data.success) {
                    // Create and insert the new comment
                    const commentElement = document.createElement("div");
                    commentElement.className = "comment";
                    commentElement.dataset.commentId = data.comment.id;
                    commentElement.innerHTML = `
                        <img src="${
                            data.comment.user.avatar || "/images/users.png"
                        }" alt="User" class="comment-profile-img" />
                        <div class="comment-content">
                            <div class="comment-header">
                                <span class="comment-user">${
                                    data.comment.user.name
                                }</span>
                                <span class="comment-time">Just now</span>
                            </div>
                            <div class="comment-text">
                                <p>${data.comment.content}</p>
                            </div>
                            <div class="comment-footer">
                                <div class="comment-actions">
                                    <button class="reply-trigger">Reply</button>
                                </div>
                                <div class="engagement-action">
                                    <button class="reaction-btn" data-comment-id="${
                                        data.comment.id
                                    }">
                                        <i class="fa fa-thumbs-up"></i>
                                    </button>
                                    <span class="like-count">0</span>
                                </div>
                            </div>
                        </div>
                    `;

                    // Add the new comment to the comments list
                    const commentsList = commentForm.nextElementSibling;
                    commentsList.insertBefore(
                        commentElement,
                        commentsList.firstChild
                    );

                    // Clear the textarea
                    textarea.value = "";

                    // ONLY update the comment count AFTER successful comment creation
                    const commentCountSpan = document.querySelector(
                        `.post[data-post-id="${postId}"] .engagement-action:nth-child(2) span`
                    );
                    if (commentCountSpan) {
                        const currentCount =
                            parseInt(commentCountSpan.textContent) || 0;
                        commentCountSpan.textContent = currentCount + 1;
                    }
                }
            } catch (error) {
                console.error("Error:", error);
                alert("Failed to post comment. Please try again.");
            } finally {
                // Re-enable the button and reset text
                button.disabled = false;
                button.textContent = "Comment";
            }
        }
    });

    // Handle comment cancel button
    document.body.addEventListener("click", function (e) {
        const cancelBtn = e.target.closest(".cancel-btn");
        if (!cancelBtn) return;

        e.preventDefault();
        const commentForm = cancelBtn.closest(".comment-form");
        if (commentForm) {
            const textarea = commentForm.querySelector("textarea");
            textarea.value = "";
            // If it's a reply form, remove the entire form
            if (commentForm.closest(".reply-form")) {
                commentForm.closest(".reply-form").remove();
            } else {
                // If it's the main comment form, hide the comment section
                const commentSection = commentForm.closest(".comment-section");
                if (commentSection) {
                    commentSection.classList.add("hidden");
                }
            }
        }
    });

    // Handle comment section toggle
    document.body.addEventListener("click", function (e) {
        const toggleBtn = e.target.closest(".toggle-comments-btn");
        if (!toggleBtn) return;

        e.preventDefault();
        e.stopPropagation();

        // Check if user is authenticated
        if (!document.querySelector('meta[name="csrf-token"]')) {
            showAuthModal();
            return;
        }

        // For authenticated users, toggle the comment section
        const postId = toggleBtn.dataset.postId;

        if (!postId) {
            console.error("No post ID found on toggle button");
            return;
        }

        const commentSection = document.querySelector(
            `.comment-section[data-post-id="${postId}"]`
        );

        if (commentSection) {
            commentSection.classList.toggle("hidden");
        } else {
            console.error(`Comment section not found for post ID: ${postId}`);
        }
    });

    // Handle comment likes - using event delegation for all comments (existing and new)
    document.body.addEventListener("click", async function (e) {
        const button = e.target.closest(
            ".comment .reaction-btn[data-comment-id]"
        );
        if (!button) return;

        e.preventDefault();
        e.stopPropagation(); // Prevent any parent event handlers

        // Check if user is authenticated
        if (!document.querySelector('meta[name="csrf-token"]')) {
            const authModal = document.getElementById("authModal");
            const loginForm = document.getElementById("loginForm");
            const registerForm = document.getElementById("registerForm");

            if (authModal) {
                authModal.classList.remove("hidden");
                loginForm.classList.remove("hidden");
                registerForm.classList.add("hidden");
                document.body.style.overflow = "hidden";
            }
            return;
        }

        const commentId = button.dataset.commentId;
        const likeCount = button.nextElementSibling;

        // Prevent multiple clicks
        if (button.disabled) return;
        button.disabled = true;

        try {
            const response = await fetch(`/comments/${commentId}/like`, {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                    "X-CSRF-TOKEN": document.querySelector(
                        'meta[name="csrf-token"]'
                    ).content,
                },
            });

            const data = await response.json();

            if (data.success) {
                // Update like count
                likeCount.textContent = data.likes_count;

                // Toggle liked class
                if (data.liked) {
                    button.classList.add("liked");
                } else {
                    button.classList.remove("liked");
                }
            }
        } catch (error) {
            console.error("Error:", error);
        } finally {
            // Re-enable the button
            button.disabled = false;
        }
    });

    // Handle show comments button
    document.body.addEventListener("click", function (e) {
        const showCommentsBtn = e.target.closest(".show-comments-btn");
        if (!showCommentsBtn) return;

        e.preventDefault();
        e.stopPropagation();

        // Check if user is authenticated
        if (!document.querySelector('meta[name="csrf-token"]')) {
            showAuthModal();
            return;
        }

        // Find the comment section
        const commentSection = document.querySelector(".comment-section");

        if (commentSection) {
            commentSection.classList.toggle("hidden");

            // Update button text
            showCommentsBtn.textContent = commentSection.classList.contains(
                "hidden"
            )
                ? "Show Comments"
                : "Hide Comments";
        } else {
            console.error("Comment section not found");
        }
    });

    // Handle reply trigger button
    document.body.addEventListener("click", function (e) {
        const replyTrigger = e.target.closest(".reply-trigger");
        if (!replyTrigger) return;

        e.preventDefault();
        e.stopPropagation();

        // Check if user is authenticated
        if (!document.querySelector('meta[name="csrf-token"]')) {
            showAuthModal();
            return;
        }

        const comment = replyTrigger.closest(".comment");
        const commentId = comment.dataset.commentId;

        // Remove any existing reply forms
        const existingReplyForm = document.querySelector(".reply-form");
        if (existingReplyForm) {
            existingReplyForm.remove();
        }

        // Create reply form
        const replyForm = document.createElement("div");
        replyForm.className = "reply-form";
        replyForm.innerHTML = `
            <div class="comment-form">
                <img src="${
                    document.querySelector(".comment-profile-img").src
                }" alt="Your Profile" class="comment-profile-img" />
                <div class="comment-input-box">
                    <textarea class="neu-input" placeholder="Write a reply..."></textarea>
                    <div class="comment-actions">
                        <button class="neu-btn cancel-btn">Cancel</button>
                        <button class="neu-btn submit-reply-btn" data-comment-id="${commentId}">Reply</button>
                    </div>
                </div>
            </div>
        `;
        comment.parentNode.insertBefore(replyForm, comment.nextSibling);
    });

    // Handle toggle replies button
    document.body.addEventListener("click", function (e) {
        const toggleRepliesBtn = e.target.closest(".toggle-replies");
        if (!toggleRepliesBtn) return;

        e.preventDefault();
        e.stopPropagation();

        const comment = toggleRepliesBtn.closest(".comment");
        const repliesSection = comment.nextElementSibling;

        if (repliesSection && repliesSection.classList.contains("replies")) {
            repliesSection.classList.toggle("hidden");
            const replyCount = repliesSection.querySelectorAll(".reply").length;
            toggleRepliesBtn.textContent = repliesSection.classList.contains(
                "hidden"
            )
                ? `View ${replyCount === 1 ? "reply" : "replies"} ${replyCount}`
                : `Hide ${replyCount === 1 ? "reply" : "replies"}`;
        }
    });

    // Handle cancel reply button
    document.body.addEventListener("click", function (e) {
        const cancelReplyBtn = e.target.closest(".cancel-reply-btn");
        if (!cancelReplyBtn) return;

        e.preventDefault();
        const replyForm = cancelReplyBtn.closest(".reply-form");
        if (replyForm) {
            replyForm.remove();
        }
    });

    // Handle submit reply button
    document.body.addEventListener("click", async function (e) {
        const submitReplyBtn = e.target.closest(".submit-reply-btn");
        if (!submitReplyBtn) return;

        e.preventDefault();

        const replyForm = submitReplyBtn.closest(".reply-form");
        const textarea = replyForm.querySelector("textarea");
        const commentId = submitReplyBtn.dataset.commentId;

        if (!textarea.value.trim()) return;

        // Disable button to prevent multiple submissions
        submitReplyBtn.disabled = true;
        submitReplyBtn.textContent = "Replying...";

        try {
            const response = await fetch(`/comments/${commentId}/replies`, {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                    "X-CSRF-TOKEN": document.querySelector(
                        'meta[name="csrf-token"]'
                    ).content,
                    Accept: "application/json",
                },
                body: JSON.stringify({
                    content: textarea.value,
                }),
            });

            const data = await response.json();

            if (data.success && data.reply) {
                const reply = data.reply;
                let repliesSection = document.querySelector(
                    `.replies[data-comment-id="${commentId}"]`
                );

                if (!repliesSection) {
                    // Create replies section if it doesn't exist
                    repliesSection = document.createElement("div");
                    repliesSection.className = "replies";
                    repliesSection.dataset.commentId = commentId;
                    replyForm.parentNode.insertBefore(
                        repliesSection,
                        replyForm.nextSibling
                    );

                    // Add toggle replies button if it doesn't exist
                    const comment = document.querySelector(
                        `.comment[data-comment-id="${commentId}"]`
                    );
                    const commentActions =
                        comment.querySelector(".comment-actions");
                    if (
                        commentActions &&
                        !commentActions.querySelector(".toggle-replies")
                    ) {
                        const toggleRepliesBtn =
                            document.createElement("button");
                        toggleRepliesBtn.className = "toggle-replies";
                        toggleRepliesBtn.dataset.commentId = commentId;
                        toggleRepliesBtn.dataset.count = "1";
                        toggleRepliesBtn.textContent = "View replies 1";
                        commentActions.insertBefore(
                            toggleRepliesBtn,
                            commentActions.firstChild
                        );
                    }
                }

                const replyHtml = `
                    <div class="reply">
                        <img src="${reply.user.avatar || "/images/users.png"}" 
                            alt="Reply User" 
                            class="comment-profile-img" 
                            onerror="this.src='/images/users.png'" />
                        <div class="reply-content">
                            <div class="reply-header">
                                <strong>${reply.user.name}</strong>
                                <span class="reply-time">just now</span>
                            </div>
                            <div class="reply-text">${reply.content}</div>
                        </div>
                    </div>
                `;

                repliesSection.insertAdjacentHTML("beforeend", replyHtml);
                repliesSection.classList.remove("hidden");
                replyForm.remove();

                // Update reply count
                const toggleRepliesBtn = document.querySelector(
                    `.toggle-replies[data-comment-id="${commentId}"]`
                );
                if (toggleRepliesBtn) {
                    const currentCount = parseInt(
                        toggleRepliesBtn.dataset.count || "0"
                    );
                    const newCount = currentCount + 1;
                    toggleRepliesBtn.dataset.count = newCount;
                    toggleRepliesBtn.textContent = `View replies ${newCount}`;
                }
            }
        } catch (error) {
            console.error("Error:", error);
            alert("Failed to post reply. Please try again.");
        } finally {
            // Re-enable button and reset text
            submitReplyBtn.disabled = false;
            submitReplyBtn.textContent = "Reply";
        }
    });
});
