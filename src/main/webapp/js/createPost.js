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

let selectedFiles = [];

function handleFileSelect(event) {
    const files = event.target.files;
    const previewContainer = document.getElementById('preview-container');
    previewContainer.innerHTML = ''; // Xóa nội dung cũ
    let firstImage = true;

    Array.from(files).forEach((file, index) => {
        selectedFiles.push(file);
        const reader = new FileReader();
        reader.onload = function (e) {
            // Tạo phần tử chứa hình ảnh
            const imgContainer = document.createElement('div');
            imgContainer.classList.add('position-relative');

            // Tạo thẻ img để hiển thị hình ảnh
            const img = document.createElement('img');
            img.src = e.target.result;
            img.classList.add('img-thumbnail');

            // Tạo nút chọn làm ảnh bìa
            // Create cover button
            const coverButton = document.createElement('button');
            coverButton.classList.add('btn', 'btn-outline-primary');
            coverButton.textContent = selectedFiles.indexOf(file) === 0 ? 'Ảnh bìa' : 'Chọn làm ảnh bìa';
            coverButton.onclick = function (e) {
                e.preventDefault();
                document.querySelectorAll('.img-container .btn').forEach(btn => btn.textContent = 'Chọn làm ảnh bìa');
                coverButton.textContent = 'Ảnh bìa';
                previewContainer.insertBefore(imgContainer, previewContainer.firstChild);
                selectedFiles = [file, ...selectedFiles.filter(f => f !== file)];
            };

            // Tạo nút xóa ảnh
            const deleteButton = document.createElement('div');
            deleteButton.innerHTML = '<button class="delete-btn">X</button>';
            deleteButton.querySelector('button').onclick = function () {
                imgContainer.remove(); // Remove image from preview
                selectedFiles = selectedFiles.filter(f => f !== file); // Remove file from selectedFiles
            }

            imgContainer.appendChild(img);
            imgContainer.appendChild(coverButton);
            imgContainer.appendChild(deleteButton);
            previewContainer.appendChild(imgContainer);

            if (firstImage) {
                coverButton.textContent = 'Ảnh bìa';
                firstImage = false;
            }
        };
        reader.readAsDataURL(file);
    });
}


// JavaScript function to check the URL and toggle button visibility
document.addEventListener("DOMContentLoaded", function () {
    var currentUrl = window.location.pathname;
    var dangTinButton = document.getElementById("dangTinButton");
    var capNhatButton = document.getElementById("capNhatButton");

    if (currentUrl === "/dang-tin") {
        dangTinButton.style.display = "block";
        capNhatButton.style.display = "none";
    } else if (currentUrl === "/dang-tin/sua-doi-thong-tin") {
        dangTinButton.style.display = "none";
        capNhatButton.style.display = "block";
    }


// preview file handler
//     let selectedFiles = [];
//
//     document.getElementById('file-upload').addEventListener('change', function (event) {
//         const previewContainer = document.getElementById('preview-container');
//         const files = event.target.files;
//
//         Array.from(files).forEach((file) => {
//             if (file && file.type.startsWith('image/')) {
//                 selectedFiles.push(file);
//                 const reader = new FileReader();
//
//                 reader.onload = function (e) {
//                     const previewImage = document.createElement('div');
//                     previewImage.classList.add('img-thumbnail');
//
//                     previewImage.innerHTML = `
//                         <button class="set-cover-image btn btn-outline-danger btn-sm">Chọn ảnh bìa</button>
//                         <img src="${e.target.result}" alt="Image">
//                         <button class="remove-image"><i class="fa-solid fa-xmark"></i></button>
//                     `;
//
//                     previewContainer.appendChild(previewImage);
//
//                     // Handle remove image event
//                     previewImage.querySelector('.remove-image').addEventListener('click', function (event) {
//                         event.preventDefault();
//                         const index = Array.from(previewContainer.children).indexOf(previewImage);
//                         removeImage(index);
//                     });
//
//                     previewImage.querySelector('.set-cover-image').addEventListener('click', function (event) {
//                         event.preventDefault();
//                         const index = Array.from(previewContainer.children).indexOf(previewImage);
//                         setCoverImage(index);
//                     });
//                 };
//
//                 reader.readAsDataURL(file);
//             }
//         });
//     });
//
//     function removeImage(index) {
//         selectedFiles.splice(index, 1);
//         const previewContainer = document.getElementById('preview-container');
//         const images = Array.from(previewContainer.getElementsByClassName('img-thumbnail'));
//
//         if (images[index]) {
//             images[index].remove();  // Remove selected image
//         }
//
//         // Update indices of remaining images
//         Array.from(previewContainer.children).forEach((child, idx) => {
//             child.querySelector('.remove-image').setAttribute('data-index', idx);
//         });
//     }
//
//     function setCoverImage(index) {
//         if (index > 0) {
//             const [file] = selectedFiles.splice(index, 1);
//             selectedFiles.unshift(file);
//
//             const previewContainer = document.getElementById('preview-container');
//             const images = Array.from(previewContainer.getElementsByClassName('img-thumbnail'));
//
//             if (images[index]) {
//                 const coverImage = images[index];
//                 previewContainer.removeChild(coverImage);
//                 previewContainer.insertBefore(coverImage, previewContainer.firstChild);
//             }
//
//             Array.from(previewContainer.children).forEach((child, idx) => {
//                 child.querySelector('.remove-image').setAttribute('data-index', idx);
//             });
//         }
//
//
//     }
});