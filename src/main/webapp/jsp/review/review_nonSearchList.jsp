<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<head>
<link rel= "stylesheet" type="text/css" href="/FoodFighter/resources/css/review/bootstrap.css">
<link rel= "stylesheet" type="text/css" href="/FoodFighter/resources/css/review/nonSearch_reviewList.css">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<title>리뷰리스트</title>
</head>
<body>

<!-- ======= Header/ Navbar ======= -->
<nav class="navbar navbar-b navbar-trans navbar-expand-md fixed-top" id="mainNav">
    <div class="nav-container">
      <!-- 로고 -->
      <a id="logo" class="navbar-brand js-scroll" href="/FoodFighter/"><img id="logo-img" src="/FoodFighter/resources/img/streetfighter.gif"></a>
      
      <div class="navbar-collapse collapse justify-content-end" id="navbarDefault">
        <ul id="navbar-nav">
	        <li class="header-items">
	  			<img src="/FoodFighter/resources/img/community/mainImg/search.png" class="header_searchIcon" width="30" height="30" align="center"> 
	   			<input type="text" class="header_searchInput" placeholder="&emsp;&emsp;식당 또는 음식 검색" value="" autocomplete="on" maxlength="50" >
	      	</li>
	      	<li class="header-items">
	         	<a class="header-link" href="/FoodFighter/">Home</a>
	      	</li>
	      	<li class="header-items">
	         	<a class="header-link" href="/FoodFighter/review/reviewNonSearchList">리뷰 리스트</a>
	      	</li>
	      	<li class="header-items">
	        	<a class="header-link" href="/FoodFighter/community/communityMain">커뮤니티</a>
	      	</li>
	      	<li class="header-items">
	        	<a class="header-link" href="/FoodFighter/event/eventList">이벤트</a>
	      	</li>
	      	<li class="header-items">
	      		<a class="header-link" href=""><img src="/FoodFighter/resources/img/community/mainImg/user.png" class="header_searchIcon" width="30" height="30" align="center"></a>
    	 	</li>
       	 </ul>
      </div>
    </div>
  </nav>


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
</footer><!-- End  Footer -->

</body>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="/FoodFigher/resourcesjs/review/bootstrap.js"></script>
</html>