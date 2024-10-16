<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
          integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
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
            <form action="/forgot-password/reset-password" method="post">
                <div class="mb-3">
                    <label for="password" class="form-label">Mật khẩu mới</label>
                    <input type="password" class="form-control" id="password" path="password" name="password"/>
                </div>
                <div class="mb-3">
                    <label for="checkPassword" class="form-label">Xác nhận mật khẩu</label>
                    <input type="password" class="form-control" id="checkPassword" path="checkPassword"
                           name="checkPassword"/>

                </div>

                <p class="text-danger">${message}</p>
                <button
                        class="btn btn-primary fw-bold mt-2" type="submit">
                    Xác nhận
                </button>
            </form>
        </div>
    </div>
</div>
<!-- Main content here -->
<jsp:include page="_footer.jsp"/>
</body>
</html>