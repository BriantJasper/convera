document.addEventListener("DOMContentLoaded", function () {
  const modal = document.getElementById("reportModal");
  const cancelBtn = document.getElementById("cancelModal");
  const form = document.getElementById("reportForm");

  if (!modal || !cancelBtn || !form) {
    console.error("Required report elements not found");
    return;
  }

  function openReportModal() {
    console.log("Opening report modal");
    modal.style.display = "flex";
    modal.classList.add("show");
    const firstRadio = form.querySelector('input[type="radio"]');
    if (firstRadio) firstRadio.focus();
  }

  function closeReportModal() {
    console.log("Closing report modal");
    modal.style.display = "none";
    modal.classList.remove("show");
    form.reset();
  }

  cancelBtn.addEventListener("click", closeReportModal);

  modal.addEventListener("click", (e) => {
    if (e.target === modal) {
      closeReportModal();
    }
  });

  form.addEventListener("submit", function (e) {
    e.preventDefault();

    const formData = new FormData(form);
    const reportData = {
      reason: formData.get("reason"),
      details: formData.get("details"),
      timestamp: new Date().toISOString(),
      postId: form.getAttribute("data-post-id") || "unknown",
    };

    console.log("Report submitted:", reportData);

    alert(
      "Report submitted successfully. Thank you for helping keep our community safe!"
    );

    closeReportModal();
  });

  window.openReportModal = openReportModal;
});
