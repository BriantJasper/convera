document.addEventListener("DOMContentLoaded", function () {
    // Search functionality
    const searchInput = document.querySelector(".search-container input");
    const searchButton = document.querySelector(".search-container button");

    if (searchButton && searchInput) {
        searchButton.addEventListener("click", function () {
            performSearch();
        });

        searchInput.addEventListener("keypress", function (e) {
            if (e.key === "Enter") {
                performSearch();
            }
        });

        function performSearch() {
            const query = searchInput.value.trim();
            if (query) {
                alert(`Searching for: "${query}"`);
                searchInput.value = "";
            }
        }
    }

    // Settings navigation
    const settingsNavItems = document.querySelectorAll(".settings-nav-item");
    const settingsSections = document.querySelectorAll(".settings-section");

    settingsNavItems.forEach((item) => {
        item.addEventListener("click", function (e) {
            e.preventDefault();
            const targetSection = this.getAttribute("data-section");

            // Remove active class from all nav items and sections
            settingsNavItems.forEach((nav) => nav.classList.remove("active"));
            settingsSections.forEach((section) =>
                section.classList.remove("active")
            );

            // Add active class to clicked nav item and corresponding section
            this.classList.add("active");
            document.getElementById(targetSection).classList.add("active");
        });
    });

    // Toggle switches
    const toggleSwitches = document.querySelectorAll(".toggle-switch");
    toggleSwitches.forEach((toggle) => {
        toggle.addEventListener("click", function () {
            this.classList.toggle("active");
        });
    });

    // Profile photo upload
    const uploadBtn = document.querySelector(".upload-btn");
    const profileUpload = document.getElementById("profileUpload");
    const profilePreview = document.getElementById("profilePreview");

    uploadBtn.addEventListener("click", function () {
        profileUpload.click();
    });

    profileUpload.addEventListener("change", function (e) {
        const file = e.target.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function (e) {
                profilePreview.src = e.target.result;
            };
            reader.readAsDataURL(file);
        }
    });

    // Change password button
    const changePasswordBtn = document.querySelector(
        'button[onclick*="Change Password"]'
    );
    if (changePasswordBtn) {
        changePasswordBtn.addEventListener("click", function () {
            alert("Change password functionality coming soon!");
        });
    }

    // View sessions button
    const viewSessionsBtn = document.querySelector(
        'button[onclick*="View Sessions"]'
    );
    if (viewSessionsBtn) {
        viewSessionsBtn.addEventListener("click", function () {
            alert("Active sessions management coming soon!");
        });
    }

    // Request download button
    const requestDownloadBtn = document.querySelector(
        'button[onclick*="Request Download"]'
    );
    if (requestDownloadBtn) {
        requestDownloadBtn.addEventListener("click", function () {
            alert("Data download request submitted!");
        });
    }

    // Danger zone buttons
    const deactivateBtn = document.querySelector(
        '.btn-danger[onclick*="Deactivate"]'
    );
    if (deactivateBtn) {
        deactivateBtn.addEventListener("click", function () {
            if (confirm("Are you sure you want to deactivate your account?")) {
                alert("Account deactivation functionality coming soon!");
            }
        });
    }

    const deleteBtn = document.getElementById("deleteAccountBtn");
    if (deleteBtn) {
        deleteBtn.addEventListener("click", function (e) {
            e.preventDefault();
            if (
                confirm(
                    "Are you sure you want to permanently delete your account? This action cannot be undone."
                )
            ) {
                // Create and submit form
                const form = document.createElement("form");
                form.method = "POST";
                form.action = "/settings/account";

                // Add CSRF token
                const csrfInput = document.createElement("input");
                csrfInput.type = "hidden";
                csrfInput.name = "_token";
                csrfInput.value = document.querySelector(
                    'meta[name="csrf-token"]'
                ).content;
                form.appendChild(csrfInput);

                // Add method spoofing for DELETE
                const methodInput = document.createElement("input");
                methodInput.type = "hidden";
                methodInput.name = "_method";
                methodInput.value = "DELETE";
                form.appendChild(methodInput);

                document.body.appendChild(form);
                form.submit();
            }
        });
    }

    // Sidebar follow buttons
    const followBtns = document.querySelectorAll(".follow-btn");
    followBtns.forEach((btn) => {
        btn.addEventListener("click", function () {
            if (this.textContent === "Follow") {
                this.textContent = "Following";
                this.style.backgroundColor = "#10b981";
            } else {
                this.textContent = "Follow";
                this.style.backgroundColor = "";
            }
        });
    });

    // Hashtag functionality
    const hashtags = document.querySelectorAll(".hashtag");
    hashtags.forEach((hashtag) => {
        hashtag.addEventListener("click", function (e) {
            e.preventDefault();
            const tag = this.textContent;
            alert(`Searching for posts with ${tag}`);
        });
    });

    // Form validation
    const inputFields = document.querySelectorAll(".input-field");
    inputFields.forEach((input) => {
        input.addEventListener("blur", function () {
            if (this.type === "email" && this.value) {
                const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                if (!emailRegex.test(this.value)) {
                    this.style.borderColor = "#ef4444";
                    alert("Please enter a valid email address");
                } else {
                    this.style.borderColor = "#2c3b52";
                }
            }
        });
    });
});
