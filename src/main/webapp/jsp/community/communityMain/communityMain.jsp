<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>푸드파이터 | 커뮤니티</title>
<style type="text/css">
body, html {
    height: 100%;
}

</style>
<!-- CSS 파일 -->
<link rel="stylesheet" href="/FoodFighter/resources/css/community/normalize.css">
<link rel="stylesheet" href="/FoodFighter/resources/css/community/sidenav.css">
<link rel="stylesheet" href="/FoodFighter/resources/css/community/communityHeader.css">
<link rel="stylesheet" href="/FoodFighter/resources/css/community/communityMain.css">

<!-- JS 파일 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
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
 	<!-- 로고 -->
 	<a id="logo" class="navbar-brand js-scroll" href="/FoodFighter/"><img id="logo-img" src="/FoodFighter/resources/img/streetfighter.gif"></a>
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
	      	<a class="header-link" href=""><img src="/FoodFighter/resources/img/community/mainImg/user.png" class="header_searchIcon" width="30" height="30" align="center"></a>
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
<div class ="page-body" style="margin-top : 95px;">
<div class="container">
	<div class = "row">
		<div class="col-sm-12 col-md-12 col-lg-12">
           <div class="boxWrap panel-primary">
                <div class="box-header">
                    <h1 class="text-center">FOOD FIGHTER</h1>
                </div>
                <div id="grid1"></div>
            </div>
        </div>
    </div>
    <div class="row">
    	 <div class="col-sm-11 col-md-11 col-lg-9">
            <div class="boxWrap" style="height: 380px;">
                <div class="box-header">
                    <h4 text-align = "left">최신 글</h4>
                </div>
                <div id=boardList">
	              <table class="table table-hover">
					<colgroup>
						<col width = "60">
						<col width = "*">
						<col width = "110">
						<col width = "75">
						<col width = "60">
					</colgroup>
				  <thead>
				    <tr>
				    	<th scope = "col" class="text-center">NO</th>
						<th scope = "col" class="text-center">제목</th>
						<th scope = "col" class="text-center">작성자</th>
						<th scope = "col" class="text-center">작성일</th>
						<th scope = "col" class="text-center">조회수</th>
				    </tr>
				  </thead>
				  <tbody>
				    <tr>
				      <td>
						<div class="text-center">2</div>
					  </td>
				      <td>
				      	<div class="text-left">신논현 근처 맛집 아는 사람 있어?</div>
				      </td>
				      <td>
				      	<div class="text-center">김비트</div>
					  </td>
				      <td>
				      	<div class="text-center">2020.08.03</div>
				      </td>
				      <td>
				      	<div class="text-center">0</div>
				      </td>
				    </tr>
				    <tr>
				      <td>
						<div class="text-center">1</div>
					  </td>
				      <td>
				      	<div class="text-left">홍콩반점 가고 싶다</div>
				      </td>
				      <td>
				      	<div class="text-center">가성비트캠프</div>
					  </td>
				      <td>
				      	<div class="text-center">2020.08.01</div>
				      </td>
				      <td>
				      	<div class="text-center">2</div>
				      </td>
				    </tr>
				  </tbody>
				</table>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-lg-3">
            <div class="boxWrap" style="height: 380px;">
                <div class="box-header">
                    <h4 class="text-center">랭킹</h4>
                </div>
                <div id=rankList">
		            <table class="table table-hover">
		            <colgroup>
		                <col width="35">
		                <col width="120">
		            </colgroup>
		          	<thead>
		            <tr>
		              <th scope="col" class="text-center">순위</th>
		              <th scope="col" class="text-center">유저</th>
		            </tr>
			        </thead>
			          <tbody>
			            <tr>
			              <td>
			                  <div class="text-center">
			                      <div class="tb-center" style="font-size: 20pt; font-weight: bold;">1</div>
			                  </div>
			              </td>
			              <td>
			                  <div class="ranker">곽아무개</div>
			              </td>
			            </tr>
			  
			            <tr>
			                <td>
			                    <div class="text-center">
			                        <div class="tb-center" style="font-size: 20pt; font-weight: bold;">2</div>
			                    </div>
			                </td>
			                <td>
			                    <div class="ranker">이아무개</div>
			                </td>
			            </tr>
			  
			            <tr>
			                <td>
			                    <div class="text-center">
			                        <div class="text-center" style="font-size: 20pt; font-weight: bold;">3</div>
			                    </div>
			                </td>
			                <td>
			                    <div class="ranker">송아무개</div>
			                </td>
			            </tr>
			
			            <tr>
			                <td>
			                    <div class="text-center" style="font-size: 20pt; font-weight: bold;">4</div>
			                </td>
			                <td>
			                    <div class="ranker">양아무개</div>
			                </td>
			            </tr>
			
			            <tr>
			                <td>
			                    <div class="text-center" style="font-size: 20pt; font-weight: bold;">5</div>
			                </td>
			                <td>
			                    <div class="ranker">지아무개</div>
			                </td>
			            </tr>
			          </tbody>
			        </table>
			    </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-12 col-md-12 col-lg-12">
            <div class="boxWrap" style="height: 260px;">
                <div class="box-header">
                    <h4>오늘 뭐 먹지?</h4>
                </div>
                <div class="panel-body text-center">
                    <p class="lead">
                    </p>
                </div>
                <div>
                    <div class="row" style="margin: 10px;">
                        <div class="col-xs-2 col-sm-5 col-md-5 col-lg-1"></div>
                        <div style="width: 190px; height: 190px;" id="progress1"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-12 col-md-12 col-lg-12">
            <div class="boxWrap" style="height: 400px;">
                <div class="box-header">
                    <h4 class="text-center">공지사항</h4>
                </div>
                <div id="grid1"></div>
            </div>
        </div>
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
</div>
<script type="text/javascript">
function myFunction(x) {
    x.classList.toggle("change");
    if (document.getElementById("mySidenav").style.width == '250px') {
        document.getElementById("mySidenav").style.width = "0";
        return;
    }
    document.getElementById("mySidenav").style.width = "250px";
}
</script>
</body>
</html>