<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
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
    <link rel="stylesheet" href="../../css/profile.css">
    <link rel="stylesheet" href="../../css/header.css">
    <link rel="stylesheet" href="../../css/footer.css">

    <script src="../../js/app.js"></script>
    <title>ApartmentWorld</title>
</head>
<body>
<jsp:include page="../header.jsp"/>
<!-- Main content here -->
<div class="container p-5">
    <div class="row">
        <aside class="col-sm-4">
            <!-- Profile Card -->
            <div class="card profile-card" style="width: 18rem; position: relative;">
                <!-- Banner -->
                <div class="banner-container position-relative">
                    <img src="../../images/avatar/banner.jpg" class="card-img-top" alt="Banner"
                         style="height: 150px; object-fit: cover;">
                    <!-- Icon to change banner -->
                    <%--                    <label for="banner-upload" class="position-absolute"--%>
                    <%--                           style="top: 10px; right: 10px; cursor: pointer;">--%>
                    <%--                        <i class="fa-solid fa-camera"></i>--%>
                    <%--                        <input type="file" id="banner-upload" style="display: none;">--%>
                    <%--                    </label>--%>
                </div>
                <!-- Avatar -->
                <div class="avatar-container text-center"
                     style="position: absolute; top: 100px; left: 50%; transform: translateX(-50%);">
                    <c:if test="${empty user.anhtaikhoan}">
                        <img src="../../images/avatar/default.png" class="rounded-circle" alt="Avatar"
                             style="width: 100px; height: 100px; border: 5px solid white;">
                    </c:if>
                    <c:if test="${not empty user.anhtaikhoan}">
                        <img src="../../images/avatar/${user.anhtaikhoan}" class="rounded-circle" alt="Avatar"
                             style="width: 100px; height: 100px; border: 5px solid white;">
                    </c:if>
                    <!-- Icon to change avatar -->
                    <%--                    <label for="avatar-upload" class="position-absolute"--%>
                    <%--                           style="bottom: 0; right: -10px; cursor: pointer;">--%>
                    <%--                        <i class="fa-solid fa-camera"></i>--%>
                    <%--                        <input type="file" id="avatar-upload" style="display: none;">--%>
                    <%--                    </label>--%>
                </div>
                <div class="card-body text-center mt-5">
                    <h5 class="card-title">${user.tentaikhoan}
                        <c:if test="${not empty user.firstname and not empty user.lastname}">
                            (${user.firstname} ${user.lastname})
                        </c:if>
                    </h5>
                    <p class="card-text">${user.mota}</p>
                    <a href="/user/settings/profile" class="btn btn-warning fw-bold mb-2 w-100">Chỉnh sửa thông tin cá
                        nhân</a>
                    <p class="card-text text-start m-2"><i class="bi bi-calendar-check me-2"></i>Ngày tham gia: 0</p>
                    <p class="card-text text-start verify m-2"><i
                            class="bi bi-patch-check-fill text-success me-2"></i></i>Verify : <a href="#"
                                                                                                 class="me-2"><i
                            class="bi bi-facebook"></i></a><a href="#" class="me-2"><i
                            class="bi bi-telephone-fill text-warning"></i></a><a class="me-2" href="#"><i
                            class="bi bi-google text-danger"></i></a></p>
                    <p class="card-text text-start m-2"><i class="bi bi-house-check-fill me-2"></i>Địa chỉ : Trống</p>
                </div>
            </div>
        </aside>
        <div class="col-8">
            <ul class="nav nav-tabs" id="myTab" role="tablist">
                <li class="nav-item" role="presentation">
                    <button class="nav-link active" id="view-tab" data-bs-toggle="tab" data-bs-target="#view-tab-pane"
                            type="button" role="tab" aria-controls="view-tab-pane" aria-selected="true">Đang hiển thị(0)
                    </button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="result-tab" data-bs-toggle="tab" data-bs-target="#result-tab-pane"
                            type="button" role="tab" aria-controls="result-tab-pane" aria-selected="false">Giao dịch
                        hoàn thành(0)
                    </button>
                </li>
                <%--                <li class="nav-item" role="presentation">--%>
                <%--                    <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact-tab-pane" type="button" role="tab" aria-controls="contact-tab-pane" aria-selected="false">Contact</button>--%>
                <%--                </li>--%>
            </ul>
            <div class="tab-content" id="myTabContent">
                <div class="tab-pane fade show active" id="view-tab-pane" role="tabpanel" aria-labelledby="view-tab"
                     tabindex="0">
                    <div class="container-fluid p-2">
                        <h4 class="text-center fw-bold">Bài đăng trống</h4>
                    </div>
                </div>
                <div class="tab-pane fade" id="result-tab-pane" role="tabpanel" aria-labelledby="result-tab"
                     tabindex="0">
                    <div class="container-fluid p-2">
                        <h4 class="text-center fw-bold">Bài đăng trống</h4>
                    </div>
                </div>
                <%--                <div class="tab-pane fade" id="contact-tab-pane" role="tabpanel" aria-labelledby="contact-tab" tabindex="0">...</div>--%>
            </div>
        </div>
    </div>
</div>
<!-- Main content here -->
<jsp:include page="../footer.jsp"/>
</body>
</html>