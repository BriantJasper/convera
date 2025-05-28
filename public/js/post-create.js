document.addEventListener("DOMContentLoaded", function () {
    const postForm = document.getElementById("postForm");
    const postTabs = document.querySelectorAll(".post-tab");

    postTabs.forEach((tab) => {
        tab.addEventListener("click", function () {
            postTabs.forEach((t) => t.classList.remove("active"));
            this.classList.add("active");
        });
    });

    postForm.addEventListener("submit", function (e) {
        e.preventDefault();
        alert("Post created successfully!");
        window.location.href = "../../index.html";
    });
});
