document.addEventListener("DOMContentLoaded", function () {
    // Initialize Select2 for community search
    $(".community-select").select2({
        placeholder: "Search for a community...",
        allowClear: true,
        minimumInputLength: 1,
        ajax: {
            url: "/api/communities/search",
            dataType: "json",
            delay: 250,
            data: function (params) {
                return {
                    search: params.term,
                };
            },
            processResults: function (data) {
                return {
                    results: data.map(function (community) {
                        return {
                            id: community.id,
                            text: community.name,
                        };
                    }),
                };
            },
            cache: true,
        },
    });

    // Handle post type tabs
    const tabs = document.querySelectorAll(".post-tab");
    tabs.forEach((tab) => {
        tab.addEventListener("click", function () {
            // Remove active class from all tabs
            tabs.forEach((t) => t.classList.remove("active"));
            // Add active class to clicked tab
            this.classList.add("active");

            // Handle different post types
            const type = this.dataset.type;
            const contentArea = document.getElementById("postContent");

            switch (type) {
                case "text":
                    contentArea.placeholder = "What's on your mind?";
                    break;
                case "image":
                    contentArea.placeholder =
                        "Add an image URL or upload an image...";
                    break;
                case "link":
                    contentArea.placeholder = "Paste your link here...";
                    break;
            }
        });
    });

    // Handle text formatting
    const formatButtons = document.querySelectorAll(".format-btn");
    formatButtons.forEach((button) => {
        button.addEventListener("click", function () {
            const format = this.dataset.format;
            const textarea = document.getElementById("postContent");
            const start = textarea.selectionStart;
            const end = textarea.selectionEnd;
            const selectedText = textarea.value.substring(start, end);
            let formattedText = "";

            switch (format) {
                case "bold":
                    formattedText = `**${selectedText}**`;
                    break;
                case "italic":
                    formattedText = `*${selectedText}*`;
                    break;
                case "list":
                    formattedText = `- ${selectedText}`;
                    break;
                case "ordered-list":
                    formattedText = `1. ${selectedText}`;
                    break;
                case "code":
                    formattedText = `\`${selectedText}\``;
                    break;
            }

            textarea.value =
                textarea.value.substring(0, start) +
                formattedText +
                textarea.value.substring(end);
            textarea.focus();
            textarea.selectionStart = start + formattedText.length;
            textarea.selectionEnd = start + formattedText.length;
        });
    });

    // Handle form submission
    const form = document.getElementById("postForm");
    form.addEventListener("submit", function (e) {
        e.preventDefault();

        // Basic validation
        const title = document.getElementById("postTitle").value.trim();
        const content = document.getElementById("postContent").value.trim();
        const community = document.getElementById("community").value;

        if (!title || !content || !community) {
            alert("Please fill in all required fields");
            return;
        }

        // Submit the form
        this.submit();
    });

    // Handle draft saving
    const draftButton = document.querySelector(".post-draft");
    draftButton.addEventListener("click", function () {
        // TODO: Implement draft saving functionality
        alert("Draft saving functionality coming soon!");
    });
});
