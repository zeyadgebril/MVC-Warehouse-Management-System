              document.addEventListener("DOMContentLoaded", function () {
                function createSecurityParticles() {
                  const particlesContainer = document.getElementById("particles");
                  if (!particlesContainer) return;

                  const particleTypes = ["lock", "key", "shield"];
                  const particleCount = 25;

                  for (let i = 0; i < particleCount; i++) {
                    const particle = document.createElement("div");
                    particle.className = `particle ${
                      particleTypes[Math.floor(Math.random() * particleTypes.length)]
                    }`;

                    particle.style.left = Math.random() * 100 + "%";
                    particle.style.top = Math.random() * 100 + "%";
                    particle.style.animationDelay = Math.random() * 10 + "s";
                    particle.style.animationDuration = 8 + Math.random() * 4 + "s";

                    particlesContainer.appendChild(particle);
                  }
                }

                function createScannerLines() {
                  const scanner = document.querySelector(".security-scanner");
                  if (!scanner) return;

                  for (let i = 0; i < 3; i++) {
                    const horizontalLine = document.createElement("div");
                    horizontalLine.className = "scanner-line";
                    horizontalLine.style.animationDelay = i * 2 + "s";
                    horizontalLine.style.animationDuration = 6 + i + "s";
                    scanner.appendChild(horizontalLine);

                    const verticalLine = document.createElement("div");
                    verticalLine.className = "scanner-line vertical";
                    verticalLine.style.animationDelay = i * 2.5 + "s";
                    verticalLine.style.animationDuration = 8 + i + "s";
                    scanner.appendChild(verticalLine);
                  }
                }

                function animateAdminStatus() {
                  const statusTexts = [
                    "Validating Credentials...",
                    "Security Check in Progress...",
                    "Contacting Administrator...",
                    "Processing Authorization...",
                    "Finalizing Access Permissions...",
                    "Request Pending Approval...",
                  ];

                  const statusElement = document.querySelector(
                    ".admin-status-panel .admin-row:first-child span"
                  );
                  if (!statusElement) return;

                  let currentIndex = 0;

                  setInterval(() => {
                    statusElement.style.opacity = "0";
                    statusElement.style.transform = "translateX(-20px)";

                    setTimeout(() => {
                      statusElement.textContent = statusTexts[currentIndex];
                      statusElement.style.opacity = "1";
                      statusElement.style.transform = "translateX(0)";
                      currentIndex = (currentIndex + 1) % statusTexts.length;
                    }, 300);
                  }, 4000);
                }

                // ===== PROGRESS ANIMATION ENHANCEMENT =====
                function enhanceProgressAnimation() {
                  const progressFill = document.querySelector(".progress-fill");
                  if (!progressFill) return;

                  let progress = 33;
                  const targetProgress = 66;

                  const animateProgress = () => {
                    if (progress < targetProgress) {
                      progress += 0.5;
                      progressFill.style.width = progress + "%";

                      // Add particle effects at progress head
                      createProgressParticle(progress);

                      requestAnimationFrame(animateProgress);
                    } else {
                      // Reset and restart
                      setTimeout(() => {
                        progress = 33;
                        requestAnimationFrame(animateProgress);
                      }, 2000);
                    }
                  };

                  animateProgress();
                }

                function createProgressParticle(progress) {
                  const progressContainer =
                    document.querySelector(".approval-progress");
                  if (!progressContainer || Math.random() > 0.1) return;

                  const particle = document.createElement("div");
                  particle.style.position = "absolute";
                  particle.style.left = progress + "%";
                  particle.style.top = "50%";
                  particle.style.width = "4px";
                  particle.style.height = "4px";
                  particle.style.background = "#ffc107";
                  particle.style.borderRadius = "50%";
                  particle.style.boxShadow = "0 0 10px #ffc107";
                  particle.style.transform = "translate(-50%, -50%)";
                  particle.style.pointerEvents = "none";
                  particle.style.zIndex = "10";

                  progressContainer.appendChild(particle);

                  // Animate particle
                  particle.animate(
                    [
                      { transform: "translate(-50%, -50%) scale(1)", opacity: 1 },
                      { transform: "translate(-50%, -80px) scale(0)", opacity: 0 },
                    ],
                    {
                      duration: 800,
                      easing: "ease-out",
                    }
                  ).onfinish = () => particle.remove();
                }

                // ===== WAREHOUSE SVG ANIMATIONS =====
                function enhanceWarehouseSVG() {
                  const svg = document.querySelector(".warehouse-svg");
                  if (!svg) return;

                  // Add loading trucks animation
                  const truck = document.createElementNS(
                    "http://www.w3.org/2000/svg",
                    "g"
                  );
                  truck.innerHTML = `
                    <rect x="0" y="10" width="25" height="10" fill="none" stroke="#007bff" stroke-width="2"/>
                    <rect x="25" y="5" width="15" height="15" fill="none" stroke="#007bff" stroke-width="2"/>
                    <circle cx="8" cy="25" r="4" fill="none" stroke="#28a745" stroke-width="2"/>
                    <circle cx="32" cy="25" r="4" fill="none" stroke="#28a745" stroke-width="2"/>
                `;

                  const animateTruck = document.createElementNS(
                    "http://www.w3.org/2000/svg",
                    "animateTransform"
                  );
                  animateTruck.setAttribute("attributeName", "transform");
                  animateTruck.setAttribute("type", "translate");
                  animateTruck.setAttribute("values", "-50,155; 350,155; -50,155");
                  animateTruck.setAttribute("dur", "12s");
                  animateTruck.setAttribute("repeatCount", "indefinite");

                  truck.appendChild(animateTruck);
                  svg.appendChild(truck);

                  // Add inventory boxes
                  for (let i = 0; i < 8; i++) {
                    const box = document.createElementNS(
                      "http://www.w3.org/2000/svg",
                      "rect"
                    );
                    box.setAttribute("x", 60 + i * 30);
                    box.setAttribute("y", 160);
                    box.setAttribute("width", "20");
                    box.setAttribute("height", "15");
                    box.setAttribute("fill", "none");
                    box.setAttribute("stroke", "#ffc107");
                    box.setAttribute("stroke-width", "1");

                    const fadeAnim = document.createElementNS(
                      "http://www.w3.org/2000/svg",
                      "animate"
                    );
                    fadeAnim.setAttribute("attributeName", "stroke-opacity");
                    fadeAnim.setAttribute("values", "0.3;1;0.3");
                    fadeAnim.setAttribute("dur", "2s");
                    fadeAnim.setAttribute("begin", i * 0.3 + "s");
                    fadeAnim.setAttribute("repeatCount", "indefinite");

                    box.appendChild(fadeAnim);
                    svg.appendChild(box);
                  }
                }

                // ===== INTERACTIVE BUTTONS WITH FEEDBACK =====
                function enhanceButtons() {
                  const buttons = document.querySelectorAll(".btn-action");

                  buttons.forEach((button) => {
                    button.addEventListener("click", function (e) {
                      e.preventDefault();

                      // Create ripple effect
                      const ripple = document.createElement("div");
                      ripple.style.position = "absolute";
                      ripple.style.borderRadius = "50%";
                      ripple.style.background = "rgba(255, 255, 255, 0.6)";
                      ripple.style.transform = "scale(0)";
                      ripple.style.animation = "ripple 0.6s linear";
                      ripple.style.left =
                        e.clientX - this.getBoundingClientRect().left - 10 + "px";
                      ripple.style.top =
                        e.clientY - this.getBoundingClientRect().top - 10 + "px";
                      ripple.style.width = "20px";
                      ripple.style.height = "20px";
                      ripple.style.pointerEvents = "none";

                      this.style.position = "relative";
                      this.appendChild(ripple);

                      setTimeout(() => ripple.remove(), 600);
                    });

                    // Hover effect enhancement
                    button.addEventListener("mouseenter", function () {
                      this.style.transform = "translateY(-3px) scale(1.05)";
                      this.style.boxShadow = "0 15px 40px rgba(0, 123, 255, 0.4)";
                    });

                    button.addEventListener("mouseleave", function () {
                      this.style.transform = "translateY(0) scale(1)";
                      this.style.boxShadow = "none";
                    });
                  });
                }

                // ===== BUTTON ACTION HANDLERS =====
                function refreshAction(button) {
                  const originalText = button.innerHTML;
                  const icon = button.querySelector("i");

                  button.style.pointerEvents = "none";
                  icon.style.animation = "spin 1s linear infinite";
                  button.innerHTML =
                    '<i class="fas fa-spinner fa-spin me-2"></i>Refreshing...';

                  setTimeout(() => {
                    button.innerHTML = '<i class="fas fa-check me-2"></i>Updated!';
                    button.style.background =
                      "linear-gradient(45deg, #28a745, #20c997)";

                    setTimeout(() => {
                      button.innerHTML = originalText;
                      button.style.background = "";
                      button.style.pointerEvents = "auto";
                      icon.style.animation = "";

                      // Simulate status update
                      updateAdminPanel();
                    }, 1500);
                  }, 2000);
                }

                function contactAction(button) {
                  const originalText = button.innerHTML;

                  button.innerHTML =
                    '<i class="fas fa-phone fa-shake me-2"></i>Connecting...';
                  button.style.pointerEvents = "none";

                  setTimeout(() => {
                    button.innerHTML =
                      '<i class="fas fa-comments me-2"></i>Admin Notified!';
                    button.style.background =
                      "linear-gradient(45deg, #17a2b8, #138496)";

                    setTimeout(() => {
                      button.innerHTML = originalText;
                      button.style.background = "";
                      button.style.pointerEvents = "auto";
                    }, 2000);
                  }, 1500);
                }

                function cancelAction(button) {
                  const originalText = button.innerHTML;

                  if (confirm("Are you sure you want to cancel this access request?")) {
                    button.innerHTML =
                      '<i class="fas fa-times fa-beat me-2"></i>Cancelling...';
                    button.style.pointerEvents = "none";

                    setTimeout(() => {
                      button.innerHTML =
                        '<i class="fas fa-ban me-2"></i>Request Cancelled';
                      button.style.background =
                        "linear-gradient(45deg, #dc3545, #c82333)";

                      setTimeout(() => {
                        // Simulate navigation back
                        console.log("Navigating back...");
                      }, 1000);
                    }, 1500);
                  }
                }

                // ===== ADMIN PANEL UPDATES =====
                function updateAdminPanel() {
                  const adminRows = document.querySelectorAll(".admin-row");

                  adminRows.forEach((row, index) => {
                    const dot = row.querySelector(".admin-dot");
                    const text = row.querySelector("span");

                    setTimeout(() => {
                      dot.style.transform = "scale(1.3)";
                      text.style.color = "#4dabf7";

                      setTimeout(() => {
                        dot.style.transform = "scale(1)";
                        text.style.color = "";
                      }, 300);
                    }, index * 200);
                  });
                }

                // ===== RESPONSIVE ADJUSTMENTS =====
                function handleResponsiveAnimations() {
                  const isMobile = window.innerWidth <= 768;

                  if (isMobile) {
                    // Reduce particle count on mobile
                    const particles = document.querySelectorAll(".particle");
                    particles.forEach((particle, index) => {
                      if (index > 10) particle.remove();
                    });

                    // Simplify scanner animations
                    const scannerLines = document.querySelectorAll(".scanner-line");
                    scannerLines.forEach((line, index) => {
                      if (index > 1) line.remove();
                    });
                  }

                  window.addEventListener("resize", () => {
                    const newIsMobile = window.innerWidth <= 768;
                    if (newIsMobile !== isMobile) {
                      location.reload(); // Refresh to reapply mobile optimizations
                    }
                  });
                }

                // ===== ADD CUSTOM CSS ANIMATIONS =====
                function addCustomStyles() {
                  const style = document.createElement("style");
                  style.textContent = `
        @keyframes ripple {
                        to { transform: scale(4); opacity: 0; }
                    }

        @keyframes spin {
                        to { transform: rotate(360deg); }
                    }

                    .fa-shake {
                        animation: shake 0.5s ease-in-out infinite;
                    }

        @keyframes shake {
                        0%, 100% { transform: translateX(0); }
                        25% { transform: translateX(-5px); }
                        75% { transform: translateX(5px); }
                    }

                    .fa-beat {
                        animation: beat 1s ease-in-out infinite;
                    }

        @keyframes beat {
                        0%, 100% { transform: scale(1); }
                        50% { transform: scale(1.1); }
                    }

        @media (max-width: 768px) {
                        .inventory-counter {
                            font-size: 0.8rem !important;
                            padding: 10px !important;
                        }
                    }
                `;
                  document.head.appendChild(style);
                }

                // ===== INITIALIZE ALL FEATURES =====
                function initialize() {
                  console.log("🏭 Initializing Warehouse Admin Approval System...");

                  addCustomStyles();
                  createSecurityParticles();
                  createScannerLines();
                  animateAdminStatus();
                  enhanceProgressAnimation();
                  enhanceWarehouseSVG();
                  enhanceButtons();
                  createTypewriterEffect();
                  createInventoryCounter();
                  handleResponsiveAnimations();

                  console.log("✅ Warehouse Admin Approval System Initialized!");
                }

                // Start initialization
                initialize();

                // Add periodic system updates
                setInterval(() => {
                  updateAdminPanel();
                }, 30000); // Update every 30 seconds
              });

              // ===== UTILITY FUNCTIONS =====
              function showNotification(message, type = "info") {
                const notification = document.createElement("div");
                notification.style.cssText = `
                position: fixed;
                top: 20px;
                right: 20px;
                background: ${
                  type === "success"
                    ? "#28a745"
                    : type === "error"
                    ? "#dc3545"
                    : "#007bff"
                };
                color: white;
                padding: 15px 20px;
                border-radius: 5px;
                z-index: 9999;
                animation: slideInRight 0.3s ease-out;
                box-shadow: 0 4px 12px rgba(0,0,0,0.3);
            `;
                notification.textContent = message;

                document.body.appendChild(notification);

                setTimeout(() => {
                  notification.style.animation = "slideOutRight 0.3s ease-in";
                  setTimeout(() => notification.remove(), 300);
                }, 3000);
              }

              // Add slide animations for notifications
              const notificationStyles = document.createElement("style");
              notificationStyles.textContent = `
        @keyframes slideInRight {
                from { transform: translateX(100%); opacity: 0; }
                to { transform: translateX(0); opacity: 1; }
            }

        @keyframes slideOutRight {
                from { transform: translateX(0); opacity: 1; }
                to { transform: translateX(100%); opacity: 0; }
            }
        `;
              document.head.appendChild(notificationStyles);
