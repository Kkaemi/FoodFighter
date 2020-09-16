<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Index</title>
  <meta content="" name="descriptison">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="/FoodFighter/resources/assets/img/favicon.png" rel="icon">
  <link href="/FoodFighter/resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Vendor CSS Files -->
  <link href="/FoodFighter/resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="/FoodFighter/resources/assets/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">
  <link href="/FoodFighter/resources/assets/vendor/venobox/venobox.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="/FoodFighter/resources/assets/css/style.css" rel="stylesheet">
  <link href="/FoodFighter/resources/css/main.css" rel = "stylesheet">

  <script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>

<body id="page-top">
<form id="headerForm" name="headerForm" method="post" action="./review/getSearchList">
<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"> 
  <!-- ======= Header/ Navbar ======= -->
  <nav class="navbar navbar-b navbar-trans navbar-expand-md fixed-top" id="mainNav">
    <div class="container">
      <a id="logo" class="navbar-brand js-scroll" href="/FoodFighter/"><img id="logo-img" src="/FoodFighter/resources/img/logo.png" width="200px;" height="55px;" ></a>
      <button class="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#navbarDefault" aria-controls="navbarDefault" aria-expanded="false" aria-label="Toggle navigation">
        <span></span>
        <span></span>
        <span></span>
      </button>
      
      <div class="navbar-collapse collapse justify-content-end" id="navbarDefault">
        <ul class="navbar-nav">
         <li class="nav-search">
            <img src="./resources/img/search.png" class="header_searchIcon" width="30" height="30" align="center"> 
            <input type="search" class="header_searchInput" placeholder="&emsp;&emsp;식당 또는 음식 검색" id ="keyword" name="keyword" autocomplete="on" maxlength="50" >
            <button size="10" id="header_searchBtn">검색</button>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll active" href="/FoodFighter">Home</a>
          </li>
          <li class="nav-item">
           <a class="nav-link js-scroll" href="/FoodFighter/community/communityMain">커뮤니티</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll" href="/FoodFighter/event/eventList">이벤트</a>
          </li>
          <li class="nav-item">
	         	  <a class="nav-link js-scroll" href="/FoodFighter/community/communityNotice">공지사항</a>
	          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll">
            <img src="/FoodFighter/resources/img/member.png" id="headerUser" class="header_searchIcon" width="30" height="30" align="center">
            </a>
          </li>

        </ul>
      </div>
    </div>
  </nav>
 </form>
  <!-- usermenu -->
  <div class="modal headUser-menu" id="headUser-menu" role="dialog">
     <div class="tri"></div>
     <c:if test="${sessionScope.memId == null}">
        <p>로그인 또는 회원가입을 하시면 <br> 더 많은 서비스를 <br>이용하실 수 있습니다.</p>
        <hr>
        <button type="button" id="loginBtn" class="headUserMenu-Btn"  onclick="location.href='/FoodFighter/login/loginForm'" >로그인</button>
        <button type="button" id="signupBtn" class="headUserMenu-Btn" onclick="location.href='/FoodFighter/member/signupChoice'" >회원가입</button>
     </c:if>
     <c:if test="${sessionScope.memId == 'admin@admin.com'}">
        <p>관리자로<br> 로그인 하셨습니다. </p>
        <hr>
        <button type="button" id="adminBtn" class="headUserMenu-Btn"  onclick="location.href='/FoodFighter/admin/adminDashboard'" >관리자페이지</button>
        <button type="button" id="logoutBtn" class="headUserMenu-Btn"  onclick="location.href='/FoodFighter/login/logout'">로그아웃</button>
     </c:if>
     <c:if test="${sessionScope.memId != null && sessionScope.memId != 'admin@admin.com'}">
        <p>맛집을 찾아보고 <br> 후기를 남겨보세요.</p>
        <hr>
        <button type="button" id="mypageBtn" class="headUserMenu-Btn"  onclick="location.href='/FoodFighter/mypage/mypageMain'" >마이페이지</button>
        <button type="button" id="logoutBtn" class="headUserMenu-Btn"  onclick="location.href='/FoodFighter/login/logout'">로그아웃</button>
     </c:if>
  </div>

  <!-- ======= Intro Section ======= -->
<form id="searchMainForm" name="searchMainForm" method="post" action="./review/getSearchList">
<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"> 
  <div id="home" class="intro route bg-image" style="background-image: url(/FoodFighter/resources/assets/img/main.jpg)">
    <div class="overlay-itro"></div>
    <div class="intro-content display-table">
      <div class="table-cell">
        <div class="container">
          <!--<p class="display-6 color-d">Hello, world!</p>-->
          <h4 class="intro-title mb-4">FOOD FIGHTER</h4>
              <input type="text" class="Intro_searchInput" placeholder="&emsp;&emsp;식당 또는 음식 검색" class="keyword" id ="keyword" name="keyword" value = "${keyword}" autocomplete="on" maxlength="20" size="80">
             <button id="Intro_searchBtn"><font class="searchBtn">검색</font></button>
        </div>
      </div>
    </div>
  </div><!-- End Intro Section -->
</form>

 <!-- Footer -->
 <div id="footer-container">
    <p class="copyright" style="text-align:left;">
        ㈜ 푸드파이터<br>서울 서초구 강남대로 459(백암빌딩) 202호<br>대표이사: FOODFIGHTER<br>사업자 등록번호: 2020-020-22222 
          <br>고객센터: 0507-1414-9601<br><br>
          <strong>HOME | 리뷰리스트 | 커뮤니티 | 이벤트</strong><br><br>
          &copy; Copyright <strong>foodFighter</strong>. All Rights Reserved
              Designed by foodFighter
    </p>
 </div>
  
  <!-- Up -->
  <a href="#" class="back-to-top"><i class="fa fa-chevron-up"> <img src="/FoodFighter/resources/img/back-up.png" width="32px;" height="32px;"></i></a>
  <div id="preloader"></div>

  <!-- Vendor JS Files -->
  <script src="/FoodFighter/resources/assets/vendor/jquery/jquery.min.js"></script>  
  <script src="/FoodFighter/resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="/FoodFighter/resources/assets/vendor/jquery.easing/jquery.easing.min.js"></script>
  <script src="/FoodFighter/resources/assets/vendor/php-email-form/validate.js"></script>
  <script src="/FoodFighter/resources/assets/vendor/waypoints/jquery.waypoints.min.js"></script>
  <script src="/FoodFighter/resources/assets/vendor/counterup/jquery.counterup.min.js"></script>
  <script src="/FoodFighter/resources/assets/vendor/owl.carousel/owl.carousel.min.js"></script>
  <script src="/FoodFighter/resources/assets/vendor/typed.js/typed.min.js"></script>
  <script src="/FoodFighter/resources/assets/vendor/venobox/venobox.min.js"></script>
   
  <!-- Template Main JS File -->
  <script src="/FoodFighter/resources/assets/js/main.js"></script>
  <script src="/FoodFighter/resources/js/review/keyword.js"></script>

<script type="text/javascript">
$('#headerUser').click(function(){
   $('#headUser-menu').modal();
});
</script>
</body>

</html>