<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 | 공지사항</title>
<style type="text/css">
body, html {
    height: 100%;
}
</style>
<!-- CSS 파일 -->
<link rel="stylesheet" href="/FoodFighter/resources/css/eventcss/sidenav.css">
<link rel="stylesheet" href="/FoodFighter/resources/css/eventcss/normalize.css">
<link rel="stylesheet" href="/FoodFighter/resources/css/eventcss/sidenav.css">
<link rel="stylesheet" href="/FoodFighter/resources/css/eventcss/headerCss.css">
<link rel="stylesheet" href="/FoodFighter/resources/css/eventcss/eventBoardList.css">
<link rel="stylesheet" href="/FoodFighter/resources/css/eventcss/eventBoardView.css">
<link rel="stylesheet" href="/FoodFighter/resources/css/eventcss/eventBoard.css">

<!-- JS 파일 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> <!-- 부트스트랩 CSS  -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="/FoodFighter/resources/js/community/communityMainJs/sidebarJs.js"></script> <!-- 사이드바JS -->
<script src="https://kit.fontawesome.com/a076d05399.js"></script> <!-- 사이드바 아이콘 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> <!-- 부트스트랩 JS -->
</head>
<body>
<!-- 헤더 -->
<!--================ Header ================-->
<div id="header-container">
  <a class="header-logo" href="/FoodFighter/">로고 자리</a>
      <ul id="header-menu">
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
	       <a class="header-link" href="communityMain.jsp"><img src="../mainImg/user.png" class="header_searchIcon" width="30" height="30" align="center"></a>
    	 </li>
   	</ul>
</div>
<!-- 사이드바 -->
<input type="checkbox" id="sidebarCheck">
<label for="sidebarCheck">
  <i class="fas fa-bars" id="sideOpenBtn"></i>
  <i class="fas fa-times" id="sideCloseBtn"></i>
</label>
<div class="sidebar" style = "z-index : 2;">
  <header>커뮤니티</header>
  <a href="#">
    <i class="far fa-comments"></i>
    <span>게시판</span>
  </a>
  <a href="#">
    <i class="fas fa-link"></i>
    <span>랭킹</span>
  </a>
  <a href="#">
    <i class="far fa-question-circle"></i>
    <span>고객센터</span>
  </a>
</div>
<!-- 본문 -->
<div class="container" style="margin-top : 65px;">
	<div class="page-header">
    	<h2 class="text-center">이벤트 체험단</h2>      
   	</div>
</div>
<div class="page-body" style = "z-index : 1;">
	<div class = "view-upper clearfix">
		<div class = "area_l">
			<a href = "#">
				<span class = "plain-btn">목록</span></a>
			<a href = "#">
				<span class = "plain-btn">이전글</span></a>
		</div>
		<div class = "area_r">
			<a href = "#">
				<span class = "plain-btn">수정</span></a>
			<a href = "#">
				<span class = "plain-btn" style = "color : red;">삭제</span></a>
		</div>
	</div>
	<div class = "view_stat">
		<div class ="mphoto">
			<img src = "/FoodFighter/resources/img/community/mainImg/d.jpg">
		</div>
		<div class = "info">
			<h1>
				<span class = "subject"> O O O 체험단을 모집합니다.</span>
			</h1>
			<p>
				<span class = "name">관리자</span>
				<span class = "date">2020.08.03</span>
			</p>
		</div>
	</div>
	<div class = "viewbox">
		<div class = "content">
			<p>체험을 원하시는 분은 비댓으로 남겨주세요.</p>
			<p></p>
			<p></p>
			<div class ="attach"><img src = "/FoodFighter/resources/img/community/mainImg/antman.png"></div>
		</div>
		</div>
		<div class ="cont_recommendation clearfix">
			<div class = "area_l">
				<a href = "#"><span class = "plain-btn">댓글</span></a>
		</div>
		<!-- 댓글 -->
		<div class = "cont_comment">
			<div class ="comment_write">
				<div class ="inner_text_write">
					<div class ="box_textarea">
						<textarea placeholder="댓글쓰기 기능이 지원되지 않는 곳입니다."	
								readonly="readonly" style ="height : 86px;"></textarea>
					</div>
					<div class = "wrap_menu">
						<div class = "area_l">
							<button class = "btnTab">
								<span class ="ico_bbs ico_photo">이미지업로드</span>
							</button>
						</div>
						<div class = "area_r">
							<span class ="num_text">
								<span class ="sr_only">글자수</span>
								<span class ="num_count">0</span> / <span class ="sr_only">총 글자 개수</span> 600
							</span>
							<button class = "btnTab btn_item">
								<span class ="ico_bbs ico_lock">비밀글</span>
							</button>
							<div class ="btn_group">
								<a href = "#">
								<span class = "plain-btn" style ="background-color: red; color: white;">등록</span></a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class ="clear"></div>
		</div>
	</div>
	<div class = "view-upper clearfix">
		<div class = "area_l">
			<a href = "#">
				<span class = "plain-btn">최신목록</span></a>
			<a href = "#">
				<span class = "plain-btn" style = "color : red;">글쓰기</span></a>
		</div>
		<div class = "area_r">
			<a href = "#">
				<span class = "plain-btn">수정</span></a>
			<a href = "#">
				<span class = "plain-btn" style = "color : red;">삭제</span></a>
		</div>
	</div>
</div>
<!--================  Footer ================-->
<div id="footer-container">
 <p class="copyright" style="text-align:left;">
     ㈜ 푸드파이터<br>서울 서초구 강남대로 459(백암빌딩) 202호<br>대표이사: FOODFIGHTER<br>사업자 등록번호: 2020-020-22222 
       <br>고객센터: 0507-1414-9601<br><br>
        <strong>HOME | 리뷰리스트 | 커뮤니티 | 이벤트</strong><br><br>
       &copy; Copyright <strong>foodFighter</strong>. All Rights Reserved
             Designed by foodFighter
 </p>
</div>
</body>
</html>