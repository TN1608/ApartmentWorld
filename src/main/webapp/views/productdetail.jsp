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
<jsp:include page="_header.jsp" />
<body>
	<div class="container">
		<!-- product section -->
		<section class="product-container">
			<!-- left side -->
			<div class="img-card">
				<img src="/images/phongtro/${image}" alt="" id="featured-image">
				<div class="small-Card">
					<img src="/images/phongtro/${image}" alt="" class="small-Img">

				</div>
			</div>
		</section>
		<section class="property-listing">
			<h2>${product.tenphong}</h2>
			<!-- Tên phòng từ đối tượng sản phẩm -->
			<h3>${product.giaphong}triệu/tháng</h3>
			<!-- Giá phòng từ đối tượng sản phẩm -->
			<div class="property-details">
				<p>
					<strong>Địa chỉ:</strong> ${product.diachi}
					<!-- Địa chỉ từ đối tượng sản phẩm -->
				</p>
			</div>
			<div class="property-features">
				<p>
					<strong>Đặc điểm bất động sản:</strong>
				</p>
				<ul>
					<li>Cho Thuê</li>
					<li>Số tiền cọc: ${product.tiencoc} đ/tháng</li>
					<li>Diện tích: ${product.dientich}</li>
					<li>Tình trạng nội thất: ${product.tinhtrang}</li>
				</ul>
			</div>
			<div class="property-description">
				<h4>Mô tả chi tiết</h4>
				<p>${product.mota}</p>
				<!-- Mô tả từ đối tượng sản phẩm -->
			</div>
		</section>
		<div class="in4">
			<section class="contact-section">
				<div class="contact-header">
					<img src="${account.anhtaikhoan}"
						alt="${account.firstname} ${account.lastname}"
						class="profile-image">
					<div class="contact-info">
						<h4>${account.firstname}${account.lastname}</h4>
						<p class="rating">4.7 (3) • 7 tin đăng</p>
					</div>
				</div>
				<button class="call-button">Bấm để hiện SĐT
					${account.sodienthoai}</button>
				<button class="chat-button">Chat</button>
			</section>

			<section class="partner-info">
				<h5>
					Đối Tác Uy Tín <i class="bi bi-shield-fill-check"></i>
				</h5>
				<p>
					Cam kết nhà đất đúng mô tả, pháp lý rõ ràng, hỗ trợ thủ tục sang
					tên. <a href="#">Xem thêm</a>
				</p>
				<ul class="partner-benefits">
					<li><i class="bi bi-house-door"></i> Giao dịch minh bạch, hợp
						đồng chuẩn</li>
					<li><i class="bi bi-shield-fill"></i> Bảo đảm quyền lợi khách
						hàng - Cam kết pháp lý</li>
					<li><i class="bi bi-credit-card"></i> Hỗ trợ trả góp - Lãi
						suất ưu đãi</li>
					<li><i class="bi bi-arrow-left-right"></i> Hỗ trợ đổi nhà cũ -
						Nhận tư vấn miễn phí</li>
				</ul>
			</section>
		</div>

	</div>

	<!-- script tags -->
	<script src="../js/productdetail.js"></script>
</body>
<jsp:include page="_footer.jsp" />
</html>
