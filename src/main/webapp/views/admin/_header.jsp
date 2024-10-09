<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%--Navbar--%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container-fluid">
        <button
                class="navbar-toggler"
                type="button"
                data-bs-toggle="offcanvas"
                data-bs-target="#sidebar"
                aria-controls="offcanvasExample"
        >
            <span class="navbar-toggler-icon" data-bs-target="#sidebar"></span>
        </button>
        <a
                class="navbar-brand me-auto ms-lg-0 ms-3 text-uppercase fw-bold"
                href="/admin/home"
        >ApartmentWorld Admin</a
        >
        <button
                class="navbar-toggler"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target="#topNavBar"
                aria-controls="topNavBar"
                aria-expanded="false"
                aria-label="Toggle navigation"
        >
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="topNavBar">
            <form class="d-flex ms-auto my-3 my-lg-0">
                <div class="input-group">
                    <input
                            class="form-control"
                            type="search"
                            placeholder="Search"
                            aria-label="Search"
                    />
                    <button class="btn btn-primary" type="submit">
                        <i class="fa-solid fa-magnifying-glass"></i>
                    </button>
                </div>
            </form>
            <ul class="navbar-nav">
                <li class="nav-item dropdown">
                    <a
                            class="nav-link ms-2"
                            href="#"
                            role="button"
                            data-bs-toggle="dropdown"
                            aria-expanded="false"
                    >
                        <i class="fa-solid fa-bell"></i>
                        <c:if test="${not empty waitingUsers}">
                            <span class="position-absolute start-100 translate-middle badge rounded-pill bg-danger">
                                    ${fn:length(waitingUsers)}
                            </span>
                        </c:if>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end">
                        <li><h5 class="fw-bold text-center">Thông báo</h5></li>
                        <hr/>
                        <c:forEach var="user" items="${waitingUsers}">
                            <li>
                                <a class="dropdown-item" href="/admin/kiemduyet">
                                        ${user.taikhoan.tentaikhoan} đợi duyệt xác thực
                                </a>
                            </li>
                        </c:forEach>
                        <c:forEach var="post" items="${pendingPosts}">
                            <li>
                                <a class="dropdown-item" href="#">
                                    Bài đăng ${post.title} đợi duyệt
                                </a>
                            </li>
                        </c:forEach>
                    </ul>
                </li>
                <li class="nav-item dropdown">
                    <a
                            class="nav-link dropdown-toggle ms-2"
                            href="#"
                            role="button"
                            data-bs-toggle="dropdown"
                            aria-expanded="false"
                    >
                        <i class="fa-solid fa-user"></i>
                        ${user.firstname} ${user.lastname}
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end">
                        <li><a class="dropdown-item" href="#">Thông tin</a></li>
                        <li><a class="dropdown-item" href="#">Another action</a></li>
                        <li>
                            <a class="dropdown-item" href="#">Something else here</a>
                        </li>
                        <hr>
                        <li>
                            <a class="dropdown-item" href="/home">Home</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
<%--Navbar--%>