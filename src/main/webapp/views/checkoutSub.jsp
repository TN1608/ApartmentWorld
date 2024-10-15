<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
          integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../css/header.css">
    <link rel="stylesheet" href="../css/footer.css">
    <script src="../js/app.js"></script>
    <title>ApartmentWorld</title>
</head>
<jsp:include page="_header.jsp"/>
<body>
<!-- Main content here -->
    <div class="container p-5">
        <form action="/checkout" method="post">
            <div class="row g-3">
                <div class="col-sm-12">
                    <h2>Thông tin thanh toán</h2>
                </div>
                <div class="col-sm-12">
                    <label class="form-label">Tên tài khoản</label>
                    <input class="form-control" type="text" value="${user.tentaikhoan}" disabled/>
                </div>
                <div class="col-sm-6">
                    <label class="form-label">Họ</label>
                    <input class="form-control" type="text" name="firstname" placeholder="Họ"/>
                </div>
                <div class="col-sm-6">
                    <label class="form-label">Tên</label>
                    <input class="form-control" type="text" name="lastname" placeholder="Tên"/>
                </div>
                <hr class="my-4">
                <div class="col-sm-12">
                    <h4>Hình thức thanh toán</h4>
                </div>

            </div>
        </form>
    </div>
</body>
<jsp:include page="_footer.jsp"/>
</html>