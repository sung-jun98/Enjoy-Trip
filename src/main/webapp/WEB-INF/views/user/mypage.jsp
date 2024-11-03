<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<c:if test="${sessionScope.userinfo == null}">
    <c:redirect url="/user/login.jsp" />
</c:if>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>TripEnjoy - My Page</title>
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
	href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900&display=swap"
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
							<a href="${root}/user/login.jsp">로그인</a>
						</li>
						<li
							class="nav-item signup-item ${not empty userinfo ? 'd-none' : ''}">
							<a href="${root}/user/signup.jsp">회원가입</a>
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
			<form id="mypage-form" class="text-center mx-auto form-signup">
				<h1 class="h3 mb-3 fw-normal text-dark">내 정보 수정</h1>

				<div class="form-floating mb-3">
					<input type="id" class="form-control" id="floatingId" name="id"
						placeholder="ssafy" value="${sessionScope.userinfo.userId}"
						readonly> <label for="floatingEmail">아이디</label>
				</div>
				<div class="form-floating mb-3">
					<input type="password" class="form-control" id="floatingPassword"
						name="password" placeholder="********" readonly> <label
						class='d-flex justify-content-between w-100'
						for="floatingPassword"> ******** </label>
					<button type="button"
						class="btn btn-link position-absolute top-50 end-0 translate-middle-y me-2"
						id="changePasswordBtn" data-bs-toggle="modal"
						data-bs-target="#changePasswordModal" style="color: #007bff;">
						<i class="bi bi-pencil-square" style="font-size: 1.25rem;"></i>
					</button>
				</div>
				<div class="form-floating mb-3">
					<input type="text" class="form-control" id="floatingName"
						name="name" value="${sessionScope.userinfo.userName}"
						placeholder="Your Name"> <label for="floatingName">이름</label>
				</div>
				<div class="form-floating mb-3">
					<input type="text" class="form-control" id="floatingEmail"
						name="email" value="${sessionScope.userinfo.userEmail}"
						placeholder="Your Email"> <label for="floatingEmail">이메일</label>
				</div>
				<div class="form-floating mb-3">
					<input type="text" class="form-control" id="floatingNickname"
						name="nickname" value="${sessionScope.userinfo.userNickname}"
						placeholder="Your Nickname"> <label for="floatingNickname">닉네임</label>
				</div>

				<button class="w-100 btn btn-lg btn-primary mb-3" id="modifyAccount"
					type="button">정보 수정</button>
				<button id="deleteAccount" class="w-100 btn btn-lg btn-danger"
					type="button">회원 탈퇴</button>
			</form>

		</div>
	</main>

	<footer id="footer" class="footer mt-auto py-3">
		<div class="container footer-top">
			<div class="container copyright text-center mt-4">
				<p>
					© <span>Copyright</span> <strong class="px-1 sitename">SSAFY</strong>
					<span>SamsunSoftwareAcademyForYouth</span>
				</p>
				<div class="credits">
					Designed by <a href="">Lee Myeong Seong</a> and <a href="">Choi
						Eun Chang</a>
				</div>
			</div>
		</div>
	</footer>

	<div class="modal fade" id="changePasswordModal" tabindex="-1"
		aria-labelledby="changePasswordModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="changePasswordModalLabel">비밀번호 수정</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form id="changePasswordForm">
						<div class="mb-3">
							<label for="currentPassword" class="form-label">현재 비밀번호</label> <input
								type="password" class="form-control" id="currentPassword"
								required>
						</div>
						<div class="mb-3">
							<label for="newPassword" class="form-label">새 비밀번호</label> <input
								type="password" class="form-control" id="newPassword" required>
						</div>
						<div class="mb-3">
							<label for="confirmNewPassword" class="form-label">새 비밀번호
								확인</label> <input type="password" class="form-control"
								id="confirmNewPassword" required>
						</div>
						<button type="submit" class="btn btn-primary">비밀번호 변경</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script>
	document.getElementById("changePasswordForm").addEventListener("submit", function(event) {
	    event.preventDefault();
	    
	    const userId = "${sessionScope.userinfo.userId}";
	    const currentPassword = document.getElementById("currentPassword").value;
	    const newPassword = document.getElementById("newPassword").value;
	    const confirmNewPassword = document.getElementById("confirmNewPassword").value;
	    
	    if (newPassword !== confirmNewPassword) {
	        alert("새 비밀번호가 일치하지 않습니다.");
	        return;
	    }
	    
	    // 비밀번호 변경 요청을 서버로 보냄
	    fetch("${root}/user?action=changePw", {
	        method: "POST",
	        headers: {
	            "Content-Type": "application/x-www-form-urlencoded",
	        },
	        body: new URLSearchParams({
	            currentPassword: currentPassword,
	            newPassword: newPassword
	        })
	    })
	    .then(response => {
	        if (response.ok) {
	            alert("비밀번호가 성공적으로 변경되었습니다. 다시 로그인 해주십쇼");
	            window.location.href = "${root}/user?action=logout"; // 성공 시 마이페이지로 이동
	        } else {
	            alert("비밀번호 변경 중 오류가 발생했습니다.");
	        }
	    })
	    .catch(error => {
	        console.error("Error:", error);
	        alert("비밀번호 변경 중 오류가 발생했습니다.");
	    });
	});
</script>
	<script>
		document.getElementById("modifyAccount").addEventListener("click", function() {
		    if (confirm("정말로 회원 정보를 수정하시겠습니까?")) {
		        const userId = document.getElementById("floatingId").value;
		        const userPw = "${sessionScope.userinfo.userPw}";
		        const userName = document.getElementById("floatingName").value;
		        const userEmail = document.getElementById("floatingEmail").value;
		        const userNickname = document.getElementById("floatingNickname").value;
		        
		        // AJAX 요청을 보냄
		        fetch("${root}/user?action=update", {
		            method: "POST",
		            headers: {
		                "Content-Type": "application/x-www-form-urlencoded",
		            },
		            body: new URLSearchParams({
		                userId: userId,
		                userPw : userPw,
		                userName : userName,
		                userEmail :  userEmail,
		                userNickname : userNickname
		                
		            })
		        })
		        .then(response => {
		            if (response.ok) {
		                alert("회원 정보가 수정 되었습니다.");
		                window.location.href = "${root}/index.jsp";
		            } else {
		                alert("회원 정보 수정 중 오류가 발생했습니다.");
		            }
		        })
		        .catch(error => {
		            console.error("Error:", error);
		            alert("회원 수정 중 오류가 발생했습니다.");
		        });
		    }
		});
</script>

	<script>
		document.getElementById("deleteAccount").addEventListener("click", function() {
		    if (confirm("정말로 회원 탈퇴를 진행하시겠습니까?")) {
		        const userId = document.getElementById("floatingId").value;
		        const userPw = "${sessionScope.userinfo.userPw}"; 
		        
		        // AJAX 요청을 보냄
		        fetch("${root}/user?action=delete", {
		            method: "POST",
		            headers: {
		                "Content-Type": "application/x-www-form-urlencoded",
		            },
		            body: new URLSearchParams({
		                userId: userId,
		                userPw: userPw,
		            })
		        })
		        .then(response => {
		            if (response.ok) {
		                alert("회원 탈퇴가 완료되었습니다.");
		                window.location.href = "${root}/index.jsp"; // 탈퇴 후 메인 페이지로 이동
		            } else {
		                alert("회원 탈퇴 중 오류가 발생했습니다.");
		            }
		        })
		        .catch(error => {
		            console.error("Error:", error);
		            alert("회원 탈퇴 중 오류가 발생했습니다.");
		        });
		    }
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
	<script src="${root}/assets/js/mypage.js"></script>

</body>

</html>
