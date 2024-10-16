<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
    <link rel="stylesheet" href="/css/createPost.css">
    <link rel="stylesheet" href="/css/header.css">
    <link rel="stylesheet" href="/css/footer.css">
    <%--    <base href="${pageContext.request.contextPath}/">--%>
    <script src="/js/app.js"></script>
    <script src="/js/createPost.js"></script>
    <title>ApartmentWorld</title>
</head>
<jsp:include page="../_header.jsp"/>
<body>
<!-- Main content here -->
<div class="dangtinform container p-5">
    <form:form action="/dang-tin" modelAttribute="phongtro" method="post" id="dang-tin" enctype="multipart/form-data">
        <div class="row g-3 rounded-2">
            <div class="col-md-4">
                <h3>Hình ảnh và video phòng trọ</h3>
                <p>Xem thêm về <a href="#">Quy định đăng tin của ApartMentWorld</a></p>
                <div class="image-group">
                    <label class="form-label">Chọn hình ảnh</label>
                    <label for="file-upload" class="btn btn-outline-warning w-100">Chọn tệp</label>
                    <input type="file" id="file-upload" name="images" accept="image/*" multiple
                           class="form-control d-none"
                           onchange="handleFileSelect(event)"/>
                    <div id="preview-container" class="img-container mt-3 ">
                        <c:if test="${not empty phongtro.anh}">
                            <c:forEach var="image" items="${phongtro.anh}">
                                <img src="/images/phongtro/${image}" class="img-thumbnail" alt="Preview image"
                                     style="width: 100px; height: 100px; object-fit: cover;"/>
                            </c:forEach>
                        </c:if>
                    </div>
                </div>
            </div>
            <div class="col-md-8 d-flex flex-column align-items-center justify-content-center">
                <div class="col-md-8 m-2">
                    <label for="tenphong" class="form-label">Tiêu đề phòng trọ</label>
                    <form:input path="tenphong" placeholder="Tiêu đề" class="form-control" id="tenphong"/>
                </div>
                <div class="col-md-8 m-2">
                    <label for="tinhtrang" class="form-label">Thông tin khác</label>
                    <form:select path="tinhtrang" id="tinhtrang" class="form-select">
                        <form:options items="${tinhtrang}" itemValue="value" itemLabel="label"/>
                    </form:select>
                </div>
                <div class="col-md-8 m-2">
                    <label for="dientich" class="form-label">Diện tích</label>
                    <form:input path="dientich" placeholder="Diện tích" class="form-control" id="dientich"/>
                </div>
                <div class="col-md-8 m-2">
                    <label class="form-label">Thông tin chi tiết & giá</label>
                    <form:input path="giaphong" placeholder="Giá thuê" class="form-control mb-3"/>
                    <form:textarea path="mota"
                                   placeholder="Thông tin phòng (Diện tích,loại phòng,vị trí,tình trạng,tiện ích,....)"
                                   class="form-control" rows="3"/>
                </div>
                <div class="col-md-8 m-2">
                    <label class="form-label">Tiền cọc</label>
                    <form:input path="tiencoc" placeholder="Tiền cọc/1 tháng" class="form-control"/>
                </div>
                <div class="col-md-8 m-2">
                    <label for="diachi" class="form-label">Địa chỉ</label>
                    <select id="diachi" name="diachi" class="form-select" onclick="showPopup()"
                            onmousedown="preventDropdown(event)">
                        <c:if test="${not empty phongtro.diachi}">
                            <option value="${phongtro.diachi}">${phongtro.diachi}</option>
                        </c:if>
                        <c:if test="${empty phongtro.diachi}">
                            <option value="">Chọn địa chỉ</option>
                        </c:if>
                    </select>
                </div>
                <!-- Modal Bootstrap -->
                <div class="modal fade" id="addressModal" tabindex="-1" aria-labelledby="addressModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="addressModalLabel">Chọn địa chỉ</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <div id="address-selection">
                                    <label for="province">Tỉnh/Thành phố:</label>
                                    <select id="province" class="form-select" onchange="loadDistricts()">
                                        <option value="">Chọn tỉnh/thành</option>
                                    </select>

                                    <label for="district" class="mt-3">Quận/Huyện:</label>
                                    <select id="district" class="form-select" onchange="loadWards()" disabled>
                                        <option value="">Chọn quận/huyện</option>
                                    </select>

                                    <label for="ward" class="mt-3">Phường/Xã:</label>
                                    <select id="ward" class="form-select" disabled>
                                        <option value="">Chọn phường/xã</option>
                                    </select>

                                    <label for="diachicuthe" class="mt-3">Địa chỉ cụ thể</label>
                                    <input type="text" name="diachicuthe" class="form-control"
                                           placeholder="Địa chỉ cụ thể?" id="diachicuthe"/>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                                <button type="button" class="btn btn-primary" onclick="saveAddress()">Lưu</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Modal Bootstrap -->
                <div class="col-md-8 m-2">
                    <div class="col-md-8 m-2 w-100">
                        <button id="dangTinButton" class="btn btn-orange fw-bold fs-5 w-100 text-white"
                                onclick="submitForm()" type="submit"
                                formaction="/dang-tin/tao-tin">Đăng tin
                        </button>
                    </div>
                    <div class="col-md-8 m-2 w-100">
                        <button id="capNhatButton" class="btn btn-success fw-bold fs-5 w-100 text-white"
                                onclick="submitForm()" type="submit"
                                formaction="/dang-tin/sua-doi-thong-tin/update?maphong=${phongtro.maphong}">Cập nhật
                        </button>
                    </div>
                </div>
                <c:if test="${not empty message}">
                    <p class="text-success" role="alert">
                            ${message}
                    </p>
                </c:if>
                <c:if test="${not empty error}">
                    <p class="text-danger" role="alert">
                            ${error}
                    </p>
                </c:if>
            </div>
        </div>
    </form:form>
</div>
<!-- Main content here -->
</body>
<jsp:include page="../_footer.jsp"/>
</html>