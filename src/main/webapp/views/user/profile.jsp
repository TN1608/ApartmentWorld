<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
    <link rel="stylesheet" href="/css/settings.css">
    <link rel="stylesheet" href="/css/header.css">
    <link rel="stylesheet" href="/css/footer.css">
    <base href="${pageContext.request.contextPath}/">
    <script src="/js/app.js"></script>
    <title>ApartmentWorld</title>
</head>
<body>
<jsp:include page="../header.jsp"/>
<!-- Main content here -->
<div class="container p-5">
    <h4 class="mb-2 fw-bold">Thông tin cá nhân</h4>
    <div class="row">
        <jsp:include page="_aside.jsp"/>
        <div class="col-8">
            <div class="card">
                <div class="card-body">
                    <div class="tab-content" id="v-pills-tabContent">
                        <div class="tab-pane fade show active" id="v-pills-profile" role="tabpanel"
                             aria-labelledby="v-pills-profile-tab" tabindex="0">
                            <div class="container mt-4">
                                <h3 class="mb-4">Thông tin cá nhân</h3>
                                <form:form modelAttribute="taikhoan"
                                           action="${pageContext.request.contextPath}/user/settings/update"
                                           method="post" class="row g-3" enctype="multipart/form-data">
                                    <!-- Username -->
                                    <!-- avatar -->
                                    <div class="col-md-7">
                                        <label for="avatar" class="form-label">Ảnh đại diện</label>
                                        <div class="row d-flex justify-content-center align-items-center">
                                            <div class="col-md-3">
                                                <c:if test="${empty user.anhtaikhoan}">
                                                    <img src="../../images/avatar/default.png" class="rounded-circle"
                                                         alt="Avatar"
                                                         style="width: 100px; height: 100px; border: 5px solid white;">
                                                </c:if>
                                                <c:if test="${not empty user.anhtaikhoan}">
                                                    <img src="../../images/avatar/${user.anhtaikhoan}"
                                                         class="rounded-circle"
                                                         alt="Avatar"
                                                         style="width: 100px; height: 100px; border: 5px solid white;">
                                                </c:if>
                                            </div>
                                            <div class="col-md-9">
                                                <label for="avatar" class="btn btn-outline-secondary ms-3">Chọn
                                                    ảnh</label>
                                                <input type="file" class="form-control d-none" id="avatar" name="avatar"
                                                       accept="image/*"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="username" class="form-label">Tên tài khoản</label>
                                        <form:input type="text" class="form-control" id="username" path="tentaikhoan"
                                                    value="${user.tentaikhoan}"/>
                                    </div>
                                    <%--        firstname--%>
                                    <div class="col-md-6">
                                        <label for="firstname" class="form-label">Họ</label>
                                        <form:input type="text" class="form-control" id="firstname" path="firstname"
                                                    value="${user.firstname}"/>
                                    </div>
                                    <!-- Last Name -->
                                    <div class="col-md-6">
                                        <label for="lastname" class="form-label">Tên</label>
                                        <form:input type="text" class="form-control" id="lastname" path="lastname"
                                                    value="${user.lastname}"/>
                                    </div>
                                    <%--        ngaysinh--%>
                                    <div class="col-md-6">
                                        <label for="ngaysinh" class="form-label">Ngày sinh</label>
                                        <form:input type="date" class="form-control" id="ngaysinh" path="ngaysinh"
                                                    value="${user.ngaysinh}"/>
                                    </div>


                                    <!-- Email -->
                                    <div class="col-md-6">
                                        <label for="email" class="form-label">Email</label>
                                        <form:input type="email" class="form-control" id="email" path="email"
                                                    value="${user.email}"/>
                                    </div>

                                    <!-- Phone Number -->
                                    <div class="col-md-6">
                                        <label for="phone" class="form-label">Số điện thoại</label>
                                        <form:input type="text" class="form-control" id="phone" path="sodienthoai"
                                                    value="${user.sodienthoai}"/>
                                    </div>

                                    <!-- Dia chi -->
                                    <div class="col-md-4">
                                        <label for="ngaysinh" class="form-label">Tỉnh Thành</label>
                                        <form:input type="text" class="form-control" id="ngaysinh" path="tinhThanh"
                                                    value="${user.tinhThanh}"/>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="ngaysinh" class="form-label">Quận Huyện</label>
                                        <form:input type="text" class="form-control" id="ngaysinh" path="quanHuyen"
                                                    value="${user.quanHuyen}"/>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="ngaysinh" class="form-label">Phường Xã</label>
                                        <form:input type="text" class="form-control" id="ngaysinh" path="phuongXa"
                                                    value="${user.phuongXa}"/>
                                    </div>
                                    <!-- Dia chi cu the -->
                                    <div class="col-md-12">
                                        <label for="ngaysinh" class="form-label">Địa chỉ</label>
                                        <form:input type="text" class="form-control" id="ngaysinh" path="diaChi"
                                                    value="${user.diaChi}"/>
                                    </div>
                                    <c:if test="${not empty message}">
                                        <p class="text-success" role="alert">
                                                ${message}
                                        </p>
                                    </c:if>
                                    <c:if test="${not empty error}">
                                        <p class="text-danger" role="alert">
                                                ${error}
                                        </p>
                                    </c:if>

                                    <!-- Submit Button -->
                                    <div class="col-12">
                                        <button type="submit" class="btn btn-primary">Cập nhật thông tin</button>
                                    </div>
                                </form:form>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="v-pills-linking" role="tabpanel"
                             aria-labelledby="v-pills-linking-tab" tabindex="0">

                        </div>
                        <div class="tab-pane fade" id="v-pills-payment-history" role="tabpanel"
                             aria-labelledby="v-pills-payment-history-tab" tabindex="0">

                        </div>
                        <div class="tab-pane fade" id="v-pills-account-settings" role="tabpanel"
                             aria-labelledby="v-pills-account-settings-tab" tabindex="0">

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Main content here -->

</body>
<jsp:include page="../footer.jsp"/>
</html>