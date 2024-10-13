<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
</head>
<body>
<jsp:include page="../_header.jsp"/>
<!-- Main content here -->
<div class="container p-5">
    <h1 class="text-center mb-5">Chọn gói đăng ký người bán</h1>
    <div class="row justify-content-center">
        <!-- Gói Free -->
        <div class="col-md-4">
            <div class="card text-center shadow">
                <div class="card-header bg-primary text-white">
                    Gói Free
                </div>
                <div class="card-body">
                    <h2 class="card-title">0 VND / tháng</h2>
                    <p class="card-text">Dành cho người bán mới</p>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">Đăng sản phẩm không giới hạn</li>
                        <li class="list-group-item">10% phí hoa hồng</li>
                        <li class="list-group-item">Hỗ trợ cơ bản</li>
                    </ul>
                    <a href="register-seller/free" class="btn btn-primary mt-4">Chọn gói</a>
                    <a href="#" class="btn btn-warning">Hỗ trợ</a>
                </div>
            </div>
        </div>

        <!-- Gói Premium -->
        <div class="col-md-4">
            <div class="card text-center shadow">
                <div class="card-header bg-success text-white">
                    Gói Premium
                </div>
                <div class="card-body">
                    <h2 class="card-title">299,000 VND / tháng</h2>
                    <p class="card-text">Dành cho người bán chuyên nghiệp</p>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">5% phí hoa hồng</li>
                        <li class="list-group-item">Tối ưu tìm kiếm sản phẩm</li>
                        <li class="list-group-item">Hỗ trợ 24/7</li>
                    </ul>
                    <a href="register-seller/premium" class="btn btn-success mt-4">Chọn gói</a>
                    <a href="#" class="btn btn-warning">Hỗ trợ</a>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../_footer.jsp"/>
</body>
</html>