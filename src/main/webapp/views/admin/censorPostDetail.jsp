<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Apartment World Admin</title>
    <%--    Bootstrap--%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
    <%--    JQuery--%>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"
            integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <%--    Font awesome--%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
          integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <%--    custom css--%>
    <link rel="stylesheet" href="/css/admin/style.css">
</head>
<body>
<jsp:include page="_header.jsp"/>
<jsp:include page="_aside.jsp"/>
<main class="mt-5 pt-3">
    <div class="container-fluid">
        <h2 class="text-center mt-4">Thông tin chi tiết</h2>
        <form class="row g-3 my-3">
            <div class="col-md-12">
                <h5 class="text-center">Bài đăng</h5>
            </div>
            <div class="col-md-4">
                <label class="form-label w-100">Hình ảnh</label>
                <c:forEach items="${post.anh}" var="image">
                    <img src="/images/phongtro/${image}" class="img-thumbnail" alt="Preview image"
                         style="width: 185px; height: 185px; object-fit: cover;"/>
                </c:forEach>
            </div>
            <div class="col-md-8 d-flex flex-column align-items-center ">
                <div class="col-md-8 mb-3">
                    <label for="tenphong" class="form-label">Tiêu đề</label>
                    <input type="text" class="form-control" id="tenphong" name="tenphong" value="${post.tenphong}"
                           disabled>
                </div>
                <div class="col-md-8 mb-3">
                    <label for="nguoidang" class="form-label">Người đăng</label>
                    <input type="text" class="form-control" id="nguoidang" name="tenphong"
                           value="${post.tentaikhoan.tentaikhoan}"
                           disabled>
                </div>
                <div class="col-md-8 mb-3">
                    <label for="tinhtrang" class="form-label">Tình trạng</label>
                    <input type="text" class="form-control" id="tinhtrang" name="tinhtrang"
                           value="${post.tinhtrang.getDescription()}"
                           disabled>
                </div>
                <div class="col-md-8 mb-3">
                    <label class="form-label">Giá</label>
                    <div class="form-control bg-gia" style="background-color: #e9ecef"><fmt:formatNumber
                            value="${post.giaphong}" pattern="#,##0"/> đ
                    </div>
                </div>
                <div class="col-md-8 mb-3">
                    <label for="dientich" class="form-label">Diện tích</label>
                    <input type="text" class="form-control" id="dientich" name="dientich" value="${post.dientich} m2"
                           disabled>
                </div>
                <div class="col-md-8 mb-3">
                    <label class="form-label">Tiền cọc</label>
                    <div class="form-control bg-gia" style="background-color: #e9ecef"><fmt:formatNumber
                            value="${post.tiencoc}" pattern="#,##0"/> đ
                    </div>
                </div>
                <div class="col-md-8 mb-3">
                    <label for="diachi" class="form-label">Địa chỉ</label>
                    <input type="text" class="form-control" id="diachi" name="diachi" value="${post.diachi}" disabled>
                </div>
                <div class="col-md-8 mb-3">
                    <label class="form-label">Ngày đăng</label>
                    <div class="form-control bg-gia" style="background-color: #e9ecef"><fmt:formatDate
                            value="${post.convert(post.ngaytao)}" pattern="dd/MM/yyyy hh:mm:ss a"/>
                    </div>
                </div>
                <div class="col-md-8 mb-3">
                    <label for="mota" class="form-label">Mô tả</label>
                    <textarea class="form-control" id="mota" name="mota" rows="3" disabled>${post.mota}</textarea>
                </div>

            </div>
        </form>
        <div class="my-4 d-flex justify-content-between">
            <a href="/admin/kiemduyet" class="btn btn-secondary">Quay lại</a>
            <div class="btn-group" role="group" aria-label="Basic example">
                <a href="${post.maphong}/accept" type="submit"
                   class="btn btn-success">Duyệt
                </a>
                <a href="${post.maphong}/reject" type="submit"
                   class="btn btn-danger">Từ chối
                </a>
            </div>
        </div>
    </div>
</main>
</body>
</html>