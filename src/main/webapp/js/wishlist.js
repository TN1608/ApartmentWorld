document.addEventListener('DOMContentLoaded', function () {
    document.querySelectorAll('.wishlist-btn').forEach(button => {
        button.addEventListener('mouseover', function() {
            const icon = this.querySelector('i');
            icon.classList.remove('bi-suit-heart-fill');
            icon.classList.add('bi-suit-heart');
        });

        button.addEventListener('mouseout', function() {
            const icon = this.querySelector('i');
            icon.classList.remove('bi-suit-heart');
            icon.classList.add('bi-suit-heart-fill');
        });
    });
});