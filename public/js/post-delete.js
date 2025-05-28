import { showModal } from "./modal.js";

export function initPostDelete() {
    const deleteButtons = document.querySelectorAll(".delete-post");

    deleteButtons.forEach((button) => {
        button.addEventListener("click", async (e) => {
            e.preventDefault();

            const postId = button.dataset.postId;
            const postSlug = button.dataset.postSlug;
            const csrfToken = document.querySelector(
                'meta[name="csrf-token"]'
            ).content;

            const shouldDelete = await showModal("deleteModal");

            if (shouldDelete) {
                try {
                    const response = await fetch(`/posts/${postSlug}`, {
                        method: "DELETE",
                        headers: {
                            "X-CSRF-TOKEN": csrfToken,
                            Accept: "application/json",
                            "Content-Type": "application/json",
                        },
                    });

                    const data = await response.json();

                    if (data.success) {
                        // Store notification for potential redirect
                        sessionStorage.setItem("notification", data.message);
                        sessionStorage.setItem("notificationType", "success");

                        // Remove the post from the DOM if on home page
                        const postElement = button.closest(".post");
                        if (postElement) {
                            postElement.remove();
                            // Show success notification immediately
                            window.showNotification.success(data.message);
                        } else {
                            // If we're on the post page, redirect to home
                            window.location.href = data.redirect;
                        }
                    } else {
                        // Show error notification
                        window.showNotification.error(data.message);
                    }
                } catch (error) {
                    console.error("Error:", error);
                    window.showNotification.error(
                        "An error occurred while deleting the post"
                    );
                }
            }
        });
    });
}
