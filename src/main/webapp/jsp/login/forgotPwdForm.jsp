<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />

<link rel="stylesheet" href="/FoodFighter/resources/css/login/login.css">
<title>비밀번호찾기</title>
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
		         <a class="header-link" href="/FoodFighter/review/review_nonSearchList">리뷰 리스트</a>
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
	<section class="forgotId-form" >
		<h1>비밀번호</h1><br><br>
			<form action="">
				<div class="int-area">
					닉네임<input type="text" name="nickName" id="nickName" >
					<label for="nickName"></label>					
				</div>
				<div id="nickNameDiv"></div>
				
				
				<div class="int-area">
					이메일<input type="text" name="email" id="email" >
					<label for="email"></label>					
				</div>
				<div id="emailDiv"></div>
				
				<div id="ResultDiv"></div>
				
				<div class="btn-area">
					<button id="searchbtn2" type="button">찾기</button>
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
$('#searchbtn2').click(function(){ 
	 $('#nickNameDiv').empty();
	 $('#emailDiv').empty(); 
	 
	 if($('#nickName').val() == ''){ 
		 	$('#nickNameDiv').text('닉네임을 입력하세요.')
			$('#nickNameDiv').css('color','red')
			$('#nickNameDiv').css('font-size','8pt')
			$('#nickNameDiv').css('font-weight','bold')
			$('#nickNameDiv').focus();	 
	
	 }else if($('#email').val() == ''){
		 $('#emailDiv').text('이메일을 입력하세요.')
		 $('#emailDiv').css('color','red')
		 $('#emailDiv').css('font-size','8pt')
		 $('#emailDiv').css('font-weight','bold')
		 $('#emailDiv').focus();
		
	 }else{
		   $.ajax({
		   		type : 'post',
		   		url : '/FoodFighter/login/getforgotpwd',
		   		data : {'nickName' : $('#nickName').val(),
		   				'email' : $('#email').val()},
		   		dataType : 'text',
		   		success : function(data){
		   			if(data == 'success'){
		   				alert(data);
		   				
		   		}else if(data == 'fail'){		
		   				 $('#ResultDiv').text('입력하신 정보가 존재하지 않습니다.');
		   				$('#ResultDiv').css('color', 'red')
					        $('#ResultDiv').css('font-size', '10pt')
					        //$('#ResultDiv').css('font-weight', 'bold') 
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