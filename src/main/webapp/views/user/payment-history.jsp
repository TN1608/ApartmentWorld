<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <!--    Bootstrap-->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
            integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
            integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
    <%--    font awesome--%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
          integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet" href="/css/settings.css">
    <link rel="stylesheet" href="/css/header.css">
    <link rel="stylesheet" href="/css/footer.css">
    <base href="${pageContext.request.contextPath}/">
    <script src="/js/app.js"></script>
    <title>ApartmentWorld</title>
</head>
<body>
<jsp:include page="../_header.jsp"/>
<!-- Main content here -->
<div class="container p-5">
    <h4 class="mb-2 fw-bold">Thông tin cá nhân</h4>
    <div class="row">
        <jsp:include page="_aside.jsp"/>
        <div class="col-8">
            <div class="card">
                <div class="card-body">
                    <div class="tab-content" id="v-pills-tabContent">
                        <div class="tab-pane fade" id="v-pills-profile" role="tabpanel"
                             aria-labelledby="v-pills-profile-tab" tabindex="0">

                        </div>
                        <div class="tab-pane fade" id="v-pills-linking" role="tabpanel"
                             aria-labelledby="v-pills-linking-tab" tabindex="0">

                        </div>
                        <div class="tab-pane fade show active" id="v-pills-payment-history" role="tabpanel"
                             aria-labelledby="v-pills-payment-history-tab" tabindex="0">
                            <div class="container mt-4">
                                <h3 class="mb-4">Lịch sử thanh toán</h3>
                                <table class="table table-bordered">
                                    <thead>
                                    <tr>
                                        <th scope="col">Mã thanh toán</th>
                                        <th scope="col">Mã hợp đồng</th>
                                        <th scope="col">Số tiền</th>
                                        <th scope="col">Ngày thanh toán</th>
                                        <th scope="col">Hình thức thanh toán</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="payment" items="${paymentHistory}">
                                        <td>${payment.id}</td>
                                        <td>${payment.maHD.maHD}</td>
                                        <td>${payment.sotien}</td>
                                        <td>${payment.ngaythanhtoan}</td>
                                        <td>${payment.hinhthucthanhtoan}</td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="v-pills-account-settings" role="tabpanel"
                             aria-labelledby="v-pills-account-settings-tab" tabindex="0">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Main content here -->

</body>
<jsp:include page="../_footer.jsp"/>
</html>
