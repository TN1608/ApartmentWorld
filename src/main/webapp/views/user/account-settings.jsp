<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <aside class="col-sm-4">
            <div class="card">
                <div class="card-body">
                    <a href="/user/settings/profile" class="nav-link text-start" role="tab" aria-controls="v-pills-profile" aria-selected="false">Thông tin cá nhân</a>
                    <a href="/user/settings/linking" class="nav-link text-start" role="tab" aria-controls="v-pills-linking" aria-selected="false">Liên kết và xác thực</a>
                    <a href="/user/settings/payment-history" class="nav-link text-start" role="tab" aria-controls="v-pills-lichsuthanhtoan" aria-selected="false">Lịch sử thanh toán</a>
                    <a href="/user/settings/account-settings" class="nav-link text-start show active" role="tab" aria-controls="v-pills-settings" aria-selected="false">Cài đặt tài khoản</a>
                </div>
            </div>
        </aside>
        <div class="col-8">
            <div class="card">
                <div class="card-body">
                    <div class="tab-content" id="v-pills-tabContent">
                        <div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab" tabindex="0">

                        </div>
                        <div class="tab-pane fade" id="v-pills-linking" role="tabpanel" aria-labelledby="v-pills-linking-tab" tabindex="0">

                        </div>
                        <div class="tab-pane fade" id="v-pills-payment-history" role="tabpanel" aria-labelledby="v-pills-payment-history-tab" tabindex="0">

                        </div>
                        <div class="tab-pane fade show active" id="v-pills-account-settings" role="tabpanel" aria-labelledby="v-pills-account-settings-tab" tabindex="0">
                            <div class="container mt-4">
                                <h3 class="mb-4">Bảo mật tài khoản</h3>
                                <form:form action="${pageContext.request.contextPath}/user/settings/changePassword" method="post" class="row g-3">
                                    <!-- Old Password -->
                                    <div class="col-md-6">
                                        <label for="password" class="form-label">Mật khẩu cũ</label>
                                        <input type="password" class="form-control" id="password" name="oldpassword" />
                                    </div>
                                    <!-- New Password -->
                                    <div class="col-md-6">
                                        <label for="newPassword" class="form-label">Mật khẩu mới</label>
                                        <input type="password" class="form-control" id="newPassword" name="newPassword" />
                                    </div>
                                    <!-- Confirm New Password -->
                                    <div class="col-md-6">
                                        <label for="confirmNewPassword" class="form-label">Xác nhận mật khẩu mới</label>
                                        <input type="password" class="form-control" id="confirmNewPassword" name="confirmNewPassword" />
                                    </div>
                                    <p class="text-danger">${message}</p>
                                    <!-- Submit Button -->
                                    <div class="col-12">
                                        <button type="submit" class="btn btn-primary">Cập nhật thông tin</button>
                                    </div>
                                </form:form>
                            </div>
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