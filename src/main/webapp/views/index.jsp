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
    </div>
</body>
<jsp:include page="footer.jsp"/>
</html>