<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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
    <link rel="stylesheet" href="../css/login.css">
    <link rel="stylesheet" href="../css/header.css">
    <link rel="stylesheet" href="../css/footer.css">
    <script src="../js/app.js"></script>
    <title>ApartmentWorld</title></head>
<body>
<jsp:include page="header.jsp"/>
<!-- Main content here -->
<div class="container p-5">
    <div class="row">
        <div class="col-md-6">
            <form:form action="/login" modelAttribute="taikhoan" method="post">
                <div class="mb-3">
                    <label for="username" class="form-label">Tên đăng nhập</label>
                    <form:input type="text" class="form-control" id="username" path="tentaikhoan" name="tentaikhoan"/>
                    <form:errors path="tentaikhoan" cssClass="text-danger"/><br>
                </div>
                <div class="mb-3">
                    <label for="username" class="form-label">Họ</label>
                    <form:input type="text" class="form-control" id="username" path="firstname" name="firstname"/>
                    <form:errors path="tentaikhoan" cssClass="text-danger"/><br>
                </div>
                <div class="mb-3">
                    <label for="username" class="form-label">Tên</label>
                    <form:input type="text" class="form-control" id="username" path="lastname" name="lastname"/>
                    <form:errors path="tentaikhoan" cssClass="text-danger"/><br>
                </div>
                <%--                <div class="mb-3">--%>
                <%--                    <label for="username" class="form-label">Email</label>--%>
                <%--                    <form:input type="text" class="form-control" id="username" path="email" name="email"/>--%>
                <%--                    <form:errors path="tentaikhoan" cssClass="text-danger"/><br>--%>
                <%--                </div>--%>
                <%--                mail đâu rồi vcl--%>
                <div class="mb-3">
                    <label for="password" class="form-label">Mật khẩu</label>
                    <form:input type="password" class="form-control" id="password" path="matkhau" name="matkhau"/>
                    <form:errors path="matkhau" cssClass="text-danger"/><br>
                    <div class="form-check">
                        <input type="checkbox" class="form-check-input" id="confirmDK" name="confirmDK" value="true"/>
                        <label class="form-check-label" for="confirmDK">Đồng ý điều khoản</label>
                    </div>
                </div>

                <p class="text-danger">${message}</p>
                <button type="submit" class="btn btn-primary">Đăng ký</button>
                <br>
                Đã có tài khoản?<a href="/login" class="btn btn-success">Đăng nhập</a>
            </form:form>
        </div>
        <div class="col-md-6 log-banner overflow-hidden">
            <img src="../images/login.jpg" alt="login" class="img-fluid">
        </div>
    </div>
</div>
<!-- Main content here -->
<jsp:include page="footer.jsp"/>
</body>
</html>