<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
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
                href="#"
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
                            class="nav-link dropdown-toggle ms-2"
                            href="#"
                            role="button"
                            data-bs-toggle="dropdown"
                            aria-expanded="false"
                    >
                        <i class="fa-solid fa-bell"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end">
<%--                        <li><a class="dropdown-item" href="#">Thông tin</a></li>--%>
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
<%--Offcanvas--%>
<div class="offcanvas offcanvas-start sidebar-nav bg-dark"
     tabindex="-1"
     id="sidebar">
    <div class="offcanvas-body p-0">
        <nav class="navbar-dark">
            <ul class="navbar-nav">
                <li>
                    <div class="text-muted small fw-bold text-uppercase px-3">
                        CORE
                    </div>
                </li>
                <li>
                    <a href="#" class="nav-link px-3 active">
                        <span class="me-2"><i class="fa-solid fa-torii-gate"></i></span>
                        <span>Dashboard</span>
                    </a>
                </li>
                <li class="my-4">
                    <hr class="dropdown-divider bg-light"/>
                </li>
                <li>
                    <div class="text-muted small fw-bold text-uppercase px-3 mb-3">
                        Interface
                    </div>
                </li>
                <li>
                    <a
                            class="nav-link px-3 sidebar-link"
                            data-bs-toggle="collapse"
                            href="#layouts"
                    >
                        <span class="me-2"><i class="fa-solid fa-layer-group"></i></span>
                        <span>Quản Lý</span>
                        <span class="ms-auto">
                  <span class="right-icon">
                    <i class="fa-solid fa-chevron-down"></i>
                  </span>
                </span>
                    </a>
                    <div class="collapse" id="layouts">
                        <ul class="navbar-nav ps-3">
                            <li>
                                <a href="#" class="nav-link px-3">
                      <span class="me-2"
                      ><i class="fa-regular fa-circle-dot"></i></span>
                                    <span>Phòng trọ</span>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="nav-link px-3">
                      <span class="me-2"
                      ><i class="fa-regular fa-circle-dot"></i></span>
                                    <span>Người dùng</span>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="nav-link px-3">
                      <span class="me-2"
                      ><i class="fa-regular fa-circle-dot"></i></span>
                                    <span>Kiểm duyệt</span>
                                </a>
                            </li>
                            <li>
                                <a href="#" class="nav-link px-3">
                      <span class="me-2"
                      ><i class="fa-regular fa-circle-dot"></i></span>
                                    <span>Doanh thu</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </li>
                <li>
                    <a href="#" class="nav-link px-3">
                        <span class="me-2"><i class="fa-solid fa-book-open"></i></span>
                        <span>Pages</span>
                    </a>
                </li>
                <li class="my-4">
                    <hr class="dropdown-divider bg-light"/>
                </li>
                <li>
                    <div class="text-muted small fw-bold text-uppercase px-3 mb-3">
                        Addons
                    </div>
                </li>
                <li>
                    <a href="#" class="nav-link px-3">
                        <span class="me-2"><i class="fa-solid fa-arrow-trend-up"></i></span>
                        <span>Charts</span>
                    </a>
                </li>
                <li>
                    <a href="#" class="nav-link px-3">
                        <span class="me-2"><i class="fa-solid fa-table"></i></span>
                        <span>Tables</span>
                    </a>
                </li>
            </ul>
        </nav>
    </div>
</div>
<%--Offcanvas--%>