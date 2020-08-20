<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700">
<title>회원가입</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="/FoodFighter/resources/css/member/memberStyle.css">
</head>
<body>
<div class="signup-form">
    <form action="" method="post">
      	<div class="row">
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
	<div class="text-center">이미 계정이 있으신가요? <a href="#"> 로그인</a></div>
</div>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">
</script>
</body>

</html>