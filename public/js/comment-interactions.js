document.addEventListener("DOMContentLoaded", function () {
    // Handle comment likes
    document.body.addEventListener("click", async function (e) {
        if (e.target.closest(".comment .reaction-btn")) {
            e.preventDefault();
            const button = e.target.closest(".comment .reaction-btn");

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
            }
        }
    });

    // Handle reply triggers
    document.body.addEventListener("click", function (e) {
        if (e.target.closest(".reply-trigger")) {
            e.preventDefault();
            const button = e.target.closest(".reply-trigger");
            const comment = button.closest(".comment");
            const repliesContainer = comment.nextElementSibling;

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

            // Create reply form if it doesn't exist
            if (
                !repliesContainer ||
                !repliesContainer.classList.contains("reply-form-container")
            ) {
                const replyForm = document.createElement("div");
                replyForm.className = "reply-form-container";
                replyForm.innerHTML = `
                    <div class="reply-form">
                        <img src="${
                            document.querySelector(".comment-profile-img").src
                        }" alt="Your Profile" class="comment-profile-img" />
                        <div class="comment-input-box">
                            <textarea class="neu-input" placeholder="Write a reply..."></textarea>
                            <div class="comment-actions">
                                <button class="neu-btn cancel-reply-btn">Cancel</button>
                                <button class="neu-btn submit-reply-btn">Reply</button>
                            </div>
                        </div>
                    </div>
                `;

                // Insert after the comment
                comment.insertAdjacentElement("afterend", replyForm);

                // Add event listeners for the new buttons
                const cancelBtn = replyForm.querySelector(".cancel-reply-btn");
                const submitBtn = replyForm.querySelector(".submit-reply-btn");
                const textarea = replyForm.querySelector("textarea");

                cancelBtn.addEventListener("click", () => {
                    replyForm.remove();
                });

                submitBtn.addEventListener("click", async () => {
                    const content = textarea.value.trim();
                    if (!content) return;

                    const commentId = comment.dataset.commentId;
                    try {
                        const response = await fetch(
                            `/comments/${commentId}/reply`,
                            {
                                method: "POST",
                                headers: {
                                    "Content-Type": "application/json",
                                    "X-CSRF-TOKEN": document.querySelector(
                                        'meta[name="csrf-token"]'
                                    ).content,
                                },
                                body: JSON.stringify({ content }),
                            }
                        );

                        const data = await response.json();

                        if (data.success) {
                            // Create and insert the new reply
                            const replyElement = document.createElement("div");
                            replyElement.className = "reply";
                            replyElement.innerHTML = `
                                <img src="${
                                    data.reply.user.avatar ||
                                    "/images/users.png"
                                }" alt="Reply User" class="comment-profile-img" />
                                <div><strong>${data.reply.user.name}</strong> ${
                                data.reply.content
                            }</div>
                            `;

                            // Find or create the replies container
                            let repliesList =
                                comment.parentElement.querySelector(
                                    `.replies[data-comment-id="${commentId}"]`
                                );
                            if (!repliesList) {
                                repliesList = document.createElement("div");
                                repliesList.className = "replies";
                                repliesList.dataset.commentId = commentId;
                                comment.parentElement.appendChild(repliesList);
                            }

                            // Add the new reply
                            repliesList.appendChild(replyElement);
                            repliesList.classList.remove("hidden");

                            // Update the reply count if it exists
                            const replyCountBtn =
                                comment.querySelector(".toggle-replies");
                            if (replyCountBtn) {
                                const replyCount = repliesList.children.length;
                                replyCountBtn.textContent = `View replies ${replyCount}`;
                            }

                            // Remove the reply form
                            replyForm.remove();
                        }
                    } catch (error) {
                        console.error("Error:", error);
                    }
                });
            }
        }
    });

    // Handle toggle replies
    document.body.addEventListener("click", function (e) {
        if (e.target.closest(".toggle-replies")) {
            e.preventDefault();
            const button = e.target.closest(".toggle-replies");
            const comment = button.closest(".comment");
            const commentId = comment.dataset.commentId;

            // Find the replies container
            const repliesContainer = comment.parentElement.querySelector(
                `.replies[data-comment-id="${commentId}"]`
            );

            if (repliesContainer) {
                repliesContainer.classList.toggle("hidden");
                const isHidden = repliesContainer.classList.contains("hidden");
                const replyCount =
                    repliesContainer.querySelectorAll(".reply").length;
                button.textContent = isHidden
                    ? `View replies ${replyCount}`
                    : `Hide replies ${replyCount}`;
            }
        }
    });

    // Initialize replies visibility on page load
    document.querySelectorAll(".replies").forEach((repliesContainer) => {
        const commentId = repliesContainer.dataset.commentId;
        const comment = document.querySelector(
            `.comment[data-comment-id="${commentId}"]`
        );
        const toggleButton = comment?.querySelector(".toggle-replies");

        if (toggleButton) {
            const replyCount =
                repliesContainer.querySelectorAll(".reply").length;
            toggleButton.textContent = `View replies ${replyCount}`;
            repliesContainer.classList.add("hidden");
        }
    });
});
