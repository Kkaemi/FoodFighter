<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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