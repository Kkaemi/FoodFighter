<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
request.setCharacterEncoding("utf-8");
String keyword = request.getParameter("keyword");
%> 
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
<link rel="stylesheet" href="/FoodFighter/resources/css/mypage/modifyStyle.css">
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
		   		<input type="search" class="header_searchInput" placeholder="&emsp;&emsp;식당 또는 음식 검색" id ="keyword" name="keyword" value="<%=keyword%>" autocomplete="on" maxlength="50" >
		   		<button size="10" id="header_searchBtn">검색</button>
		      </li>
		       <li class="nav-item">
		           <a class="nav-link js-scroll active" href="/FoodFighter">Home</a>
		       </li>
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
	            <img src="/FoodFighter/resources/img/member.png" id="headerUser" class="header_searchIcon" width="30" height="30" align="center">
	            </a>
     	     </li>
	   	</ul>
	</div>
 </form>
<!-- usermenu -->
  <div class="modal headUser-menu" id="headUser-menu" role="dialog">
     <div class="tri"></div>
     <c:if test="${sessionScope.memId == null}">
        <p>로그인 또는 회원가입을 하시면 <br> 더 많은 서비스를 <br>이용하실 수 있습니다.</p>
        <hr>
        <button type="button" id="loginBtn" class="headUserMenu-Btn"  onclick="location.href='/FoodFighter/login/loginForm'" >로그인</button>
        <button type="button" id="signupBtn" class="headUserMenu-Btn" onclick="location.href='/FoodFighter/member/signupChoice'" >회원가입</button>
     </c:if>
     <c:if test="${sessionScope.memId == 'admin@admin.com'}">
        <p>관리자로<br> 로그인 하셨습니다. </p>
        <hr>
        <button type="button" id="adminBtn" class="headUserMenu-Btn"  onclick="location.href='/FoodFighter/admin/adminDashboard'" >관리자페이지</button>
        <button type="button" id="logoutBtn" class="headUserMenu-Btn"  onclick="location.href='/FoodFighter/login/logout'">로그아웃</button>
     </c:if>
     <c:if test="${sessionScope.memId != null && sessionScope.memId != 'admin@admin.com'}">
        <p>맛집을 찾아보고 <br> 후기를 남겨보세요.</p>
        <hr>
        <button type="button" id="mypageBtn" class="headUserMenu-Btn"  onclick="location.href='/FoodFighter/mypage/mypageMain'" >마이페이지</button>
        <button type="button" id="logoutBtn" class="headUserMenu-Btn"  onclick="location.href='/FoodFighter/login/logout'">로그아웃</button>
     </c:if>
  </div>
  
  <!--=================================== content ==========================-->
<div class="myModifyFormDiv">
    <form id="myMofidyForm" action="" method="post" enctype="multipart/form-data">
      	<div class="row">
        	<div class="col-5 offset-4">
				<h2>회원정보 수정</h2>
			</div>	
      	</div>
      	
      	
      	<div class="form-group row">
			<div class="col-5 offset-4">
                <input type="email" id="email" class="form-control"  name="email" value="${memberDTO.email}" placeholder="이메일" readonly>
	 		<div id="emailDiv"></div>         
            </div> 
        </div>
        
        <div id="profileImgBox" class="form-group row">
			<div class="col-12">
			<c:choose>
		  	  <c:when test="${memberDTO.profile == null}">
           		<img id="profilePrev" src="/FoodFighter/resources/img/basic.png" class="profileImg-part">
			  </c:when>
			  <c:otherwise>	
		  		<img id="profilePrev" src="/FoodFighter/storage/profile/${memberDTO.profile}" class="profileImg-part">
		  	  </c:otherwise>	
		  	</c:choose>
			
				
				
				<div class="filebox profileImg-part form-group"> 
					<label for="profile">프로필 등록 </label> 
					<input type="file" id="profile" name ="profileFile"> 
				</div>
				<!-- 확장자 오류 모달 -->
				<div class="modal fade" id="errorModal" role="dialog">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal">×</button>
				      </div>
				      <div class="modal-body">
				        	이미지 파일이 아닙니다! (gif, png, jpg, jpeg 만 업로드 가능)
				        	<br><br>
				      </div>
				    </div>
				  </div>
				</div>
				
       		</div> 
        </div>
        
        
        <div class="form-group row">
			<div class="col-5 offset-4">
                <input type="text" id="name" class="form-control"  name="name" value="${memberDTO.name}" placeholder="이름">
            </div>
            <div id="nameDiv" class="col-8 offset-2"></div>        	
        </div>
        
        
        <div class="form-group row">
			<div class="col-5 offset-4">
                <input type="text" id="nickname" class="form-control"  name="nickname" value="${memberDTO.nickname}" placeholder="닉네임" readonly>
            </div>
            <div id="nicknameDiv" class="col-8 offset-2"></div>        	
        </div>
        
		<div class="form-group row">
			<div class="col-5 offset-4">
                <button type="button" id="modifyPwdBtn">비밀번호 변경</button>
            </div>        	
        </div> 
        
        <!-- 비밀번호 변경 모달 -->
		<div class="modal fade" id="modifyPWdModal" role="dialog">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		      	<p>비밀번호 변경</p><button type="button" class="close" data-dismiss="modal">×</button>
		      </div>
		      <div class="modal-body">
		      		<p>새 비밀번호를 입력 후에 반드시 변경 완료를 눌러야만<br>
		      			 비밀변호 변경이 완료 됩니다.</p>
		      	<div class="modalForm">
		      		<input type="password" id="nowPwd" class="form-control" placeholder="기존 비밀번호">
		      		<div id="nowPwdDiv"></div><input type="hidden" id="checkNowPwd" value="">
		        	<input type="password" id="pwd" class="form-control"  name="pwd" placeholder="새 비밀번호">
		        	<div id="pwdDiv"></div>  
		        	<input type="password" id="confirm_pwd" class="form-control" placeholder="새 비밀번호 재확인">
		        	<div id="confirm_pwdDiv"></div> 
		        	<button type="button" id="completePwdBtn" class="btn btn-primary btnPart">변경완료</button>
		     	</div>
		      </div>
		    </div>
		  </div>
		</div>
		
        
        
		<div class="form-group row">
			<div class="col-5 offset-4">
				<button type="button"  id="resetBtn" class="btn btn-primary btnPart">다시 수정</button>
				
				<button type="button"  id="modifyBtn" class="btn btn-primary btnPart">정보 수정</button>
				
				<button type="button"  id="withdrawBtn" class="btn btn-primary btnPart">회원 탈퇴</button>
			</div>  
		</div>
	  
	 	      
    </form>
     	
    
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

//파일 확장자 체크
$('#profile').on('change',function(){
	ext = $('#profile').val().split('.').pop().toLowerCase();
	 if($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
		 
		 $("#profile").replaceWith( $("#profile").clone(true) ); 
		
         $('#errorModal').modal();
	 }else{
		 file = $('#profile').prop("files")[0];
         prev = window.URL.createObjectURL(file);
         $('#profilePrev').attr('src', prev);
	 }
});
//다시 수정 버튼
$('#resetBtn').click(function(){
	location.href="/FoodFighter/mypage/modifyForm"
});
//비밀번호 변경하기
$('#modifyPwdBtn').click(function(){
	$('#modifyPWdModal').modal();
});
$('#nowPwd').focusout(function(){
	$('#nowPwdDiv').empty();
	let nowPwd = $('#nowPwd').val();
	if(nowPwd == ""){
		$('#nowPwdDiv').text("기존 비밀번호를 입력하세요");
		$('#nowPwd').focus();
		$('#nowPwdDiv').css('color','blue');
		$('#nowPwdDiv').css('font-weight','bold');
		$('#nowPwdDiv').css('font-size','8pt');
	}else{
		$.ajax({
			type: 'post',
	 		url: '/FoodFighter/mypage/checkNowPwd',
	 		data: 'nowPwd='+nowPwd,
	 		dataType: 'text',
	 		success : function(data){
	 			if(data == 'match'){
	 			$('#nowPwdDiv').text("기존 비밀번호 일치");
				$('#checkNowPwd').val('1');

				}else{
					$('#nowPwdDiv').text('기존 비밀번호가 아닙니다.')
					$('#nowPwdDiv').css('color','magenta')
					$('#nowPwdDiv').css('font-size','8pt')
					$('#nowPwdDiv').css('font-weight','bold')
				}
			},
			error:function(e){
				console.log(e);
			}
		});	
	}
		
	
});
//변경 완료 버튼
$('#completePwdBtn').click(function(){
	$('#pwdDiv').empty();
	$('#confirm_pwdDiv').empty();
	
	if ($('#pwd').val() == '') {
		$('#pwdDiv').text('비밀번호를 입력해주세요.');
		$('#pwdDiv').css('color', 'red');

	}else if(!/^[a-zA-Z0-9]{10,15}$/.test($('#pwd').val())){
		$('#pwdDiv').text('숫자와 영문자 조합, 10~15자리로 입력해주세요');
		$('#pwdDiv').css('font', '9pt');
		$('#pwdDiv').css('color', 'red');
		
	} else if ($('#pwd').val() != $('#confirm_pwd').val()) {
		$('#confirm_pwdDiv').text('비밀번호가 일치하지 않습니다.');
		$('#confirm_pwdDiv').css('font', '9pt');
		$('#confirm_pwdDiv').css('color', 'red');

	}else if($('#checkNowPwd').val() != '1'){
    	$('#nowPwdDiv').text('기존 비밀번호가 맞지 않습니다.')
        $('#nowPwdDiv').css('color', 'magenta')
        $('#nowPwdDiv').css('font-size', '9pt')
        $('#nowPwdDiv').css('font-weight', 'bold')
    }else{
    	$.ajax({
			type : 'post',
			url : '/FoodFighter/mypage/modifyPwd',
			data : 'email='+$('#email').val()+'&pwd='+$('#pwd').val(),
			success : function(){
				alert("비밀번호 변경 환료!");
				$('#modifyPWdModal').modal('hide');
				$('#pwd').val('');
				$('#nowPwd').val('');
				$('#confirm_pwd').val('');
			},
			error : function(e){
				console.log(e);
			}
		});
	}
});


//정보 수정 버튼
$('#modifyBtn').click(function(){
	$('#nameDiv').empty();
	$('#nicknameDiv').empty();
	
	if ($('#name').val() == '') {
		$('#nameDiv').text('이름을 입력해주세요.');
		$('#nameDiv').css('color', 'red');

	}else{
		$.ajax({
			type : 'post',
			enctype:'multipart/form-data',
			processData: false, //이걸 안잡으면 문자열 형식으로 넘어간다 우리는 multipart타입으로 넘어가야 하므로 꼭 필요하다.
			contentType: false,
			url : '/FoodFighter/mypage/modify',
			data : new FormData($('#myMofidyForm')[0]),
			success : function(){
					alert("정보수정 완료!");
					location.href = '/FoodFighter/mypage/mypageMain';	
				
			},
			error : function(e){
				console.log(e);
			}
		});
	}
});

//회원탈퇴 버튼
$('#withdrawBtn').click(function(){
	let check = confirm("정말 탈퇴하시겠습니까?");
	
	if(check){
		$.ajax({
			type : 'post',
			url : '/FoodFighter/mypage/withdraw',
			data : 'email='+$('#email').val(),
			success : function(){
					alert("탈퇴가 완료되었습니다");
					location.href = '/FoodFighter';	
				
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