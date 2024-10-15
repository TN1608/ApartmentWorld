<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%--Offcanvas--%>
<div class="offcanvas offcanvas-start sidebar-nav bg-dark"
     tabindex="-1"
     id="sidebar">
    <div class="offcanvas-body p-0">
        <nav class="navbar-dark">
            <ul class="navbar-nav">
                <li>
                    <div class="text-muted small fw-bold text-uppercase px-3">
                        Mục Chính
                    </div>
                </li>
                <li>
                    <a href="#" class="nav-link px-3 active">
                        <span class="me-2"><i class="fa-solid fa-torii-gate"></i></span>
                        <span>Trang Quản Lý</span>
                    </a>
                </li>
                <li class="my-4">
                    <hr class="dropdown-divider bg-light"/>
                </li>
                <li>
                    <div class="text-muted small fw-bold text-uppercase px-3 mb-3">
                        Mục Quản Lý
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
                                <a href="user" class="nav-link px-3">
                      <span class="me-2"
                      ><i class="fa-regular fa-circle-dot"></i></span>
                                    <span>Người dùng</span>
                                </a>
                            </li>
                            <li>
                                <a href="post" class="nav-link px-3">
                      <span class="me-2"
                      ><i class="fa-regular fa-circle-dot"></i></span>
                                    <span>Bài đăng</span>
                                </a>
                            </li>
                            <li>
                                <a href="kiemduyet" class="nav-link px-3">
                      <span class="me-2"
                      ><i class="fa-regular fa-circle-dot"></i></span>
                                    <span>Kiểm duyệt</span>
                                </a>
                            </li>
                            <li>
                                <a href="revenue" class="nav-link px-3">
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
                        Mục khác
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