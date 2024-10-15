<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.8.1/font/bootstrap-icons.min.css"
          rel="stylesheet">
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
        <hr>
        <div class="justify-content-end d-flex option">
            <button class="btn btn-option" type="button" data-bs-toggle="offcanvas"
                    data-bs-target="#offcanvasWithBothOptions" aria-controls="offcanvasWithBothOptions"><i
                    class="bi bi-sliders2 me-2"></i><span>Bộ lọc</span></button>

            <div class="offcanvas offcanvas-start" data-bs-scroll="true" tabindex="-1" id="offcanvasWithBothOptions"
                 aria-labelledby="offcanvasWithBothOptionsLabel">
                <div class="offcanvas-header">
                    <h5 class="offcanvas-title" id="offcanvasWithBothOptionsLabel">Lọc giá và thông tin</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
                </div>
                <div class="offcanvas-body">
                    <p>
                        <%--                    searchBar--%>
                    <form action="/home" class="w-100" method="get">
                        <label class="form-label">Tìm kiếm</label>
                        <div class="input-group mb-3">
                            <input type="text" class="form-control" placeholder="Nhập nội dung cần tìm" name="keywords"
                                   value="${keywords}">
                            <button class="btn btn-outline-secondary" type="submit" id="button-addon2">Tìm kiếm</button>
                        </div>
                    </form>
                    <%--                    SortGia--%>
                    <form class="sortPice w-100 mb-3" action="/home/sort" method="get">
                        <div class="form-group">
                            <label class="form-label">Chọn giá</label>
                            <div class="d-flex align-items-center">
                                <input type="number" class="form-control mx-2" id="minPrice" name="minPrice"
                                       placeholder="Giá thấp nhất" value="${minPrice}">
                                <input type="number" class="form-control mx-2" id="maxPrice" name="maxPrice"
                                       placeholder="Giá cao nhất" value="${maxPrice}">
                            </div>
                        </div>
                        <button class="btn btn-primary mt-3" type="submit">Lọc theo giá</button>
                    </form>
                    <%--                    tinh trang noi that--%>
                    <form class="filterTinhTrang w-100" action="/home/filter" method="get">
                        <div class="form-group">
                            <label class="form-label">Chọn Tình Trạng</label>
                            <select class="form-control" name="tinhTrang">
                                <c:forEach var="option" items="${tinhtrang}">
                                    <option value="${option.value}">${option.label}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <button class="btn btn-primary mt-3" type="submit">Lọc theo Tình Trạng</button>
                    </form>
                    </p>
                </div>
            </div>
        </div>
        <div class="row ps-3">
            <c:if test="${not empty items.content}">
                <c:forEach var="item" items="${items.content}">
                    <div class="col-3">
                        <div class="card">
                            <div class="position-relative">
                                <a href="/wishlists/add?id=${item.maphong}" class="wishlist-link position-absolute">
                                    <i class="bi bi-heart" id="wishlist-icon-${item.maphong}"></i>
                                </a>
                                <img src="../../images/phongtro/${item.anh[0]}" class="card-img-top" alt="...">
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-10">
                                        <h7 class="card-title fw-bold">${item.tenphong}</h7>
                                        <p class="card-text m-0">
                                            <i class="bi bi-geo-alt"></i>
                                            <span>${item.diachi}</span><br>
                                            <span>${item.tinhtrang.getDescription()}</span>
                                        <p class="text-danger fw-bold">Giá: <fmt:formatNumber value="${item.giaphong}"
                                                                                              pattern="#,##0"/>
                                            đ/tháng</p>
                                        </p>
                                    </div>
                                    <div class="d-flex justify-content-end">
                                        Ngày đăng: <fmt:formatDate
                                            value="${item.convert(item.ngaytao)}"
                                            pattern="dd/MM/yyyy"/>
                                        <a href="/post/${item.maphong}" class="btn btn-detail w-100">Xem thêm</a>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </c:if>
            <c:if test="${empty items.content}">
                <div class="alert alert-warning mt-3" role="alert">
                    <h4 class="fw-bold text-danger text-center">Không tìm thấy phòng trọ nào</h4>
                </div>
            </c:if>
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