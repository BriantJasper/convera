export function showModal(modalId) {
    return new Promise((resolve) => {
        const modal = document.getElementById(modalId);
        if (!modal) {
            console.error(`Modal with id ${modalId} not found`);
            resolve(false);
            return;
        }

        modal.classList.add("active");

        const cancelBtn = modal.querySelector(".modal-btn.cancel");
        const confirmBtn = modal.querySelector(".modal-btn.confirm");

        const handleCancel = () => {
            modal.classList.remove("active");
            cleanup();
            resolve(false);
        };

        const handleConfirm = () => {
            modal.classList.remove("active");
            cleanup();
            resolve(true);
        };

        const handleEscape = (e) => {
            if (e.key === "Escape") {
                handleCancel();
            }
        };

        const handleClickOutside = (e) => {
            if (e.target === modal) {
                handleCancel();
            }
        };

        const cleanup = () => {
            cancelBtn.removeEventListener("click", handleCancel);
            confirmBtn.removeEventListener("click", handleConfirm);
            document.removeEventListener("keydown", handleEscape);
            modal.removeEventListener("click", handleClickOutside);
        };

        cancelBtn.addEventListener("click", handleCancel);
        confirmBtn.addEventListener("click", handleConfirm);
        document.addEventListener("keydown", handleEscape);
        modal.addEventListener("click", handleClickOutside);
    });
}
