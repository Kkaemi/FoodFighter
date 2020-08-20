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
<title>Bootstrap Sign up Form Horizontal</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="/FoodFighter/resources/css/member/memberStyle.css">
</head>
<body>
<div class="signup-form">
    <form id="socialSignupForm" action="" method="post">
      	<div class="row">
        	<div class="col-8 offset-4">
				<h2>회원가입</h2>
			</div>	
      	</div>
      	
      	<div class="form-group row">
			<div class="col-8 offset-2">
                <input type="hidden" id="email" class="form-control"  name="email" value="" placeholder="이메일">
                
                <div id="checkDiv">
	                <input type="text" id="emailCode" class="form-control col-8" placeholder="인증코드"> 
	                <button type="button" id="emailCheckBtn" class="btn btn-primary btn-lg col-3">인증</button>
	               	<input type="hidden" id="emailCheckSw" value="0">
                </div>
	 		<div id="emailDiv"></div>         
            </div> 
            
            <button type="button" id="sendEmailBtn" class="btn btn-primary btn-lg offset-4">인증 메일 발송</button> 
            
            
            <!-- 이메일 발송 완료 모달  -->
				<div class="modal fade" id="sendEmailModal" role="dialog">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <!-- header -->
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal">×</button>
				      </div>
				      <!-- body -->
				      <div class="modal-body">
				        	이메일 발송를 완료했습니다!
				        	<br><br>
				      </div>
				    </div>
				  </div>
				</div>   	
        
        </div>
      	
        
        <div class="form-group row">
			<div class="col-8 offset-2">
                <input type="text" id="username" class="form-control"  name="username" placeholder="이름">
            </div>
            <div id="usernameDiv" class="col-8 offset-2"></div>        	
        </div>	
        
        <div class="form-group row">
			<div class="col-8 offset-2">
                <input type="text" id="nickname" class="form-control"  name="nickname" placeholder="닉네임">
            </div>
            <div id="nicknameDiv" class="col-8 offset-2"></div>        	
        </div>	
        
        
		<div class="form-group row">
			<div class="col-8 offset-2">
				<button type="button"  id="signupBtn" class="btn btn-primary btn-block">회원가입</button>
			</div>  
		</div>
		
		<div><button type="button" id="logout">로그아웃</button></div>	<!-- ★★나중에 지울것★★ -->      
    </form>
	<div class="text-center">이미 계정이 있으신가요? <a href="/FoodFighter/login/loginForm"> 로그인</a></div>
</div>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" ></script>
<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    $(document).ajaxSend(function(e, xhr, options) {
        xhr.setRequestHeader(header, token);
    });
});

//인증 부분 숨김처리
$(document).ready(function() {
	$('#emailCode').hide();
	$('#emailCheckBtn').hide();
});
//이메일 발송 버튼을 눌렀을 때
$('#sendEmailBtn').click(function() {

$('#emailDiv').empty();
	if ($('#email').val() == '') {
		$('#emailDiv').text('이메일은 반드시 동의를 해주셔야 가입이 가능합니다.');
		$('#emailDiv').css('color', 'red');

	} else {
		if (!/^[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/.test($('#email').val())) {	//형식 체크
			$('#emailDiv').text('올바른 형식으로 입력해주세요.');
			$('#emailDiv').css('color', 'red');
			
		} else {
			
			$('#sendEmailModal').modal();//발송 완료 모달
			
			//메일발송		
			$.ajax({
				type:'post',
				url : '/FoodFighter/member/signupSendMail',
				data : 'email='+$('#email').val(),
				dataType:'text',
				success : function(data) {
					sessionStorage.setItem("authCode", data ); //히든으로 하면 보안때문에 session으로 변경
					alert(sessionStorage.getItem("authCode")); //임시
				},
				error : function(e) {
					console.log(e);
				}
			});
			
			$('#sendEmailBtn').text('재전송');
			$('#sendEmailBtn').addClass('offset-5')
			$('#emailCode').show('slide');
			$('#emailCheckBtn').show('slide');
		}
	}//빈칸 체크 if
});

//인증 버튼을 눌렀을 때
$('#emailCheckBtn').click(function(){
	$('#emailDiv').empty();
	
	if ($('#emailCode').val() == '') {
			$('#emailDiv').text('인증번호를 입력해주세요');
			$('#emailDiv').css('color', 'red');
	
	}else{
		
		if(sessionStorage.getItem("authCode")!= $('#emailCode').val()){
			$('#emailDiv').text('인증번호가 다릅니다.');
			$('#emailDiv').css('color', 'red');
		}else{
			$('#emailCheckBtn').prop('disabled', true); //버튼 비활성화
			$('#emailCheckSw').val('1'); //이메일 인증 여부
		}
		
	}//입력여부 if
});


//회원가입 버튼을 눌렀을 때
$('#signupBtn').click(function() {
	$('#emailDiv').empty();
	$('#usernameDiv').empty();

	if ($('#emailCheckSw').val() == '0') {
		$('#emailDiv').text('이메일인증을 해주세요.');
		$('#emailDiv').css('color', 'red');

	}  else if ($('#username').val() == '') {
		$('#usernameDiv').text('이름을 입력해주세요.');
		$('#usernameDiv').css('color', 'red');

	}else if(/^[가-힣a-zA-Z]{3,16}$/.test($('#username').val())){

		$('#usernameDiv').text('이름은 2글자 이상 영문자와 한글만 입력해주세요');
		$('#usernameDiv').css('color', 'red');

	}  else if ($('#nickname').val() == '') {
		$('#nicknameDiv').text('닉네임을 입력해주세요.');
		$('#nicknameDiv').css('color', 'red');

	} else {
		$.ajax({
			type : 'post',
			url : '/FoodFighter/member/socialSignup',
			data : $('#socialSignupForm').serialize(),
			success : function() {
				
				location.href = '/FoodFighter/member/signupChoice';

			},
			error : function(e) {
				console.log(e);
			}
		});
	}
});
</script>
</body>
</html>