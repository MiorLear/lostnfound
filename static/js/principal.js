document.addEventListener('DOMContentLoaded', function() {
    // =============================================
    // Redirección al hacer clic en "Ver más"
    // =============================================
    const viewMoreBtn = document.querySelector('.view-more-btn');
    
    if(viewMoreBtn) {
        viewMoreBtn.addEventListener('click', function() {
            // Redirigir a la página de login
            window.location.href = '/login';
            
            // Alternativa para desarrollo local si no funciona:
            // window.location.href = 'http://localhost:5000/login';
        });
    }

    // =============================================
    // Redirección al hacer clic en "VIEW MORE" (historia)
    // =============================================
    const historyBtn = document.querySelector('.history-btn');
    
    if(historyBtn) {
        historyBtn.addEventListener('click', function() {
            // Puedes cambiar esto por otra ruta si lo necesitas
            window.location.href = '/about'; // Ejemplo para página "about"
        });
    }

    // =============================================
    // Efecto de aparición suave al cargar la página
    // =============================================
    const heroContent = document.querySelector('.hero-section .container');
    if(heroContent) {
        heroContent.style.opacity = '0';
        setTimeout(() => {
            heroContent.style.transition = 'opacity 1s ease';
            heroContent.style.opacity = '1';
        }, 300);
    }

    // =============================================
    // Efecto de aparición para la sección de historia al hacer scroll
    // =============================================
    const historyContent = document.querySelector('.history-content');
    if(historyContent) {
        // Configuración inicial para la animación
        historyContent.style.opacity = '0';
        historyContent.style.transform = 'translateY(50px)';
        historyContent.style.transition = 'all 0.8s ease';

        // Controlador del evento scroll
        window.addEventListener('scroll', function() {
            const scrollPosition = window.scrollY;
            const historySection = document.querySelector('.history-section');
            
            if (historySection) {
                const historyOffset = historySection.offsetTop;
                const windowHeight = window.innerHeight;
                
                if (scrollPosition > historyOffset - windowHeight + 200) {
                    historyContent.style.opacity = '1';
                    historyContent.style.transform = 'translateY(0)';
                }
            }
        });
    }

    // =============================================
    // Efecto parallax mejorado
    // =============================================
    const parallaxBg = document.querySelector('.parallax-bg');
    if(parallaxBg) {
        window.addEventListener('scroll', function() {
            const scrollPosition = window.scrollY;
            parallaxBg.style.transform = `translateY(${scrollPosition * 0.5}px)`;
        });
    }

    // =============================================
    // Smooth scrolling para todos los enlaces
    // =============================================
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function(e) {
            e.preventDefault();
            document.querySelector(this.getAttribute('href')).scrollIntoView({
                behavior: 'smooth'
            });
        });
    });
});