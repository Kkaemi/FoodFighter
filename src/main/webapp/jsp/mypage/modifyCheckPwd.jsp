<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%
request.setCharacterEncoding("utf-8");
String keyword = request.getParameter("keyword");
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />
<title>Insert title here</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="/FoodFighter/resources/css/mypage/modifyCheckFormStyle.css">
</head>
<body>
<!--================ Header ================-->
<form id="headerForm" name="headerForm" method="post" action="../review/getSearchList">
<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"> 
	<div id="header-container">
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
 </form>
<!-- usermenu -->
  <div class="modal headUser-menu" id="headUser-menu" role="dialog">
     <div class="tri"></div>
     <c:if test="${sessionScope.memId == null}">
        <p>로그인 또는 회원가입을 하시면 <br> 더 많은 서비스를 <br>이용하실 수 있습니다.</p>
        <hr>
        <button type="button" id="loginBtn" class="headUserMenu-Btn"  onclick="location.href='/FoodFighter/login/loginForm'" >로그인</button>
        <button type="button" id="signupBtn" class="headUserMenu-Btn" onclick="location.href='/FoodFighter/member/signupChoice'" >회원가입</button>
     </c:if>
     <c:if test="${sessionScope.memId == 'admin@admin.com'}">
        <p>관리자로<br> 로그인 하셨습니다. </p>
        <hr>
        <button type="button" id="adminBtn" class="headUserMenu-Btn"  onclick="location.href='/FoodFighter/admin/adminDashboard'" >관리자페이지</button>
        <button type="button" id="logoutBtn" class="headUserMenu-Btn"  onclick="location.href='/FoodFighter/login/logout'">로그아웃</button>
     </c:if>
     <c:if test="${sessionScope.memId != null && sessionScope.memId != 'admin@admin.com'}">
        <p>맛집을 찾아보고 <br> 후기를 남겨보세요.</p>
        <hr>
        <button type="button" id="mypageBtn" class="headUserMenu-Btn"  onclick="location.href='/FoodFighter/mypage/mypageMain'" >마이페이지</button>
        <button type="button" id="logoutBtn" class="headUserMenu-Btn"  onclick="location.href='/FoodFighter/login/logout'">로그아웃</button>
     </c:if>
  </div>
<div class="head-container">
  <div class="head-content">
  	
  </div>
</div>
<div class="body-container">
  <div class="body-content row">
  	<div class="wrapDiv col-6 offset-3">
	  	<div class="body-title">
	  		<span>비밀번호 재확인</span>
	  		<p>개인정보 보호를 위해 회원님의 비밀번호를 다시 한번 확인합니다.</p>
	  	</div> 
	  	<div class="body-input col-6 ">
	  		<form id="pwdCheckForm">
	  			<input type="text" id="email" name="email" class="form-control" value="${email}"readonly>
	  			<input type="password" id="pwd" name="pwd" class="form-control">
	  			<button type="button" id="confirmBtn" class="btn btn-block">확인</button>
	  		</form>
	  	</div>
  	</div>	
  </div>
</div>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- 부트스트랩 js -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" ></script>
<script type="text/javascript">
$(document).ready(function(){
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    $(document).ajaxSend(function(e, xhr, options) {
        xhr.setRequestHeader(header, token);
    });
});

$('#confirmBtn').click(function(){
	$.ajax({
		type : 'post',
		url : '/FoodFighter/mypage/confirmPwd',
		data : $('#pwdCheckForm').serialize(),
		dataType:'text',
		success : function(data){
				if(data == "match" ){
					location.href='/FoodFighter/mypage/modifyForm'
				}else{
					alert("비밀번호가 일치하지 않습니다.");
					$('#pwd').val("");
					$('#pwd').focus();
				}
			
		},
		error : function(e){
			console.log(e);
		}
	});
});
</script>
</body>
</html>