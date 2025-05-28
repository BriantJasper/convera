document.addEventListener("DOMContentLoaded", () => {
    // Show notification if it exists
    const notification = document.getElementById("notification");
    if (notification) {
        setTimeout(() => {
            notification.classList.add("show");
        }, 100);
    }

    // Handle create post buttons for unauthenticated users
    const createPostButtons = document.querySelectorAll("#createPostBtn");
    createPostButtons.forEach((button) => {
        button.addEventListener("click", () => {
            showAuthModal();
        });
    });

    // Check if we need to open the auth modal
    const openModalType = document.body.getAttribute("data-open-modal");
    if (openModalType) {
        const authModal = document.getElementById("authModal");
        const loginForm = document.getElementById("loginForm");
        const registerForm = document.getElementById("registerForm");

        if (authModal) {
            authModal.classList.remove("hidden");
            document.body.style.overflow = "hidden";

            if (openModalType === "login") {
                loginForm.classList.remove("hidden");
                registerForm.classList.add("hidden");
            } else if (openModalType === "register") {
                loginForm.classList.add("hidden");
                registerForm.classList.remove("hidden");
            }
        }
    }

    // Get the DIV containers for login and register sections
    const loginFormContainer = document.getElementById("loginForm");
    const registerFormContainer = document.getElementById("registerForm");

    // Correctly get the switch links by their HTML IDs
    const showRegisterLink = document.getElementById("showRegister");
    const showLoginLink = document.getElementById("showLogin");

    const loginBtn = document.getElementById("loginBtn");
    const closeAuthModal = document.getElementById("closeAuthModal");
    const authModal = document.getElementById("authModal");

    if (loginBtn) {
        loginBtn.addEventListener("click", () => {
            showAuthModal();
        });
    }

    if (closeAuthModal) {
        closeAuthModal.addEventListener("click", () => {
            authModal.classList.add("hidden");
            document.body.style.overflow = "";
        });
    }

    // Add click event listener to the modal overlay
    authModal.addEventListener("click", (e) => {
        // Only close if clicking directly on the modal overlay (not its children)
        if (e.target === authModal) {
            authModal.classList.add("hidden");
            document.body.style.overflow = "";
        }
    });

    // Ensure the link exists before adding an event listener
    if (showRegisterLink) {
        showRegisterLink.addEventListener("click", (e) => {
            e.preventDefault();
            loginFormContainer.classList.add("hidden"); // Hide the login DIV container
            registerFormContainer.classList.remove("hidden"); // Show the register DIV container
        });
    }

    // Ensure the link exists before adding an event listener
    if (showLoginLink) {
        showLoginLink.addEventListener("click", (e) => {
            e.preventDefault();
            registerFormContainer.classList.add("hidden"); // Hide the register DIV container
            loginFormContainer.classList.remove("hidden"); // Show the login DIV container
        });
    }

    // Handle form submissions (your existing code for this seems okay,
    // assuming the form elements like 'login-email', 'reg-email' are within these containers)
    const loginFormElement = loginFormContainer.querySelector("form");
    if (loginFormElement) {
        loginFormElement.addEventListener("submit", function (e) {
            // Remove preventDefault to allow form submission
            const email = document.getElementById("login-email").value;
            const password = document.getElementById("login-password").value;
            const remember = document.getElementById("remember").checked;

            if (!email || !password) {
                e.preventDefault();
                return;
            }
        });
    }

    const registerFormElement = registerFormContainer.querySelector("form");
    if (registerFormElement) {
        registerFormElement.addEventListener("submit", function (e) {
            // Remove the preventDefault and client-side handling
            // Let the form submit normally to the Laravel backend
        });
    }
});

// Function to dismiss notification
function dismissNotification() {
    const notification = document.getElementById("notification");
    if (notification) {
        notification.classList.remove("show");
        setTimeout(() => {
            notification.remove();
        }, 300);
    }
}

// Function to show auth modal
function showAuthModal() {
    const authModal = document.getElementById("authModal");
    const loginForm = document.getElementById("loginForm");
    const registerForm = document.getElementById("registerForm");

    if (authModal) {
        authModal.classList.remove("hidden");
        loginForm.classList.remove("hidden");
        registerForm.classList.add("hidden");
        document.body.style.overflow = "hidden";
    }
}
