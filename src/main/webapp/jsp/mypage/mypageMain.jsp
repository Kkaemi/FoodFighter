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

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<!-- 별 css -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css"><!-- 슬라이드  -->
<title>Bootstrap Sign up Form Horizontal</title>
<link rel="stylesheet" href="/FoodFighter/resources/css/mypage/mypageStyle.css">
<link rel="stylesheet" href="/FoodFighter/resources/css/mypage/mypageTableStyle.css">
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
<!-- ============main ============== -->
<div class="container">
  <div id="row1" class="row">
  	<input type="hidden" id="memId" value=${sessionScope.memId }>
	<div class="col-12">
	   <div id="top">
	   
		  <div id="profileImgBox" class="offset-1" >
		  	<c:choose>
		  	  <c:when test="${memberDTO.profile == null}">
           		<img id="profileImg" src="/FoodFighter/resources/img/mypage/basic.png">	
			  </c:when>
			  <c:otherwise>	
		  		<img id="profileImg" src="/FoodFighter/storage/profile/${memberDTO.profile}">
		  	  </c:otherwise>	
		  	</c:choose>
		  </div>
		  
		  <div id="profileInfoBox" class="col-7 offset-2">
		  	<div id="info">
		  		<div id="name">${memberDTO.name }</div>
		  		<c:if test="${memberDTO.socialLogin != 1}">
		  			<button type="button" id="modifyBtn" class="btn btn-primary" onclick="location.href='/FoodFighter/mypage/modifyCheckPwd'">정보수정</button>
		  		</c:if>
		  		<c:if test="${memberDTO.socialLogin == 1}">
		  			<button type="button" id="socialModifyBtn" class="btn btn-primary">프로필 수정</button>
		  		</c:if>
		  	</div>
		  		
		  	 <div class="modal" id="socialModifyModal" role="dialog">
				  <div class="modal-dialog">
				    <div class="modal-content">
				    
				      <div class="modal-header">
				      	<p>프로필 변경 & 회원탈퇴</p><button type="button" class="close" data-dismiss="modal">×</button>
				      </div>
				      
				      <div class="modal-body">
						<form id="socialMofidyForm" action="" method="post" enctype="multipart/form-data">
						  	<div id="profileImgBox" class="form-group row">
								<div id="profilePrevWrap" class="col-12">
									<c:choose>
									  <c:when test="${memberDTO.profile == null}">
										<img id="profilePrev" src="/FoodFighter/resources/img/basic.png" class="profileImg-part">
										<input type="hidden" id="resetProfilePrev" value="/FoodFighter/resources/img/basic.png">
									  </c:when>
									  <c:otherwise>	
										<img id="profilePrev" src="/FoodFighter/storage/profile/${memberDTO.profile}" class="profileImg-part">
										<input type="hidden" id="resetProfilePrev" value="/FoodFighter/storage/profile/${memberDTO.profile}">
									  </c:otherwise>	
									</c:choose>
								</div>
									
									
									<div id="fileboxWrap" class="filebox profileImg-part form-group"> 
										<label for="profile">프로필 등록 </label>
										<input type="hidden" id="eamil" name="email" value=${sessionScope.memId }> 
										<input type="file" id="profile" name ="profileFile"> 
									</div>
							</div>
			
					      	<div id="btnWrap" class="modalForm form-group">
					      		<button type="button" id="resetModifyBtn" class="btn btn-primary btnPart">다시 수정</button>
					        	<button type="button" id="completeModifyBtn" class="btn btn-primary btnPart">변경완료</button>
								<button type="button" id="socialWithdrawBtn" class="btn btn-primary btnPart">회원탈퇴</button>
					     	</div>
				      </form>
				    </div>
				    
				  </div>
				</div>
			</div>
		
		  	
		  	<div id="alramBox">
		  		<div class="alram-part">리뷰</div>
		  		<div class="alram-part">게시글</div>
		  		<div class="alram-part">댓글</div>
		  	</div>
		  	<div id="alramDataBox">
		  		<div class="alram-data-part">${reviewNum}</div>
		  		<div class="alram-data-part">${postNum}</div>
		  		<div class="alram-data-part">&emsp;${replyNum}</div>
		  	</div>
		  
		  </div>
		</div><!-- top -->
	</div><!-- col  -->
  </div><!-- row1  -->
  
  <!-- ==============================================================탑 -->
  
  <div id="row2" class="row">
	<div class="col-12">
		<nav id="menu" class="border-top">
		  <div id="menuTextBox" class="col-10  offset-1" >
			  	<a id="myReview" class="menu-part" href="/FoodFighter/mypage/myReview">
			  	  <span class="glyphicon glyphicon-list-alt"></span>
			  	  <span>내가 쓴 리뷰</span>
			  	</a>

			  	<a id="myPost"  class="menu-part" href="/FoodFighter/mypage/myPost">
			  	  <span class="glyphicon glyphicon-comment"></span>
			  	  <span>내가 쓴 글</span>
			  	</a>

		
			  
			  	<a id="myAsk" class="menu-part" href="/FoodFighter/mypage/myAsk">
			  	  <span class="glyphicon glyphicon-question-sign"></span>
			  	  <span>문의</span>
			  	</a>

		  </div><!-- menuTextBox  -->
		</nav>		
		
		
	</div>
  </div><!-- row2  -->
  <!-- =========================================================메뉴바 -->
   <div id="row3" class="row">
	<div id="listDiv" class="col-12">
		 <jsp:include page="${display}"></jsp:include>
	</div>
  </div><!-- row3  -->
   <!-- =========================================================메인 div -->
   <div id="row4" class="row">
	<div class="col-12">
		 
	</div>
  </div><!-- row4  -->
  <!-- =========================================================풋터 -->
  
</div><!--★★★container★★★  -->

<!--================  Footer ================-->
	 <div id="footer-container">
		 <p class="copyright" style="text-align:left;">
		     ㈜ 푸드파이터<br>서울 서초구 강남대로 459(백암빌딩) 202호<br>대표이사: FOODFIGHTER<br>사업자 등록번호: 2020-020-22222 
		       <br>고객센터: 0507-1414-9601<br><br>
		        <strong>HOME | 리뷰리스트 | 커뮤니티 | 이벤트</strong><br><br>
		       &copy; Copyright <strong>foodFighter</strong>. All Rights Reserved
	              Designed by foodFighter
		 </p>
	 </div>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<!--슬라이드  -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
<!-- 부트스트랩 js -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" ></script>

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

$('#headerUser').click(function(){
	$('#headUser-menu').modal();
});


$('#menuTextBox a').click(function(){
	$('#menuTextBox a').removeClass('first');
	$('#menuTextBox a').removeClass('now');
	$(this).addClass('now');
});

//파일 확장자 체크
$('#profile').on('change',function(){
	ext = $('#profile').val().split('.').pop().toLowerCase();
	 if($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
		 
		 $("#profile").replaceWith( $("#profile").clone(true) ); 
		
         alert("이미지 파일이 아닙니다! (gif, png, jpg, jpeg 만 업로드 가능)");
	 }else{
		 file = $('#profile').prop("files")[0];
         prev = window.URL.createObjectURL(file);
         $('#profilePrev').attr('src', prev);
	 }
});

$('#resetModifyBtn').click(function(){
	let resetProfilePrev = $('#resetProfilePrev').val();
	$('#profilePrev').attr('src',resetProfilePrev);
	$('#socialModifyModal').find("#socialMofidyForm")[0].reset(); 
});

//프로필 수정 버튼
$('#socialModifyBtn').click(function(){
	$('#socialModifyModal').modal();
});
$('#socialWithdrawBtn').click(function(){
let check = confirm("정말 탈퇴하시겠습니까?");
	
	if(check){
		$.ajax({
			type : 'post',
			url : '/FoodFighter/mypage/withdraw',
			data : 'email='+$('#memId').val(),
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
$('#completeModifyBtn').click(function(){
	$.ajax({
		type : 'post',
		enctype:'multipart/form-data',
		processData: false, 
		contentType: false,
		url : '/FoodFighter/mypage/socialModify',
		data : new FormData($('#socialMofidyForm')[0]),
		success : function(){
				alert("정보수정 완료!");
				location.href = '/FoodFighter/mypage/mypageMain';	
			
		},
		error : function(e){
			console.log(e);
		}
	});
});

</script>
</body>
</html>