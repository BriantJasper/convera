document.addEventListener("DOMContentLoaded", function () {
    const tabs = document.querySelectorAll(".tab");
    const tabContents = document.querySelectorAll(".tab-content");
  
    tabs.forEach((tab) => {
      tab.addEventListener("click", function () {
        const tabId = this.getAttribute("data-tab");
  
        tabs.forEach((t) => t.classList.remove("active"));
        this.classList.add("active");
  
        tabContents.forEach((content) => {
          content.classList.add("hidden");
        });
  
        document.getElementById(`${tabId}-form`).classList.remove("hidden");
      });
    });
  
    const loginForm = document.getElementById("loginForm").querySelector("form");
    if (loginForm) {
      loginForm.addEventListener("submit", function (e) {
        e.preventDefault();
  
        const email = document.getElementById("login-email").value;
        const password = document.getElementById("login-password").value;
        const remember = document.getElementById("remember").checked;
  
        console.log("Login Attempt:", { email, password, remember });
        if (email && password) {
          const userData = {
            email,
            name: "Demo User",
            avatar: "https://via.placeholder.com/40",
          };
  
          if (remember) {
            localStorage.setItem("userData", JSON.stringify(userData));
          } else {
            sessionStorage.setItem("userData", JSON.stringify(userData));
          }
  
          window.location.href = "../../index.html";
        }
      });
    }
  
    const registerForm = document
      .getElementById("register-form")
      .querySelector("form");
    if (registerForm) {
      registerForm.addEventListener("submit", function (e) {
        e.preventDefault();
  
        const username = document.getElementById("reg-username").value;
        const email = document.getElementById("reg-email").value;
        const password = document.getElementById("reg-password").value;
        const confirmPassword = document.getElementById("reg-confirm").value;
  
        console.log("Register Attempt:", { username, email, password });
  
        if (password !== confirmPassword) {
          alert("Passwords do not match!");
          return;
        }
  
        if (username && email && password) {
          const userData = {
            email,
            name: username,
            avatar: "https://via.placeholder.com/40",
          };
  
          localStorage.setItem("userData", JSON.stringify(userData));
  
          window.location.href = "../../index.html";
        }
      });
    }
  });
  
  document.addEventListener("DOMContentLoaded", () => {
    const loginForm = document.getElementById("loginForm").querySelector("form");
    const registerForm = document
      .getElementById("registerForm")
      .querySelector("form");
    const switchToRegister = document.getElementById("switchToRegister");
    const switchToLogin = document.getElementById("switchToLogin");
    const loginBtn = document.getElementById("loginBtn");
    const closeAuthModal = document.getElementById("closeAuthModal");
    const authModal = document.getElementById("authModal");
  
    loginBtn.addEventListener("click", () => {
      authModal.classList.remove("hidden");
      loginForm.classList.remove("hidden");
      registerForm.classList.add("hidden");
      document.body.style.overflow = "hidden";
    });
  
    closeAuthModal.addEventListener("click", () => {
      authModal.classList.add("hidden");
      document.body.style.overflow = "";
    });
  
    switchToRegister.addEventListener("click", (e) => {
      e.preventDefault();
      loginForm.classList.add("hidden");
      registerForm.classList.remove("hidden");
    });
  
    switchToLogin.addEventListener("click", (e) => {
      e.preventDefault();
      registerForm.classList.add("hidden");
      loginForm.classList.remove("hidden");
    });
  });
  