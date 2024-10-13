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
    <%--    font awesome--%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
          integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="/css/settings.css">
    <link rel="stylesheet" href="/css/header.css">
    <link rel="stylesheet" href="/css/footer.css">
    <base href="${pageContext.request.contextPath}/">
    <script src="/js/app.js"></script>
    <script src="/js/link.js"></script>
    <title>ApartmentWorld</title>
    <style>
        html, body {
            height: 100%;
            margin: 0;
            display: flex;
            flex-direction: column;
        }

        .container {
            flex: 1;
        }
    </style>
</head>
<body>
<jsp:include page="../_header.jsp"/>
<!-- Main content here -->
<div class="container p-5">
    <h4 class="mb-2 fw-bold">Thông tin cá nhân</h4>
    <div class="row">
        <jsp:include page="_aside.jsp"/>
        <div class="col-8">
            <div class="card">
                <div class="card-body ">
                    <div class="tab-content" id="v-pills-tabContent">
                        <div class="tab-pane fade" id="v-pills-profile" role="tabpanel"
                             aria-labelledby="v-pills-profile-tab" tabindex="0">

                        </div>
                        <div class="tab-pane fade show active" id="v-pills-linking" role="tabpanel"
                             aria-labelledby="v-pills-linking-tab" tabindex="0">
                            <div class="container mt-4">
                                <h3 class="mb-4">Liên kết tài khoản</h3>
                                <form:form action="user/settings/linking/update" class="row g-3"
                                           modelAttribute="taikhoan" method="post">
                                    <div class="col-md-6">
                                        <label for="email" class="form-label">Email</label>
                                        <form:input path="email" type="email" class="form-control" id="email"
                                                    value="${user.email}" readonly="true"/>
                                        <c:if test="${!emailVerified}">
                                            <button formaction="/user/settings/linking/sendMail" id="verifyEmailBtn"
                                                    class="btn btn-primary fw-bold mt-2" type="submit">
                                                Xác thực <i class="bi bi-patch-check-fill"></i>
                                            </button>
                                        </c:if>
                                        <c:if test="${emailVerified}">
                                            <span class="badge bg-success">
                                                <i class="fa-solid fa-check"></i>
                                                Đã xác thực
                                            </span>
                                        </c:if>
                                    </div>

                                    <c:if test="${showOtpField == 'true'}">
                                        <div class="col-md-6" id="otpField">
                                            <label for="otp" class="form-label">Nhập mã xác thực</label>
                                            <input type="text" class="form-control" name="otpMail" id="otp"
                                                   placeholder="Nhập mã OTP"/>
                                            <button type="submit" formaction="user/settings/linking/verifyMail"
                                                    id="confirmOtpBtn" class="btn btn-success fw-bold mt-2">
                                                Xác nhận mã <i class="bi bi-check-circle-fill"></i>
                                            </button>
                                        </div>
                                    </c:if>
                                    <div class="col-md-6">
                                        <label for="sdt" class="form-label">Số điện thoại</label>
                                        <form:input path="sodienthoai" type="text" class="form-control" id="sdt"
                                                    value="${user.sodienthoai}" readonly="true"/>
                                        <c:if test="${!phoneVerified}">
                                            <button formaction="/user/settings/linking/sendPhone" type="submit"
                                                    class="btn btn-primary fw-bold mt-2">
                                                Xác thực
                                                <i class="bi bi-patch-check-fill"></i>
                                            </button>
                                        </c:if>
                                        <c:if test="${phoneVerified}">
                                            <span class="badge bg-success">
                                                <i class="fa-solid fa-check"></i>
                                                Đã xác thực
                                            </span>
                                        </c:if>
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
                                </form:form>
                            </div>
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
<jsp:include page="../_footer.jsp"/>
</html>
