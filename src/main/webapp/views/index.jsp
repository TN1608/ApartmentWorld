<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <!--    Bootstrap-->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
    <link rel="stylesheet" href="../css/index.css">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <!-- Add this in your HTML file -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
    <script src="../js/app.js"></script>
    <title>ApartmentWorld</title>
</head>
<jsp:include page="header.jsp"/>
<body>
    <div class="content w-100">
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
        <section class="section3 pt-5 container">
            <h5 class="fw-bold mb-2">Phòng trọ cho thuê giá rẻ cập nhật 9/2024</h5>
            <div class="row w-75">
                <div class="col-lg-8">
                    <div class="card">
                        <img src="../images/test.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">KTX Q.7 Cao Cấp cách LotteMart 300m</h5>
                            <p class="card-text">950k/1 tháng</p>
                            <a href="#" class="btn btn-primary">Tìm hiểu</a>
                        </div>
                        <div class="wishlist">
                            <a href="#" class="p-2 bottom-0"><i class="bi bi-heart"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="card">
                        <img src="../images/test.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">KTX Q.7 Cao Cấp cách LotteMart 300m</h5>
                            <p class="card-text">950k/1 tháng</p>
                            <a href="#" class="btn btn-primary">Tìm hiểu</a>
                        </div>
                        <div class="wishlist">
                            <a href="#" class="p-2 bottom-0"><i class="bi bi-heart"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="card">
                        <img src="../images/test.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">KTX Q.7 Cao Cấp cách LotteMart 300m</h5>
                            <p class="card-text">950k/1 tháng</p>
                            <a href="#" class="btn btn-primary">Tìm hiểu</a>
                        </div>
                        <div class="wishlist">
                            <a href="#" class="p-2 bottom-0"><i class="bi bi-heart"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="card">
                        <img src="../images/test.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">KTX Q.7 Cao Cấp cách LotteMart 300m</h5>
                            <p class="card-text">950k/1 tháng</p>
                            <a href="#" class="btn btn-primary">Tìm hiểu</a>
                        </div>
                        <div class="wishlist">
                            <a href="#" class="p-2 bottom-0"><i class="bi bi-heart"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="card">
                        <img src="../images/test.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">KTX Q.7 Cao Cấp cách LotteMart 300m</h5>
                            <p class="card-text">950k/1 tháng</p>
                            <a href="#" class="btn btn-primary">Tìm hiểu</a>
                        </div>
                        <div class="wishlist">
                            <a href="#" class="p-2 bottom-0"><i class="bi bi-heart"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="card">
                        <img src="../images/test.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">KTX Q.7 Cao Cấp cách LotteMart 300m</h5>
                            <p class="card-text">950k/1 tháng</p>
                            <a href="#" class="btn btn-primary">Tìm hiểu</a>
                        </div>
                        <div class="wishlist">
                            <a href="#" class="p-2 bottom-0"><i class="bi bi-heart"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</body>
<jsp:include page="footer.jsp"/>
</html>