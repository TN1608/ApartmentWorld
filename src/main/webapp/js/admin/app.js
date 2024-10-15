const charts = document.querySelectorAll(".chart");

charts.forEach(function (chart) {
    var ctx = chart.getContext("2d");
    var myChart = new Chart(ctx, {
        type: "bar",
        data: {
            labels: ["Red", "Blue", "Yellow", "Green", "Purple", "Orange"],
            datasets: [
                {
                    label: "# of Votes",
                    data: [12, 19, 3, 5, 2, 3],
                    backgroundColor: [
                        "rgba(255, 99, 132, 0.2)",
                        "rgba(54, 162, 235, 0.2)",
                        "rgba(255, 206, 86, 0.2)",
                        "rgba(75, 192, 192, 0.2)",
                        "rgba(153, 102, 255, 0.2)",
                        "rgba(255, 159, 64, 0.2)",
                    ],
                    borderColor: [
                        "rgba(255, 99, 132, 1)",
                        "rgba(54, 162, 235, 1)",
                        "rgba(255, 206, 86, 1)",
                        "rgba(75, 192, 192, 1)",
                        "rgba(153, 102, 255, 1)",
                        "rgba(255, 159, 64, 1)",
                    ],
                    borderWidth: 1,
                },
            ],
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true,
                },
            },
        },
    });
});

$(document).ready(function () {
    $(".data-table").each(function (_, table) {
        $(table).DataTable();
    });
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

function toggleField(fieldId, buttonId) {
    var field = document.getElementById(fieldId);
    var button = document.getElementById(buttonId);
    if (field.style.display === "none") {
        field.style.display = "block";
        button.style.display = "none";
    } else {
        field.style.display = "none";
        button.style.display = "block";
    }
}

document.addEventListener("DOMContentLoaded", function () {
    var currentUrl = window.location.pathname;
    var addUser = document.getElementById("addUser");
    var editUser = document.getElementById("editUser");

    if (currentUrl.includes("/add")) {
        addUser.style.display = "block";
        editUser.style.display = "none";
    } else if (currentUrl.includes("/edit")) {
        addUser.style.display = "none";
        editUser.style.display = "block";
    }
});


let provincesData = [];

let selectedProvince = '';
let selectedDistrict = '';
let selectedWard = '';

function preventDropdown(event) {
    event.preventDefault(); // Chặn sự kiện mousedown để ngăn hiển thị dropdown
}

function showPopup() {
    var modal = new bootstrap.Modal(document.getElementById('addressModal'), {
        keyboard: false
    });

    // Fetch provinces and their districts from API
    fetch('https://provinces.open-api.vn/api/?depth=3')
        .then(response => response.json())
        .then(data => {
            provincesData = data;
            var provinceSelect = document.getElementById('province');
            provinceSelect.innerHTML = '<option value="">Chọn tỉnh/thành</option>';
            data.forEach(province => {
                provinceSelect.innerHTML += `<option value="${province.code}">${province.name}</option>`;
            });

            if (selectedProvince) {
                provinceSelect.value = selectedProvince;
                loadDistricts();
            } else {
                document.getElementById('district').classList.add('not-allowed');
                document.getElementById('ward').classList.add('not-allowed');
                document.getElementById('district').disabled = true;
                document.getElementById('ward').disabled = true;
            }
            if (selectedDistrict) {
                document.getElementById('district').value = selectedDistrict;
                loadWards();
            } else {
                document.getElementById('ward').classList.add('not-allowed');
                document.getElementById('ward').disabled = true;
            }
            if (selectedWard) {
                document.getElementById('ward').value = selectedWard;
            }
        });

    modal.show();
}

function loadDistricts() {
    var provinceCode = document.getElementById('province').value;
    var districtSelect = document.getElementById('district');
    var wardSelect = document.getElementById('ward');
    districtSelect.innerHTML = '<option value="">Chọn quận/huyện</option>';
    wardSelect.innerHTML = '<option value="">Chọn phường/xã</option>'; // Clear wards


    if (provinceCode) {
        var selectedProvince = provincesData.find(province => province.code == provinceCode);
        if (selectedProvince && selectedProvince.districts) {
            selectedProvince.districts.forEach(district => {
                districtSelect.innerHTML += `<option value="${district.code}">${district.name}</option>`;
            });
            districtSelect.disabled = false;
            districtSelect.classList.remove('not-allowed');
        }
        wardSelect.disabled = true;
        wardSelect.classList.add('not-allowed');
    } else {
        districtSelect.classList.add('not-allowed');
        wardSelect.classList.add('not-allowed');
        districtSelect.disabled = true;
        wardSelect.disabled = true;
    }
}

function loadWards() {
    var provinceCode = document.getElementById('province').value;
    var districtCode = document.getElementById('district').value;
    var wardSelect = document.getElementById('ward');
    wardSelect.innerHTML = '<option value="">Chọn phường/xã</option>';

    if (provinceCode && districtCode) {
        var selectedProvince = provincesData.find(province => province.code == provinceCode);
        if (selectedProvince && selectedProvince.districts) {
            var selectedDistrict = selectedProvince.districts.find(district => district.code == districtCode);
            if (selectedDistrict && selectedDistrict.wards) {
                selectedDistrict.wards.forEach(ward => {
                    wardSelect.innerHTML += `<option value="${ward.code}">${ward.name}</option>`;
                });
                wardSelect.disabled = false;
                wardSelect.classList.remove('not-allowed');
            }
        }
    } else {
        wardSelect.classList.add('not-allowed');
        wardSelect.disabled = true;
    }
}

function saveAddress() {
    var province = document.getElementById('province').selectedOptions[0].text;
    var district = document.getElementById('district').selectedOptions[0].text;
    var ward = document.getElementById('ward').selectedOptions[0].text;
    var addressDetail = document.getElementById('diachicuthe').value;

    selectedProvince = document.getElementById('province').value;
    selectedDistrict = document.getElementById('district').value;
    selectedWard = document.getElementById('ward').value;

    var address = `${addressDetail},  ${ward}, ${district}, ${province}`;
    document.getElementById('diachi').innerHTML = `<option value="${address}" selected>${address}</option>`;
    var modal = bootstrap.Modal.getInstance(document.getElementById('addressModal'));
    modal.hide();
}


document.addEventListener('DOMContentLoaded', function () {
    let selectedFiles = []

    document.getElementById('fileUpload').addEventListener('change', function (event) {
        const previewContainer = document.getElementById('filePreview');
        const files = event.target.files;

        Array.from(files).forEach((file) => {
            if (file && file.type.startsWith('image/')) {
                selectedFiles.push(file);
                const reader = new FileReader();

                reader.onload = function (e) {
                    const previewImage = document.createElement('div');
                    previewImage.classList.add('preview-image');

                    previewImage.innerHTML = `
                        <button class="set-cover-image btn btn-outline-danger btn-sm">Chọn ảnh bìa</button>
                        <img src="${e.target.result}" alt="Image">
                        <button class="remove-image"><i class="fa-solid fa-xmark"></i></button>
                    `;

                    previewContainer.appendChild(previewImage);

                    // Handle remove image event
                    previewImage.querySelector('.remove-image').addEventListener('click', function (event) {
                        event.preventDefault();
                        const index = Array.from(previewContainer.children).indexOf(previewImage);
                        removeImage(index);
                    });

                    previewImage.querySelector('.set-cover-image').addEventListener('click', function (event) {
                        event.preventDefault();
                        const index = Array.from(previewContainer.children).indexOf(previewImage);
                        setCoverImage(index);
                    });
                };

                reader.readAsDataURL(file);
            }
        });
    });

    function removeImage(index) {
        selectedFiles.splice(index, 1);
        const previewContainer = document.getElementById('filePreview');
        const images = Array.from(previewContainer.getElementsByClassName('preview-image'));

        if (images[index]) {
            images[index].remove();  // Remove selected image
        }

        // Update indices of remaining images
        Array.from(previewContainer.children).forEach((child, idx) => {
            child.querySelector('.remove-image').setAttribute('data-index', idx);
        });
    }


    function setCoverImage(index) {
        if (index > 0) {
            const [file] = selectedFiles.splice(index, 1);
            selectedFiles.unshift(file);

            const previewContainer = document.getElementById('filePreview');
            const images = Array.from(previewContainer.getElementsByClassName('preview-image'));

            if (images[index]) {
                const coverImage = images[index];
                previewContainer.removeChild(coverImage);
                previewContainer.insertBefore(coverImage, previewContainer.firstChild);
            }

            // Update indices of remaining images
            Array.from(previewContainer.children).forEach((child, idx) => {
                child.querySelector('.remove-image').setAttribute('data-index', idx);
            });
        }
    }

    document.querySelector('form').addEventListener('submit', function (event) {
        event.preventDefault(); // Prevent default form submission

        const formData = new FormData(this);
        // formData.delete('mailFile');
        selectedFiles.forEach((file, index) => {
            formData.append('mailFile', file);
        });
    });
});