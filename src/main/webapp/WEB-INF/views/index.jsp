<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>TripEnjoy - SSAFY</title>
    <meta name="description" content="">
    <meta name="keywords" content="">

    <!-- Favicons -->
    <link href="${root}/assets/img/favicon.png" rel="icon">
    <link href="${root}/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

    <!-- Fonts -->
    <link href="https://fonts.googleapis.com" rel="preconnect">
    <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
    <link
        href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
        rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="${root}/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="${root}/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="${root}/assets/vendor/aos/aos.css" rel="stylesheet">
    <link href="${root}/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
    <link href="${root}/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

    <!-- Main CSS File -->
    <link href="${root}/assets/css/main.css" rel="stylesheet">

    <!-- Custom Styles for Top Visitors -->
    <style>
        /* 상위 방문자 섹션 스타일 */
        .top-visitors ul {
            list-style: none;
            padding: 0;
            margin: 0;
            display: flex;
            flex-direction: column;
            align-items: flex-end;
        }

        .top-visitors li {
            background-color: #f8f9fa;
            padding: 5px 10px;
            border-radius: 5px;
            font-size: 0.9rem;
            color: #333;
            margin-bottom: 5px;
            display: flex;
            align-items: center;
        }

        .top-visitors .medal {
            margin-right: 5px;
        }

        /* 반응형 디자인을 위한 조정 */
        @media (max-width: 992px) {
            .top-visitors {
                display: none; /* 중간 크기 이하에서는 숨김 처리 */
            }
        }

        /* 헤더 내 로그인 및 로그아웃 메뉴 위치 고정 */
        .navmenu ul {
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
        }

        .navmenu ul li {
            margin-left: 15px; /* 각 메뉴 아이템 간 간격 조정 */
        }
    </style>

    <!-- =======================================================
      * Template Name: Restaurantly
      * Template URL: https://bootstrapmade.com/restaurantly-restaurant-template/
      * Updated: Aug 07 2024 with Bootstrap v5.3.3
      * Author: BootstrapMade.com
      * License: https://bootstrapmade.com/license/
      ======================================================== -->
</head>

<body class="index-page">

    <header id="header" class="header fixed-top">
        <div class="branding d-flex align-items-center">
            <div class="container position-relative d-flex align-items-center justify-content-between">
                <!-- 왼쪽 섹션: 로고 및 네비게이션 메뉴 -->
                <div class="d-flex align-items-center">
                    <a href="${root}/" class="logo d-flex align-items-center me-3">
                        <h1 class="sitename">TripEnjoy</h1>
                    </a>

                    <nav id="navmenu" class="navmenu">
                        <ul class="d-flex align-items-center">
                            <li class="nav-item login-item ${not empty userinfo ? 'd-none' : ''}">
                                <a href="${root}/user/login">로그인</a>
                            </li>
                            <li class="nav-item signup-item ${not empty userinfo ? 'd-none' : ''}">
                                <a href="${root}/user/signup">회원가입</a>
                            </li>
                            <li class="nav-item logout-item ${empty userinfo ? 'd-none' : ''}">
                                <a href="${root}/user/logout" id="logoutButton">로그아웃</a>
                            </li>
                            <li class="nav-item mypage-item ${empty userinfo ? 'd-none' : ''}">
                                <a href="${root}/user/mypage">내 정보</a>
                            </li>
                            <li class="nav-item admin-item ${sessionScope.isAdmin ? '' : 'd-none'}">
                                <a href="${root}/user/admin">관리자</a>
                            </li>
                        </ul>
                        <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
                    </nav>
                </div>

                <!-- 오른쪽 섹션: 상위 방문자 정보 -->
                <div class="top-visitors">
                    <ul>
                        <c:forEach var="user" items="${topVisitors}" varStatus="status">
                            <li>
                                <c:choose>
                                    <c:when test="${status.index == 0}">
                                        <span class="medal">🥇</span> ${user.userNickname} (${user.userVisited}회 방문)
                                    </c:when>
                                    <c:when test="${status.index == 1}">
                                        <span class="medal">🥈</span> ${user.userNickname} (${user.userVisited}회 방문)
                                    </c:when>
                                    <c:otherwise>
                                        ${user.userNickname} (${user.userVisited}회 방문)
                                    </c:otherwise>
                                </c:choose>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
    </header>

    <main class="main">
        <!-- Hero Section -->
        <section id="hero" class="hero section transparent-background">
            <!-- <img src="${pageContext.request.contextPath}/img/main_2.jpeg" alt="" data-aos="fade-in"> -->

            <div class="container">
                <div class="row">
                    <div class="col-lg-8 d-flex flex-column align-items-center align-items-lg-start">
                        <h2 class='main-text' data-aos="fade-up" data-aos-delay="100">
                            우리 같이 <span>여행</span> 갈래?
                        </h2>
                        <p data-aos="fade-up" data-aos-delay="200">친구, 가족, 연인들과 함께!!</p>
                    </div>
                    <div class="col-lg-4 d-flex align-items-center justify-content-center mt-5 mt-lg-0">
                        <a href="${root}/attraction/tripSearch" class="pulsating-play-btn"></a>
                    </div>
                </div>
            </div>
        </section>
        <!-- /Hero Section -->
    </main>

    <footer id="footer" class="footer">
        <div class="container footer-top">
            <div class="container copyright text-center mt-4">
                <p>
                    © <span>Copyright</span> <strong class="px-1 sitename">SSAFY</strong>
                    <span>SamsunSoftwareAcademyForYouth</span>
                </p>
                <div class="credits">
                    Designed by <a href="">Lee Myung Sung</a> and <a href=""> Choi Eun Chang</a>
                </div>
            </div>
        </div>
    </footer>

    <!-- Scroll Top -->
    <a href="#" id="scroll-top" class="scroll-top d-flex align-items-center justify-content-center"><i
            class="bi bi-arrow-up-short"></i></a>

    <!-- Vendor JS Files -->
    <script src="${root}/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="${root}/assets/vendor/php-email-form/validate.js"></script>
    <script src="${root}/assets/vendor/aos/aos.js"></script>
    <script src="${root}/assets/vendor/glightbox/js/glightbox.min.js"></script>
    <script src="${root}/assets/vendor/imagesloaded/imagesloaded.pkgd.min.js"></script>
    <script src="${root}/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
    <script src="${root}/assets/vendor/swiper/swiper-bundle.min.js"></script>

    <!-- Main JS File -->
    <script src="${root}/assets/js/main.js"></script>
    <script>
        var rootPath = '${root}';
        document.body.style.backgroundImage = 'url(' + rootPath + '/img/main.jpg)';
    </script>

</body>

</html>
