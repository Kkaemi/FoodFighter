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
<link rel="stylesheet" href="/FoodFighter/sources/css/community/normalize.css">
<link rel="stylesheet" href="/FoodFighter/sources/css/community/sidenav.css">
<link rel="stylesheet" href="/FoodFighter/sources/css/community/communityHeader.css">
<link rel="stylesheet" href="/FoodFighter/sources/css/community/communityBoardWrite.css">

<!-- JS 파일 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> <!-- 부트스트랩 CSS  -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> <!-- 부트스트랩 JS -->
<!-- 썸머노트 -->
<link rel="stylesheet"  href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
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
	       <a class="header-link" href="communityMain.jsp"><img src="../mainImg/user.png" class="header_searchIcon" width="30" height="30" align="center"></a>
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
<div class="container" style="margin-top : 95px;">
	<div class="page-header">
    	<h2 class="text-center" style="margin-bottom: 20px;">커뮤니티 공지사항</h2> 
  		<p class="text-center" style ="font-size: medium; font-weight: bold;">수정</p>      
  	</div>
</div>
<div class ="page-body">
	<div class ="writeTable">
		<form id = communityBoardModifyForm method = "post" enctype = "multipart/form-data" style = "position: relative;">
				<table>
					<colgroup>
						<col width = "135">
						<col width = "395">
						<col width = "155">
						<col width = "*">
					</colgroup>
					<tbody>
						<tr>
							<th><div style = "text-align: center;">제목</div></th>
							<td colspan="3">
								<div class ="title">
									<input type = "text" id ="subject" class ="subject"> <!-- 경고 모달 -->
								</div>
								<div class ="title_select"></div>
							</td>
						</tr>
						<tr>
							<th><div style = "text-align: center;">내용</div></th>
							<td colspan="3">
								<div>
									<textarea id ="summernote" name ="content"></textarea> <!-- 경고 모달 -->
								</div>
							</td>
						</tr>
						<tr>
							<th style = "text-align: center;">파일</th>
							<td colspan = "3">
								<div>
									<input type = "text" id = "img1" class ="fileSelect">
									<a href="#" class ="btn_file">찾아보기</a>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
		</form>
		<div class = "btn_area clearfix">
			<a href = "#">
				<span class = "btn-o" id = "modify">수정</span></a>
			<a href = "#">
			<span class = "btn-o">취소</span></a>
		</div>
	</div>
	<div class ="clear"></div>
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
/* 썸머노트 */
$(document).ready(function(){
	$('#summernote').summernote({
	    tabsize: 2,
	    height: 400,
	    minHeight : null,
	    maxHeight : null,
	    placeholder: '최대 ~~~자까지 쓸 수 있습니다.',
	    lang : "ko-KR",
	    toolbar: [
		    // [groupName, [list of button]]
		    ['fontname', ['fontname']],
		    ['fontsize', ['fontsize']],
		    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
		    ['color', ['forecolor','color']],
		    ['table', ['table']],
		    ['para', ['ul', 'ol', 'paragraph']],
		    ['height', ['height']],
		    ['insert',['picture','link','video']],
		    ['view', ['fullscreen', 'help']]
		  ],
		fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
		fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
	  });
});
$('#modify').click(function(){
	if ($('#subject').val() == ''){
		alert("제목을 입력해주세요");
	}else if ($('#summernote').val() == ''){
		alert("내용을 입력해주세요");
	}
});
</script>
</body>
</html>