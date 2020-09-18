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
<title>커뮤니티 | 공지사항</title>
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
<!-- 헤더 -->
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
    	<h2 class="text-center">커뮤니티 공지사항</h2>      
  		<p class="text-center">공지사항을 잘 확인해보세요</p>      
  	</div>
</div>
<div class="page-body">
  <table class="table table-hover" id = "noticeBoard">
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
    <tbody id = cNTable>
    	<c:if test = "${list ne null}">
    		<c:forEach var ="cNotice" items = "${list }">
		      <tr>
		      	<td class ="adminDelete">
		      		<div class = "tb-center"><input type ="checkbox" class = "select" value="${cNotice.nseq }"></div>
		      	</td>
		      	<td>
		      		<div class = "tb-center">${cNotice.nseq }</div>
		      	</td>
		      	<td>
		      		<div class = "tb-left"><a id = "subjectA">${cNotice.subject }</a></div>
		      	</td>
		      	<td>
		      		<div class = "tb-center">${cNotice.nickname }</div>
		      	</td>
		      	<!-- 오늘 날짜 -->
		      	<jsp:useBean id="now" class="java.util.Date" />
				<fmt:formatDate value="${now}" pattern = "yyyyMMdd" var = "today" />
				
		      	<!-- 가져온 게시글의 날짜 -->
		      	<fmt:formatDate value="${cNotice.logtime}" pattern="yyyyMMdd" var="todayNotice" />
		      	<td>
			      	<c:if test="${today == todayNotice}">
					<fmt:formatDate var = "date" value="${cNotice.logtime }" pattern="HH:mm"/>
						<div class ="tb-center">${date }</div>
					</c:if>
					<c:if test="${today != todayNotice}">
					<fmt:formatDate var = "date" value="${cNotice.logtime }" pattern="yyyy-MM-dd"/>
						<div class ="tb-center">${date }</div>
					</c:if>
		      	</td>
		      	<td>
		      		<div class ="tb-center">${cNotice.hit }</div>
		      	</td>
		      </tr>
      		</c:forEach>
      </c:if>
    </tbody>
  </table>
  
	<div class = "content-wrapper">
		<div class = "pagingBox">
			${cNPaging.pagingHTML}
		</div>
		<div class = "listBtnBox">
			<a href = "communityNotice?pg=1">
				<span class = "plain-btn">처음 목록</span></a>
			<a href = "communityNoticeWriteForm?pg=${pg }">
				<span class = "plain-btn" id = "adminNoticeWrite">글쓰기</span></a>
		</div>
	</div>
	<div class = "list-search">
		<fieldset>
	<form id = "noticeSrch" action = "/FoodFighter/community/communityNoticeSearch?${_csrf.parameterName}=${_csrf.token}" method="get">
		<select name = "nSrchOption" id = "nSrchOption">
			<option value = "subject" selected>제목</option>
			<option value = "content">본문</option>
		</select>
		<input type = "text" placeholder = "검색어를 입력해주세요" name = "nKeyword" id = "nKeyword" value = "${nKeyword }">
		<input type = "button" value = "검색" class = "plain-btn" id = "nSrchBtn">
		<input type = "hidden" class = "nSrchOption" value = "${nSrchOption }">	
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
<script type="text/javascript" src ="/FoodFighter/resources/js/community/communitySidenavJS.js"></script>
<script type="text/javascript" src= "/FoodFighter/resources/js/review/keyword.js"></script> <!-- 헤더 JS -->
<script type="text/javascript">
let id = '${memberDTO.nickname}';
$('.adminDelete').css('display', 'none');
$('#adminNoticeWrite').css('display', 'none');
</script>
<script type="text/javascript" src ="/FoodFighter/resources/js/community/communityNoticeJS.js"></script>
</body>
</html>