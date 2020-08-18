<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 | 자유게시판</title>
<style type="text/css">
body, html {
    height: 100%;
}
</style>
<!-- CSS 파일 -->             
<link rel="stylesheet" href="/FoodFighter/resources/css/community/normalize.css">
<link rel="stylesheet" href="/FoodFighter/resources/css/community/sidenav.css">
<link rel="stylesheet" href="/FoodFighter/resources/css/community/communityHeader.css">
<link rel="stylesheet" href="/FoodFighter/resources/css/community/communityBoardView.css">
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
	       <a class="header-link" href="communityMain.jsp"><img src="/FoodFighter/resources/img/member.png" class="header_searchIcon" width="30" height="30" align="center"></a>
    	 </li>
   	</ul>
</div>
<div id="mySidenav" class="sidenav">
	<a href="/FoodFighter/community/communityNotice"><span class="glyphicon glyphicon-exclamation-sign"></span>&emsp;공지사항</a>
    <a href="/FoodFighter/community/communityBoard"><span class="glyphicon glyphicon-list"></span>&emsp;게시판</a>
    <a href="/FoodFighter/community/communityRank"><span class="glyphicon glyphicon-star"></span>&emsp;랭킹</a>
    <a href=""><span class="glyphicon glyphicon-question-sign"></span>&emsp;고객센터</a>
</div>
<!-- 본문 -->
<div class="container" style="margin-top : 80px;">
	<div class="page-header">
    	<h2 class="text-center">커뮤니티 자유게시판</h2>      
   	</div>
</div>
<div class="page-body">
	<div class = "view-upper clearfix">
		<div class = "area_l">
			<a href = "#">
				<span class = "plain-btn">목록</span></a>
			<a href = "#">
				<span class = "plain-btn">이전글</span></a>
		</div>
		<div class = "area_r">
			<a href = "#">
				<span class = "plain-btn">답글</span></a>
			<a href = "#">
				<span class = "plain-btn">수정</span></a>
			<a href = "#">
				<span class = "plain-btn" style = "color : red;">삭제</span></a>
		</div>
	</div>
	<div class = "view_stat">
		<div class ="mphoto">
			<img src = "/FoodFighter/resources/img/community/boardImg/d.jpg">
		</div>
		<div class = "info">
			<h1>
				<span class = "subject">신논현 근처 맛집 아는 사람 있어?</span>
			</h1>
			<p>
				<span class = "name">김비트</span>
				<span class = "date">2020.08.03</span>
			</p>
		</div>
	</div>
	<div class = "viewbox">
		<div class = "content">
			<p>신논현에서 학원 다니는데</p>
			<p>점심 먹을 때마다 존나 고민됨</p>
			<p>사진은 내가 좋아하는 폴 러드 사진</p>
			<div class ="attach"><img src = "/FoodFighter/resources/img/community/boardImg/antman.png"></div>
		</div>
	</div>
		<div class ="cont_recommendation clearfix">
			<div class = "area_l">
				<a href = "#"><span class = "plain-btn">댓글</span></a>
			</div>
		</div>
		<!-- 댓글 -->
		<div class = "cont_comment" id = "cont_comment">
			<ul class = "comment_list">
				<li class = "comment_section">
					<div class ="pic"><img src = "/FoodFighter/resources/img/community/boardImg/d.jpg"></div>
					<div class ="info">
						<div class ="comment_post">
							<div class = "data">
								<span class = "txt_name">가성비트캠프</span>
							</div>
							<span class ="txt_date">08.03 17:50</span>
							<div class ="comment_cont">
								신논현 근처에 맛집 없어요. 걍 아무거나 드세요
							</div>
							<div class = "comment_reply" id = "comment_reply">
								<a href ="javascript:" class ="reply">답글</a>
							</div>
						</div>
					</div>
					<div class = "comment_replyWrite">
						<div class ="inner_text_write">
							<div class ="box_textarea">
							<textarea placeholder="인터넷은 우리가 함께 만들어가는 소중한 공간입니다. 댓글 작성 시 타인에 대한 배려와 책임을 담아주세요"	
							maxlength="600" style ="height : 86px;"></textarea><!-- 모달로 경고 띄우기 -->
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
					</div> <!-- 대댓 -->
					<div class = "clear"></div>
				</li>
				<li class = "comment_section">
					<div class ="pic"></div>
					<div class ="info">
						<div class = "data">
							<span class = "txt_name">집에갈거야</span>
						</div>
						<span class ="txt_date">08.05 20:50</span>
						<div class ="comment_cont">
							집에 가고 싶네
						</div>
						<div class = "comment_reply" id = "comment_reply">
							<a href ="javascript:" class ="reply">답글</a>
						</div>
					</div>
					<div class = "clear"></div>
					<li class = "comment_section" style ="padding: 14px 0 20px 90px;">
					<div class ="pic"></div>
					<div class ="info">
						<div class = "data">
							<span class = "txt_name">집에갈거야</span>
						</div>
						<span class ="txt_date">08.05 20:50</span>
						<div class ="comment_cont">
							집에 가고 싶네
						</div>
						<div class = "comment_reply" id = "comment_reply">
							<a href ="javascript:" class ="reply">답글</a>
						</div>
					</div>
					<div class = "clear"></div>
				</li>
				</li>
			</ul>
			<div class ="simple_paging">
				<a href ="#" title = "prev">
					<span><</span>
				</a>
				<a href ="#" title = "1페이지">
				<span>1</span>
				</a>
				<a href ="#" title = "2페이지">
					<span>2</span>
				</a>
				<a class = "now" href ="#" title = "3페이지">
					<span>3</span>
				</a>
				<a href ="#" title = "4페이지">
					<span>4</span>
				</a>
				<a href ="#" title = "5페이지">
					<span>5</span>
				</a>
				<a href ="#" title = "next">
					<span>></span>
				</a>
			</div>
			<div class ="comment_write">
				<div class ="inner_text_write">
					<div class ="box_textarea">
						<textarea placeholder="인터넷은 우리가 함께 만들어가는 소중한 공간입니다. 댓글 작성 시 타인에 대한 배려와 책임을 담아주세요"	
								maxlength="600" style ="height : 86px;"></textarea><!-- 모달로 경고 띄우기 -->
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
	<div class = "view-upper clearfix" style ="margin-bottom: 20px;">
		<div class = "area_l">
			<a href = "#">
				<span class = "plain-btn">최신목록</span></a>
			<a href = "#">
				<span class = "plain-btn" style = "color : red;">글쓰기</span></a>
		</div>
		<div class = "area_r">
			<a href = "#">
				<span class = "plain-btn">답글</span></a>
			<a href = "#">
				<span class = "plain-btn">수정</span></a>
			<a href = "#">
				<span class = "plain-btn" style = "color : red;">삭제</span></a>
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
<!-- <div class = "comment_replyWrite">
						<div class ="inner_text_write">
							<div class ="box_textarea">
							<textarea placeholder="인터넷은 우리가 함께 만들어가는 소중한 공간입니다. 댓글 작성 시 타인에 대한 배려와 책임을 담아주세요"	
							maxlength="600" style ="height : 86px;"></textarea>모달로 경고 띄우기
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
					</div> -->
<script type="text/javascript">
function myFunction(x) {
    x.classList.toggle("change");
    if (document.getElementById("mySidenav").style.width == '250px') {
        document.getElementById("mySidenav").style.width = "0";
        return;
    }
    document.getElementById("mySidenav").style.width = "250px";
}
$('.cont_comment').on('click', '.reply', function(e){
	let reply = $('.reply')
	if(e.target == e.currentTarget) {
		reply.text('답글 접기');
    } else {
    	e.preventDefault();
    } 

});
</script>
</body>
</html>