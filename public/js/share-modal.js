// Share functionality
const shareModal = document.getElementById("shareModal");
const closeShareModal = document.getElementById("closeShareModal");
const shareLink = document.getElementById("shareLink");
const copyLinkBtn = document.getElementById("copyLinkBtn");
let currentPostId = null;

// Share button click handler
document.body.addEventListener("click", function (e) {
    if (e.target.closest(".share-btn")) {
        const btn = e.target.closest(".share-btn");
        currentPostId = btn.getAttribute("data-post-id");

        // Generate post URL
        const postUrl = `${window.location.origin}${window.location.pathname}#post-${currentPostId}`;
        shareLink.value = postUrl;

        shareModal.classList.remove("hidden");
        e.stopPropagation();
    }
});

// Close share modal
closeShareModal.addEventListener("click", function () {
    shareModal.classList.add("hidden");
});

// Close modal when clicking outside
shareModal.addEventListener("click", function (e) {
    if (e.target === shareModal) {
        shareModal.classList.add("hidden");
    }
});

// Copy link functionality
copyLinkBtn.addEventListener("click", function () {
    shareLink.select();
    shareLink.setSelectionRange(0, 99999); // For mobile devices

    try {
        document.execCommand("copy");

        // Visual feedback
        const originalText = copyLinkBtn.innerHTML;
        copyLinkBtn.innerHTML = '<i class="fa fa-check"></i>';
        copyLinkBtn.classList.add("copy-success");

        setTimeout(() => {
            copyLinkBtn.innerHTML = originalText;
            copyLinkBtn.classList.remove("copy-success");
        }, 2000);
    } catch (err) {
        console.error("Failed to copy: ", err);
    }
});

// Share platform handlers
document.querySelectorAll(".share-option").forEach(function (btn) {
    btn.addEventListener("click", function () {
        const platform = this.getAttribute("data-platform");
        const postUrl = shareLink.value;
        const postText = getPostText(currentPostId);

        let shareUrl = "";

        switch (platform) {
            case "facebook":
                shareUrl = `https://www.facebook.com/sharer/sharer.php?u=${encodeURIComponent(
                    postUrl
                )}`;
                break;
            case "twitter":
                shareUrl = `https://twitter.com/intent/tweet?url=${encodeURIComponent(
                    postUrl
                )}&text=${encodeURIComponent(postText)}`;
                break;
            case "linkedin":
                shareUrl = `https://www.linkedin.com/sharing/share-offsite/?url=${encodeURIComponent(
                    postUrl
                )}`;
                break;
            case "whatsapp":
                shareUrl = `https://wa.me/?text=${encodeURIComponent(
                    postText + " " + postUrl
                )}`;
                break;
            case "telegram":
                shareUrl = `https://t.me/share/url?url=${encodeURIComponent(
                    postUrl
                )}&text=${encodeURIComponent(postText)}`;
                break;
            case "email":
                shareUrl = `mailto:?subject=${encodeURIComponent(
                    "Check out this post"
                )}&body=${encodeURIComponent(postText + "\n\n" + postUrl)}`;
                break;
        }

        if (shareUrl) {
            window.open(shareUrl, "_blank", "width=600,height=400");
        }
    });
});

// Helper function to get post text
function getPostText(postId) {
    const post = document.querySelector(`[data-post-id="${postId}"]`);
    if (post) {
        const contentElement = post.querySelector(".post-content p");
        return contentElement
            ? contentElement.textContent.trim()
            : "Check out this post!";
    }
    return "Check out this post!";
}
