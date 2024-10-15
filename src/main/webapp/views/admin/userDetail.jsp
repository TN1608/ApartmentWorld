<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
    <script src="/js/admin/app.js"></script>
    <style>
        h2 {
            color: #343a40; /* Màu tiêu đề */
        }

        .form-control {
            border-radius: 5px; /* Bo góc cho input */
        }

        .invalid-feedback {
            font-size: 0.9rem; /* Kích thước chữ cho thông báo lỗi */
        }
    </style>
</head>
<body>
<jsp:include page="_header.jsp"/>
<jsp:include page="_aside.jsp"/>
<main class="mt-5 pt-3">
    <div class="container-fluid position-relative">
        <h2 class="mt-4 text-center">Quản lý người dùng</h2>
        <form:form method="post" enctype="multipart/form-data" class="needs-validation" modelAttribute="taikhoan">
            <div class="row">
                <div class="col-md-6 mb-3">
                    <label for="tentaikhoan">Tên tài khoản:</label>
                    <form:input type="text" class="form-control" id="tentaikhoan" path="tentaikhoan" maxlength="150"
                    />
                    <div class="invalid-feedback">Vui lòng nhập tên tài khoản.</div>
                </div>
                <div class="col-md-6 mb-3">
                    <label for="email">Email:</label>
                    <form:input type="email" class="form-control" id="email" path="email" maxlength="150"
                    />
                </div>

            </div>
            <div class="row">
                <div class="col-md-6 mb-3">
                    <label for="firstname">Họ:</label>
                    <form:input type="text" class="form-control" id="firstname" path="firstname" maxlength="100"
                    />
                </div>
                <div class="col-md-6 mb-3">
                    <label for="lastname">Tên:</label>
                    <form:input type="text" class="form-control" id="lastname" path="lastname" maxlength="100"
                    />
                </div>

            </div>
            <div class="row">
                <div class="col-md-6 mb-3">
                    <label for="matkhau">Mật khẩu:</label>
                    <form:input type="password" class="form-control" id="matkhau" path="matkhau" maxlength="200"
                    />
                </div>
                <div class="col-md-6 mb-3">
                    <label for="sodienthoai">Số điện thoại:</label>
                    <form:input type="text" class="form-control" id="sodienthoai" path="sodienthoai" maxlength="15"
                    />
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 mb-3">
                    <label for="gioitinh">Giới tính:</label>
                    <form:select class="form-control" id="gioitinh" path="gioitinh">
                        <form:options items="${gioitinh}" itemValue="value" itemLabel="label"/>
                    </form:select>
                </div>
                <div class="col-md-6 mb-3">
                    <label for="ngaysinh">Ngày sinh:</label>
                    <form:input type="date" class="form-control" id="ngaysinh" path="ngaysinh"
                    />
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 mb-3">
                    <label for="vaitro">Vai trò:</label>
                    <form:select class="form-control" id="vaitro" path="vaitro">
                        <form:options items="${vaitro}" itemValue="value" itemLabel="label"/>
                    </form:select>
                </div>
                <div class="col-md-6 mb-3">
                    <label for="mota">Mô tả:</label>
                    <form:textarea class="form-control" id="mota" path="mota" maxlength="200"
                    />
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 mb-3" id="avatarField" style="display: none">
                    <label for="anhtaikhoan">Ảnh tài khoản:</label>
                    <input type="file" class="form-control" id="anhtaikhoan" name="avatar"/>
                </div>
                <div class="col-md-6 mb-3" id="statusField" style="display: none">
                    <label for="status">Trạng thái Xác thực:</label>
                    <form:select class="form-control" id="status" path="status">
                        <form:options items="${status}" itemValue="value" itemLabel="label"/>
                    </form:select>
                </div>
            </div>
            <div class="row mb-4">
                <div class="col-md-6 mb-3" id="sellerField" style="display: none">
                    <label for="seller">Trạng thái bán hàng:</label>
                    <form:select class="form-control" id="seller" path="seller">
                        <form:options items="${seller}" itemValue="value" itemLabel="label"/>
                    </form:select>
                </div>
            </div>

            <div class="mb-3 d-flex justify-content-between">
                <a type="submit" href="/admin/user" class="btn btn-secondary btn-block">Quay lại</a>
                <div>
                    <button type="button" id="avatarBtn" class="btn btn-info btn-block"
                            onclick="toggleField('avatarField', 'avatarBtn')">Ảnh
                    </button>
                    <button type="button" id="statusBtn" class="btn btn-success btn-block"
                            onclick="toggleField('statusField', 'statusBtn')">Xác thực
                    </button>
                    <button type="button" id="sellerBtn" class="btn btn-warning btn-block"
                            onclick="toggleField('sellerField', 'sellerBtn')">Bán hàng
                    </button>
                </div>
                <button formaction="add/send" id="addUser" type="submit" class="btn btn-dark btn-block">Thêm</button>
                <div id="editUser">
                    <button formaction="/admin/user/delete/${taikhoan.tentaikhoan}" type="submit"
                            class="btn btn-danger btn-block" onclick="return confirm('Xác nhận xóa ?')">Xóa
                    </button>
                    <button formaction="send/${taikhoan.tentaikhoan}" type="submit"
                            class="btn btn-dark btn-block">Sửa
                    </button>
                </div>
            </div>
        </form:form>
    </div>
</main>
</body>
</html>