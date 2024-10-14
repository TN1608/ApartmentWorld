<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <!--    Bootstrap-->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
            integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
            integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
    <%--    font awesome--%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
          integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="../../css/seller.css">
    <link rel="stylesheet" href="../../css/header.css">
    <link rel="stylesheet" href="../../css/footer.css">

    <script src="../../js/app.js"></script>
    <title>ApartmentWorld</title>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const url = window.location.href;
            const packageSelect = document.getElementById('package');
            const sendLink = document.getElementById('sendLink');

            if (url.includes('/free')) {
                packageSelect.value = 'free';
                sendLink.formAction = `send?package=free`;
            } else if (url.includes('/premium')) {
                packageSelect.value = 'premium';
                sendLink.formAction = `send?package=premium`;
            }

            packageSelect.addEventListener('change', function () {
                const selectedPackage = packageSelect.value;
                const currentUrl = window.location.href;

                if (selectedPackage === 'free' && !currentUrl.includes('/free')) {
                    window.location.href = '/register-seller';
                } else if (selectedPackage === 'premium' && !currentUrl.includes('/premium')) {
                    window.location.href = '/register-seller';
                }
            });

        });
    </script>
</head>
<body>
<jsp:include page="../_header.jsp"/>
<!-- Main content here -->
<div class="container-form p-5">
    <h1 class="text-center mb-4">Thông tin đăng ký</h1>
    <form:form id="sellerForm" modelAttribute="taikhoan" method="post">
        <!-- Tên tài khoản -->
        <div class="mb-3">
            <label for="username" class="form-label">Tên tài khoản</label>
            <form:input path="tentaikhoan" type="text" class="form-control" id="username" value="${user.tentaikhoan}"
                        disabled="true" name="tentaikhoan"/>
        </div>

        <!-- Họ và Tên -->
        <div class="row">
            <div class="col-md-6 mb-3">
                <label for="firstname" class="form-label">Họ</label>
                <form:input path="firstname" type="text" class="form-control" id="firstname" value="${user.firstname}"
                            name="firstname"/>
            </div>
            <div class="col-md-6 mb-3">
                <label for="lastname" class="form-label">Tên</label>
                <form:input path="lastname" type="text" class="form-control" id="lastname" value="${user.lastname}"
                            name="lastname"/>
            </div>
        </div>

        <!-- Email -->
        <div class="mb-3">
            <label for="email" class="form-label">Email</label>
            <form:input path="email" type="email" class="form-control" id="email" value="${user.email}"
                        placeholder="Nhập email"
                        name="email"/>
        </div>

        <!-- Số điện thoại -->
        <div class="mb-3">
            <label for="phone" class="form-label">Số điện thoại</label>
            <form:input path="sodienthoai" type="tel" class="form-control" id="phone" value="${user.sodienthoai}"
                        placeholder="Nhập số điện thoại" name="sodienthoai"/>
        </div>

        <!-- Gói đã chọn -->
        <div class="mb-3">
            <label for="package" class="form-label">Gói đã chọn</label>
            <select class="form-select form-control" id="package" required>
                <option value="free">Gói Free</option>
                <option value="premium">Gói Premium</option>
            </select>
        </div>

        <!-- Nút Gửi -->

        <button id="sendLink" type="submit" class="btn btn-primary w-100">Gửi thông tin
        </button>
    </form:form>
</div>
<jsp:include page="../_footer.jsp"/>
</body>
</html>