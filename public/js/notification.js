class Notification {
    constructor(message, type = "default", duration = 5000) {
        this.message = message;
        this.type = type;
        this.duration = duration;
        this.notification = null;
    }

    show() {
        // Create notification element
        this.notification = document.createElement("div");
        this.notification.className = `notification ${this.type}`;

        // Create message element
        const messageElement = document.createElement("span");
        messageElement.className = "message";
        messageElement.textContent = this.message;

        // Create close button
        const closeButton = document.createElement("button");
        closeButton.className = "close-btn";
        closeButton.innerHTML = "&times;";
        closeButton.onclick = () => this.dismiss();

        // Append elements
        this.notification.appendChild(messageElement);
        this.notification.appendChild(closeButton);
        document.body.appendChild(this.notification);

        // Show notification with animation
        setTimeout(() => {
            this.notification.classList.add("show");
        }, 100);

        // Auto dismiss after duration
        if (this.duration > 0) {
            setTimeout(() => {
                this.dismiss();
            }, this.duration);
        }
    }

    dismiss() {
        if (this.notification) {
            this.notification.classList.remove("show");
            setTimeout(() => {
                this.notification.remove();
            }, 300);
        }
    }
}

// Helper functions for different notification types
const showNotification = {
    success: (message, duration = 5000) => {
        new Notification(message, "success", duration).show();
    },
    error: (message, duration = 5000) => {
        new Notification(message, "error", duration).show();
    },
    warning: (message, duration = 5000) => {
        new Notification(message, "warning", duration).show();
    },
    info: (message, duration = 5000) => {
        new Notification(message, "info", duration).show();
    },
    default: (message, duration = 5000) => {
        new Notification(message, "default", duration).show();
    },
};

// Make showNotification globally available
window.showNotification = showNotification;
window.Notification = Notification;

// Initialize notifications from session data if available
document.addEventListener("DOMContentLoaded", function () {
    // Check for session storage notifications first
    const sessionNotification = sessionStorage.getItem("notification");
    const sessionNotificationType = sessionStorage.getItem("notificationType");

    if (sessionNotification && sessionNotificationType) {
        showNotification[sessionNotificationType](sessionNotification);
        // Clear from session storage
        sessionStorage.removeItem("notification");
        sessionStorage.removeItem("notificationType");
        return; // Don't check for DOM notifications if we have session ones
    }

    // Check for server-rendered notifications
    const successMessage = document.querySelector(
        '.notification[data-type="success"]'
    );
    const errorMessage = document.querySelector(
        '.notification[data-type="error"]'
    );

    if (successMessage) {
        const message = successMessage.querySelector(".message");
        if (message) {
            showNotification.success(message.textContent);
            successMessage.style.display = "none"; // Hide the server-rendered one
        }
    }

    if (errorMessage) {
        const message = errorMessage.querySelector(".message");
        if (message) {
            showNotification.error(message.textContent);
            errorMessage.style.display = "none"; // Hide the server-rendered one
        }
    }
});
