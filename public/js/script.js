document.addEventListener('DOMContentLoaded', function() {
    const modal = document.getElementById("authModal");
    const loginBtn = document.getElementById("loginBtn");
    const closeBtn = document.getElementById("closeAuthModal");
    const tabs = document.querySelectorAll(".tab");
    const tabContents = document.querySelectorAll(".tab-content");

    if (loginBtn) {
        loginBtn.addEventListener("click", function() {
            modal.classList.remove("hidden");
            document.body.style.overflow = "hidden";
        });
    }

    if (closeBtn) {
        closeBtn.addEventListener("click", function() {
            modal.classList.add("hidden");
            document.body.style.overflow = ""; 
        });
    }

    tabs.forEach(tab => {
        tab.addEventListener("click", function() {
            const tabId = this.getAttribute("data-tab");

            tabs.forEach(t => t.classList.remove("active"));
            this.classList.add("active");

            tabContents.forEach(content => content.classList.add("hidden"));
            document.getElementById(`${tabId}-form`).classList.remove("hidden");
        });
    });

    const loginForm = document.querySelector("#login-form form");
    if (loginForm) {
        loginForm.addEventListener("submit", function(e) {
            e.preventDefault();
            const email = document.getElementById("email").value;
            const password = document.getElementById("password").value;
            const remember = document.getElementById("remember")?.checked;
            
            console.log("Login attempt:", {email, password, remember});

            if (email && password) {
                const userData = {
                    email,
                    name: "Demo User",
                    avatar: "https://via.placeholder.com/40"
                };

                if (remember) {
                    localStorage.setItem("userData", JSON.stringify(userData));
                } else {
                    sessionStorage.setItem("userData", JSON.stringify(userData));
                }

                modal.classList.add("hidden");
                document.body.style.overflow = "";

                if (loginBtn) {
                    loginBtn.textContent = "Profile";
                }
            }
        });
    }

    const registerForm = document.querySelector("#register-form form");
    if (registerForm) {
        registerForm.addEventListener("submit", function(e) {
            e.preventDefault();
            const username = document.getElementById("reg-username").value;
            const email = document.getElementById("reg-email").value;
            const password = document.getElementById("reg-password").value;
            const confirmPassword = document.getElementById("reg-confirm").value;
            
            console.log("Register attempt:", {username, email});

            if (password !== confirmPassword) {
                alert("Passwords do not match!");
                return;
            }

            if (username && email && password) {
                const userData = {
                    email,
                    name: username,
                    avatar: "https://via.placeholder.com/40"
                };

                localStorage.setItem("userData", JSON.stringify(userData));
                modal.classList.add("hidden");
                document.body.style.overflow = "";
                if (loginBtn) {
                    loginBtn.textContent = "Profile";
                }
            }
        });
    }

    const likeButtons = document.querySelectorAll('.engagement-action button:first-child');
    
    likeButtons.forEach(button => {
        button.addEventListener('click', function() {
            const countElement = this.nextElementSibling;
            let count = countElement.textContent;

            let numericCount = parseFloat(count.replace('K', ''));
            if (count.includes('K')) {
                numericCount *= 1000;
            }

            if (!this.classList.contains('liked')) {
                numericCount += 1;
                this.classList.add('liked');
                this.querySelector('i').style.color = '#3b82f6';
            } else {
                numericCount -= 1;
                this.classList.remove('liked');
                this.querySelector('i').style.color = '';
            }

            if (numericCount >= 1000) {
                countElement.textContent = (numericCount / 1000).toFixed(1) + 'K';
            } else {
                countElement.textContent = numericCount;
            }
        });
    });
    
    const followButtons = document.querySelectorAll('.follow-btn');
    
    followButtons.forEach(button => {
        button.addEventListener('click', function() {
            if (this.textContent === 'Follow') {
                this.textContent = 'Following';
                this.style.color = '#10b981';  
            } else {
                this.textContent = 'Follow';
                this.style.color = '#3b82f6';  
            }
        });
    });

    const postInput = document.querySelector('.post-input input');
    
    if (postInput) {
        postInput.addEventListener('focus', function() {
            this.placeholder = 'What\'s on your mind?';
        });
        
        postInput.addEventListener('blur', function() {
            this.placeholder = 'Create a post...';
        });
    }
    
    const navItems = document.querySelectorAll('.nav-item');
    
    navItems.forEach(item => {
        item.addEventListener('click', function(e) {
            if (!this.getAttribute('href') || this.getAttribute('href') === '#') {
                e.preventDefault();
            }
            
            navItems.forEach(nav => nav.classList.remove('active'));
            this.classList.add('active');
        });
    });
    
    const searchInput = document.querySelector('.search-container input');
    const searchButton = document.querySelector('.search-container button');
    
    if (searchButton && searchInput) {
        searchButton.addEventListener('click', function() {
            performSearch();
        });
        
        searchInput.addEventListener('keypress', function(e) {
            if (e.key === 'Enter') {
                performSearch();
            }
        });
        
        function performSearch() {
            const query = searchInput.value.trim();
            if (query) {
                console.log(`Search query: ${query}`);
                searchInput.value = '';
            }
        }
    }
});