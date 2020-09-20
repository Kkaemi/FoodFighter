<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
request.setCharacterEncoding("utf-8");
String keyword = request.getParameter("keyword");
%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FAQ게시판</title>
    
    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="/FoodFighter/resources/css/community/normalize.css">
    <link rel="stylesheet" href="/FoodFighter/resources/css/community/communityCSBoard.css">
    <link rel="stylesheet" href="/FoodFighter/resources/css/community/faq.css">
    <link rel="stylesheet" href="/FoodFighter/resources/css/community/sidenav.css">
    <!-- <link rel="stylesheet" href="/FoodFighter/css/community/header_and_footer.css"> -->
    <link rel="stylesheet" href="/FoodFighter/resources/css/community/communityCSHeader.css">
</head>

<body>
    <!--================ Header ================-->
	<form id="headerForm" name="headerForm" method="post" action="../review/getSearchList">
	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
		<div id="header-container">
		<!-- 햄버거버튼 -->
        <div class="hamberger pull-left" onclick="myFunction(this)">
            <div class="bar1"></div>
            <div class="bar2"></div>
            <div class="bar3"></div>
        </div>
		  <a class="header-logo" href="/FoodFighter"><img src="../resources/img/logo.png" width="250px;" height="55px;" align="left" style="margin-top: 10px; margin-left: 200px;"></a>
		      <ul id="header-menu">
			      <li class="header-items">
			  		<img src="../resources/img/search.png" class="header_searchIcon" width="30" height="30" align="center"> 
			   		<input type="search" class="header_searchInput" placeholder="&emsp;&emsp;식당 또는 음식 검색" id ="keyword" name="keyword" value="<%=keyword%>" autocomplete="on" maxlength="50" >
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
    
    <!-- 왼쪽 메뉴바 -->
    <div id="mySidenav" class="sidenav" style="margin-top: 50px;">
	  	<a href="/FoodFighter/community/communityNotice"><span class="glyphicon glyphicon-exclamation-sign"></span>&emsp;공지사항</a>
	    <a href="/FoodFighter/community/communityBoard"><span class="glyphicon glyphicon-list"></span>&emsp;게시판</a>
	    <a href="/FoodFighter/community/communityRank"><span class="glyphicon glyphicon-star"></span>&emsp;랭킹</a>
	    <a href="/FoodFighter/community/csCenter"><span class="glyphicon glyphicon-question-sign"></span>&emsp;고객센터</a>
    </div>
    
    <!-- 제목부분 -->
    <div class="container" style="border-top-width: 65px; border-top-style: solid;">
        <div class="page-header">
            <h2 class="text-center">FAQ</h2>
            <p class="text-center">자주 묻는 질문 모음</p>
        </div>
    </div>
    <!-- FAQ 본문 -->
    <div class="page-body" style="margin-bottom: 300px;">
        
        <!-- 탭버튼 -->
        <ul class="mypage_type">
            <li class="selected"><a href="/FoodFighter/community/memberFAQ">회원 관련</a></li>
            <li><a href="/FoodFighter/community/reviewFAQ">리뷰 관련</a></li>
            <li><a href="/FoodFighter/community/etcFAQ">기타</a></li>
        </ul>
        <!-- //탭버튼 -->
        <!-- 콘텐츠 -->
        <table class="table_basic table_faq_cs">
            <colgroup>
                <col width="8%">
                <col width="">
            </colgroup>
            <thead>
                <tr>
                    <th style="text-align: center;">번호</th>
                    <th style="text-align: center;">내용</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>1</td>
                    <td class="txt_contents"><a href="#"
                            onclick="viewContent('faq_69', '', '');">회원가입은 어떻게 하나요?</a>
                    </td>
                </tr>
                <tr id="faq_69" style="display: none;">
                    <td class="faq_q">답변</td>
                    <td class="faq_a">
                        <p>푸드파이터 상단 오른쪽에 있는 회원 프로필 사진을 누르면 회원가입과 로그인버튼이 나옵니다 그곳에서 회원가입 해주세요~</p>
                    </td>
                </tr>
                <tr>
                    <td>2</td>
                    <td class="txt_contents"><a href="javascript:void(0)"
                            onclick="viewContent('faq_70', '', ''); return false;">회원정보수정은 어떻게 하나요?</a></td>
                </tr>
                <tr id="faq_70" style="display: none;">
                    <td class="faq_q">답변</td>
                    <td class="faq_a">
                        <p>
                        	로그인 한 상태에서 푸드파이터 페이지 상단 오른쪽에 있는 회원 프로필 사진을 누르면 마이페이지 버튼이 나옵니다<br>
                        	마이페이지에 들어가시면 정보수정 버튼이 있습니다<br>
                        	정보수정 버튼을 누른 후 비밀번호를 다시한번 입력하시게되면 회원정보 수정 하실 수 있습니다~
                        </p>
                    </td>
                </tr>
                <tr>
                    <td>3</td>
                    <td class="txt_contents"><a href="javascript:void(0)"
                            onclick="viewContent('faq_71', '', ''); return false;">회원탈퇴는 어떻게 하나요?</a></td>
                </tr>
                <tr id="faq_71" style="display: none;">
                    <td class="faq_q">답변</td>
                    <td class="faq_a">
                        <p>
                        	로그인 한 상태에서 푸드파이터 페이지 상단 오른쪽에 있는 회원 프로필 사진을 누르면 마이페이지 버튼이 나옵니다<br>
                        	마이페이지에 들어가시면 정보수정 버튼이 있습니다<br>
                        	정보수정 버튼을 누른 후 비밀번호를 다시한번 입력하시게되면 회원정보 수정 하실 수 있는데<br>
                        	그곳에서 회원탈퇴 버튼을 누르면 회원탈퇴를 하실 수 있습니다~
                        </p>
                    </td>
                </tr>
                
                <tr>
                    <td>4</td>
                    <td class="txt_contents"><a href="javascript:void(0)"
                            onclick="viewContent('faq_72', '', ''); return false;">프로필 사진 변경이 안됩니다</a></td>
                </tr>
                <tr id="faq_72" style="display: none;">
                    <td class="faq_q">답변</td>
                    <td class="faq_a">
                        <p>
                        	기능관련 문제는 QnA게시판에 문의하시면 해결 도와드리겠습니다
                        </p>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- //콘텐츠 -->
    
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
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="/FoodFighter/resources/js/review/keyword.js"></script>
<script type="text/javascript">
	function myFunction(x) {
	    x.classList.toggle("change");
	    if (document.getElementById("mySidenav").style.width == '250px') {
	        document.getElementById("mySidenav").style.width = "0";
	        return;
	    }
	    document.getElementById("mySidenav").style.width = "250px";
	}
	
	function viewContent(id, a, b) {
		var faq_id = '#' + id;
		
		$(faq_id).toggle(function() {
			$(faq_id).removeAttr("style");
		}, function() {
			/* $(faq_id).css('display', 'none'); */
		});
	}
</script>
</html>