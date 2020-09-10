<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
request.setCharacterEncoding("utf-8");
String keyword = request.getParameter("keyword");
%> 


<head>
<link rel= "stylesheet" type="text/css" href="/FoodFighter/resources/css/review/bootstrap.css">
<link rel= "stylesheet" type="text/css" href="/FoodFighter/resources/css/review/nonSearch_reviewList.css">
<meta charset="utf-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- bootstraps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- security -->
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />
<title>리뷰리스트</title>
</head>
<body>


<!--================ Header ================-->
<form id="headerForm" name="headerForm" method="get" action="../review/getSearchList">
	<div id="header-container">
	  <a class="header-logo" href="/FoodFighter"><img src="../resources/img/logo.png" width="250px;" height="55px;" align="left" style="margin-top: 10px; margin-left: 200px;"></a>
	      <ul id="header-menu">
		      <li class="header-items">
		  		<img src="../resources/img/search.png" class="header_searchIcon" width="30" height="30" align="center"> 
		   		<input type="search" class="header_searchInput" placeholder="&emsp;&emsp;식당 또는 음식 검색" id ="keyword" name="keyword" autocomplete="on" maxlength="50" >
		   		<button size="10" id="header_searchBtn">검색</button>
		      </li>
		       <li class="nav-item">
		           <a class="nav-link js-scroll active" href="/FoodFighter">Home</a>
		       </li>
		       <li class="nav-item">
	         	  <a class="nav-link js-scroll" href="/FoodFighter/review/reviewNonSearchList">리뷰 리스트</a>
	          </li>
	          <li class="nav-item">
	           <a class="nav-link js-scroll" href="/FoodFighter/community/communityMain">커뮤니티</a>
	          </li>
	          <li class="nav-item">
	            <a class="nav-link js-scroll" href="/FoodFighter/event/eventList">이벤트</a>
	          </li>
	          <li class="nav-item">
	            <a class="nav-link js-scroll">
	            <img src="/FoodFighter/resources/img/member.png" class="header_searchIcon" width="30" height="30" align="center">
	            </a>
     	     </li>
	   	</ul>
	</div>
 </form>

<!--리뷰 리스트 container -->>
<div class="riewViewList-nonSearch-container">
    <div class="text-center">
        <h2 id="title">맛집리스트</h2>    
    </div>
    <!--상단 태그 -->
    <div class="top-tag">
        <button class="tag-item selected"># 전체</button>
        <button class="tag-item"># 파스타</button>
        <button class="tag-item"># 무한리필</button>
        <button class="tag-item"># 디저트</button>
        <button class="tag-item"># 고기</button>
        <button class="tag-item"># 데이트</button>
        <button class="tag-item"># 카페</button>
        <button class="tag-item"># 라멘</button>
        <button class="tag-item"># 국밥</button>
        <button class="tag-item"># 아이스크림</button>
        <button class="tag-item"># 감자튀김</button>
    </div>

    <div class="category-container">
        <div class="category">
            <img src="/FoodFighter/resources/img/review/category-img/리스트1.PNG">

        </div>

        <div class="category">
            <img src="/FoodFighter/resources/img/review/category-img/리스트2.PNG">

        </div>
        <div class="category">
            <img src="/FoodFighter/resources/img/review/category-img/리스트3.PNG">

        </div>
    
        <div class="category">
            <img src="/FoodFighter/resources/img/review/category-img/리스트4.PNG">

        </div>
        <div class="category">
            <img src="/FoodFighter/resources/img/review/category-img/리스트5.PNG">

        </div>
        <div class="category">
            <img src="/FoodFighter/resources/img/review/category-img/리스트6.PNG">

        </div>
        <div class="category">
            <img src="/FoodFighter/resources/img/review/category-img/리스트7.PNG">

        </div>
        <div class="category">
            <img src="/FoodFighter/resources/img/review/category-img/리스트8.PNG">

        </div>

        <!-- 더보기  -->
        <div id="more">
           <button id="moreBtn">더보기</button>
        </div>
    </div>
</div>
<!-- ======= Footer ======= -->
<footer>
    <div class="footer-container" id="footer-container">
        <p style="text-align:left;">
          ㈜ 푸드파이터<br>서울 서초구 강남대로 459(백암빌딩) 202호<br>대표이사: FOODFIGHTER<br>사업자 등록번호: 2020-020-22222 
       <br>고객센터: 0507-1414-9601<br><br>
        </p>
          <div class="copyright-box">
            <p class="copyright">&copy; Copyright <strong>foodFighter</strong>. All Rights Reserved</p>
              <p>Designed by foodFighter</p>
          </div>
    </div>
</footer>
<!-- End  Footer -->

</body>
<script src="/FoodFighter/resources/js/review/keyword.js"></script>
<!-- Vendor JS Files -->
<!-- <script src="../../assets/vendor/jquery/jquery.min.js"></script>  -->
<!-- <script src="../resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script> -->
<script src="../resources/assets/vendor/jquery.easing/jquery.easing.min.js"></script>
<script src="../resources/assets/vendor/php-email-form/validate.js"></script>
<script src="../resources/assets/vendor/waypoints/jquery.waypoints.min.js"></script>
<script src="../resources/assets/vendor/counterup/jquery.counterup.min.js"></script>
<script src="../resources/assets/vendor/owl.carousel/owl.carousel.min.js"></script>
<script src="../resources/assets/vendor/venobox/venobox.min.js"></script>
<script src="../resources/assets/js/main.js"></script> 
<script type="text/javascript" src="/FoodFighter/resources/js/review/reviewSearch.js"></script>
</html>