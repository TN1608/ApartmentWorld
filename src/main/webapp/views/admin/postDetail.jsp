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

        .preview-image {
            position: relative;
            display: inline-block;
            margin-right: 10px;
            margin-bottom: 10px;
        }

        .preview-image img {
            width: 150px;
            height: 150px;
            object-fit: cover;
            border-radius: 5px;
        }

        .remove-image {
            position: absolute;
            top: -5px;
            right: -5px;
            background-color: red;
            color: white;
            border: none;
            border-radius: 50%;
            width: 25px;
            height: 25px;
            display: flex;
            justify-content: center;
            align-items: center;
            cursor: pointer;
            font-size: 12px;
        }

        .remove-image i {
            font-size: 14px;
        }

        .set-cover-image {
            position: absolute;
            bottom: 5px;
            left: 50%;
            transform: translateX(-50%);
            /*background-color: green;*/
            /*color: white;*/
            /*border: none;*/
            /*border-radius: 50%;*/
            width: 100%;
            /*height: 25px;*/
            display: flex;
            justify-content: center;
            align-items: center;
            cursor: pointer;
            font-size: 12px;
        }
    </style>
</head>
<body>
<jsp:include page="_header.jsp"/>
<jsp:include page="_aside.jsp"/>
<main class="mt-5 pt-3">
    <div class="container-fluid position-relative">
        <h2 class="mt-4 text-center">Quản lý bài đăng</h2>
        <form:form method="post" enctype="multipart/form-data" class="needs-validation" modelAttribute="post">
        <div class="row">
            <div class="col-md-4 mb-3">
                <label>Hình ảnh:</label>
                <label for="fileUpload" class="btn btn-outline-dark w-100">Chọn tệp</label>
                <input type="file" id="fileUpload" name="images" accept="image/*" multiple
                       class="form-control d-none"
                       onchange="handleFileSelect(event)"/>
                <div id="filePreview" class="mt-3 d-flex flex-wrap">
                    <c:if test="${not empty post.anh}">
                        <c:forEach var="image" items="${post.anh}">
                            <div class="preview-image">
                                <img src="/images/phongtro/${image}" alt="preview"/>
                                <button type="button" class="remove-image" onclick="removeImage(event)">
                                    <i class="fas fa-times"></i>
                                </button>
                                <button type="button" class="set-cover-image" onclick="setCoverImage(event)">
                                    Đặt làm ảnh bìa
                                </button>
                            </div>
                        </c:forEach>
                    </c:if>
                </div>
            </div>
            <div class="col-md-8 mb-3 ">
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="content">Mã bài đăng:</label>
                        <form:input class="form-control" id="content" path="maphong" value="${postId}" disabled="true"
                        />
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="content">Tiêu đề:</label>
                        <form:input class="form-control" id="content" path="tenphong"
                        />
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="content">Giá:</label>
                        <form:input class="form-control" id="content" path="giaphong"
                        />
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="content">Tiền cọc:</label>
                        <form:input class="form-control" id="content" path="tiencoc"
                        />
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="content">Diện tích:</label>
                        <form:input class="form-control" id="content" path="dientich"
                        />
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="content">Người đăng:</label>
                        <input class="form-control" id="content" name="tentaikhoan"
                               value="${post.tentaikhoan.tentaikhoan}" disabled="true"
                        />
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 mb-3" id="tinhtrangField" style="display: none">
                        <label for="content">Tình trạng:</label>
                        <form:select class="form-control" id="content" path="tinhtrang">
                            <form:options items="${tinhtrang}" itemValue="value" itemLabel="label"/>
                        </form:select>
                    </div>
                    <div class="col-md-6 mb-3" id="trangthaiField" style="display: none">
                        <label for="content">Trạng thái:</label>
                        <form:select class="form-control" id="content" path="trangthai">
                            <form:options items="${trangthai}" itemValue="value" itemLabel="label"/>
                        </form:select>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 mb-3">
                        <label for="content">Địa chỉ:</label>
                        <select class="form-control" id="diachi" name="diachi" onclick="showPopup()"
                                onmousedown="preventDropdown(event)">
                            <c:if test="${not empty post.diachi}">
                                <option value="${post.diachi}">${post.diachi}</option>
                            </c:if>
                            <c:if test="${empty post.diachi}">
                                <option value="">Chọn địa chỉ</option>
                            </c:if>
                        </select>
                    </div>
                    <div class="col-md-12 mb-3">
                        <label for="content">Mô tả:</label>
                        <form:textarea class="form-control" id="content" path="mota"
                        />
                    </div>
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
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng
                                    </button>
                                    <button type="button" class="btn btn-primary" onclick="saveAddress()">Lưu
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="mb-3 d-flex justify-content-between">
            <a type="submit" href="/admin/post" class="btn btn-secondary btn-block">Quay lại</a>
            <div>
                <button type="button" id="tinhtrangBtn" class="btn btn-success btn-block"
                        onclick="toggleField('tinhtrangField', 'tinhtrangBtn')">Tình trạng
                </button>
                <button type="button" id="trangthaiBtn" class="btn btn-warning btn-block"
                        onclick="toggleField('trangthaiField', 'trangthaiBtn')">Trạng thái
                </button>
            </div>
            <button formaction="add/send" id="addUser" type="submit" class="btn btn-dark btn-block">Thêm</button>
            <div id="editUser">
                <button formaction="/admin/post/delete/${post.maphong}" type="submit"
                        class="btn btn-danger btn-block" onclick="return confirm('Xác nhận xóa ?')">Xóa
                </button>
                <button formaction="send/${post.maphong}" type="submit"
                        class="btn btn-dark btn-block">Sửa
                </button>
            </div>
            </form:form>
        </div>
</main>
</body>
</html>