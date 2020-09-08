<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />

<link rel="stylesheet" href="/FoodFighter/resources/css/login/login.css">
<title>로그인</title>
</head>

<header>

	
<!--================ Header ================-->
	<div id="header-container">
	  <a class="header-logo" href="#page-top">로고 자리</a>
	      <ul id="header-menu">
		      <li class="header-items">
		  		<img src="/FoodFighter/resources/img/search.png" class="header_searchIcon" width="30" height="30" align="center"> 
		   		<input type="text" class="header_searchInput" placeholder="&emsp;&emsp;식당 또는 음식 검색" value="" autocomplete="on" maxlength="50" >
		      </li>
		      <li class="header-items">
		         <a class="header-link" href="/FoodFighter/">Home</a>
		      </li>
		      <li class="header-items">
		         <a class="header-link" href="/FoodFighter/review/reviewNonSearch">리뷰 리스트</a>
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
</header>

<body>

	<section class="login-form" >
		<h1>Login</h1>
			<form action="">
				<div class="int-area">
					아이디<input type="text" name="email" id="email" >
					<label for="id"></label>					
				</div>
				<div id="idDiv"></div>
				
				<div class="int-area">
					비밀번호<input type="password" name="pwd" id="pwd" >
					<div id="pwdDiv"> </div>
					<label for="pwd" ></label>
				</div>
				
				<div id="loginResultDiv"></div>
				
				<div class="btn-area">
					<button id="loginbtn" type="button">login</button>
				<%-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> --%> 
				</div> 
					
				<!-- div class="cacaobtn-area">
					<a id="kakao-login-btn"></a>
					<a href="http://developers.kakao.com/logout"></a>
				</div> -->
				<div class="caption">
					<a href="/FoodFighter/login/forgotIdForm">아이디찾기</a>&emsp;
					<a href="/FoodFighter/login/forgotPwdForm">비밀번호찾기</a>&emsp;<br><br>
					회원이 아니신가요? <a href="/FoodFighter/member/signupChoice"> 회원가입</a>
					</div>
			</form>
	</section>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    $(document).ajaxSend(function(e, xhr, options) {
        xhr.setRequestHeader(header, token);
    });
}); 

//header부분 키워드 입력 시, 검색 버튼 나타는 기능
$('.header_searchInput').click(function(){
	$('#header_searchBtn').addClass('show');
});


$('#loginbtn').click(function(){ 
	 $('#idDiv').empty();
	 $('#pwdDiv').empty(); 
	 
	 if($('#email').val() == ''){ 
		 	$('#idDiv').text('아이디를 입력하세요.')
			$('#idDiv').css('color','red')
			$('#idDiv').css('font-size','8pt')
			$('#idDiv').css('font-weight','bold')
			$('#idDiv').focus();	 
			 
	 }else if($('#pwd').val() == ''){

		 $('#pwdDiv').text('비밀번호를 입력하세요.')
		 $('#pwdDiv').css('color','red')
		 $('#pwdDiv').css('font-size','8pt')
		 $('#pwdDiv').css('font-weight','bold')
		 $('#pwdDiv').focus();
		
	}else{
    	$.ajax({
    		type : 'post',
    		url : '/FoodFighter/login/login',
    		data : {'email' : $('#email').val(),
    				'pwd' : $('#pwd').val()},
    				
    		dataType : 'text',
    		success : function(data){
    			if(data == 'success'){
    				location.href = '/FoodFighter/';
    				
    		}else if(data == 'fail'){		
    				 $('#loginResultDiv').text('가입하지 않은 아이디이거나, 잘못된 비밀번호입니다.');
    				$('#loginResultDiv').css('color', 'red')
			        $('#loginResultDiv').css('font-size', '10pt')
			        //$('#loginResultDiv').css('font-weight', 'bold') 
    			}
    		},
    		error : function(e){
				console.log(e);
			}
    	});
    }
});//로그인


</script>
<!-- <script src = "//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type='text/javascript'>
 
Kakao.init(''); //아까 카카오개발자홈페이지에서 발급받은 자바스크립트 키를 입력함
 
//카카오 로그인 버튼을 생성합니다. 
Kakao.Auth.createLoginButton({ 
    container: '#kakao-login-btn', 
    success: function(authObj) { 
           Kakao.API.request({
 
               url: '/v1/user/me',
 
               success: function(res) {
 
                     console.log(res.id);//<---- 콘솔 로그에 id 정보 출력(id는 res안에 있기 때문에  res.id 로 불러온다)
 
                     console.log(res.kaccount_email);//<---- 콘솔 로그에 email 정보 출력 (어딨는지 알겠죠?)
 
                     console.log(res.properties['nickname']);//<---- 콘솔 로그에 닉네임 출력(properties에 있는 nickname 접근 
                             
                 // res.properties.nickname으로도 접근 가능 )
                     console.log(authObj.access_token);//<---- 콘솔 로그에 토큰값 출력
          
          var kakaonickname = res.properties.nickname;    //카카오톡 닉네임을 변수에 저장 (닉네임 값을 다른페이지로 넘겨 출력하기 위해서)
                     
          window.location.replace("http://" + window.location.hostname + ( (location.port==""||location.port==undefined)?"":":" + location.port) + "/home?kakaonickname="+kakaonickname);
          //로그인 결과 페이지로 닉네임 값을 넘겨서 출력시킨다.,
                   }
                 })
               },
               fail: function(error) {
                 alert(JSON.stringify(error));
               }
             });
</script>  -->
</body>
</html>
