document.addEventListener('DOMContentLoaded', function () {
    const carouselInner = document.querySelector('.carousel-inner');
    if (carouselInner) {
        const carouselWidth = carouselInner.scrollWidth;
        const cardWidth = document.querySelector('.carousel-item').offsetWidth;

        let scrollPosition = 0;

        document.querySelector('.carousel-control-next').addEventListener('click', function () {
            if (scrollPosition < (carouselWidth - (cardWidth * 4))) {
                scrollPosition += cardWidth;
                document.querySelector('.carousel-inner').scrollBy({left: cardWidth, behavior: 'smooth'});
            }
        });

        document.querySelector('.carousel-control-prev').addEventListener('click', function () {
            if (scrollPosition > 0) {
                scrollPosition -= cardWidth;
                document.querySelector('.carousel-inner').scrollBy({left: -cardWidth, behavior: 'smooth'});
            }
        });
    } else {
        console.error("Element with class 'carousel-inner' not found.");
    }
});
document.addEventListener('DOMContentLoaded', function () {
    const wishlistHeart = document.getElementById('wishlist-heart');
    wishlistHeart.addEventListener('mouseover', function () {
        this.querySelector('i').classList.replace('bi-heart', 'bi-heart-fill');
    });
    wishlistHeart.addEventListener('mouseout', function () {
        this.querySelector('i').classList.replace('bi-heart-fill', 'bi-heart');
    });
});

document.addEventListener('DOMContentLoaded', function () {
    const readAllNotifications = document.getElementById('readAllNotifications');
    if (readAllNotifications) {
        readAllNotifications.addEventListener('click', function () {
            fetch('/notification/readAll', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                }
            }).then(response => {
                if (response.ok) {
                    location.reload();
                } else {
                    console.error('Failed to mark notifications as read');
                }
            }).catch(error => {
                console.error('Error:', error);
            });
        });
    } else {
        console.error("Element with ID 'readAllNotifications' not found.");
    }
});


document.addEventListener('DOMContentLoaded', function () {
    const notificationBox = document.getElementById('notificationBox');
    const notificationMessage = document.getElementById('notiBoxMessage');
    const progressBar = document.getElementById('notiBoxProgressBar');
    const closeBtn = document.getElementById('closeNotiBox');

    if (notificationMessage.textContent.trim() !== '') {
        notificationBox.style.display = 'block';
        progressBar.style.animation = 'progress 5s linear forwards';
        setTimeout(function () {
            notificationBox.style.display = 'none';
        }, 6000);
    }

    closeBtn.addEventListener('click', function () {
        notificationBox.style.display = 'none';
    });
});

// document.addEventListener('DOMContentLoaded', function () {
//     document.querySelectorAll('.wishlist-link').forEach(function (link) {
//         link.addEventListener('click', function (event) {
//             event.preventDefault();
//             const url = this.getAttribute('href');
//             console.log(url);
//             fetch(url, {
//                 method: 'GET',
//                 headers: {
//                     'Content-Type': 'application/json'
//                 }
//             }).then(response => {
//                 if (response.ok) {
//                     location.reload(); // Reload the current page
//                 } else {
//                     console.error('Failed to update wishlist');
//                 }
//             }).catch(error => {
//                 console.error('Error:', error);
//             });
//         });
//     });
// });