document.addEventListener("DOMContentLoaded", function () {
    const loginBtn = document.getElementById("loginBtn");
    const authModal = document.getElementById("authModal");
    const closeAuthModal = document.getElementById("closeAuthModal");
    const loginForm = document.getElementById("loginForm");
    const registerForm = document.getElementById("registerForm");
    const showRegister = document.getElementById("showRegister");
    const showLogin = document.getElementById("showLogin");

    loginBtn.addEventListener("click", function () {
        authModal.classList.remove("hidden");
        loginForm.classList.remove("hidden");
        registerForm.classList.add("hidden");
    });

    closeAuthModal.addEventListener("click", function () {
        authModal.classList.add("hidden");
    });

    showRegister.addEventListener("click", function (e) {
        e.preventDefault();
        loginForm.classList.add("hidden");
        registerForm.classList.remove("hidden");
    });

    showLogin.addEventListener("click", function (e) {
        e.preventDefault();
        registerForm.classList.add("hidden");
        loginForm.classList.remove("hidden");
    });

    authModal.addEventListener("click", function (e) {
        if (e.target === authModal) {
            authModal.classList.add("hidden");
        }
    });
});
