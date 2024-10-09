function showPopup() {
    var modal = new bootstrap.Modal(document.getElementById('addressModal'), {
        keyboard: false
    });

    // Fetch provinces from API
    fetch('/api/provinces')
        .then(response => response.json())
        .then(data => {
            var provinceSelect = document.getElementById('province');
            provinceSelect.innerHTML = '<option value="">Chọn tỉnh/thành</option>';
            data.forEach(province => {
                provinceSelect.innerHTML += `<option value="${province.code}">${province.name}</option>`;
            });
        });

    modal.show();
}

function loadDistricts() {
    var provinceCode = document.getElementById('province').value;
    var districtSelect = document.getElementById('district');
    districtSelect.innerHTML = '<option value="">Chọn quận/huyện</option>';

    if (provinceCode) {
        // Fetch districts for selected province
        fetch(`/api/districts?provinceCode=${provinceCode}`)
            .then(response => response.json())
            .then(data => {
                data.forEach(district => {
                    districtSelect.innerHTML += `<option value="${district.code}">${district.name}</option>`;
                });
            });
    }
}

function loadWards() {
    var districtCode = document.getElementById('district').value;
    var wardSelect = document.getElementById('ward');
    wardSelect.innerHTML = '<option value="">Chọn phường/xã</option>';

    if (districtCode) {
        // Fetch wards for selected district
        fetch(`/api/wards?districtCode=${districtCode}`)
            .then(response => response.json())
            .then(data => {
                data.forEach(ward => {
                    wardSelect.innerHTML += `<option value="${ward.code}">${ward.name}</option>`;
                });
            });
    }
}

function saveAddress() {
    var province = document.getElementById('province').selectedOptions[0].text;
    var district = document.getElementById('district').selectedOptions[0].text;
    var ward = document.getElementById('ward').selectedOptions[0].text;

    var address = `${province}, ${district}, ${ward}`;
    document.getElementById('diachi').innerHTML = `<option value="${address}" selected>${address}</option>`;
    var modal = bootstrap.Modal.getInstance(document.getElementById('addressModal'));
    modal.hide();
}
