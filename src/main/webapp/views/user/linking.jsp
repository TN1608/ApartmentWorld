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
    <script src="/js/link.js"></script>
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
                <div class="card-body a-groups">
                    <a href="/user/settings/profile" class="nav-link text-start" role="tab"
                       aria-controls="v-pills-profile" aria-selected="false">Thông tin cá nhân</a>
                    <a href="/user/settings/linking" class="nav-link text-start show active" role="tab"
                       aria-controls="v-pills-linking" aria-selected="false">Liên kết và xác thực</a>
                    <a href="/user/settings/payment-history" class="nav-link text-start" role="tab"
                       aria-controls="v-pills-lichsuthanhtoan" aria-selected="false">Lịch sử thanh toán</a>
                    <a href="/user/settings/account-settings" class="nav-link text-start" role="tab"
                       aria-controls="v-pills-settings" aria-selected="false">Cài đặt tài khoản</a>
                </div>
            </div>
        </aside>
        <div class="col-8">
            <div class="card">
                <div class="card-body">
                    <div class="tab-content" id="v-pills-tabContent">
                        <div class="tab-pane fade" id="v-pills-profile" role="tabpanel"
                             aria-labelledby="v-pills-profile-tab" tabindex="0">

                        </div>
                        <div class="tab-pane fade show active" id="v-pills-linking" role="tabpanel"
                             aria-labelledby="v-pills-linking-tab" tabindex="0">
                            <div class="container mt-4">
                                <h3 class="mb-4">Liên kết tài khoản</h3>
                            <form:form action="user/settings/linking/update" class="row g-3" modelAttribute="taikhoan" method="post">
                                <div class="col-md-6">
                                    <label for="email" class="form-label">Email</label>
                                    <form:input path="email" type="email" class="form-control" id="email" value="${user.email}"/>
                                    <c:if test="${!emailVerified}">
                                        <button formaction="/user/settings/linking/verifyMail" id="verifyEmailBtn" class="btn btn-primary fw-bold mt-2">
                                            Xác thực <i class="bi bi-patch-check-fill"></i>
                                        </button>
                                    </c:if>
                                </div>
                                <div class="col-md-6" id="otpField" style="display:none;">
                                    <label for="otp" class="form-label">Nhập mã xác thực</label>
                                    <input type="text" class="form-control" name="otp" id="otp" placeholder="Nhập mã OTP" />
                                    <button type="button" id="confirmOtpBtn" class="btn btn-success fw-bold mt-2">
                                        Xác nhận mã <i class="bi bi-check-circle-fill"></i>
                                    </button>
                                </div>
                                <div class="col-md-6">
                                    <label for="sdt" class="form-label">Số điện thoại</label>
                                    <form:input path="sodienthoai" type="text" class="form-control" id="sdt" value="${user.sodienthoai}"/>
                                    <button class="btn btn-primary fw-bold mt-2">Xác thực <i class="bi bi-patch-check-fill"></i></button>
                                </div>
                            </form:form>
                                <script>
                                    document.getElementById('verifyEmailBtn').addEventListener('click', function(event) {
                                        event.preventDefault();
                                        // Show OTP input field
                                        document.getElementById('otpField').style.display = 'block';
                                    });

                                    // Verify OTP and disable email input field on successful verification
                                    document.getElementById('confirmOtpBtn').addEventListener('click', function() {
                                        const enteredOtp = document.getElementById('otp').value;

                                        // Simulating OTP check with backend (replace with actual verification call)
                                        if (enteredOtp === 'expectedOtp') { // Replace 'expectedOtp' with actual OTP sent from the server
                                            // Disable the email input field and verification button
                                            document.getElementById('email').setAttribute('disabled', 'true');
                                            document.getElementById('verifyEmailBtn').setAttribute('disabled', 'true');
                                            alert('Mã xác thực đúng. Email đã được xác nhận!');
                                        } else {
                                            alert('Mã xác thực không đúng. Vui lòng thử lại!');
                                        }
                                    });
                                </script>
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
<jsp:include page="../footer.jsp"/>
</html>
