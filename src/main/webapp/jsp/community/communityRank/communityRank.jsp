<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 | 랭킹</title>
<style type="text/css">
body, html {
    height: 100%;
}
.starR1{
    background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat -52px 0;
    background-size: auto 100%;
    width: 15px;
    height: 30px;
    float:left;
    text-indent: -9999px;
    cursor: pointer;
}
.starR2{
    background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
    background-size: auto 100%;
    width: 15px;
    height: 30px;
    float:left;
    text-indent: -9999px;
    cursor: pointer;
}
.starR1.on{background-position:0 0;}
.starR2.on{background-position:-15px 0;}

</style>

<!-- CSS 파일 -->
<link rel="stylesheet" href="/FoodFighter/resources/css/community/normalize.css">
<link rel="stylesheet" href="/FoodFighter/resources/css/community/sidenav.css">
<link rel="stylesheet" href="/FoodFighter/resources/css/community/communityHeader.css">
<link rel="stylesheet" href="/FoodFighter/resources/css/community/communityRankCss.css?after">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/raty/2.9.0/jquery.raty.min.css">

<!-- JS 파일 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="/FoodFighter/js/community/jquery.raty.js">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> <!-- 부트스트랩 CSS  -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> <!-- 부트스트랩 JS -->
</head>
<body>
<!-- 헤더 -->
<!--================ Header ================-->
<div id="header-container">
	<div class="hamberger pull-left" onclick="myFunction(this)">
        <div class="bar1"></div>
        <div class="bar2"></div>
        <div class="bar3"></div>
    </div>
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
	       <a class="header-link" href="communityMain.jsp"><img src="/FoodFighter/resources/img/community/mainImg/user.png" class="header_searchIcon" width="30" height="30" align="center"></a>
    	 </li>
   	</ul>
</div>
<!-- 사이드바 -->
<div id="mySidenav" class="sidenav">
	<a href="/FoodFighter/community/communityNotice"><span class="glyphicon glyphicon-exclamation-sign"></span>&emsp;공지사항</a>
    <a href="/FoodFighter/community/communityBoard"><span class="glyphicon glyphicon-list"></span>&emsp;게시판</a>
    <a href="/FoodFighter/community/communityRank"><span class="glyphicon glyphicon-star"></span>&emsp;랭킹</a>
    <a href="/FoodFighter/community/csCenter"><span class="glyphicon glyphicon-question-sign"></span>&emsp;고객센터</a>
</div>
<!-- 본문 -->
<div class="container" style="margin-top : 65px;">
	<div class="page-header">
    	<h2 class="text-center">RANK</h2>
    	<p class="text-center">이 달의 Top10 랭커가 되어보세요</p>
   	</div>
</div>
<div class="page-body" style = "z-index : 1;">
	<div style = "margin-bottom: 30px;">
		<h4 class = "rankTitle">
			맛집
			<em style = "color : #FF6A4D;">Top10</em>
			<div style="float : right!important;">
				<img src="/FoodFighter/resources/img/community/rankImg/simbol.png" alt="" id="img" class="img-circle" width="50" height="50" style="cursor: pointer;" onclick="changeRank()">
			</div>
		</h4>
	</div>
	<ul class ="rankList">
		<li class = "rankItem">
			<div class ="rankInner">
				<div class ="ranking">
					<img src ="/FoodFighter/resources/img/community/rankImg/rank1.png">
				</div>
				<div class="rankerInfo">
					<div class ="infoPic">
						<img src= "/FoodFighter/resources/img/community/rankImg/simbol.png">
					</div>
					<div class ="infoText">
						<div class ="infoName">
							<span class ="nickName">할랄가이즈</span>
						</div>
						<div class ="grade">
							 <span class="starR1 on" id = star1_Left data-value="0.5" >별1_왼쪽</span>
						     <span class="starR2" id = star1_Right data-value ="1.0">별1_오른쪽</span>
						     <span class="starR1" id = star2_Left data-value ="1.5">별2_왼쪽</span>
						     <span class="starR2" id = star2_Right data-value ="2.0">별2_오른쪽</span>
						     <span class="starR1" id = star3_Left data-value ="2.5">별3_왼쪽</span>
						     <span class="starR2" id = star3_Right data-value ="3.0">별3_오른쪽</span>
						     <span class="starR1" id = star4_Left data-value ="3.5">별4_왼쪽</span>
						     <span class="starR2" id = star4_Right data-value ="4.0">별4_오른쪽</span>
						     <span class="starR1" id = star5_Left data-value ="4.5">별5_왼쪽</span>
						     <span class="starR2" id = star5_Right data-value ="5.0">별5_오른쪽</span>
						     <span class ="rate">4.5</span>
				   		</div>
					</div>
				</div><!-- rankerInfo -->
				<div class ="rankerBoardWrap">
					<ul class ="postList">
						<li class ="postItem">
							<div class ="review">
								<a href="#" class ="reviewLink">
									<span class = "reviewThumb"></span>
									<div class ="reviewText">
										<strong class = "reviewTextSum">
											<p>신논현 맛집 리뷰 : 할랄가이즈 가고 싶은 맛집</p>
										</strong>
									</div>
								</a>
							</div>
						</li>
						<li class ="postItem">
							<div class ="review">
								<a href="#" class ="reviewLink">
									<span class = "reviewThumb"></span>
									<div class ="reviewText">
										<strong class = "reviewTextSum">
											<p>신논현 맛집 리뷰 : 할랄가이즈 가고 싶은 맛집</p>
										</strong>
									</div>
								</a>
							</div>
						</li>
						<li class ="postItem">
							<div class ="review">
								<a href="#" class ="reviewLink">
									<span class = "reviewThumb"></span>
									<div class ="reviewText">
										<strong class = "reviewTextSum">
											<p>신논현 맛집 리뷰 : 할랄가이즈 가고 싶은 맛집</p>
										</strong>
									</div>
								</a>
							</div>
						</li>
					</ul>
				</div>
			</div><!-- rankInner -->
		</li>
	</ul>
	<ul class ="rankList">
		<li class = "rankItem">
			<div class ="rankInner">
				<div class ="ranking">
					<img src ="/FoodFighter/resources/img/community/rankImg/rank1.png">
				</div>
				<div class="rankerInfo">
					<div class ="infoPic">
						<img src= "/FoodFighter/resources/img/community/rankImg/simbol.png">
					</div>
					<div class ="infoText">
						<div class ="infoName">
							<span class ="nickName">스누피</span>
						</div>
						<div class ="grade">
							<span>Lv.5 검정띠</span><img src="/FoodFighter/resources/img/community/rankImg/grade.png"style = "margin-left : 20px; width : 30px; height : 30px;">
						</div>
					</div>
				</div><!-- rankerInfo -->
				<div class ="rankerBoardWrap">
					<ul class ="postList">
						<li class ="postItem">
							<div class ="review">
								<a href="#" class ="reviewLink">
									<span class = "reviewThumb"></span>
									<div class ="reviewText">
										<strong class = "reviewTextSum">
											<p>신논현 맛집 리뷰 : 할랄가이즈 가고 싶은 맛집</p>
										</strong>
									</div>
								</a>
							</div>
						</li>
						<li class ="postItem">
							<div class ="review">
								<a href="#" class ="reviewLink">
									<span class = "reviewThumb"></span>
									<div class ="reviewText">
										<strong class = "reviewTextSum">
											<p>신논현 맛집 리뷰 : 할랄가이즈 가고 싶은 맛집</p>
										</strong>
									</div>
								</a>
							</div>
						</li>
						<li class ="postItem">
							<div class ="review">
								<a href="#" class ="reviewLink">
									<span class = "reviewThumb"></span>
									<div class ="reviewText">
										<strong class = "reviewTextSum">
											<p>신논현 맛집 리뷰 : 할랄가이즈 가고 싶은 맛집</p>
										</strong>
									</div>
								</a>
							</div>
						</li>
					</ul>
				</div>
			</div><!-- rankInner -->
		</li>
		<li class = "rankItem">
			<div class ="rankInner">
				<div class ="ranking">
					<img src ="/FoodFighter/resources/img/community/rankImg/rank1.png">
				</div>
				<div class="rankerInfo">
					<div class ="infoPic">
						<img src= "/FoodFighter/resources/img/community/rankImg/simbol.png">
					</div>
					<div class ="infoText">
						<div class ="infoName">
							<span class ="nickName">스누피</span>
						</div>
						<div class ="grade">
							<span>Lv.5 검정띠</span><img src="/FoodFighter/resources/img/community/rankImg/grade.png"style = "margin-left : 20px; width : 30px; height : 30px;">
						</div>
					</div>
				</div><!-- rankerInfo -->
				<div class ="rankerBoardWrap">
					<ul class ="postList">
						<li class ="postItem">
							<div class ="review">
								<a href="#" class ="reviewLink">
									<span class = "reviewThumb"></span>
									<div class ="reviewText">
										<strong class = "reviewTextSum">
											<p>신논현 맛집 리뷰 : 할랄가이즈 가고 싶은 맛집</p>
										</strong>
									</div>
								</a>
							</div>
						</li>
						<li class ="postItem">
							<div class ="review">
								<a href="#" class ="reviewLink">
									<span class = "reviewThumb"></span>
									<div class ="reviewText">
										<strong class = "reviewTextSum">
											<p>신논현 맛집 리뷰 : 할랄가이즈 가고 싶은 맛집</p>
										</strong>
									</div>
								</a>
							</div>
						</li>
						<li class ="postItem">
							<div class ="review">
								<a href="#" class ="reviewLink">
									<span class = "reviewThumb"></span>
									<div class ="reviewText">
										<strong class = "reviewTextSum">
											<p>신논현 맛집 리뷰 : 할랄가이즈 가고 싶은 맛집</p>
										</strong>
									</div>
								</a>
							</div>
						</li>
					</ul>
				</div>
			</div><!-- rankInner -->
		</li>
		<li class = "rankItem">
			<div class ="rankInner">
				<div class ="ranking">
					<img src ="/FoodFighter/resources/img/community/rankImg/rank1.png">
				</div>
				<div class="rankerInfo">
					<div class ="infoPic">
						<img src= "/FoodFighter/resources/img/community/rankImg/simbol.png">
					</div>
					<div class ="infoText">
						<div class ="infoName">
							<span class ="nickName">스누피</span>
						</div>
						<div class ="grade">
							<span>Lv.5 검정띠</span><img src="/FoodFighter/resources/img/community/rankImg/grade.png"style = "margin-left : 20px; width : 30px; height : 30px;">
						</div>
					</div>
				</div><!-- rankerInfo -->
				<div class ="rankerBoardWrap">
					<ul class ="postList">
						<li class ="postItem">
							<div class ="review">
								<a href="#" class ="reviewLink">
									<span class = "reviewThumb"></span>
									<div class ="reviewText">
										<strong class = "reviewTextSum">
											<p>신논현 맛집 리뷰 : 할랄가이즈 가고 싶은 맛집</p>
										</strong>
									</div>
								</a>
							</div>
						</li>
						<li class ="postItem">
							<div class ="review">
								<a href="#" class ="reviewLink">
									<span class = "reviewThumb"></span>
									<div class ="reviewText">
										<strong class = "reviewTextSum">
											<p>신논현 맛집 리뷰 : 할랄가이즈 가고 싶은 맛집</p>
										</strong>
									</div>
								</a>
							</div>
						</li>
						<li class ="postItem">
							<div class ="review">
								<a href="#" class ="reviewLink">
									<span class = "reviewThumb"></span>
									<div class ="reviewText">
										<strong class = "reviewTextSum">
											<p>신논현 맛집 리뷰 : 할랄가이즈 가고 싶은 맛집</p>
										</strong>
									</div>
								</a>
							</div>
						</li>
					</ul>
				</div>
			</div><!-- rankInner -->
		</li>
	</ul>
</div><!-- pageBody -->
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

<script type="text/javascript">
/* 사이드바 */
function myFunction(x) {
    x.classList.toggle("change");
    if (document.getElementById("mySidenav").style.width == '250px') {
        document.getElementById("mySidenav").style.width = "0";
        return;
    }
    document.getElementById("mySidenav").style.width = "250px";
}
	$('.adminDelete').hide();
	
function changeRank() {
    if (document.getElementById("img").src.match("/FoodFighter/resources/img/community/rankImg/home.png")) {
        document.getElementById("img").src = "/FoodFighter/resources/img/community/rankImg/simbol.png";
    } else {
        document.getElementById("img").src = "/FoodFighter/resources/img/community/rankImg/home.png";
    }
}

$('.grade span').click(function(){
	  $(this).parent().children('span').removeClass('on');
	  $(this).addClass('on').prevAll('span').addClass('on');
	  return false;
	});

</script>
</body>
</html>