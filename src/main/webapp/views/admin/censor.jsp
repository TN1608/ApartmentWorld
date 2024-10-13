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
    <link rel="stylesheet" href="../../css/admin/style.css">

</head>
<body>
<jsp:include page="_header.jsp"/>
<jsp:include page="_aside.jsp"/>
<main class="mt-5 pt-3">
    <div class="container-fluid">
        <ul class="nav nav-tabs justify-content-center" id="myTab" role="tablist">
            <li class="nav-item" role="presentation">
                <button class="nav-link active" id="cccd-tab" data-bs-toggle="tab" data-bs-target="#cccd-tab-pane"
                        type="button" role="tab" aria-controls="cccd-tab-pane" aria-selected="true">Duyệt Xác thực
                    (${waitingUsers.size()})
                </button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="post-tab" data-bs-toggle="tab" data-bs-target="#post-tab-pane"
                        type="button" role="tab" aria-controls="post-tab-pane" aria-selected="false">Duyệt bài
                    đăng (${waitingPosts.size()})
                </button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="seller-tab" data-bs-toggle="tab" data-bs-target="#seller-tab-pane"
                        type="button" role="tab" aria-controls="seller-tab-pane" aria-selected="false">Duyệt người bán
                    (${waitingSellers.size()})
                </button>
            </li>
            <%--                <li class="nav-item" role="presentation">--%>
            <%--                    <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact-tab-pane" type="button" role="tab" aria-controls="contact-tab-pane" aria-selected="false">Contact</button>--%>
            <%--                </li>--%>
        </ul>
        <div class="tab-content" id="myTabContent">
            <div class="tab-pane fade show active" id="cccd-tab-pane" role="tabpanel" aria-labelledby="cccd-tab"
                 tabindex="0">
                <%--                Xác thực CCCD--%>
                <div class="container-fluid p-2">
                    <c:if test="${not empty waitingUsers}">
                        <table class="table table-striped table-hover">
                            <thead>
                            <tr>
                                <th scope="col">STT</th>
                                <th scope="col">Tên tài khoản</th>
                                <th scope="col">Họ và tên</th>
                                <th scope="col">Ngày thêm</th>
                                <th scope="col">Thao tác</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${waitingUsers}" var="user" varStatus="loop">
                                <tr>
                                    <th scope="row">${loop.index + 1}</th>
                                    <td>${user.taikhoan.tentaikhoan}</td>
                                    <td>${user.taikhoan.firstname} ${user.taikhoan.lastname}</td>
                                    <td>
                                        <fmt:formatDate value="${user.ngaythem}" pattern="dd/MM/yyyy"/>
                                    </td>
                                    <td>
                                        <div class="btn-group" role="group" aria-label="Basic example">
                                            <a href="kiemduyet/cccd/${user.taikhoan.tentaikhoan}" type="submit"
                                               class="btn btn-secondary">Xem chi tiết
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </c:if>
                    <c:if test="${empty waitingUsers}">
                        <h4 class="text-center fw-bold">Không có tài khoản nào chờ duyệt </h4>
                    </c:if>
                </div>
            </div>
            <div class="tab-pane fade" id="post-tab-pane" role="tabpanel" aria-labelledby="post-tab"
                 tabindex="0">
                <%--                Duyệt bài đăng--%>
                <div class="container-fluid p-2">
                    <c:if test="${not empty waitingPosts}">
                        <table class="table table-striped table-hover">
                            <thead>
                            <tr>
                                <th scope="col">STT</th>
                                <th scope="col">Tên bài đăng</th>
                                <th scope="col">Người đăng</th>
                                <th scope="col">Ngày thêm</th>
                                <th scope="col">Thao tác</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${waitingPosts}" var="post" varStatus="loop">
                                <tr>
                                    <th scope="row">${loop.index + 1}</th>
                                    <td>${post.tenphong}</td>
                                    <td>${post.tentaikhoan.tentaikhoan}</td>
                                    <td>
                                        <fmt:formatDate value="${post.convert(post.ngaytao)}"
                                                        pattern="dd/MM/yyyy hh:mm:ss"/>
                                    </td>
                                    <td>
                                        <div class="btn-group" role="group" aria-label="Basic example">
                                            <a href="kiemduyet/baidang/${post.maphong}" type="submit"
                                               class="btn btn-secondary">Xem chi tiết
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </c:if>
                    <c:if test="${empty waitingPosts}">
                        <h4 class="text-center fw-bold">Bài đăng trống</h4>
                    </c:if>
                </div>
            </div>
            <div class="tab-pane fade" id="seller-tab-pane" role="tabpanel" aria-labelledby="seller-tab"
                 tabindex="0">
                <%--                Duyệt bài đăng--%>
                <div class="container-fluid p-2">
                    <c:if test="${not empty waitingSellers}">
                        <table class="table table-striped table-hover">
                            <thead>
                            <tr>
                                <th scope="col">STT</th>
                                <th scope="col">Tên Tài Khoản</th>
                                <th scope="col">Email</th>
                                <th scope="col">Số điện thoại</th>
                                <th scope="col">Gói</th>
                                <th scope="col">Thao tác</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${waitingSellers}" var="seller" varStatus="loop">
                                <tr>
                                    <th scope="row">${loop.index + 1}</th>
                                    <td>${seller.tentaikhoan}</td>
                                    <td>${seller.email}</td>
                                    <td>${seller.sodienthoai}</td>
                                    <c:if test="${seller.seller == 'WAITING_FREE'}">
                                        <td>Free</td>
                                    </c:if>
                                    <c:if test="${seller.seller == 'WAITING_PREMIUM'}">
                                        <td>Premium</td>
                                    </c:if>
                                    <td>
                                        <div class="btn-group" role="group" aria-label="Basic example">
                                            <a href="kiemduyet/seller/${seller.tentaikhoan}/accept" type="submit"
                                               class="btn btn-secondary">Chấp nhận
                                            </a>
                                            <a href="kiemduyet/seller/${seller.tentaikhoan}/reject" type="submit"
                                               class="btn btn-danger">Từ chối
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </c:if>
                    <c:if test="${empty waitingSellers}">
                        <h4 class="text-center fw-bold">Chưa có người đăng ký</h4>
                    </c:if>
                </div>
            </div>
            <%--                <div class="tab-pane fade" id="contact-tab-pane" role="tabpanel" aria-labelledby="contact-tab" tabindex="0">...</div>--%>
        </div>
    </div>
</main>

</body>
</html>