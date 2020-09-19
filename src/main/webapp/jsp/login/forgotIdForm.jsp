<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />
 
 <!-- CSS 파일 -->
<link rel="stylesheet" href="/FoodFighter/resources/css/login/login.css">
<link rel="stylesheet" href="/FoodFighter/resources/css/event/headerCss.css">

<!-- JS 파일 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<title>아이디찾기</title>
<style type="text/css">
body, html {
    height: 100%;
}

</style>
 </head>
 
<header>
<!-- 헤더 -->
<!--================ Header ================-->
<form id="headerForm" name="headerForm" method="post" action="../review/getSearchList">
<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
	<div id="header-container">
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
		       <!-- <li class="nav-item">
	         	  <a class="nav-link js-scroll" href="/FoodFighter/review/reviewNonSearchList">리뷰 리스트</a>
	          </li> -->
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
    <%-- <div class="modal headUser-menu" id="headUser-menu" role="dialog">
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
    </div> --%>

</form>
</header>

<body>
	<section class="forgotId-form" >
		<h1>아이디 찾기</h1><br><br>
			<form action="">
				<div class="int-area">
					닉네임<input type="text" name="nickName" id="nickName" >
					<label for="nickName"></label>					
				</div>
				<div id="nickNameDiv" ></div>
				
				 <div class="modal fade" id="findId" role="dialog">
				  <div class="modal-dialog">
				    <div class="modal-content">
				     
				      <div class="modal-header">
				        <!-- //<button type="button" class="close" data-dismiss="modal">×</button> -->
				         <input type="hidden" name="bookId" id="bookId" value=""/>
				      </div>
				      
				      <div class="modal-body">
				        	
				        	<br><br>
				      </div>
				    </div>
				  </div>
				</div>
				
				
				<div id="ResultDiv"></div>
				
				<div class="btn-area">
					<button id="searchbtn" type="button">찾기</button>
				</div>
			</form>
	</section>

<script type="text/javascript">
/* $('#headerUser').click(function(){
	$('#headUser-menu').modal();
}); */
</script>
<script type="text/javascript">
$(document).ready(function(){
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    $(document).ajaxSend(function(e, xhr, options) {
        xhr.setRequestHeader(header, token);
    });
});



$('#searchbtn').click(function(){  
	 $('#nickNameDiv').empty();
	 
	 if($('#nickName').val() == ''){ 
		 	$('#nickNameDiv').text('닉네임을 입력하세요.')
			$('#nickNameDiv').css('color','red')
			$('#nickNameDiv').css('font-size','8pt')
			$('#nickNameDiv').css('font-weight','bold')
			$('#nickNameDiv').focus();
		
	}else{
	   	 $.ajax({
	    		type : 'post',
	    		url : '/FoodFighter/login/getforgotId',
	    		data : { 'nickName' : $('#nickName').val()},						
	    			 dataType : 'json',
	 			 success : function(data){				 
	 				 //alert(JSON.stringify(data));
	 				 
	 				 if(data.find == 'no'){ 
	 					 alert("찾을 아이디가 없습니다!");
	 				 }else{
	 			       
	 					alert(data.memberDTO.email);  
	 					
	 				   
	 				 }
	 	
	 	   		},
	    		error : function(e){
	 				console.log(e); 
	 			}
	    		});
	    	
	    }
	 });
</script>

</body>
</html>