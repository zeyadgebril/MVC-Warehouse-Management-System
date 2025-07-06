    document.addEventListener('DOMContentLoaded', function() {
    const offcanvas = new bootstrap.Offcanvas(document.getElementById('mobileSidebar'));

    // Prevent offcanvas from closing when clicking on dropdown
    document.querySelectorAll('.dropdown-menu').forEach(menu => {
        menu.addEventListener('click', function (e) {
            e.stopPropagation();
        });
    });

    // Existing navigation functionality
    function setActiveNav(clickedLink) {
        document.querySelectorAll(".nav-link").forEach((l) => l.classList.remove("active"));
    clickedLink.classList.add("active");
    const href = clickedLink.getAttribute("href");
    const correspondingLinks = document.querySelectorAll(`a[href="${href}"]`);
      correspondingLinks.forEach((link) => link.classList.add("active"));
    }
    
    //document.querySelectorAll(".nav-link:not(.dropdown-toggle)").forEach((link) => {
    //    link.addEventListener("click", function (e) {
    //        e.preventDefault();
    //        setActiveNav(this);
    //        offcanvas.hide();
    //    });
    //});

    // Card hover effects
    document.querySelectorAll(".card").forEach((card) => {
        card.addEventListener("mouseenter", function () {
            this.style.boxShadow = "0 4px 8px rgba(0, 123, 255, 0.3)";
        });
    card.addEventListener("mouseleave", function() {
        this.style.boxShadow = "none";
      });
    });
  });
