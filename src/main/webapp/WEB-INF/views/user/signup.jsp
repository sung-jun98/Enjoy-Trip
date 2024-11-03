<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>TripEnjoy - SSAFY 회원가입</title>
    <meta name="description" content="">
    <meta name="keywords" content="">

    <!-- Favicons -->
    <link href="${pageContext.request.contextPath}/assets/img/favicon.png" rel="icon">
    <link href="${pageContext.request.contextPath}/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

    <!-- Fonts -->
    <link href="https://fonts.googleapis.com" rel="preconnect">
    <link href="https://fonts.googleapis.com" rel="preconnect" crossorigin>
    <link
        href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900&display=swap"
        rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="${pageContext.request.contextPath}/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/vendor/aos/aos.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

    <!-- Main CSS File -->
    <link href="${pageContext.request.contextPath}/assets/css/main.css" rel="stylesheet">
    <style>
        body {
            background-image: url('${pageContext.request.contextPath}/img/main_2.jpeg');
            /* 원하는 배경 이미지 경로로 수정 */
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            background-attachment: fixed;
        }
    </style>
</head>

<body class="d-flex flex-column min-vh-100">
    <header id="header" class="header fixed-top">
        <div class="branding d-flex align-items-center">
            <div class="container position-relative d-flex align-items-center justify-content-between">
                <a href="${pageContext.request.contextPath}/index.jsp" class="logo d-flex align-items-center me-auto me-xl-0">
                    <h1 class="sitename">TripEnjoy</h1>
                </a>

                <nav id="navmenu" class="navmenu">
                    <ul>
                        <li class="nav-item login-item"><a href="${pageContext.request.contextPath}/user/login">로그인</a></li>
                        <li class="nav-item signup-item"><a href="${pageContext.request.contextPath}/user/signup">회원가입</a></li>
                        <li class="nav-item logout-item d-none"><a href="#" id="logoutButton">로그아웃</a></li>
                        <li class="nav-item mypage-item d-none"><a href="${pageContext.request.contextPath}/user/mypage.jsp">내 정보</a></li>
                        <li class="nav-item admin-item d-none"><a href="${pageContext.request.contextPath}/user/admin.jsp">관리자</a></li>
                    </ul>
                    <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
                </nav>
            </div>
        </div>

    </header>

    <main class="flex-grow-1 d-flex align-items-center justify-content-center mb-5">
        <div class="container">
            <form action="${pageContext.request.contextPath}/user/join" method="post" class="text-center mx-auto form-signup">

                <h1 class="h3 mb-3 fw-normal text-dark">회원가입</h1>

                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="floatingId" name="userid"
                        placeholder="id" required>
                    <label for="floatingEmail">아이디</label>
                </div>
                <div class="form-floating mb-3">
                    <input type="password" class="form-control" id="floatingPassword" name="password"
                        placeholder="Password" required>
                    <label for="floatingPassword">비밀번호</label>
                </div>
                <div class="form-floating mb-3">
                    <input type="password" class="form-control" id="floatingPasswordConfirm" name="password_confirm"
                        placeholder="Confirm Password" required>
                    <label for="floatingPasswordConfirm">비밀번호 확인</label>
                </div>
                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="floatingName" name="name" placeholder="Your Name"
                        required>
                    <label for="floatingName">이름</label>
                </div>
                <div class="form-floating mb-3">
                    <input type="email" class="form-control" id="floatingEmail" name="email" placeholder="example@ssafy.com"
                        required>
                    <label for="floatingEmail">이메일</label>
                </div>
                <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="floatingNickname" name="nickname"
                        placeholder="Your Nickname" required>
                    <label for="floatingNickname">닉네임</label>
                </div>

                <button class="w-100 btn btn-lg btn-primary" type="submit">회원가입</button>
                <p class="mt-3 mb-3 text-muted">&copy; 2024</p>
            </form>
        </div>
    </main>

    <footer id="footer" class="footer mt-auto py-3">
        <div class="container footer-top">

            <div class="container copyright text-center mt-4">
                <p>© <span>Copyright</span> <strong class="px-1 sitename">SSAFY</strong>
                    <span>SamsunSoftwareAcademyForYouth</span>
                </p>
                <div class="credits">
                    Designed by <a href="">Lee Myeong Seong</a> and <a href=""> Choi Eun Chang</a>
                </div>
            </div>
        </div>
    </footer>

    <!-- Vendor JS Files -->
    <script src="${pageContext.request.contextPath}/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/vendor/php-email-form/validate.js"></script>
    <script src="${pageContext.request.contextPath}/assets/vendor/aos/aos.js"></script>
    <script src="${pageContext.request.contextPath}/assets/vendor/glightbox/js/glightbox.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/vendor/imagesloaded/imagesloaded.pkgd.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/vendor/swiper/swiper-bundle.min.js"></script>

    <!-- Main JS File -->
    <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/signup.js"></script>

</body>

</html>
