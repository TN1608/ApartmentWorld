<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<html>
<header>
    <%--    <div class="d-flex justify-content-end">--%>
    <%--        <div class="dropdown">--%>
    <%--            <a class="dropdown-toggle nav-link fs-6 p-1" href="#" role="button" data-bs-toggle="dropdown"--%>
    <%--               aria-expanded="false"><s:message code="header.mn.language"/>--%>
    <%--            </a>--%>
    <%--            <ul class="dropdown-menu">--%>
    <%--                <li><a class="dropdown-item" href="?lang=vi">Tiếng Việt</a></li>--%>
    <%--                <li><a class="dropdown-item" href="?lang=en">English</a></li>--%>
    <%--            </ul>--%>
    <%--        </div>--%>
    <%--    </div>--%>
    <div class="d-flex justify-content-end me-4">
        <span class="text-muted">Ngôn ngữ:</span><a href="?lang=vi" class="text-decoration-none">vi-VN</a>
        <span class="text-muted">|</span><a class="text-decoration-none" href="?lang=en" class="">en-US</a>
    </div>
    <nav class="navbar navbar-expand-lg bg-body-tertiary align-items-center d-flex justify-content-center">
        <div class="container-fluid">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo01"
                    aria-controls="navbarTogglerDemo01" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <a class="nav-brand navbar-toggler text-decoration-none border border-0" href="/">
                <img src="../images/icon/logo.png" alt="logo" width="20" height="20"
                     class="d-inline-block align-top"> ApartmentWorld</a>
            <div class="collapse navbar-collapse" id="navbarTogglerDemo01">
                <a class="navbar-brand" href="/home">
                    <img src="../images/icon/logo.png" alt="logo" width="30" height="30"
                         class="d-inline-block align-top">
                    <span>ApartmentWorld</span>
                </a>
                <ul class="navbar-nav mx-auto mb-2 mb-lg-0">
                    <li class="nav-item d-flex align-items-center ms-5">
                        <a class="nav-link" href="/test"><s:message code="header.mn.contact"/></a>
                    </li>
                    <li class="nav-item d-flex align-items-center">
                        <a class="nav-link" href="#"><i class="bi bi-bag-fill text-success me-2"></i><s:message
                                code="header.mn.order"/> </a>
                    </li>
                    <li class="nav-item d-flex align-items-center">
                        <div class="dropdown">
                            <a class="dropdown-toggle nav-link" href="#" role="button" data-bs-toggle="dropdown"
                               aria-expanded="false">
                                <i class="bi bi-bell-fill text-warning me-2"></i><s:message
                                    code="header.mn.notification"/>
                                <c:if test="${not empty notifications}">
                                    <span class="position-absolute translate-middle p-2 bg-danger border border-light rounded-circle"
                                          style="left: 15%">
                                   <span class="visually-hidden">New alerts</span>
                                </span>
                                </c:if>
                            </a>
                            <ul class="dropdown-menu p-2">
                                <li>
                                    <h4 class="fw-bold text-center notifi"><s:message
                                            code="header.mn.notification"/></h4>
                                    <hr>
                                    <c:if test="${empty notifications}">
                                        <p class="text-center"><s:message code="header.mn.notification.none"/></p>
                                    </c:if>
                                    <c:if test="${not empty notifications}">
                                        <c:forEach items="${notifications}" var="tb">
                                            <div class="d-flex flex-column ">
                                                <label>${tb.message}</label>
                                                <label>Vào lúc: <fmt:formatDate value="${tb.convertDate(tb.createAt)}"
                                                                                pattern="dd/MM/yy hh:mm:ss a"/></label>
                                                <hr class="mt-1 mb-2"/>
                                            </div>
                                        </c:forEach>
                                        <label class="make-read d-flex justify-content-end">
                                            <a id="readAllNotifications"
                                               class=""><s:message
                                                    code="header.mn.notification.readAll"/></a>
                                        </label>
                                    </c:if>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <c:if test="${not empty user}">
                        <li class="nav-item d-flex align-items-center cDropDown">
                            <div class="dropdown">
                                <a class="dropdown-toggle nav-link d-block justify-content-center" href="/user"
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
                                    <li class="dropdown-header">Tiện ích</li>
                                    <li><a class="dropdown-item" href="/wishlists"><s:message code="header.mn.wishlist" /></a></li>
                                    <li><a class="dropdown-item" href="/dang-tin"><s:message code="header.mn.addPost"/></a></li>
                                    <li class="dropdown-header">Dịch vụ trả phí</li>
                                    <li><a class="dropdown-item" href="user/settings/payment-history"><s:message code="header.mn.paymentHistory"/></a></li>
                                    <c:if test="${user.status == 'APPROVED'}">
                                        <li><a class="dropdown-item" href="/register-seller"><s:message code="header.mn.registerSeller"/></a></li>
                                    </c:if>
                                    <li class="dropdown-header">Khác</li>
                                    <li><a class="dropdown-item" href="/user"><s:message code="header.mn.profile"/></a></li>
                                    <li><a class="dropdown-item" href="/reviewaboutme"><s:message code="header.mn.review"/></a></li>
                                    <li><a class="dropdown-item" href="/logout"><s:message code="header.mn.logout"/></a></li>
                                    <c:if test="${user.vaitro}">
                                        <li><a class="dropdown-item" href="/admin/home"><s:message code="header.mn.admin"/></a></li>
                                    </c:if>
<%--                                    <li><a class="dropdown-item" href="/user"><s:message--%>
<%--                                            code="header.mn.profile"/></a></li>--%>
<%--                                    <c:if test="${user.status == 'APPROVED'}">--%>
<%--                                        <li><a class="dropdown-item" href="/register-seller"><s:message--%>
<%--                                                code="header.mn.registerSeller"/></a></li>--%>
<%--                                    </c:if>--%>
<%--                                    <li><a class="dropdown-item" href="/dang-tin"><s:message--%>
<%--                                            code="header.mn.addPost"/></a></li>--%>
<%--                                    <li><a class="dropdown-item" href="#"><s:message--%>
<%--                                            code="header.mn.paymentHistory"/></a></li>--%>
<%--                                    <li><a class="dropdown-item" href="/logout"><s:message code="header.mn.logout"/></a>--%>
<%--                                    </li>--%>
<%--                                    <c:if test="${user.vaitro}">--%>
<%--                                        <hr>--%>
<%--                                        <li><a class="dropdown-item" href="/admin/home"><s:message--%>
<%--                                                code="header.mn.admin"/></a></li>--%>
<%--                                    </c:if>--%>
                                </ul>
                            </div>
                        </li>
                    </c:if>
                    <c:if test="${empty user}">
                        <li class="nav-item d-flex align-items-center">
                            <div class="dropdown">
                                <a class="dropdown-toggle nav-link d-block justify-content-center" href="/user"
                                   role="button" data-bs-toggle="dropdown"
                                   aria-expanded="false">
                                    <i class="fa-solid fa-user"></i>
                                    <span><s:message code="header.mn.account"/></span>
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="/login"><s:message code="header.mn.login"/></a>
                                    </li>
                                    <li><a class="dropdown-item" href="/signup"><s:message
                                            code="header.mn.register"/></a></li>
                                </ul>
                            </div>
                        </li>
                    </c:if>
                </ul>
            </div>
        </div>
    </nav>
</header>
<%--noti box--%>
<div class="notiBox" id="notificationBox">
    <span id="notiBoxMessage">${notiBox}</span>
    <button class="close-notiBox" id="closeNotiBox">&times;</button>
    <div class="notiBox-progress-bar" id="notiBoxProgressBar"></div>
</div>