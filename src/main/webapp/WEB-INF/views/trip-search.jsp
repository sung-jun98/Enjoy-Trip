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
<title>trip-search</title>
<meta name="description" content="">
<meta name="keywords" content="">

<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/assets/img/favicon.ico" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
<script src="${pageContext.request.contextPath}/assets/js/key.js"></script>
<link href="${pageContext.request.contextPath}/assets/img/favicon.png"
	rel="icon">
<link
	href="${pageContext.request.contextPath}/assets/img/apple-touch-icon.png"
	rel="apple-touch-icon">

<link href="https://fonts.googleapis.com" rel="preconnect">
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/css/main.css"
	rel="stylesheet">
</head>

<body>

	<header id="header" class="header fixed-top">
		<div class="branding d-flex align-items-center">
			<div
				class="container position-relative d-flex align-items-center justify-content-between">
				<a href="${pageContext.request.contextPath}/index.jsp"
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
		</div>
	</header>


	</div>
	</div>
	</header>

	<section id="hero" style="margin-top: 6.9%; padding: 1% 17%;">
		<form class="d-flex my-3" onsubmit="return false;" role="search">
			<select id="search-area" class="form-select me-2">
				<option value="0,0" selected>검색 할 지역 선택</option>
			</select> <select id="search-content-id" class="form-select me-2">
				<option value="0" selected>관광지 유형</option>
				<option value="12">관광지</option>
				<option value="14">문화시설</option>
				<option value="15">축제공연행사</option>
				<option value="25">여행코스</option>
				<option value="28">레포츠</option>
				<option value="32">숙박</option>
				<option value="38">쇼핑</option>
				<option value="39">음식점</option>
			</select> <input id="search-keyword" class="form-control me-2" type="search"
				placeholder="검색어" aria-label="검색어" />
			<button id="btn-search" class="btn btn-outline-success" type="button">Search</button>
		</form>
		<div id="map" class="mt-3"
			style="width: 100%; height: 350px; margin-bottom: 50px;"></div>
		<div class="row">
			<table class="table table-striped" style="display: none;">
				<thead>
					<tr>
						<th>대표이미지</th>
						<th>관광지명</th>
						<th>주소</th>
						<th>위도</th>
						<th>경도</th>
					</tr>
				</thead>
				<tbody id="trip-list"></tbody>
			</table>
		</div>
	</section>

	<footer id="footer" class="footer">
		<div class="container footer-top">
			<div class="container copyright text-center mt-4">
				<p>
					© <span>Copyright</span> <strong class="px-1 sitename">SSAFY</strong>
					<span>SamsunSoftwareAcademyForYouth</span>
				</p>
			</div>
		</div>
	</footer>

	<!-- 필수 스크립트들 -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d1dd17c58c88da953972d7c8b3daece0&libraries=services,clusterer,drawing"></script>
	<script src="${pageContext.request.contextPath}/assets/js/main.js"></script>

	<!-- 컨텍스트 패스를 JavaScript 변수로 전달 -->
	<script>
    const contextPath = '<%= request.getContextPath() %>';
  </script>

	<!-- 별도의 trip-search.js 파일을 사용하지 않고, 스크립트를 JSP 내에 포함 -->
	<script>
    document.addEventListener('DOMContentLoaded', function() {
      // 지도 객체를 전역으로 선언
      let map;

      // 페이지 로드 시 지역 목록 가져오기
      fetch(window.location.origin + contextPath + '/Attraction?action=getSidoGugun')
        .then(response => {
          if (!response.ok) {
            throw new Error('Network response was not ok');
          }
          return response.json();
        })
        .then(data => {
          console.log('Received data:', data); // 디버깅을 위한 로그 추가
          const searchArea = document.getElementById('search-area');
          data.forEach(area => {
            const option = document.createElement('option');
            option.value = area.sidoCode + "," + area.gugunCode; // "sidoCode,gugunCode"
            option.textContent = area.sidoName + ' ' + area.gugunName; // 시도 + 구군 이름
            searchArea.appendChild(option);
          });
        })
        .catch(error => console.error('Error fetching area list:', error));

      // 카카오 지도 초기화
      const mapContainer = document.getElementById('map');
      const mapOption = {
        center: new kakao.maps.LatLng(37.5665, 126.978), // 기본 위치 (서울)
        level: 5
      };
      map = new kakao.maps.Map(mapContainer, mapOption);

      // 검색 버튼 클릭 이벤트
      document.getElementById('btn-search').addEventListener('click', function() {
        const selectedValue = document.getElementById('search-area').value;
        const [sido, gungu] = selectedValue.split(','); // sidoCode, gugunCode 분리
        const contentTypeId = document.getElementById('search-content-id').value;
        const keyword = document.getElementById('search-keyword').value;

        console.log('Search Parameters:', { sido, gungu, contentTypeId, keyword });

        // 검색 요청을 서버로 보냄 (contentTypeId 추가)
        const url = window.location.origin + contextPath + '/Attraction?action=searchByGungu&sido=' +
                    encodeURIComponent(sido) + '&gugun=' + encodeURIComponent(gungu) + '&contentTypeId=' + encodeURIComponent(contentTypeId) +
                    '&name=' + encodeURIComponent(keyword);

        fetch(url)
          .then(response => {
            if (!response.ok) {
              throw new Error('Network response was not ok');
            }
            return response.json();
          })
          .then(data => {
            console.log('Received search data:', data); // 디버깅을 위한 로그 추가
            const tripList = document.getElementById('trip-list');
            tripList.innerHTML = ''; // 이전 결과 초기화

            if (data.length === 0) {
              alert("검색 결과가 없습니다."); // 결과가 없을 때 알림
              document.querySelector('table').style.display = 'none';
              map.setCenter(new kakao.maps.LatLng(37.5665, 126.978)); // 기본 위치로 이동
              return;
            }

            // 마커를 담을 배열
            const markers = [];

            data.forEach(attraction => {
              const row = document.createElement('tr');

              // 이미지 경로 설정
              const imageSrc = attraction.firstImage1 ? attraction.firstImage1 : contextPath + '/assets/img/no_image.png';

              row.innerHTML = '<td><img src="' + imageSrc + '" alt="' + attraction.title + '" style="width: 100px;"></td>' +
                              '<td>' + attraction.title + '</td>' +
                              '<td>' + attraction.addr1 + ' ' + attraction.addr2 + '</td>' +
                              '<td>' + attraction.latitude + '</td>' +
                              '<td>' + attraction.longitude + '</td>';
              row.style.cursor = 'pointer';
              row.addEventListener('click', () => {
                moveCenter(attraction.latitude, attraction.longitude);
              });
              tripList.appendChild(row);

              // 마커 생성
              if(attraction.latitude && attraction.longitude) {
                const markerPosition = new kakao.maps.LatLng(attraction.latitude, attraction.longitude);
                const marker = new kakao.maps.Marker({
                  map: map,
                  position: markerPosition,
                  title: attraction.title
                });
                markers.push(marker);
              }
            });

            // 테이블 표시
            document.querySelector('table').style.display = 'table';

            // 지도에 마커 표시
            displayMarkers(markers);

            // 첫 번째 위치로 지도 중심 이동
            if(data[0].latitude && data[0].longitude) {
              map.setCenter(new kakao.maps.LatLng(data[0].latitude, data[0].longitude));
            }
          })
          .catch(error => console.error('Error:', error));
      });

      // 마커를 지도에 표시하고, 모든 마커가 보이도록 지도의 범위를 조정
      function displayMarkers(markers) {
        if(markers.length === 0) return;

        const clusterer = new kakao.maps.MarkerClusterer({
          map: map,
          averageCenter: true,
          minLevel: 5
        });

        clusterer.addMarkers(markers);
      }

      // 지도 중심을 이동시키는 함수
      function moveCenter(lat, lng) {
        const moveLatLng = new kakao.maps.LatLng(lat, lng);
        map.setCenter(moveLatLng);
      }
    });
  </script>

</body>

</html>
