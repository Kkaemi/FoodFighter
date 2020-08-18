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
<link rel="stylesheet" href="/FoodFighter/resources/css/community/communityBoardList.css">
<!-- JS 파일 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> <!-- 부트스트랩 CSS  -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> <!-- 부트스트랩 JS -->
</head>
<body>
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
    <a href=""><span class="glyphicon glyphicon-question-sign"></span>&emsp;고객센터</a>
</div>
<!-- 본문 -->
<div class="container" style="margin-top : 95px;">
	<div class="page-header">
    	<h2 class="text-center">커뮤니티 자유게시판</h2>      
  		<p class="text-center">푸드파이터들과 자유롭게 대화해보세요</p>      
  	</div>
</div>
<div class="page-body">
  <table class="table table-hover">
  	<colgroup id ="colgroup">
  		<col width = "60">
  		<col width = "*">
  		<col width = "110">
  		<col width = "75">
  		<col width = "60">
  	</colgroup>
    <thead>
      <tr>
      	<th scope = "col" class ="text-center adminDelete">선택</th>
      	<th scope = "col" class="text-center">NO</th>
		<th scope = "col" class="text-center">제목</th>
		<th scope = "col" class="text-center">작성자</th>
		<th scope = "col" class="text-center">작성일</th>
		<th scope = "col" class="text-center">조회수</th>
      </tr>
    </thead>
    <tbody>
      <tr>
      	<td class ="adminDelete">
      		<div class = "tb-center"><input type ="checkbox"></div>
      	</td>
        <td>
			<div class ="tb-center">2</div>
		</td>
        <td>
        	<div class ="tb-left">신논현 근처 맛집 아는 사람 있어?</div>
        </td>
        <td>
        	<div class ="tb-center">김비트</div>
		</td>
        <td>
        	<div class ="tb-center">2020.08.03</div>
        </td>
        <td>
        	<div class ="tb-center">0</div>
        </td>
      </tr>
      <tr>
      	<td class ="adminDelete">
      		<div class = "tb-center"><input type ="checkbox"></div>
      	</td>
        <td>
			<div class ="tb-center">3</div>
		</td>
        <td>
        	<div class ="tb-left">&emsp;
        	<img src ="/FoodFighter/resources/img/community/boardImg/reply_icon.png" style ="width : 12px; height : 12px; margin-right : 5px;">
        	신논현 말고 강남으로 가봐</div>
        </td>
        <td>
        	<div class ="tb-center">드랍더비트</div>
		</td>
        <td>
        	<div class ="tb-center">2020.08.20</div>
        </td>
        <td>
        	<div class ="tb-center">3</div>
        </td>
      </tr>
      <tr>
      	<td class ="adminDelete">
      		<div class = "tb-center"><input type ="checkbox"></div>
      	</td>
        <td>
			<div class ="tb-center">1</div>
		</td>
        <td>
        	<div class ="tb-left">홍콩반점 가고 싶다</div>
        </td>
        <td>
        	<div class ="tb-center">가성비트캠프</div>
		</td>
        <td>
        	<div class ="tb-center">2020.08.01</div>
        </td>
        <td>
        	<div class ="tb-center">2</div>
        </td>
      </tr>
    </tbody>
  </table>

	<div class = "content-wrapper">
		<div class = "paging">
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
			<a href ="#" title = "6페이지">
				<span>6</span>
			</a>
			<a href ="#" title = "7페이지">
				<span>7</span>
			</a>
			<a href ="#" title = "8페이지">
				<span>8</span>
			</a>
			<a href ="#" title = "9페이지">
				<span>9</span>
			</a>
			<a href ="#" title = "10페이지">
				<span>10</span>
			</a>
			<a href ="#" title = "next">
				<span>></span>
			</a>
		</div>
		<div class = "listBtnBox">
			<a href = "#">
				<span class = "plain-btn">처음 목록</span></a>
			<a href = "#">
				<span class = "plain-btn">글쓰기</span></a>
		</div>
	</div>
	<div class = "list-search">
		<fieldset>
		<select name = "where">
			<option value = "subject">제목</option>
			<option value = "content">본문</option>
			<option value = "nickname">닉네임</option>
		</select>
		<input type = "text" placeholder = "검색어를 입력해주세요" id = "inp"><!-- 검색어 입력 경고 (모달) -->
		<input type = "button" value = "검색" class = "plain-btn" id = "searchBtn">
		</fieldset>
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
/*
$(document).ready(function(){
	if(id = 'admin'){
		let col = document.createElement('col');
		col.setAttribute('width', '45');
		let colgroup = $('#colgroup');
		colgroup.prepend(col);
		$('.adminDelete').show();
		$('<tr id = "admin"/>').append($('<td id = "allCheck"/>',{
		}).append($('<input type = "checkbox" id = "allSelect"/>',{
		}))).append($('<td/>',{
			align: 'center',
			colspan : 4
		})).append($('<td/>',{
			align: 'center'
		}).append($('<input type = "button" value ="삭제" class = "plain-btn" id = "delete" />'),{
		})).prependTo($('thead'));
	}
});
*/
$('#searchBtn').click(function(){
	if($('#inp').val() == ""){
		alert("검색어를 입력해주세요");
		$('#inp').focus();
		let col = document.createElement('col');
		col.setAttribute('width', '45');
		let colgroup = $('#colgroup');
		colgroup.prepend(col);
		$('.adminDelete').show();
		$('<tr id = "admin"/>').append($('<td id = "allCheck"/>',{
		}).append($('<input type = "checkbox" id = "allSelect"/>',{
		}))).append($('<td/>',{
			align: 'center',
			colspan : 4
		})).append($('<td/>',{
			align: 'center'
		}).append($('<input type = "button" value ="삭제" class = "plain-btn" id = "delete" />'),{
		})).prependTo($('thead'));
	}
});
</script>
</body>
</html>