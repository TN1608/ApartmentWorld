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
    <link rel="stylesheet" href="/css/createPost.css">
    <link rel="stylesheet" href="/css/header.css">
    <link rel="stylesheet" href="/css/footer.css">
    <base href="${pageContext.request.contextPath}/">
    <script src="/js/app.js"></script>
    <title>ApartmentWorld</title>
</head>
<jsp:include page="../_header.jsp"/>
<body>
<!-- Main content here -->
    <div class="container p-5">
        <form:form action="/dang-tin" modelAttribute="phongtro" method="post" enctype="multipart/form-data">
        <div class="row g-3 bg-secondary rounded-2">
            <div class="col-md-3 bg-warning">
                <h3>Hình ảnh và video phòng trọ</h3>
                <p>Xem thêm về <a href="#">Quy định đăng tin của ApartMentWorld</a></p>
            </div>
            <div class="col-md-9 bg-success">
                <div class="col-md-8">
                    <label for="tenphong" class="form-label">Tên phòng</label>
                    <form:input path="tenphong" class="form-control" id="tenphong"/>
                </div>
                <div class="col-md-8">
                    <label for="tinhtrang" class="form-label">Thông tin khác</label>
                    <form:select path="matinhtrang" id="tinhtrang" class="form-select" items="matinhtrang"
                    </form:select>
                </div>
            </div>
        </div>
        </form:form>
    </div>
<!-- Main content here -->
</body>
<jsp:include page="../_footer.jsp"/>
</html>