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