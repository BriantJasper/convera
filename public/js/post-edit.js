import { showModal } from "./modal.js";

document.addEventListener("DOMContentLoaded", function () {
    const editForm = document.getElementById("editForm");
    const postTabs = document.querySelectorAll(".post-tab");
    const cancelBtn = document.getElementById("cancelBtn");
    const deleteBtn = document.getElementById("deleteBtn");
    const changesIndicator = document.getElementById("changesIndicator");
    const postTitle = document.getElementById("postTitle");
    const postContent = document.getElementById("postContent");
    const communitySelect = document.getElementById("community");
    const container = document.querySelector(".edit-post-container");
    const csrfToken = container.dataset.csrfToken;

    // Store original values to detect changes
    const originalTitle = postTitle.value;
    const originalContent = postContent.value;
    const originalCommunity = communitySelect.value;

    let hasUnsavedChanges = false;
    let isSubmitting = false;

    // Tab switching functionality
    postTabs.forEach((tab) => {
        tab.addEventListener("click", function () {
            postTabs.forEach((t) => t.classList.remove("active"));
            this.classList.add("active");
        });
    });

    // Track changes
    function checkForChanges() {
        const titleChanged = postTitle.value !== originalTitle;
        const contentChanged = postContent.value !== originalContent;
        const communityChanged = communitySelect.value !== originalCommunity;
        hasUnsavedChanges = titleChanged || contentChanged || communityChanged;

        if (hasUnsavedChanges) {
            changesIndicator.style.display = "inline-block";
            changesIndicator.classList.add("unsaved-changes");
            changesIndicator.textContent = "Unsaved Changes";
        } else {
            changesIndicator.style.display = "none";
            changesIndicator.classList.remove("unsaved-changes");
        }
    }

    // Add event listeners for change detection
    postTitle.addEventListener("input", checkForChanges);
    postContent.addEventListener("input", checkForChanges);
    communitySelect.addEventListener("change", checkForChanges);

    // Form submission
    editForm.addEventListener("submit", async function (e) {
        e.preventDefault();

        if (hasUnsavedChanges) {
            const shouldSubmit = await showModal("unsavedChangesModal");
            if (!shouldSubmit) {
                return;
            }
        }

        // Show update confirmation
        const shouldUpdate = await showModal("updateModal");
        if (!shouldUpdate) {
            return;
        }

        // Show saving indicator
        changesIndicator.style.display = "inline-block";
        changesIndicator.classList.remove("unsaved-changes");
        changesIndicator.style.backgroundColor = "#10b981";
        changesIndicator.textContent = "Saving...";

        // Submit the form
        this.submit();
    });

    // Cancel button
    cancelBtn.addEventListener("click", async function () {
        if (hasUnsavedChanges) {
            const shouldLeave = await showModal("unsavedChangesModal");
            if (shouldLeave) {
                window.history.back();
            }
        } else {
            window.history.back();
        }
    });

    // Delete button
    deleteBtn.addEventListener("click", async function () {
        if (hasUnsavedChanges) {
            const shouldLeave = await showModal("unsavedChangesModal");
            if (!shouldLeave) {
                return;
            }
        }

        const shouldDelete = await showModal("deleteModal");
        if (shouldDelete) {
            // Get the post slug from the form's action URL
            const formAction = editForm.getAttribute("action");
            const postSlug = formAction.split("/").pop();

            try {
                // Send delete request
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
                    // Store the notification message in sessionStorage
                    sessionStorage.setItem("notification", data.notification);
                    sessionStorage.setItem("notificationType", "success");
                    // Redirect to the homepage
                    window.location.href = data.redirect;
                } else {
                    alert(
                        "Error deleting post: " +
                            (data.message || "Unknown error occurred")
                    );
                }
            } catch (error) {
                console.error("Error:", error);
                alert(
                    "An error occurred while deleting the post. Please try again."
                );
            }
        }
    });

    // Formatting buttons functionality
    const formatBtns = document.querySelectorAll(".format-btn");
    formatBtns.forEach((btn) => {
        btn.addEventListener("click", function () {
            const textarea = postContent;
            const start = textarea.selectionStart;
            const end = textarea.selectionEnd;
            const selectedText = textarea.value.substring(start, end);

            let formattedText = "";
            const icon = this.querySelector("i").className;

            if (icon.includes("fa-bold")) {
                formattedText = `**${selectedText}**`;
            } else if (icon.includes("fa-italic")) {
                formattedText = `*${selectedText}*`;
            } else if (icon.includes("fa-list-ul")) {
                formattedText = `• ${selectedText}`;
            } else if (icon.includes("fa-list-ol")) {
                formattedText = `1. ${selectedText}`;
            } else if (icon.includes("fa-code")) {
                formattedText = `\`${selectedText}\``;
            } else if (icon.includes("fa-link")) {
                const url = prompt("Enter URL:");
                if (url) {
                    formattedText = `[${selectedText || "Link text"}](${url})`;
                } else {
                    return;
                }
            }

            textarea.value =
                textarea.value.substring(0, start) +
                formattedText +
                textarea.value.substring(end);
            textarea.focus();
            textarea.setSelectionRange(
                start + formattedText.length,
                start + formattedText.length
            );
            checkForChanges();
        });
    });

    // Auto-save functionality (every 30 seconds)
    setInterval(() => {
        if (hasUnsavedChanges) {
            // Simulate auto-save
            console.log("Auto-saving draft...");
            // You can implement actual auto-save logic here
        }
    }, 30000);
});
