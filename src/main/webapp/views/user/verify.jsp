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
    <script src="/js/link.js"></script>
    <title>ApartmentWorld</title>
    <style>
        html, body {
            height: 100%;
            margin: 0;
            display: flex;
            flex-direction: column;
        }

        .container {
            flex: 1;
        }
    </style>
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
                <div class="card-body ">
                    <div class="tab-content" id="v-pills-tabContent">
                        <div class="tab-pane fade" id="v-pills-profile" role="tabpanel"
                             aria-labelledby="v-pills-profile-tab" tabindex="0">

                        </div>
                        <div class="tab-pane fade show active" id="v-pills-linking" role="tabpanel"
                             aria-labelledby="v-pills-linking-tab" tabindex="0">
                            <div class="container mt-4">
                                <h3>Xác thực thông tin</h3>
                                <form:form class="row g-3" action="/user/settings/verify/updateCCCD"
                                           modelAttribute="CCCD" method="post" enctype="multipart/form-data">
                                    <div class="col-md-6">
                                        <label for="maCCCD" class="form-label">Mã CCCD</label>
                                        <form:input path="maCCCD" type="text" class="form-control" id="maCCCD"
                                                    value="${CCCD.maCCCD}"/>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="tenCCCD" class="form-label">Họ và Tên</label>
                                        <form:input path="tenCCCD" type="text" class="form-control" id="tenCCCD"
                                                    value="${CCCD.tenCCCD}"/>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="ngaysinh" class="form-label">Ngày Sinh</label>
                                        <form:input path="ngaysinh" type="date" class="form-control" id="ngaysinh"
                                                    value="${CCCD.ngaysinh}"/>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="ngaycap" class="form-label">Ngày cấp</label>
                                        <form:input path="ngaycap" type="date" class="form-control" id="ngaycap"
                                                    value="${CCCD.ngaycap}"/>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="noicap" class="form-label">Nơi cấp</label>
                                        <form:input path="noicap" type="text" class="form-control" id="noicap"
                                                    value="${CCCD.noicap}"/>
                                    </div>
                                    <div class="col-md-6">

                                    </div>
                                    <div class="col-md-6">
                                        <label for="anhCCCDtruoc" class="form-label">Ảnh CCCD (Mặt trước)</label>
                                        <input type="file" name="anhTruoc" class="form-control" id="anhCCCDtruoc"
                                               accept="image/*"/>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="anhCCCDsau" class="form-label">Ảnh CCCD (Mặt sau)</label>
                                        <input type="file" name="anhSau" class="form-control" id="anhCCCDsau"
                                               accept="image/*"/>
                                    </div>
                                    <div class="col-md-6">
                                        <button type="submit" class="btn btn-primary fw-bold mt-2">Cập nhật CCCD
                                        </button>
                                    </div>
                                </form:form>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="v-pills-payment-history" role="tabpanel"
                             aria-labelledby="v-pills-payment-history-tab" tabindex="0">

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
