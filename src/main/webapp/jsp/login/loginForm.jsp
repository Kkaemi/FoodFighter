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
<form id="headerForm" name="headerForm" method="post" action="../review/getSearchList">
<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">  
<header>
<!--================ Header ================-->

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
	         <img src="/FoodFighter/resources/img/member.png" class="header_searchIcon" width="30" height="30" align="center">
	         </a>
	    	</li>
   	</ul>
</div>
</form>
</header>
<body>
  
	<section class="login-form" >
		<h1>Login</h1>
			<!-- <form action="/FoodFighter/login/loginForm-processing" id="loginForm" method="post"> -->
			    <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
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
					
				 <div class="cacaobtn-area">
					<a id="kakao-login-btn" class="btn-face m-b-20" style="cursor: pointer;">
						<img src="/FoodFighter/resources/img/kakao_login.png">
					</a>
				</div>

				<div class="caption">
					<a href="/FoodFighter/login/forgotIdForm">아이디찾기</a>&emsp;
					<a href="/FoodFighter/login/forgotPwdForm">비밀번호찾기</a>&emsp;<br><br>
					회원이 아니신가요? <a href="/FoodFighter/member/signupChoice"> 회원가입</a>
					</div>
			</form>
	</section>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="/FoodFighter/resources/js/review/keyword.js"></script>
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
	 
	 if($('#email').val() == '' ){ 
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
		/* document.getElementById('loginForm').submit(); */
		
    	$.ajax({
            type : 'post',
            url : '/FoodFighter/login/login',
            data : {'email' : $('#email').val(),
                  'pwd' : $('#pwd').val()},
                  
            dataType : 'text',
            success : function(data){
          	  //alert(JSON.stringify(data));     	  
               if(data == 'success'){
            
              	 location.href = '/FoodFighter/';
              	 
               }else if(data == 'admin')	{
            	   
              	 location.href = '/FoodFighter/admin/adminDashboard';
                     
            }else if(data == 'fail'){      
                   $('#loginResultDiv').text('가입하지 않은 아이디이거나, 잘못된 비밀번호입니다.');
                  $('#loginResultDiv').css('color', 'red');
                   $('#loginResultDiv').css('font-size', '10pt');
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
<script src="http://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type='text/javascript'>
$('#kakao-login-btn').click(function(){
	Kakao.init("42cbda65d990bd717a2a38923ec19349");
	
	Kakao.Auth.loginForm({
		success : function(authObj) {
			Kakao.API.request({
				url : "/v2/user/me",
				success : function(res) {
					email = res.kakao_account.email;
					$.ajax({
						type : 'post',
						url : '/FoodFighter/login/kakaologin',
						data : {'email' : email},
			    		dataType : 'text',
			    		success : function(data){
		    			if(data == 'success'){
		    				location.href = '/FoodFighter/';
		    				
		    				}else if(data == 'fail'){	
		    					location.href = '/FoodFighter/login/loginForm';
								}
							},
							
						error : function(err) {
							console.log(err);
						}
					});
				},
				fail : function(err) {
					console.log(err);
				}
			});
		},
		fail : function(err) {
			console.log(err);
		}
	});
});
</script> 
</body>
</html>
