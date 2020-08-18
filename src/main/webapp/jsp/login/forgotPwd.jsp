<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/FoodFighter/sources/css/logincss/login.css">
<title>비밀번호찾기</title>
<header>
<!--================ Header ================-->
	<div id="header-container">
	  <a class="header-logo" href="/FoodFighter/">로고 자리</a>
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
					이름<input type="text" name="name" id="name" >
					<label for="name"></label>					
				</div>
				<div id="nameDiv" style="border: 1px red solid;"></div>
				
				<div class="int-area">
					이메일<input type="text" name="email" id="email" >
					<label for="email"></label>
					<div id="emailDiv" style="border: 1px red solid;"></div>
				</div>
				
				<div class="int-area">
					아이디<input type="text" name="id" id="id" >
					<label for="id"></label>					
				</div>
				<div id="idDiv"></div>
				
				<div id="ResultDiv"></div>
				
				<div class="btn-area">
					<button id="searchbtn2" type="button">찾기</button>
				</div>
			</form>
	</section>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$('#searchbtn2').click(function(){ 
	 $('#nameDiv').empty();
	 $('#emailDiv').empty(); 
	 $('#idDiv').empty(); 
	 
	 if($('#name').val() == ''){ 
		 	$('#nameDiv').text('이름을 입력하세요.')
			$('#nameDiv').css('color','red')
			$('#nameDiv').css('font-size','8pt')
			$('#nameDiv').css('font-weight','bold')
			$('#nameDiv').focus();	 
			 
	 }else if($('#email').val() == ''){
		 $('#emailDiv').text('이메일 입력하세요.')
		 $('#emailDiv').css('color','red')
		 $('#emailDiv').css('font-size','8pt')
		 $('#emailDiv').css('font-weight','bold')
		 $('#emailDiv').focus();
	
	 }else if($('#id').val() == ''){
		 $('#idDiv').text('아이디를 입력하세요.')
		 $('#idDiv').css('color','red')
		 $('#idDiv').css('font-size','8pt')
		 $('#idDiv').css('font-weight','bold')
		 $('#idDiv').focus();
		
	}else{
   	/* $.ajax({
   		type : 'post',
   		url : '/foodfighter/member/forgotId',
   		data : {'name' : $('#name').val(),
   				'pwd' : $('#email').val(),
   				'id' : $('id').val()},
   		dataType : 'text',
   		success : function(data){
   			if(data == 'success'){
   				location.href = '/foodfighter/login/login';
   				
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
   	*/
   }
});
</script>
</body>
</html>