<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
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
    <link rel="stylesheet" href="../css/wishlist.css">
    <link rel="stylesheet" href="../css/header.css">
    <link rel="stylesheet" href="../css/footer.css">
    <script src="../js/wishlist.js"></script>
    <script src="../js/app.js"></script>
    <title>ApartmentWorld</title>
</head>
<jsp:include page="_header.jsp"/>
<body>

<div class="container p-5">
    <div class="row ps-3 wishlist-content">
        <h4 class="fw-bold">Tin đăng đã lưu</h4>
        <hr>
        <c:if test="${not empty wishlists}">
            <c:forEach var="item" items="${wishlists}">
                <div class="card">
                    <img src="../../images/phongtro/${item.maphong.anh[0]}" class="card-img-top" alt="...">
                    <div class="card-body">
                        <div class="text-section">
                            <h5 class="card-title">${item.maphong.tenphong}</h5>
                            <p class="card-text">
                                <span><i class="bi bi-geo-alt me-2"></i>Địa chỉ: ${item.maphong.diachi}</span><br>
                                <span><i
                                        class="bi bi-justify me-2"></i>Tình trạng: ${item.maphong.tinhtrang.getDescription()}</span><br>
                                <span><i
                                        class="bi bi-bounding-box me-2"></i>Diện tích: ${item.maphong.dientich}m<sup>2</sup></span>
                            <p class="text-warning fw-bold">Tiền cọc: <fmt:formatNumber value="${item.maphong.tiencoc}"
                                                                                        pattern="#,##0"/>đ</p>
                            </p>
                        </div>
                        <div class="cta-section">
                            <div class=""><p class="text-danger fw-bold"><fmt:formatNumber
                                    value="${item.maphong.giaphong}"
                                    pattern="#,##0"/> đ/tháng</p>
                            </div>
                            <a href="/productdetail" class="btn btn-primary">Xem chi tiết</a>
                            <a href="/wishlists/remove?id=${item.maphong.maphong}"
                               class="btn wishlist-link wishlist-btn"><i
                                    class="bi bi-suit-heart-fill text-danger"></i></a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </c:if>
        <c:if test="${empty wishlists}">
            <div class="alert alert-warning" role="alert">
                Bạn chưa lưu tin đăng nào
            </div>
        </c:if>
    </div>
    <nav aria-label="Page navigation example">
        <ul class="pagination justify-content-center d-flex">
            <li class="page-item"><a class="page-link" href="#">Previous</a></li>
            <li class="page-item"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#">Next</a></li>
        </ul>
    </nav>
</div>
</body>
<jsp:include page="_footer.jsp"/>
</html>