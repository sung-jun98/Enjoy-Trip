<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
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
<link href="${root}/assets/img/apple-touch-icon.png"
	rel="apple-touch-icon">

<!-- Fonts -->
<link href="https://fonts.googleapis.com" rel="preconnect">
<link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900&family=Playfair+Display:ital,wght@0,400;0,500;0,600;0,700;0,800;0,900;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="${root}/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${root}/assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="${root}/assets/vendor/aos/aos.css" rel="stylesheet">
<link href="${root}/assets/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
<link href="${root}/assets/vendor/swiper/swiper-bundle.min.css"
	rel="stylesheet">

<!-- Main CSS File -->
<link href="${root}/assets/css/main.css" rel="stylesheet">
<style>
body {
	background-image:
		url('${pageContext.request.contextPath}/img/main_2.jpeg');
	/* 원하는 배경 이미지 경로로 수정 */
	background-size: cover;
	background-position: center;
	background-repeat: no-repeat;
	background-attachment: fixed;
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

<body class="d-flex flex-column min-vh-100">
	<header id="header" class="header fixed-top">
		<div class="branding d-flex align-items-center">
			<div
				class="container position-relative d-flex align-items-center justify-content-between">
				<a href="${root}/index.jsp"
					class="logo d-flex align-items-center me-auto me-xl-0">
					<h1 class="sitename">TripEnjoy</h1>
				</a>

				<nav id="navmenu" class="navmenu">
					<ul>
						<li
							class="nav-item login-item ${not empty userinfo ? 'd-none' : ''}">
							<a href="${root}/user/login">로그인</a>
						</li>
						<li
							class="nav-item signup-item ${not empty userinfo ? 'd-none' : ''}">
							<a href="${root}/user/signup">회원가입</a>
						</li>
						<li class="nav-item logout-item ${empty userinfo ? 'd-none' : ''}">
							<a href="${root}/user?action=logout" id="logoutButton">로그아웃</a>
						</li>
						<li class="nav-item mypage-item ${empty userinfo ? 'd-none' : ''}">
							<a href="${root}/user?action=mvMypage">내 정보</a>
						</li>
						<li
							class="nav-item admin-item ${sessionScope.isAdmin ? '' : 'd-none'}">
							<a href="${root}/user/admin.jsp">관리자</a>
						</li>
					</ul>
					<i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
				</nav>
			</div>
		</div>

	</header>

	<main
		class="flex-grow-1 d-flex align-items-center justify-content-center">
		<div class="container">
		 <c:if test="${not empty error}">
                <div class="alert alert-danger" role="alert">
                    ${error}
                </div>
            </c:if>
			<form action="${root}/user/login" method="post" class="text-center mx-auto form-signin">

				<h1 class="h3 mb-3 fw-normal text-dark">로그인</h1>

				<div class="form-floating mb-3">
					<input type="text" class="form-control" id="floatingInput"
						name="userid" placeholder="id" required> <label
						for="floatingInput">아이디</label>
				</div>
				<div class="form-floating mb-3">
					<input type="password" class="form-control" id="floatingPassword"
						name="userPw" placeholder="Password" required> <label
						for="floatingPassword">비밀번호</label>
				</div>

				<button class="w-100 btn btn-lg btn-primary" type="submit">로그인</button>
				<p class="mt-3 mb-3 text-muted">&copy; SSAFY</p>
				<div class="form-links d-flex justify-content-between">
					<a href="#" data-bs-toggle="modal"
						data-bs-target="#findCredentialsModal">아이디/비밀번호 찾기</a> <a
						href="${root}/user/signup.jsp">회원가입</a>
				</div>
			</form>
		</div>
	</main>

	<footer id="footer" class="footer">
		<div class="container footer-top">
			<div class="container copyright text-center mt-4">
				<p>
					© <span>Copyright</span> <strong class="px-1 sitename">SSAFY</strong>
					<span>SamsunSoftwareAcademyForYouth</span>
				</p>
				<div class="credits">
					Designed by <a href="">Lee Myeong Seong</a> and <a href="">
						Choi Eun Chang</a>
				</div>
			</div>
		</div>
	</footer>
	<!-- 아이디 및 비밀번호 찾기 모달 -->
	<div class="modal fade" id="findCredentialsModal" tabindex="-1"
		aria-labelledby="findCredentialsModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="findCredentialsModalLabel">아이디 및
						비밀번호 찾기</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<!-- 아이디 찾기 폼 -->
					<h6>아이디 찾기</h6>
					<form id="findIdForm">
						<div class="mb-3">
							<label for="findIdEmail" class="form-label">이메일</label> <input
								type="email" class="form-control" id="findIdEmail"
								placeholder="이메일을 입력하세요" required>
						</div>
						<button type="submit" class="btn btn-primary w-100 mb-3">아이디
							찾기</button>
					</form>

					<!-- 비밀번호 찾기 폼 -->
					<h6>비밀번호 찾기</h6>
					<form id="findPasswordForm">
						<div class="mb-3">
							<label for="findPwId" class="form-label">아이디</label> <input
								type="text" class="form-control" id="findPwId"
								placeholder="아이디를 입력하세요" required>
						</div>
						<div class="mb-3">
							<label for="findPwEmail" class="form-label">이메일</label> <input
								type="email" class="form-control" id="findPwEmail"
								placeholder="이메일을 입력하세요" required>
						</div>
						<button type="submit" class="btn btn-primary w-100">비밀번호
							찾기</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<script>
		//아이디 찾기 폼 처리
		document.getElementById("findIdForm").addEventListener("submit", function(event) {
		    event.preventDefault();
		    
		    const email = document.getElementById("findIdEmail").value;
		    
		    fetch("${root}/user?action=findId", {
		        method: "POST",
		        headers: {
		            "Content-Type": "application/x-www-form-urlencoded",
		        },
		        body: new URLSearchParams({
		            email: email
		        })
		    })
		    .then(response => response.text())
		    .then(data => {
		        if (data) {
		            alert("아이디: " + data); // 서버에서 아이디를 반환했다고 가정
		        } else {
		            alert("아이디 찾기 중 오류가 발생했습니다.");
		        }
		    })
		    .catch(error => {
		        console.error("Error:", error);
		        alert("아이디 찾기 중 오류가 발생했습니다.");
		    });
		});
		
		document.getElementById("findPasswordForm").addEventListener("submit", function(event) {
		    event.preventDefault(); 
		    
		    const userId = document.getElementById("findPwId").value;
		    const email = document.getElementById("findPwEmail").value;
		    
		    fetch("${root}/user?action=findPassword", {
		        method: "POST",
		        headers: {
		            "Content-Type": "application/x-www-form-urlencoded",
		        },
		        body: new URLSearchParams({
		            userId: userId,
		            email: email
		        })
		    })
		    .then(response => response.ok ? alert("비밀번호 찾기 이메일을 보냈습니다.") : alert("비밀번호 찾기 중 오류가 발생했습니다."))
		    .catch(error => {
		        console.error("Error:", error);
		        alert("비밀번호 찾기 중 오류가 발생했습니다.");
		    });
		});
	</script>



	<!-- Vendor JS Files -->
	<script
		src="${root}/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="${root}/assets/vendor/php-email-form/validate.js"></script>
	<script src="${root}/assets/vendor/aos/aos.js"></script>
	<script src="${root}/assets/vendor/glightbox/js/glightbox.min.js"></script>
	<script
		src="${root}/assets/vendor/imagesloaded/imagesloaded.pkgd.min.js"></script>
	<script src="${root}/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script src="${root}/assets/vendor/swiper/swiper-bundle.min.js"></script>

	<!-- Main JS File -->
	<script src="${root}/assets/js/main.js"></script>

</body>


</html>
