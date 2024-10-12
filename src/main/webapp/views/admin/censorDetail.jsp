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
                <h5 class="text-center">Tài khoản</h5>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label for="name">Tên tài khoản</label>
                    <input type="text" class="form-control" id="name" name="name" value="${cccd.taikhoan.tentaikhoan}"
                           disabled>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label for="ngaysinh">Ngày sinh</label>
                    <input type="date" class="form-control" id="ngaysinh" name="name" pattern="dd/MM/yyyy"
                           value="${cccd.taikhoan.ngaysinh}"
                           disabled>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label for="ho">Họ</label>
                    <input type="text" class="form-control" id="ho" name="name" value="${cccd.taikhoan.firstname}"
                           disabled>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label for="ten">Tên</label>
                    <input type="text" class="form-control" id="ten" name="name" value="${cccd.taikhoan.lastname}"
                           disabled>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="text" class="form-control" id="email" name="name" value="${cccd.taikhoan.email}"
                           disabled>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label for="sodienthoai">Số điện thoại</label>
                    <input type="text" class="form-control" id="sodienthoai" name="name"
                           value="${cccd.taikhoan.sodienthoai}"
                           disabled>
                </div>
            </div>
            <hr>
            <div class="col-md-12">
                <h5 class="text-center">Chứng minh nhân dân</h5>
            </div>

            <div class="col-md-6">
                <div class="form-group">
                    <label for="soCCCD">Mã số CCCD</label>
                    <input type="text" class="form-control" id="soCCCD" name="name"
                           value="${cccd.maCCCD}"
                           disabled>
                </div>
            </div>

            <div class="col-md-6">
                <div class="form-group">
                    <label for="tenCCCD">Họ và Tên</label>
                    <input type="text" class="form-control" id="tenCCCD" name="name"
                           value="${cccd.tenCCCD}"
                           disabled>
                </div>
            </div>

            <div class="col-md-6">
                <div class="form-group">
                    <label for="ngaysinh">Ngày sinh</label>
                    <input type="date" class="form-control" id="ngaysinh" name="name" pattern="dd/MM/yyyy"
                           value="${cccd.ngaysinh}"
                           disabled>
                </div>
            </div>

            <div class="col-md-6">
                <div class="form-group">
                    <label for="ngaycap">Ngày cấp</label>
                    <input type="date" class="form-control" id="ngaycap" name="name"
                           value="${cccd.ngaycap}"
                           disabled>
                </div>
            </div>

            <div class="col-md-6">
                <div class="form-group">
                    <label for="noicap">Nơi cấp</label>
                    <input type="text" class="form-control" id="noicap" name="name"
                           value="${cccd.noicap}"
                           disabled>
                </div>
            </div>

            <div class="col-md-6">
            </div>

            <div class="col-md-6">
                <label for="anhtruoc">Ảnh trước</label>
                <img class="img-thumbnail overflow-y-auto w-100" src="/images/cccd/${cccd.anhTruocCCCD}"
                     alt="" style="max-height: 300px" id="anhtruoc">
            </div>
            <div class="col-md-6">
                <label for="anhsau">Ảnh sau</label>
                <img class="img-thumbnail overflow-y-auto w-100" src="/images/cccd/${cccd.anhSauCCCD}"
                     alt="" style="max-height: 300px" id="anhsau">
            </div>
        </form>
        <div class="my-4 d-flex justify-content-between">
            <a href="/admin/kiemduyet" class="btn btn-secondary">Quay lại</a>
            <div class="btn-group" role="group" aria-label="Basic example">
                <a href="${cccd.taikhoan.tentaikhoan}/accept" type="submit"
                   class="btn btn-success">Duyệt
                </a>
                <a href="${cccd.taikhoan.tentaikhoan}/reject" type="submit"
                   class="btn btn-danger">Từ chối
                </a>
            </div>
        </div>
    </div>
</main>
</body>
</html>