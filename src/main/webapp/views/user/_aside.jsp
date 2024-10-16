<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<aside class="col-sm-4">
    <div class="card">
        <div class="card-body">
            <a href="/user/settings/profile" class="nav-link text-start" role="tab"
               aria-controls="v-pills-profile" aria-selected="false">Thông tin cá nhân</a>
            <a href="/user/settings/linking" class="nav-link text-start" role="tab"
               aria-controls="v-pills-linking" aria-selected="false">Liên kết tài khoản</a>
            <a href="/user/settings/verify" class="nav-link text-start" role="tab"
               aria-controls="v-pills-linking" aria-selected="false">Xác thực tài khoản</a>
            <a href="/user/settings/payment-history" class="nav-link text-start" role="tab"
               aria-controls="v-pills-lichsuthanhtoan" aria-selected="false">Lịch sử thanh toán</a>
            <a href="/user/settings/account-settings" class="nav-link text-start show active" role="tab"
               aria-controls="v-pills-settings" aria-selected="false">Cài đặt tài khoản</a>
<%--            <c:if test="${user.status == 'APPROVED'}">--%>
<%--                <a href="/user/settings/register-seller" class="nav-link text-start show active" role="tab"--%>
<%--                   aria-controls="v-pills-settings" aria-selected="false">Đăng ký làm nhà bán hàng</a>--%>
<%--            </c:if>--%>
        </div>
    </div>
</aside>

