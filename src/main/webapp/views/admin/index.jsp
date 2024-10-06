<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Home</title>
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
<main class="mt-5 pt-3">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <h4>Dashboard</h4>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3 mb-3">
                <div class="card bg-primary text-white h-100">
                    <div class="card-body py-5">Primary Card</div>
                    <div class="card-footer d-flex">
                        View Details
                        <span class="ms-auto">
                  <i class="bi bi-chevron-right"></i>
                </span>
                    </div>
                </div>
            </div>
            <div class="col-md-3 mb-3">
                <div class="card bg-warning text-dark h-100">
                    <div class="card-body py-5">Warning Card</div>
                    <div class="card-footer d-flex">
                        View Details
                        <span class="ms-auto">
                  <i class="bi bi-chevron-right"></i>
                </span>
                    </div>
                </div>
            </div>
            <div class="col-md-3 mb-3">
                <div class="card bg-success text-white h-100">
                    <div class="card-body py-5">Success Card</div>
                    <div class="card-footer d-flex">
                        View Details
                        <span class="ms-auto">
                  <i class="bi bi-chevron-right"></i>
                </span>
                    </div>
                </div>
            </div>
            <div class="col-md-3 mb-3">
                <div class="card bg-danger text-white h-100">
                    <div class="card-body py-5">Danger Card</div>
                    <div class="card-footer d-flex">
                        View Details
                        <span class="ms-auto">
                  <i class="bi bi-chevron-right"></i>
                </span>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6 mb-3">
                <div class="card h-100">
                    <div class="card-header">
                        <span class="me-2"><i class="bi bi-bar-chart-fill"></i></span>
                        Area Chart Example
                    </div>
                    <div class="card-body">
                        <canvas class="chart" width="400" height="200"></canvas>
                    </div>
                </div>
            </div>
            <div class="col-md-6 mb-3">
                <div class="card h-100">
                    <div class="card-header">
                        <span class="me-2"><i class="bi bi-bar-chart-fill"></i></span>
                        Area Chart Example
                    </div>
                    <div class="card-body">
                        <canvas class="chart" width="400" height="200"></canvas>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12 mb-3">
                <div class="card">
                    <div class="card-header">
                        <span><i class="bi bi-table me-2"></i></span> Data Table
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table
                                    id="example"
                                    class="table table-striped data-table"
                                    style="width: 100%"
                            >
                                <thead>
                                <tr>
                                    <th>STT</th>
                                    <th>
                                        <a class="text-decoration-none text-black"
                                           href="/admin/home?field=tentaikhoan">ID</a>
                                    </th>
                                    <th>
                                        <a class="text-decoration-none text-black"
                                           href="/admin/home?field=firstname">FullName</a>
                                    </th>
                                    <th>
                                        <a class="text-decoration-none text-black"
                                           href="/admin/home?field=sodienthoai">Phone</a>
                                    </th>
                                    <th><a class="text-decoration-none text-black"
                                           href="/admin/home?field=gioitinh">Gender</a></th>
                                    <th>Image</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="user" items="${pages.content}" varStatus="status">
                                <tr>
                                    <td>${pages.number * pages.size + status.index + 1}</td>
                                    <td>${user.tentaikhoan}</td>
                                    <td>${user.firstname} ${user.lastname}</td>
                                    <td>${user.sodienthoai}</td>
                                    <td>${user.gioitinh ? "Nữ" : "Nam"}</td>
                                    <td><a href="/images/avatar/${user.anhtaikhoan}"
                                           class="text-decoration-none text-black">
                                        <img alt="${user.tentaikhoan}" src="../../images/avatar/${user.anhtaikhoan}"
                                             class="img-fluid" width="40px">
                                    </a>
                                    </td>
                                </tr>
                                </c:forEach>
                                <%--                                <tfoot>--%>
                                <%--                                <tr>--%>
                                <%--                                    <th>Name</th>--%>
                                <%--                                    <th>Position</th>--%>
                                <%--                                    <th>Office</th>--%>
                                <%--                                    <th>Age</th>--%>
                                <%--                                    <th>Start date</th>--%>
                                <%--                                    <th>Salary</th>--%>
                                <%--                                </tr>--%>
                                <%--                                </tfoot>--%>
                            </table>
                        </div>
                        <%--                        pegination--%>
                        <nav aria-label="Page navigation example">
                            <ul class="pagination">
                                <li class="page-item">
                                    <a class="page-link"
                                       href="/admin/home?page=${pages.number - 1}&field=${param.field}"
                                       aria-label="Previous">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                                <c:forEach var="i" begin="1" end="${pages.totalPages}">
                                    <li class="page-item">
                                        <a class="page-link"
                                           href="/admin/home?page=${i - 1}&field=${param.field}">${i}</a>
                                    </li>
                                </c:forEach>
                                <li class="page-item">
                                    <a class="page-link"
                                       href="/admin/home?page=${pages.number + 1}&field=${param.field}"
                                       aria-label="Next">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
<script src="../../js/admin/app.js"></script>
</body>
</html>