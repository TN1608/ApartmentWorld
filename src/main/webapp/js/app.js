document.addEventListener('DOMContentLoaded', function () {
    const carouselInner = document.querySelector('.carousel-inner');
    if (carouselInner) {
        const carouselWidth = carouselInner.scrollWidth;
        const cardWidth = document.querySelector('.carousel-item').offsetWidth;

        let scrollPosition = 0;

        document.querySelector('.carousel-control-next').addEventListener('click', function () {
            if (scrollPosition < (carouselWidth - (cardWidth * 4))) {
                scrollPosition += cardWidth;
                document.querySelector('.carousel-inner').scrollBy({ left: cardWidth, behavior: 'smooth' });
            }
        });

        document.querySelector('.carousel-control-prev').addEventListener('click', function () {
            if (scrollPosition > 0) {
                scrollPosition -= cardWidth;
                document.querySelector('.carousel-inner').scrollBy({ left: -cardWidth, behavior: 'smooth' });
            }
        });
    } else {
        console.error("Element with class 'carousel-inner' not found.");
    }
});