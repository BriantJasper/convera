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
});
