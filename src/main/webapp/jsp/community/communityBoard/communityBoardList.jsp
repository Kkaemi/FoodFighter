<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
    
<!DOCTYPE html>
<html>
<head>
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />
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
<form id="headerForm" name="headerForm" method="post" action="../review/getSearchList">
<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
	<div id="header-container">
	<div class="hamberger pull-left" onclick="myFunction(this)">
        <div class="bar1"></div>
        <div class="bar2"></div>
        <div class="bar3"></div>
    </div>
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
	<!-- usermenu -->
    <div class="modal headUser-menu" id="headUser-menu" role="dialog">
  	  <div class="tri"></div>
  	  <c:if test="${memId == null}">
  	  	  <p>로그인 또는 회원가입을 하시면 <br> 더 많은 서비스를 <br>이용하실 수 있습니다.</p>
  		  <hr>
	  	  <button type="button" id="loginBtn" class="headUserMenu-Btn"  onclick="location.href='/FoodFighter/login/loginForm'" >로그인</button>
	  	  <button type="button" id="signupBtn" class="headUserMenu-Btn" onclick="location.href='/FoodFighter/member/signupChoice'" >회원가입</button>
  	  </c:if>
  	  <c:if test="${memId == 'admin@admin.com'}">
  		  <p>관리자로<br> 로그인 하셨습니다. </p>
  		  <hr>
	  	  <button type="button" id="adminBtn" class="headUserMenu-Btn"  onclick="location.href='/FoodFighter/admin/adminMain'" >관리자페이지</button>
	  	  <button type="button" id="logoutBtn" class="headUserMenu-Btn"  onclick="location.href='/FoodFighter/login/logout'">로그아웃</button>
  	  </c:if>
  	  <c:if test="${memId != null && sessionScope.memId != 'admin@admin.com'}">
  		  <p>맛집을 찾아보고 <br> 후기를 남겨보세요.</p>
  		  <hr>
	  	  <button type="button" id="mypageBtn" class="headUserMenu-Btn"  onclick="location.href='/FoodFighter/mypage/mypageMain'" >마이페이지</button>
	  	  <button type="button" id="logoutBtn" class="headUserMenu-Btn"  onclick="location.href='/FoodFighter/login/logout'">로그아웃</button>
  	  </c:if>
    </div>
 </form>
<!-- 사이드바 -->
<div id="mySidenav" class="sidenav">
	<a href="communityNotice"><span class="glyphicon glyphicon-exclamation-sign"></span>&emsp;공지사항</a>
    <a href="communityBoard"><span class="glyphicon glyphicon-list"></span>&emsp;게시판</a>
    <a href="communityRank"><span class="glyphicon glyphicon-star"></span>&emsp;랭킹</a>
    <a href="/FoodFighter/community/csCenter"><span class="glyphicon glyphicon-question-sign"></span>&emsp;고객센터</a>
</div>
<!-- 본문 -->
<input type="hidden" id="pg" value="${pg}">
<div style = "clear: both;"></div>
<div class="container" style="margin-top : 95px;">
	<div class="page-header">
    	<h2 class="text-center">커뮤니티 자유게시판</h2>      
  		<p class="text-center">푸드파이터들과 자유롭게 대화해보세요</p>      
  	</div>
</div>
<div class="page-body">
  <table class="table table-hover" id = "cmntBoard">
  	<colgroup id ="colgroup">
  		<col width = "60">
  		<col width = "*">
  		<col width = "110">
  		<col width = "90">
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
    <tbody id = "cBTable">
      <c:if test = "${list ne null }">
      	<c:forEach var = "cBoard" items ="${list }">
      		<tr>
      			<td class ="adminDelete">
		      		<div class = "tb-center"><input type ="checkbox" class = "select" value="${cBoard.bseq }"></div>
		      	</td>
		      	<td>
		      		<div class = "tb-center">${cBoard.bseq }</div>
		      	</td>
		      	<td>
		      		<div class = "tb-left">
		      			<c:if test="${cBoard.lev != 0 }">					
							<c:forEach var="i" begin="1" end="${cBoard.lev }" step="1">&emsp;</c:forEach><img src ="../resources/img/community/boardImg/reply_icon.png" 
																										style ="vertical-align : top !important; width : 12px; height : 12px; margin : 0 5px 0 3px;">
						</c:if>
						<a id = "subjectA">${cBoard.subject }</a>
					</div>
		      	</td>
		      	<td>
		      		<div class = "tb-center">${cBoard.nickname }</div>
		      	</td>
		      	<!-- 오늘 날짜 -->
		      	<jsp:useBean id="now" class="java.util.Date" />
				<fmt:formatDate value="${now}" pattern = "yyyyMMdd" var = "today" />
				
		      	<!-- 가져온 게시글의 날짜 -->
		      	<fmt:formatDate value="${cBoard.logtime}" pattern="yyyyMMdd" var="todayBoard" />
		      	<td>
			      	<c:if test="${today == todayBoard}">
					<fmt:formatDate var = "date" value="${cBoard.logtime }" pattern="HH:mm"/>
						<div class ="tb-center">${date }</div>
					</c:if>
					<c:if test="${today != todayBoard}">
					<fmt:formatDate var = "date" value="${cBoard.logtime }" pattern="yyyy-MM-dd"/>
						<div class ="tb-center">${date }</div>
					</c:if>
		      	</td>
		      	<td>
		      		<div class ="tb-center">${cBoard.hit }</div>
		      	</td>
      		</tr>
      	</c:forEach>
      </c:if>
    </tbody>
  </table>

	<div class = "content-wrapper">
		<div class = "pagingBox">
			${cBPaging.pagingHTML}
		</div>
		<div class = "listBtnBox">
			<a href = "communityBoard?pg=1">
				<span class = "plain-btn">처음 목록</span></a>
			<a href = "communityBoardWriteForm?pg=${pg }">
				<span class = "plain-btn" style = "color : red;" id = "write">글쓰기</span></a>
		</div>
	</div>
	<div class = "list-search">
		<fieldset>
	<form id = "boardSrch" action = "/FoodFighter/community/communityBoardSearch?${_csrf.parameterName}=${_csrf.token}" action="get">
		<select name = "bSrchOption" id = "bSrchOption">
			<option value = "subject" selected>제목</option>
			<option value = "content">본문</option>
			<option value = "nickname">닉네임</option>
		</select>
		<input type = "text" placeholder = "검색어를 입력해주세요" name = "bKeyword" id = "bKeyword" value = "${bKeyword }">
		<input type = "button" value = "검색" class = "plain-btn" id = "bSrchBtn">
		<input type = "hidden" class = "bSrchOption" value = "${bSrchOption }">	
	</form>
		</fieldset>
	</div>
</div>
<!--================  Footer ================-->
<div id="footer-container">
 <p class="copyright" style="text-align:left;">
     ㈜ 푸드파이터<br>서울 서초구 강남대로 459(백암빌딩) 202호<br>대표이사: FOODFIGHTER<br>사업자 등록번호: 2020-020-22222 
       <br>고객센터: 0507-1414-9601<br><br>
        <strong>HOME | 리뷰리스트 | 커뮤니티 | 이벤트</strong><br><br>
       &copy; Copyright <strong>FoodFighter</strong>. All Rights Reserved
             Designed by FoodFighter
 </p>
</div>
<script type="text/javascript" src= "/FoodFighter/resources/js/community/communitySidenavJS.js"></script> <!-- 사이드바 JS -->
<script type="text/javascript" src= "/FoodFighter/resources/js/review/keyword.js"></script> <!-- 헤더 JS -->
<script type="text/javascript">
let id = '${memberDTO.nickname}';
$('.adminDelete').css('display', 'none');
$('#write').css('display', 'none');
</script>
<script type="text/javascript" src ="/FoodFighter/resources/js/community/communityBoardJS.js"></script>
</body>
</html>