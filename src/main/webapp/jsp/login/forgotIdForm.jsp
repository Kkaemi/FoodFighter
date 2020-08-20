<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />
 
<link rel="stylesheet" href="/FoodFighter/resources/css/login/login.css">
<title>아이디찾기</title>
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
				<a class="header-link" href="/FoodFighter/main/index">Home</a>                                                
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
				<a class="header-link" >                                                                                          
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
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
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