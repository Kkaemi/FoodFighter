<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/FoodFighter/resources/css/logincss/login.css">
<title>아이디찾기</title>
<header>
<!--================ Header ================-->
	<div id="header-container">
	  <a class="header-logo" href="#page-top">로고 자리</a>
	      <ul id="header-menu">
		      <li class="header-items">
		  		<img src="/FoodFighter/resources/img/search.png" class="header_searchIcon" width="30" height="30" align="center"> 
		   		<input type="text" class="header_searchInput" placeholder="&emsp;&emsp;식당 또는 음식 검색" value="" autocomplete="on" maxlength="50" >
		      </li>
		      <li class="nav-item">                                                                                                     
				<a class="nav-link js-scroll active" href="/FoodFighter/main/index">Home</a>                                                
			  </li>                                                                                                                     
			  <li class="nav-item">                                                                                                     
				<a class="nav-link js-scroll" href="/FoodFighter/review/review_nonSearchList">리뷰 리스트</a>                               
			  </li>                                                                                                                     
			  <li class="nav-item">                                                                                                     
				<a class="nav-link js-scroll" href="/FoodFighter/community/communityMain">커뮤니티</a>                                      
			  </li>                                                                                                                     
			  <li class="nav-item">                                                                                                     
				<a class="nav-link js-scroll" href="/FoodFighter/event/eventList">이벤트</a>                                               
			  </li>                                                                                                                     
			  <li class="nav-item">                                                                                                     
				<a class="nav-link js-scroll">                                                                                          
		      <img src="/FoodFighter/resources/img/member.png" class="header_searchIcon" width="30" height="30" align="center">     
				</a>                                                                                                                  
			  </li>                                                                                                                     
	   	</ul>
	</div>
</header>

<body>
	<section class="forgotId-form" >
		<h1>아이디 찾기</h1><br><br>
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
				
				<div id="ResultDiv"></div>
				
				<div class="btn-area">
					<button id="searchbtn" type="button">찾기</button>
				</div>
			</form>
	</section>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$('#searchbtn').click(function(){ 
	 $('#nameDiv').empty();
	 $('#emailDiv').empty(); 
	 
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
		
	}else{
   	 $.ajax({
   		type : 'post',
   		url : '/foodfighter/member/forgotId',
   		data : {'name' : $('#name').val(),
   				'email' : $('#email').val()},			
   			 dataType : 'json',
			 success : function(data){				 
				 //alert(JSON.stringify(data));
				 
				 if(data.find == 'no'){ 
					 alert("찾을 아이디가 없습니다!");
				 }else{
	
					 alert(data.memberDTO.id);  
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