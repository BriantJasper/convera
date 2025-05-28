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
        const commentBtn = e.target.closest(".comment-btn");
        if (!commentBtn) return;

        e.preventDefault();

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

        const commentForm = commentBtn.closest(".comment-form");
        const textarea = commentForm.querySelector("textarea");
        const postId = commentForm.closest(".comment-section").dataset.postId;
        const commentsList = commentForm.nextElementSibling;

        if (!textarea.value.trim()) return;

        try {
            const response = await fetch(`/posts/${postId}/comments`, {
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

            if (data.success && data.comment) {
                const comment = data.comment;
                const commentHtml = `
                    <div class="comment" data-comment-id="${comment.id}">
                        <img src="${
                            comment.user.avatar || "/images/users.png"
                        }" 
                            alt="${comment.user.name}" 
                            class="comment-profile-img" 
                            onerror="this.src='/images/users.png'" />
                        <div class="comment-content">
                            <div class="comment-header">
                                <span class="comment-user">${
                                    comment.user.name
                                }</span>
                                <span class="comment-time">just now</span>
                            </div>
                            <div class="comment-text">
                                <p>${comment.content}</p>
                            </div>
                            <div class="comment-footer">
                                <div class="engagement-action">
                                    <button class="reaction-btn" data-comment-id="${
                                        comment.id
                                    }">
                                        <i class="fa fa-thumbs-up"></i>
                                    </button>
                                    <span>0</span>
                                </div>
                            </div>
                        </div>
                    </div>
                `;

                commentsList.insertAdjacentHTML("afterbegin", commentHtml);
                textarea.value = "";

                // Add event listener to the new like button
                const newLikeButton = commentsList.querySelector(
                    `[data-comment-id="${comment.id}"] .reaction-btn`
                );
                if (newLikeButton) {
                    newLikeButton.addEventListener("click", async function (e) {
                        e.preventDefault();
                        try {
                            const response = await fetch(
                                `/comments/${comment.id}/like`,
                                {
                                    method: "POST",
                                    headers: {
                                        "Content-Type": "application/json",
                                        "X-CSRF-TOKEN": document.querySelector(
                                            'meta[name="csrf-token"]'
                                        ).content,
                                    },
                                }
                            );

                            const data = await response.json();
                            if (data.success) {
                                this.nextElementSibling.textContent =
                                    data.likes_count;
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
                }

                // Update comment count
                const commentCount = document.querySelector(
                    `.toggle-comments-btn[data-post-id="${postId}"] + span`
                );
                if (commentCount) {
                    commentCount.textContent =
                        parseInt(commentCount.textContent) + 1;
                }
            }
        } catch (error) {
            console.error("Error:", error);
            alert("Failed to post comment. Please try again.");
        }
    });

    // Handle comment cancel button
    document.body.addEventListener("click", function (e) {
        if (e.target.closest(".cancel-btn")) {
            const button = e.target.closest(".cancel-btn");
            const textarea = button
                .closest(".comment-form")
                .querySelector("textarea");
            textarea.value = "";
        }
    });

    // Handle comment section toggle
    document.body.addEventListener("click", function (e) {
        if (e.target.closest(".toggle-comments-btn")) {
            const button = e.target.closest(".toggle-comments-btn");
            const postId = button.dataset.postId;
            const commentSection = document.querySelector(
                `.comment-section[data-post-id="${postId}"]`
            );
            if (commentSection) {
                commentSection.classList.toggle("hidden");
            }
        }
    });

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
});
