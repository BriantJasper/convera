document.addEventListener("DOMContentLoaded", function () {
  initializeNeuPosts();

  function initializeNeuPosts() {
    createNeuPost();

    document.addEventListener('click', function(event) {
      if (event.target.closest('.neu-dot-menu-btn')) {
        const button = event.target.closest('.neu-dot-menu-btn');
        const postId = button.getAttribute('data-post-id');
        toggleDotMenu(postId);
      }

      if (event.target.closest('.neu-follow-btn')) {
        const button = event.target.closest('.neu-follow-btn');
        const postId = button.getAttribute('data-post-id');
        toggleFollow(postId);
      }

      if (event.target.closest('.neu-toggle-replies')) {
        const button = event.target.closest('.neu-toggle-replies');
        const postId = button.getAttribute('data-post-id');
        toggleReplies(postId);
      }

      if (event.target.closest('.neu-cancel-btn')) {
        const button = event.target.closest('.neu-cancel-btn');
        const postId = button.closest('.neu-comment-section').getAttribute('data-post-id');
        cancelComment(postId);
      }

      if (event.target.closest('.neu-comment-btn')) {
        const button = event.target.closest('.neu-comment-btn');
        const postId = button.closest('.neu-comment-section').getAttribute('data-post-id');
        submitComment(postId);
      }
    });
  }

  function createNeuPost() {

  }
  
  function createNeuPostHTML(postData) {

  }
  
  function toggleDotMenu(postId) {
    const dotMenu = document.querySelector(`.neu-post[data-post-id="${postId}"] .neu-dropdown-menu`);
    if (dotMenu) {
      document.querySelectorAll('.neu-dropdown-menu').forEach(menu => {
        if (menu !== dotMenu) {
          menu.classList.add('hidden');
        }
      });

      dotMenu.classList.toggle('hidden');

      const button = document.querySelector(`.neu-post[data-post-id="${postId}"] .neu-dot-menu-btn`);
      button.classList.toggle('active');
    }
  }
  
  function toggleFollow(postId) {
    const followBtn = document.querySelector(`.neu-post[data-post-id="${postId}"] .neu-follow-btn`);
    if (followBtn) {
      const isFollowing = followBtn.classList.contains('following');
      
      if (isFollowing) {
        followBtn.classList.remove('following');
        followBtn.classList.add('not-following');
        followBtn.textContent = 'Follow';

        followBtn.style.backgroundColor = '#1a2332';
        followBtn.style.color = '#3b82f6';
        followBtn.style.boxShadow = '3px 3px 6px #131c27, -3px -3px 6px #2b3647';
      } else {
        followBtn.classList.remove('not-following');
        followBtn.classList.add('following');
        followBtn.textContent = 'Following';

        followBtn.style.backgroundColor = '#3b82f6';
        followBtn.style.color = '#ffffff';
        followBtn.style.boxShadow = 'inset 3px 3px 6px #2d65c0, inset -3px -3px 6px #479fff';
      }
    }
  }
  
  function toggleReplies(postId) {
    const repliesSection = document.querySelector(`.neu-post[data-post-id="${postId}"] + .neu-comment-section`);
    if (repliesSection) {
      repliesSection.classList.toggle('hidden');

      if (!repliesSection.classList.contains('hidden')) {
        repliesSection.style.animation = 'fadeIn 0.3s ease forwards';
      }
    }
  }
  
  function cancelComment(postId) {
    const commentSection = document.querySelector(`.neu-comment-section[data-post-id="${postId}"]`);
    const textarea = commentSection.querySelector('textarea');

    if (textarea) {
      textarea.value = '';
    }
    commentSection.classList.add('hidden');
  }
  
  function submitComment(postId) {
    const commentSection = document.querySelector(`.neu-comment-section[data-post-id="${postId}"]`);
    const textarea = commentSection.querySelector('textarea');
    const commentsList = commentSection.querySelector('.comments-list');
    
    if (textarea && commentsList) {
      const commentText = textarea.value.trim();
      
      if (commentText !== '') {
        const newComment = document.createElement('div');
        newComment.className = 'comment';
        
        newComment.innerHTML = `
          <img src="/api/placeholder/40/40" alt="User" class="comment-profile-img">
          <div class="comment-content">
            <div class="comment-header">
              <span class="comment-user">Current User</span>
              <span class="comment-time">Just now</span>
            </div>
            <div class="comment-text">
              <p>${commentText}</p>
            </div>
            <div class="comment-footer">
              <button class="toggle-replies">View replies (0)</button>
              <div class="like-count">👍 0</div>
            </div>
          </div>
        `;

        commentsList.prepend(newComment);

        textarea.value = '';
      }
    }
  }

  document.addEventListener('click', function(e) {
    if (!e.target.closest('.neu-dot-menu-btn') && !e.target.closest('.neu-dropdown-menu')) {
      document.querySelectorAll('.neu-dropdown-menu').forEach(menu => {
        menu.classList.add('hidden');
      });

      document.querySelectorAll('.neu-dot-menu-btn').forEach(button => {
        button.classList.remove('active');
      });
    }
  });
});