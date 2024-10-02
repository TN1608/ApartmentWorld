<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<html>
<header>
    <nav class="navbar navbar-expand-lg bg-body-tertiary align-items-center d-flex justify-content-center">
        <div class="container-fluid">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo01"
                    aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
                <a class="navbar-brand" href="/home">
                    <img src="../images/icon/logo.png" alt="logo" width="30" height="30"
                         class="d-inline-block align-top">
                    <span>ApartmentWorld</span>
                </a>
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <form class="d-flex align-items-center searchbar" role="search">
                        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success" type="submit">Search</button>
                    </form>
                    <li class="nav-item d-flex align-items-center ms-5">
                        <a class="nav-link" href="#">Liên hệ</a>
                    </li>
                    <li class="nav-item d-flex align-items-center">
                        <a class="nav-link" href="#"><i class="bi bi-bag-fill text-success me-2"></i>Đơn hàng</a>
                    </li>
                    <li class="nav-item d-flex align-items-center">
                        <div class="dropdown">
                            <a class="dropdown-toggle nav-link" href="#" role="button" data-bs-toggle="dropdown"
                               aria-expanded="false">
                                <i class="bi bi-bell-fill text-warning me-2"></i>Thông báo</a>
                            </a>
                            <ul class="dropdown-menu p-2">
                                <li>
                                    <h4 class="fw-bold text-center">Thông báo</h4>
                                    <hr>
                                    <p>Trống</p>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <c:if test="${not empty user}">
                        <li class="nav-item d-flex align-items-center">
                            <div class="dropdown">
                                <a class="dropdown-toggle nav-link d-block justify-content-center" href="#"
                                   role="button" data-bs-toggle="dropdown"
                                   aria-expanded="false">
                                    <i class="fa-solid fa-user"></i>
                                    <c:choose>
                                        <c:when test="${empty user.firstname and empty user.lastname}">
                                            ${user.tentaikhoan}
                                        </c:when>
                                        <c:otherwise>
                                            ${user.firstname} ${user.lastname}
                                        </c:otherwise>
                                    </c:choose>
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="/user">Thông tin</a></li>
                                    <li><a class="dropdown-item" href="#">Lịch sử thanh toán</a></li>
                                    <li><a class="dropdown-item" href="/logout">Đăng xuất</a></li>
                                    <hr>
                                    <c:if test="${user.vaitro}">
                                        <li><a class="dropdown-item" href="/admin/home">Admin</a></li>
                                    </c:if>
                                </ul>
                            </div>
                        </li>
                    </c:if>
                    <c:if test="${empty user}">
                        <li class="nav-item d-flex align-items-center">
                            <a class="nav-link btn btn-success" href="/login">Đăng nhập</a>
                        </li>
                        <li class="nav-item d-flex align-items-center">
                            <a class="nav-link btn btn-warning" href="/signup">Đăng ký</a>
                        </li>
                    </c:if>
                </ul>
            </div>
        </div>
    </nav>
</header>
</html>