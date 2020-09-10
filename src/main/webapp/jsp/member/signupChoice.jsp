<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 <meta id="_csrf" name="_csrf" content="${_csrf.token}" />
 <meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700">
<title>회원가입</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="/FoodFighter/resources/css/member/memberStyle.css">
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
		   		<input type="search" class="header_searchInput" placeholder="&emsp;&emsp;식당 또는 음식 검색" id ="keyword" name="keyword" value="" autocomplete="on" maxlength="50" >
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
	            <img src="/FoodFighter/resources/img/member.png" id="headerUser" class="header_searchIcon" width="30" height="30" align="center">
	            </a>
     	     </li>
	   	</ul>
	</div>
 </form>
 <!-- ============main ============== -->
<div class="signup-form">
    <form action="" method="post">
      	<div id="title" class="row">
        	<div class="col-8 offset-4">
				<h2>회원가입</h2>
			</div>	
      	</div>
		<div class="form-group row">
			<div class="col-8 offset-2">
				<button type="button"  id="genSignupBtn" class="btn btn-primary btn-block" onclick="location.href='/FoodFighter/member/signupForm'">일반 회원가입</button>
			</div>  
		</div>
		
		
		
		<div id="sepDiv">
			<img alt="또는" src="/FoodFighter/resources/img/sep.jpg" class="col-8 offset-2">
		</div>
		
		
		
		
		<div class="form-group row">
			<div class="col-8 offset-2">
				<button type="button" id="kakaoBtn"><img class="img-responsive" alt="" src="/FoodFighter/resources/img/kakao_login.png"></button>
			</div>
		</div>		      
    </form>
	<div class="text-center">이미 계정이 있으신가요? <a href="/FoodFighter/login/loginForm"> 로그인</a></div>
</div>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    $(document).ajaxSend(function(e, xhr, options) {
        xhr.setRequestHeader(header, token);
    });
});

$('#kakaoBtn').click(function(){
	Kakao.init('2b37811e9fe31f7968899e4c31119899');
	Kakao.Auth.loginForm({
	    success: function(authObj) {

		   Kakao.API.request({
		      url:'/v2/user/me',
		      success: function(res){
				
	           	let email = res.kakao_account.email;

				$.ajax({
						type : 'post',
						url : '/FoodFighter/member/kakaoSignup',
						data : 'email=' + email,
						dataType : 'text',
						success : function() {
							location.href = '/FoodFighter/member/socialSignupForm';
						},
						error : function(err) {
							console.log(err);
						}
					});	
		      	  }
	           	
		   		});
		     console.log(authObj);
		    let token = authObj.access_token;
		
		  },
		  fail: function(err) {
		     alert(JSON.stringify(err));
		  }
		  
	});
});
</script>
</body>

</html>