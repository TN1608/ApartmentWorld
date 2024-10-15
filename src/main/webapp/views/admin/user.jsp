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
    <script src="/js/admin/app.js"></script>
</head>
<body>
<jsp:include page="_header.jsp"/>
<jsp:include page="_aside.jsp"/>
<main class="mt-5 pt-3">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <h4>Quản lý người dùng</h4>
                <a href="user/add" class="btn btn-dark mb-3">Thêm người dùng</a>
            </div>
        </div>
        <!-- Search bar -->
        <div class="row mb-3">
            <div class="col-md-12">
                <form action="/admin/user" method="get" class="input-group">
                    <input type="text" class="form-control" name="keyword" placeholder="Tìm kiếm nhân viên..."
                           aria-label="Search" value="${param.keyword}">
                    <button class="btn btn-dark" type="submit">
                        <i class="fa-solid fa-magnifying-glass"></i> Tìm kiếm
                    </button>
                </form>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <span><i class="fa-solid fa-users"></i></span> Danh sách người dùng
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-striped">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th><a class="text-decoration-none text-black"
                                           href="?field=tentaikhoan">Username</a></th>
                                    <th><a class="text-decoration-none text-black"
                                           href="?field=firstname">Họ và Tên</a>
                                    </th>
                                    <th><a class="text-decoration-none text-black"
                                           href="?field=email">Email</a></th>
                                    <th><a class="text-decoration-none text-black"
                                           href="?field=sodienthoai">Số điện thoại</a></th>
                                    <th>Giới tính</th>
                                    <th>Actions</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="user" items="${pages.content}" varStatus="status">
                                    <tr>
                                        <td>${pages.number * pages.size + status.index + 1}</td>
                                        <td>${user.tentaikhoan}</td>
                                        <td>${user.firstname} ${user.lastname}</td>
                                        <td>${user.email}</td>
                                        <td>${user.sodienthoai}</td>
                                        <td>${user.gioitinh ? "Nam" : "Nữ"}</td>
                                        <td>
                                            <a href="user/edit/${user.tentaikhoan}" class="btn btn-sm btn-info">Xem</a>
                                            <a href="user/delete/${user.tentaikhoan}" class="btn btn-sm btn-danger"
                                               onclick="return confirm('Xác nhận xóa?')">Xóa</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <!-- Pagination -->
                        <nav aria-label="Page navigation">
                            <ul class="pagination">
                                <li class="page-item">
                                    <a class="page-link" href="?page=${pages.number - 1}">&laquo;</a>
                                </li>
                                <c:forEach var="i" begin="1" end="${pages.totalPages}">
                                    <li class="page-item ${i == page ? 'active' : ''}">
                                        <a class="page-link" href="?page=${i}">${i}</a>
                                    </li>
                                </c:forEach>
                                <li class="page-item">
                                    <a class="page-link" href="?page=${pages.number + 1}">&raquo;</a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
</body>
</html>