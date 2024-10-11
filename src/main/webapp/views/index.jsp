<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
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
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"
            integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <!-- Add this in your HTML file -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
    <%--    font awesome--%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
          integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <script src="../js/app.js"></script>
    <link rel="stylesheet" href="../css/header.css">
    <link rel="stylesheet" href="../css/index.css">
    <link rel="stylesheet" href="../css/footer.css">
    <link rel="icon" href="../images/icon/logo.png"
          type="image/x-icon">
    <title>ApartmentWorld</title>
</head>
<jsp:include page="_header.jsp"/>
<body>
<div class="content">
    <section class="section1">
        <div class="container-fluid position-relative">
            <div class="row banner position-absolute w-100 h-75">
                <img src="../images/banner.jpg" class="img-fluid w-100 h-100" style="object-fit: cover;">
            </div>
            <div class="row position-relative">
                <div class="col-12">
                    <h1 class="text-center text-white">Welcome to ApartmentWorld</h1>
                </div>
            </div>
            <div class="row position-relative">
                <div class="col-12">
                    <p class="text-center text-white mb-5">The best place to find your new home</p>
                </div>
            </div>
        </div>
    </section>
    <section class="section2 mt-3 container">
        <hr>
        <div id="carouselExample" class="carousel w-75">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <div class="card">
                        <div class="card-body">
                            <a href="#" class="">
                                <h5>Phòng trọ Bình Tân</h5>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="carousel-item active">
                    <div class="card">
                        <div class="card-body">
                            <a href="#" class="">
                                <h5>Phòng trọ Thủ Đức</h5>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="carousel-item active">
                    <div class="card">
                        <div class="card-body">
                            <a href="#" class="">
                                <h5>Phòng trọ Bình Thạnh</h5>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <div class="card">
                        <div class="card-body">
                            <a href="#" class="">
                                <h5>Phòng trọ Tân Phú</h5>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <div class="card">
                        <div class="card-body">
                            <a href="#" class="">
                                <h5>Phòng trọ Gò Vấp</h5>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <div class="card">
                        <div class="card-body">
                            <a href="#" class="">
                                <h5>Phòng trọ Phú Nhuận</h5>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <div class="card">
                        <div class="card-body">
                            <a href="#" class="">
                                <h5>Phòng trọ Quận 7</h5>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
        <hr>
    </section>
    <section class="section3 container w-100">
        <h5 class="fw-bold mb-2 pt-2 text-center">Phòng trọ cho thuê giá rẻ cập nhật 9/2024</h5>
        <form action="/home" class="w-50" method="get">
            <div class="input-group mb-3">
                <input type="text" class="form-control" placeholder="Nhập nội dung cần tìm" name="keywords"
                       value="${keywords}">
                <button class="btn btn-outline-secondary" type="submit" id="button-addon2">Tìm kiếm</button>
            </div>
        </form>
        <hr>
        <div class="row ps-3">
            <c:forEach var="item" items="${items.content}">
                <div class="col-3">
                    <div class="card">
                        <img src="../images/products/1.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-10">
                                    <h7 class="card-title fw-bold">${item.tenphong}</h7>
                                    <p class="card-text">
                                        <i class="bi bi-geo-alt"></i>
                                        <span>Quận Bình Thạnh</span>
                                    <p class="text-danger fw-bold">Giá: <fmt:formatNumber value="${item.giaphong}"
                                                                                          pattern="#,##0"/> đ/tháng</p>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <nav aria-label="Page navigation example">
            <ul class="pagination justify-content-center align-items-center">
                <li class="page-item">
                    <a class="page-link" href="/home?p=0" aria-label="First">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
                <li class="page-item"><a class="page-link" href="/home?p=${page.number-1}">Trang trước</a></li>
                <li class="page-item"><a class="page-link" href="/home?p=${page.number+1}">Trang sau</a></li>
                <li class="page-item">
                    <a class="page-link" href="/home?p=${page.totalPages-1}" aria-label="Last">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </ul>
        </nav>
    </section>
    <section class="about">
        <div class="container-fluid position-relative">
            <div class="row banner position-absolute w-100 h-75">
                <img src="../images/banner.jpg" class="img-fluid w-100 h-100" style="object-fit: cover;">
            </div>
            <div class="row position-relative">
                <div class="col-12">
                    <h1 class="text-center text-white">Về chúng tôi</h1>
                </div>
            </div>
            <div class="row position-relative">
                <div class="col-12">
                    <p class="text-center text-white mb-5">Là 1 trang web có thể giúp các bạn sinh viên chọn lọc những
                        phòng trọ đang tìm kiếm dễ hơn</p>
                </div>
            </div>
        </div>
    </section>
</div>
</body>
<jsp:include page="_footer.jsp"/>
</html>