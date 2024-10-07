<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
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
    <link rel="stylesheet" href="../css/login.css">
    <link rel="stylesheet" href="../css/header.css">
    <link rel="stylesheet" href="../css/footer.css">
    <script src="../js/app.js"></script>
    <title>ApartmentWorld</title>
</head>

<body>
<jsp:include page="_header.jsp"/>
<!-- Main content here -->
<div class="container p-5">
    <div class="row">
        <div class="col-md-6 log-banner overflow-hidden">
            <img src="../images/login.jpg" alt="login" class="img-fluid">
        </div>
        <div class="col-md-6">
            <form action="/forgot-password" method="post">
                <div class="mb-3">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" class="form-control" id="email" path="email" name="email" value="${email}"
                           required
                           <c:if test="${showOtp == true || showResetForm == true}">disabled</c:if>/>
                    <c:if test="${!showOtp || !showResetForm}">
                        <button formaction="/forgot-password/sendOtp"
                                class="btn btn-primary fw-bold mt-2" type="submit">
                            Gửi mã
                        </button>
                    </c:if>
                </div>
                <c:if test="${showOtp == true}">
                    <div class="mb-3">
                        <label for="otp" class="form-label">Mã Xác nhận</label>
                        <input type="text" class="form-control" id="otp" path="otp" name="otp"/>
                        <button formaction="/forgot-password/verifyOtp"
                                class="btn btn-primary fw-bold mt-2" type="submit">
                            Xác nhận
                        </button>
                    </div>
                </c:if>

                <c:if test="${showResetForm == true}">
                    <div class="mb-3">
                        <label for="password" class="form-label">Mật khẩu mới</label>
                        <input type="password" class="form-control" id="password" path="password" name="password"/>
                    </div>
                    <div class="mb-3">
                        <label for="checkPassword" class="form-label">Xác nhận mật khẩu</label>
                        <input type="password" class="form-control" id="checkPassword" path="checkPassword"
                               name="checkPassword"/>
                    </div>
                    <button formaction="/forgot-password/reset-password"
                            class="btn btn-primary fw-bold mt-2" type="submit">
                        Xác nhận
                    </button>
                </c:if>

                <p class="text-danger">${message}</p>
            </form>
        </div>
    </div>
</div>
<!-- Main content here -->
<jsp:include page="_footer.jsp"/>
</body>

</html>