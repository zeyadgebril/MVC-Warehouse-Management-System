    window.addEventListener("scroll", function () {
          const navbar = document.getElementById("navbar");
    const scrollY = window.scrollY;

          if (scrollY > 100) {
        navbar.classList.add("scrolled");
          } else {
        navbar.classList.remove("scrolled");
          }
        });

        document.querySelectorAll('a[href^="#"]').forEach((anchor) => {
        anchor.addEventListener("click", function (e) {
            e.preventDefault();
            const target = document.querySelector(this.getAttribute("href"));
            if (target) {
                const offsetTop = target.offsetTop - 100;
                window.scrollTo({
                    top: offsetTop,
                    behavior: "smooth",
                });
            }
        });
        });

    const observerOptions = {
        threshold: 0.1,
    rootMargin: "0px 0px -50px 0px",
        };

    const observer = new IntersectionObserver(function (entries) {
        entries.forEach((entry, index) => {
            if (entry.isIntersecting) {
                setTimeout(() => {
                    entry.target.classList.add("visible");
                }, index * 100);
            }
        });
        }, observerOptions);

    // Observe all animated elements
    document
    .querySelectorAll(".fade-in, .slide-in-left, .slide-in-right")
          .forEach((el) => {
        observer.observe(el);
          });

    // Animated counter for stats
    function animateCounter(element, target, duration = 2000) {
          const start = 0;
    const increment = target / (duration / 16);
    let current = start;

          const timer = setInterval(() => {
        current += increment;
            if (current >= target) {
        current = target;
    clearInterval(timer);
            }

            if (target >= 100) {
        element.textContent = Math.floor(current).toLocaleString() + "+";
            } else if (target < 100 && target % 1 !== 0) {
        element.textContent = current.toFixed(1) + "%";
            } else {
        element.textContent =
        Math.floor(current) +
        (target === 24 ? "/7" : target >= 100 ? "%" : "");
            }
          }, 16);
        }

        // Trigger counter animations when stats section is visible
        const statsObserver = new IntersectionObserver((entries) => {
        entries.forEach((entry) => {
            if (entry.isIntersecting) {
                const counters = entry.target.querySelectorAll(".stat-number");
                counters.forEach((counter) => {
                    const target = parseFloat(counter.dataset.target);
                    animateCounter(counter, target);
                });
                statsObserver.unobserve(entry.target);
            }
        });
        });

    const statsSection = document.querySelector(".stats");
    if (statsSection) {
        statsObserver.observe(statsSection);
        }

    // Enhanced form submission with better UX
    document
    .getElementById("contactForm")
    .addEventListener("submit", function (e) {
        e.preventDefault();

    const submitBtn = this.querySelector(".submit-btn");
    const originalText = submitBtn.textContent;

    // Loading state
    submitBtn.textContent = "Processing...";
    submitBtn.disabled = true;
    submitBtn.style.background =
    "linear-gradient(135deg, #6366F1 0%, #4F46E5 100%)";

    // Add loading animation
    submitBtn.style.position = "relative";
    submitBtn.innerHTML = `
    <span style="opacity: 0.7;">Processing</span>
    <span style="animation: pulse 1s infinite;">...</span>
    `;

            // Simulate API call
            setTimeout(() => {
        submitBtn.innerHTML = "✓ Demo Scheduled!";
    submitBtn.style.background =
    "linear-gradient(135deg, #10B981 0%, #059669 100%)";

    // Show success message
    const successMsg = document.createElement("div");
    successMsg.innerHTML =
    '<p style="color: #10B981; text-align: center; margin-top: 1rem; font-weight: 600;">🎉 Thank you! We\'ll contact you within 24 hours to schedule your personalized demo.</p>';
    this.appendChild(successMsg);

              setTimeout(() => {
        submitBtn.innerHTML = originalText;
    submitBtn.disabled = false;
    submitBtn.style.background =
    "linear-gradient(135deg, var(--primary-blue) 0%, var(--secondary-blue) 100%)";
    this.reset();
    successMsg.remove();
              }, 4000);
            }, 2000);
          });

        // Add parallax effect to hero section
        window.addEventListener("scroll", () => {
          const scrolled = window.pageYOffset;
    const heroContent = document.querySelector(".hero-content");
    const warehouseSvg = document.querySelector(".warehouse-svg");

    if (heroContent && scrolled < window.innerHeight) {
        heroContent.style.transform = `translateY(${scrolled * 0.3}px)`;
    if (warehouseSvg) {
        warehouseSvg.style.transform = `translateY(${scrolled * 0.2
        }px) rotate(${scrolled * 0.02}deg)`;
            }
          }
        });

    // Initialize particles
    // Create animated particles
    function createParticles() {
          const particlesContainer = document.getElementById("particles");
    const particleCount = 150; // Adjust number of particles as needed

    for (let i = 0; i < particleCount; i++) {
            const particle = document.createElement("div");
    particle.className = "particle";

    // Random positioning
    particle.style.left = Math.random() * 100 + "%";

    // Random animation properties
    particle.style.animationDelay = Math.random() * 6 + "s";
    particle.style.animationDuration = Math.random() * 3 + 3 + "s";

    // Random size variation
    const size = Math.random() * 3 + 1;
    particle.style.width = size + "px";
    particle.style.height = size + "px";

    // Random opacity variation
    particle.style.opacity = Math.random() * 0.5 + 0.3;

    particlesContainer.appendChild(particle);
          }
        }

    // Initialize particles when DOM is loaded
    document.addEventListener("DOMContentLoaded", createParticles);

        // Add mouse movement effect for cards
        document.querySelectorAll(".feature-card").forEach((card) => {
        card.addEventListener("mousemove", (e) => {
            const rect = card.getBoundingClientRect();
            const x = e.clientX - rect.left;
            const y = e.clientY - rect.top;

            const centerX = rect.width / 2;
            const centerY = rect.height / 2;

            const rotateX = (y - centerY) / 10;
            const rotateY = (centerX - x) / 10;

            card.style.transform = `perspective(1000px) rotateX(${rotateX}deg) rotateY(${rotateY}deg) translateY(-12px) scale(1.02)`;
        });

          card.addEventListener("mouseleave", () => {
        card.style.transform = "";
          });
        });

        // Add dynamic background color based on scroll
        window.addEventListener("scroll", () => {
          const scrollPercent =
    window.pageYOffset /
    (document.documentElement.scrollHeight - window.innerHeight);
    const hue = 240 + scrollPercent * 60; // Blue to purple transition
    document.documentElement.style.setProperty("--scroll-hue", hue);
        });
