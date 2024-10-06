<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <!--    Bootstrap-->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
    <link rel="stylesheet" href="../css/signup.css">
    <link rel="stylesheet" href="../css/header.css">
    <link rel="stylesheet" href="../css/footer.css">
    <script src="../js/app.js"></script>
    <title>ApartmentWorld</title>
</head>
<jsp:include page="_header.jsp"/>
<body>
<!-- Main content here -->
<div class="container p-5">
    <div class="row">
        <div class="col-md-6 signup-banner overflow-hidden">
            <img src="../images/login.jpg" alt="signup" class="img-fluid">
        </div>
        <div class="col-md-6">
            <form:form action="/signup" modelAttribute="taikhoan" method="post">
                <div class="mb-3">
                    <label for="username" class="form-label">Tên đăng nhập</label>
                    <form:input type="text" class="form-control" id="username" path="tentaikhoan"/>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Email</label>
                    <form:input type="email" class="form-control" id="password" path="email"/>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Mật khẩu</label>
                    <form:input type="password" class="form-control" id="password" path="matkhau"/>
                </div>
                <div class="mb-3">
                    <label for="Cpassword" class="form-label">Xác nhận mật khẩu</label>
                    <input type="password" class="form-control" id="Cpassword" name="cpass" />
                </div>
                <p class="text-danger">${message}</p>
                <button type="submit" class="btn btn-primary">Đăng ký</button>
            </form:form>
        </div>
    </div>
</div>
<!-- Main content here -->
</body>
<jsp:include page="_footer.jsp"/>
</html>