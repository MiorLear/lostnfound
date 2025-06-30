// Configuración del carrusel de imágenes
function initImageCarousel() {
    const carouselElement = document.getElementById('loginCarousel');
    
    if (!carouselElement) return;
    
    // Configuración del carrusel con intervalo de 3 segundos
    const carousel = new bootstrap.Carousel(carouselElement, {
        interval: 3000,  // 3000 ms = 3 segundos
        ride: 'carousel',  // Inicia automáticamente
        wrap: true,  // Vuelve al inicio después del último slide
        pause: false  // No pausar automáticamente al interactuar
    });

    // Control de pausa al interactuar (opcional)
    carouselElement.addEventListener('mouseenter', () => {
        carousel.pause();
    });

    carouselElement.addEventListener('mouseleave', () => {
        carousel.cycle();
    });

    // Para dispositivos táctiles
    carouselElement.addEventListener('touchstart', () => {
        carousel.pause();
    });

    carouselElement.addEventListener('touchend', () => {
        carousel.cycle();
    });
}

// Efectos para el formulario de login
function setupLoginForm() {
    const loginForm = document.querySelector('.login-form form');
    const emailInput = document.getElementById('email');
    const loginBtn = document.querySelector('.btn-login');

    if (loginForm) {
        loginForm.addEventListener('submit', function(e) {
            e.preventDefault();
            // Validación básica
            if (emailInput.value.trim() === '') {
                emailInput.classList.add('is-invalid');
                return;
            }
            
            // Simular envío (remplazar con tu lógica real)
            loginBtn.disabled = true;
            loginBtn.innerHTML = '<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span> Procesando...';
            
            setTimeout(() => {
                // Aquí iría tu lógica de autenticación real
                window.location.href = '/dashboard';  // Redirigir después del login
            }, 1500);
        });

        // Remover estado de error al escribir
        if (emailInput) {
            emailInput.addEventListener('input', function() {
                this.classList.remove('is-invalid');
            });
        }
    }
}

// Inicializar todo cuando el DOM esté listo
document.addEventListener('DOMContentLoaded', function() {
    initImageCarousel();
    setupLoginForm();
    
    // Efecto de aparición suave
    const loginForm = document.querySelector('.login-form');
    if (loginForm) {
        loginForm.style.opacity = '0';
        setTimeout(() => {
            loginForm.style.transition = 'opacity 0.5s ease';
            loginForm.style.opacity = '1';
        }, 300);
    }
});