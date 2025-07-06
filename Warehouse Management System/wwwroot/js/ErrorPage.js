        function createParticles() {
          const particlesContainer = document.getElementById("particles");
          const numberOfParticles = 80;
          const particleTypes = ["small", "medium", "large"];

          for (let i = 0; i < numberOfParticles; i++) {
            const particle = document.createElement("div");
            const type =
              particleTypes[Math.floor(Math.random() * particleTypes.length)];

            particle.className = `particle ${type}`;
            particle.style.left = Math.random() * 100 + "%";
            particle.style.top = Math.random() * 100 + "%";
            particle.style.animationDelay = Math.random() * 8 + "s";
            particle.style.animationDuration = Math.random() * 4 + 6 + "s";

            particlesContainer.appendChild(particle);
          }
        }

        function setupButtonEffects() {
          const button = document.querySelector(".btn-return");

          button.addEventListener("click", function (e) {
            e.preventDefault();

            const ripple = document.createElement("span");
            const rect = this.getBoundingClientRect();
            const size = Math.max(rect.width, rect.height);
            const x = e.clientX - rect.left - size / 2;
            const y = e.clientY - rect.top - size / 2;

            ripple.style.cssText = `
                      position: absolute;
                      border-radius: 50%;
                      background: rgba(255, 255, 255, 0.4);
                      transform: scale(0);
                      animation: ripple 0.8s ease-out;
                      width: ${size}px;
                      height: ${size}px;
                      left: ${x}px;
                      top: ${y}px;
                      pointer-events: none;
                  `;

            this.appendChild(ripple);

            setTimeout(() => {
              window.history.back();
            }, 300);

            setTimeout(() => {
              ripple.remove();
            }, 800);
          });
        }

        function startCountdown() {
          let timeLeft = 720; // 12 minutes in seconds
          const countdownElement = document.querySelector(".info-value");

          const timer = setInterval(() => {
            const minutes = Math.floor(timeLeft / 60);
            const seconds = timeLeft % 60;

            if (countdownElement) {
              countdownElement.textContent = `${minutes}:${seconds
                .toString()
                .padStart(2, "0")} remaining`;
            }

            timeLeft--;

            if (timeLeft < 0) {
              clearInterval(timer);
              setTimeout(() => {
                window.location.reload();
              }, 2000);
            }
          }, 1000);
        }

        function simulateSystemStatus() {
          const statusMessages = [
            "Updating database schemas...",
            "Optimizing warehouse algorithms...",
          ];
        }

        createParticles();
        setupButtonEffects();
        startCountdown();
        simulateSystemStatus();
