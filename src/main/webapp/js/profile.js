let formChanged = false;

document.addEventListener('DOMContentLoaded', function() {
    const form = document.querySelector('form');
    const inputs = form.querySelectorAll('input, select, textarea');

    inputs.forEach(input => {
        input.addEventListener('input', () => {
            formChanged = true;
        });
    })
});
window.addEventListener('beforeunload', function(event) {
    if (formChanged) {
        event.preventDefault();
        event.returnValue = 'Dữ liệu bạn nhập có thể không được lưu lại. Bạn có chắc chắn muốn rời khỏi trang này?';
    }
});
function formSubmitHandler(){
    formChanged = false;
}
