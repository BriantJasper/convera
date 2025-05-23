export function setupAuthModal() {
    const modal = document.getElementById("authModal");
    const loginBtn = document.getElementById("loginBtn");
    const closeBtn = document.getElementById("closeAuthModal");
    const tabs = modal.querySelectorAll(".tab");
    const tabContents = modal.querySelectorAll(".tab-content");
  
    loginBtn.addEventListener("click", () => {
      modal.classList.remove("hidden");
      document.body.style.overflow = "hidden";
    });
  
    closeBtn.addEventListener("click", () => {
      modal.classList.add("hidden");
      document.body.style.overflow = "";
    });
  
    tabs.forEach((tab) => {
      tab.addEventListener("click", function () {
        const tabId = this.getAttribute("data-tab");
        tabs.forEach((t) => t.classList.remove("active"));
        this.classList.add("active");
        tabContents.forEach((content) => content.classList.add("hidden"));
        modal.querySelector(`#${tabId}-form`).classList.remove("hidden");
      });
    });
  
    const loginForm = modal.querySelector("#login-form form");
    if (loginForm) {
      loginForm.addEventListener("submit", function (e) {
        e.preventDefault();
        const email = modal.querySelector("#email").value;
        const password = modal.querySelector("#password").value;
        const remember = modal.querySelector("#remember").checked;
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
          modal.classList.add("hidden");
          document.body.style.overflow = "";
        }
      });
    }
  
    const registerForm = modal.querySelector("#register-form form");
    if (registerForm) {
      registerForm.addEventListener("submit", function (e) {
        e.preventDefault();
        const username = modal.querySelector("#reg-username").value;
        const email = modal.querySelector("#reg-email").value;
        const password = modal.querySelector("#reg-password").value;
        const confirmPassword = modal.querySelector("#reg-confirm").value;
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
          modal.classList.add("hidden");
          document.body.style.overflow = "";
        }
      });
    }
  }
  