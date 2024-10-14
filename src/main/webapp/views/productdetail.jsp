<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
<meta charset="UTF-8">
<!--    Bootstrap-->
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
	integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
	integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
<link rel="stylesheet" href="../css/signup.css">
<link rel="stylesheet" href="../css/header.css">
<link rel="stylesheet" href="../css/footer.css">
<link rel="stylesheet" href="../css/productdetail.css">
<title>ApartmentWorld</title>
</head>
<jsp:include page="_header.jsp"/>
<body>
<div class="container" >
	<!-- product section -->
	<section class="product-container">
		<!-- left side -->
<div class="img-card">
    <img src="/images/productdetail/mg5.jpg" alt="" id="featured-image">
    <div class="small-Card">
        <img src="/images/productdetail/mg1.jpg" alt="" class="small-Img">
        <img src="/images/productdetail/mg2.jpg" alt="" class="small-Img">
        <img src="/images/productdetail/mg3.jpg" alt="" class="small-Img">
        <img src="/images/productdetail/mg4.jpg" alt="" class="small-Img">
        <img src="/images/productdetail/mg6.jpg" alt="" class="small-Img">
    </div>
</div>



		<!-- Right side -->
		<div class="product-info">
			<h3>My Girl</h3>
			<h5>Price: ∞</h5>
			<p>This is my girl.</p>
			<p>No one touch her!</p>
			<div class="quantity">
				<button>Add to Cart</button>
			</div>


            <section class="partner-info">
                <h5>Đối Tác Uy Tín <i class="bi bi-shield-fill-check"></i></h5>
                <p>Cam kết nhà đất đúng mô tả, pháp lý rõ ràng, hỗ trợ thủ tục sang tên. <a href="#">Xem thêm</a></p>
                <ul class="partner-benefits">
                    <li><i class="bi bi-house-door"></i> Giao dịch minh bạch, hợp đồng chuẩn</li>
                    <li><i class="bi bi-shield-fill"></i> Bảo đảm quyền lợi khách hàng - Cam kết pháp lý</li>
                    <li><i class="bi bi-credit-card"></i> Hỗ trợ trả góp - Lãi suất ưu đãi</li>
                    <li><i class="bi bi-arrow-left-right"></i> Hỗ trợ đổi nhà cũ - Nhận tư vấn miễn phí</li>
                </ul>
            </section>



		</div>

	</section>
	<br>
	<!-- Product Details Section -->
<section class="product-detail-container">
    <h4>Mô tả chi tiết</h4>

    <p>Ngôi nhà này đang được bán và hỗ trợ trả góp - Giao dịch an toàn</p>
    <ul>
        <li><strong>Biệt thự sang trọng tại Quận 7</strong></li>
        <li><i class="bi bi-arrows-fullscreen"></i> Diện tích: 300m²</li>
        <li><i class="bi bi-bed"></i> Số phòng ngủ: 5</li>
        <li><i class="bi bi-bath"></i> Số phòng tắm: 4</li>
        <li><i class="bi bi-water"></i> Có hồ bơi riêng và sân vườn rộng</li>
        <li><i class="bi bi-house"></i> Tiện nghi: Gara, điều hòa, phòng gym</li>
        <li><i class="bi bi-file-earmark-text"></i> Giấy tờ pháp lý đầy đủ</li>
    </ul>

    <!-- Information Table -->
    <table class="table">
        <thead>
            <tr>
                <th colspan="2">Thông số chi tiết</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>Vị trí</td>
                <td>Quận 7, TP. Hồ Chí Minh</td>
            </tr>
            <tr>
                <td>Loại hình</td>
                <td>Biệt thự</td>
            </tr>
            <tr>
                <td>Diện tích đất</td>
                <td>300m²</td>
            </tr>
            <tr>
                <td>Diện tích sử dụng</td>
                <td>450m²</td>
            </tr>
            <tr>
                <td>Số tầng</td>
                <td>3 tầng</td>
            </tr>
            <tr>
                <td>Pháp lý</td>
                <td>Sổ hồng</td>
            </tr>
            <tr>
                <td>Năm xây dựng</td>
                <td>2018</td>
            </tr>
            <tr>
                <td>Hướng nhà</td>
                <td>Đông Nam</td>
            </tr>
        </tbody>
    </table>

</section>
</div>
	

	<!-- script tags -->
	<script src="../js/productdetail.js"></script>
</body>
<jsp:include page="_footer.jsp" />
</html>