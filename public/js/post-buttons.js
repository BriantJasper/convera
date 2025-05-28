// Modal function - inline version instead of import
function showModal(modalId) {
    return new Promise((resolve) => {
        const modal = document.getElementById(modalId);
        if (!modal) {
            console.error(`Modal with id ${modalId} not found`);
            resolve(false);
            return;
        }

        modal.classList.add("active");

        const cancelBtn = modal.querySelector(".modal-btn.cancel");
        const confirmBtn = modal.querySelector(".modal-btn.confirm");

        const handleCancel = () => {
            modal.classList.remove("active");
            cleanup();
            resolve(false);
        };

        const handleConfirm = () => {
            modal.classList.remove("active");
            cleanup();
            resolve(true);
        };

        const handleEscape = (e) => {
            if (e.key === "Escape") {
                handleCancel();
            }
        };

        const handleClickOutside = (e) => {
            if (e.target === modal) {
                handleCancel();
            }
        };

        const cleanup = () => {
            if (cancelBtn) cancelBtn.removeEventListener("click", handleCancel);
            if (confirmBtn)
                confirmBtn.removeEventListener("click", handleConfirm);
            document.removeEventListener("keydown", handleEscape);
            modal.removeEventListener("click", handleClickOutside);
        };

        if (cancelBtn) cancelBtn.addEventListener("click", handleCancel);
        if (confirmBtn) confirmBtn.addEventListener("click", handleConfirm);
        document.addEventListener("keydown", handleEscape);
        modal.addEventListener("click", handleClickOutside);
    });
}

document.addEventListener("DOMContentLoaded", function () {
    // Fix: Use correct selector for dot menu buttons
    const dotButtons = document.querySelectorAll(".dot-menu-btn");

    dotButtons.forEach((button, index) => {
        button.addEventListener("click", (e) => {
            e.preventDefault();
            e.stopPropagation();

            // Close all other dropdowns first
            document.querySelectorAll(".dropdown-menu").forEach((dropdown) => {
                if (dropdown !== button.nextElementSibling) {
                    dropdown.classList.add("hidden");
                }
            });

            // Toggle current dropdown
            const dropdown = button.nextElementSibling;
            if (dropdown && dropdown.classList.contains("dropdown-menu")) {
                dropdown.classList.toggle("hidden");
            } else {
                console.error(`Dropdown not found for button ${index}`);
            }
        });
    });

    // Close dropdowns when clicking outside
    document.addEventListener("click", (e) => {
        if (!e.target.closest(".post-actions-menu")) {
            document.querySelectorAll(".dropdown-menu").forEach((dropdown) => {
                dropdown.classList.add("hidden");
            });
        }
    });

    // Handle dropdown menu items
    const menuItems = document.querySelectorAll(".dropdown-menu a");

    menuItems.forEach((item) => {
        item.addEventListener("click", async function (e) {
            if (this.classList.contains("edit-post")) {
                // Let the link work normally
                return true;
            }

            e.preventDefault();

            // Close dropdown after clicking
            const dropdown = this.closest(".dropdown-menu");
            if (dropdown) {
                dropdown.classList.add("hidden");
            }

            if (this.classList.contains("save-post")) {
                sessionStorage.setItem(
                    "notification",
                    "Post saved to your bookmarks"
                );
                sessionStorage.setItem("notificationType", "success");
                showNotificationFromStorage();
            } else if (this.classList.contains("delete-post")) {
                const postId = this.getAttribute("data-post-id");
                const postSlug = this.getAttribute("data-post-slug");

                if (postId && postSlug) {
                    const shouldDelete = await showModal("deleteModal");
                    if (shouldDelete) {
                        try {
                            const response = await fetch(`/posts/${postSlug}`, {
                                method: "DELETE",
                                headers: {
                                    "X-CSRF-TOKEN": document.querySelector(
                                        'meta[name="csrf-token"]'
                                    ).content,
                                    Accept: "application/json",
                                    "Content-Type": "application/json",
                                },
                            });

                            const data = await response.json();
                            if (data.success) {
                                sessionStorage.setItem(
                                    "notification",
                                    data.message
                                );
                                sessionStorage.setItem(
                                    "notificationType",
                                    "success"
                                );

                                const postElement = this.closest(".post");
                                if (postElement) {
                                    postElement.remove();
                                    const commentSection =
                                        document.querySelector(
                                            `.comment-section[data-post-id="${postId}"]`
                                        );
                                    if (commentSection) {
                                        commentSection.remove();
                                    }
                                } else {
                                    window.location.href = data.redirect;
                                }
                            } else {
                                sessionStorage.setItem(
                                    "notification",
                                    data.message
                                );
                                sessionStorage.setItem(
                                    "notificationType",
                                    "error"
                                );
                                window.location.reload();
                            }
                        } catch (error) {
                            console.error("Error:", error);
                            sessionStorage.setItem(
                                "notification",
                                "An error occurred while deleting the post"
                            );
                            sessionStorage.setItem("notificationType", "error");
                            window.location.reload();
                        }
                    }
                }
            } else if (this.classList.contains("hide-post")) {
                const postElement = this.closest(".post");
                const postId = postElement?.getAttribute("data-post-id");

                if (postElement) {
                    postElement.style.display = "none";
                    const commentSection = document.querySelector(
                        `.comment-section[data-post-id="${postId}"]`
                    );
                    if (commentSection) {
                        commentSection.style.display = "none";
                    }
                }

                sessionStorage.setItem(
                    "notification",
                    "Post hidden from your feed"
                );
                sessionStorage.setItem("notificationType", "success");
                showNotificationFromStorage();
            } else if (this.classList.contains("report-post")) {
                const postElement = this.closest(".post");
                const postId = postElement?.getAttribute("data-post-id");
                if (postId) {
                    window.location.href = `/report/${postId}`;
                }
            }
        });
    });

    // Handle reply toggles
    const toggleRepliesButtons = document.querySelectorAll(".toggle-replies");
    toggleRepliesButtons.forEach((btn) => {
        btn.addEventListener("click", function (e) {
            e.preventDefault();
            e.stopPropagation();

            const comment = this.closest(".comment");
            if (!comment) return;

            let replies = comment.parentElement.querySelector(".replies");

            if (replies) {
                const isHidden = replies.classList.contains("hidden");
                replies.classList.toggle("hidden");

                const replyCount = replies.querySelectorAll(".reply").length;
                this.textContent = isHidden
                    ? "Hide replies"
                    : `View replies ${replyCount > 0 ? replyCount : ""}`;
            }
        });
    });

    // Helper function to show notifications
    function showNotificationFromStorage() {
        const notification = sessionStorage.getItem("notification");
        const notificationType = sessionStorage.getItem("notificationType");

        if (notification) {
            // Remove existing notifications
            const existingNotifications =
                document.querySelectorAll(".notification");
            existingNotifications.forEach((n) => n.remove());

            const notificationDiv = document.createElement("div");
            notificationDiv.className = `notification ${notificationType}`;
            notificationDiv.innerHTML = `<span class="message">${notification}</span>`;
            document.body.appendChild(notificationDiv);

            // Show the notification
            setTimeout(() => {
                notificationDiv.style.display = "block";
                notificationDiv.classList.add("show");
            }, 100);

            // Auto-hide after 3 seconds
            setTimeout(() => {
                notificationDiv.classList.remove("show");
                setTimeout(() => notificationDiv.remove(), 300);
            }, 3000);

            // Clear from sessionStorage
            sessionStorage.removeItem("notification");
            sessionStorage.removeItem("notificationType");
        }
    }

    // Show any pending notifications from sessionStorage
    showNotificationFromStorage();
});
