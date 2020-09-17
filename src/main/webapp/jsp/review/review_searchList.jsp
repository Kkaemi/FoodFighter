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
<meta charset="utf-8">
<!-- bootstraps -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
<!-- css -->
 <link rel = "stylesheet" href="../resources/css/review/reviewList.css">
<!-- jquery -->
 	<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- security -->
	<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
	<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />
<title>List 화면</title>
</head>
<body>

<input type="hidden" value="${restaurantDTO.resSeq}" id="resSeq" name="resSeq">
<input type="hidden" value="${restaurantDTO.resName}" id="resName" name="resName">

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

	<!--================ Container ================-->
<form id="modalForm" name="modalForm" method="post" action="../review/modalSearchList">
<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
<input type="hidden" name="keyword" value="<%=keyword%>">
<input type="hidden" name="orderby">
<input type="hidden" name="Price"> 
<input type="hidden" name="Food"> 
    <div class="container">
    <!-- Page Keyword -->
      <div class="keywordZone">
		<div id="keyword_name" name="keyword_name" align="center" style="width: 100%; font-size:60px; text-align:center; font-weight:bold;"><%=keyword%></div><br>
			<ul class="keword_issue" align="center">
  				<li># 신논현 맛집 Top5</a></li>
  				<li># 강남 맛집 Top5</a></li>
  				<li># 디저트 맛집</a></li>
  				<li><div class="modalZone" id="modalZone" align="right">
  				 	<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal" style="background: rgba(0,0,0,0); border: rgba(0,0,0,0); outline:none; ">
  				 	<img src="../resources/img/filter.png" class="keyword_FilterIcon">
  					 </button>
					  <!-- Modal -->
					  <div class="modal fade" id="myModal" role="dialog">
					    <div class="modal-dialog">
					    
					     <!--  Modal content -->
					      <div class="modal-content">
					        <div class="modal-body" align="center"><br>
					          <p  align="left">검색순 </p>
					           <button type="button" class="orderbyAvg check" >평점순</button>
					          <hr>
					        </div>
					         <div class="modal-body" align="center">
					      	  <p  align="left">가격순 </p><br>
					           <button type="button" class="firstPrice">1만원미만</button>
			                   <button type="button" class="secondPrice">1만원대</button> 
			                   <button type="button" class="thirdPrice">2만원대</button> 
	                           <button type="button" class="fourthPrice">3만원대</button> 
	                           <button type="button" class="fifthPrice">4만원이상</button> 
							<hr>
					        </div>
					         <div class="modal-body" align="center">
					          <p  align="left">음식 카테고리 </p><br>
					           <button type="button" class="koreanFood"> 한식</button>
			                   <button type="button" class="westernFood">양식</button>
			                   <button type="button" class="chineseFood">중식</button>
	                           <button type="button" class="japaneseFood">일식</button>
                               <button type="button" class="dessert">카페/디저트</button>
					        </div>
					       	<div class="modal-footer">
					        <button type="submit" id="modalsearchBtn" class="btn btn-default" data-dismiss="modal" style="background-color:#ffc34d; outline: none; border-style:none;">검색</button>
					       </div>
					   </div><!-- modal-content -->
				    </div><!-- modal-dialog -->
				  </div><!-- Modal -->
				</div><!-- modalZone -->
  				</li>
			</ul>
 	 </div><br> <!-- keywordZone -->
</form> 
 <!--================ List(5개씩) ================--> 
 <c:if test="${empty list}">
 		<div id="emptyDiv">
			<center>
				<br><br>
				<img src="../resources/img/logo.png" width="250px;" height="55px;">
				<h4 style="color:#ffc34d;">찾고자 하시는 검색어의 결과가 없습니다</h4>
			</center>
		</div>
</c:if>
<br>

<div class="containerRow">
<c:if test="${!empty list}">
		<c:forEach var="restaurantDTO" items="${list}">
			<div class="row">
    			<div class="col-sm-3"><img src = "/FoodFighter/storage/restaurant/${restaurantDTO.resImage1}" class="row_StoreImg"></div>
	   		  <div class="col-sm-9">	
		       	<ul class="storeMain">
					<li><span class="resName">${restaurantDTO.resName} &emsp;&emsp;&emsp;&emsp;</span></li>
					<li><span class="resScore">${restaurantDTO.resScore}</span></li>
				</ul><br><br>
				<ul class="storeDetail" align="left">
		  			<li>주소:&emsp;&emsp;&emsp; ${restaurantDTO.resAddress}</li>
		  			<li>카테고리:&emsp; ${restaurantDTO.resTheme}</li>
		  			<li>가격대:&emsp;&emsp;${restaurantDTO.resPrice}</li>
		  		</ul>

	  		<div class="storeMore"><a id="gotoReviewView" class="reviewList_detailPage" href="/FoodFighter/review/reviewView?resSeq=${restaurantDTO.resSeq}&resName=${restaurantDTO.resName}" style="color: #ffc34d;">가게이름 상세보기 ></a></div>
   		</div><!-- col-sm-9 -->
   </div><hr><!-- row -->
	</c:forEach>
</c:if>
</div>

    <!--================ 더보기 버튼 ================-->    
<div class="contentMore">
 	<input type="hidden" value="1" id="pg" name="pg">
  	<button type="button" class="moreBtn" id="moreBtn"><font style="color: #ffc34d;">더보기</font></button>
  </div>    
</div><!-- container -->  

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
  
  <!--================ Up ================-->
  <a href="#" class="back-to-top"><i class="fa fa-chevron-up"> <img src="../resources/img/back-up.png" width="32px;" height="32px;"></i></a>
  <div id="preloader"></div>

<script type="text/javascript">
$(document).ready(function(){
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    $(document).ajaxSend(function(e, xhr, options) {
        xhr.setRequestHeader(header, token);
    });
});

$('#headerUser').click(function(){
   $('#headUser-menu').modal();
});
</script>
<script type="text/javascript">
$('.orderbyAvg').click(function(){
	$('input[name=orderby]').attr({"value" : "resScore"});
});
$('.orderbyHit').click(function(){
	$('input[name=orderby]').attr({"value" : "orderbyHit"});
});

$('.firstPrice').click(function(){
	$('input[name=Price]').attr({"value" : "1만원미만"});
});
$('.secondPrice').click(function(){
	$('input[name=Price]').attr({"value" : "1만원대"});
});
$('.thirdPrice').click(function(){
	$('input[name=Price]').attr({"value" : "2만원대"});
});
$('.fourthPrice').click(function(){
	$('input[name=Price]').attr({"value" : "3만원대"});
});
$('.fifthPrice').click(function(){
	$('input[name=Price]').attr({"value" : "4만원이상"});
});

$('.koreanFood').click(function(){
	$('input[name=Food]').attr({"value" : "한식"});
});
$('.westernFood').click(function(){
	$('input[name=Food]').attr({"value" : "양식"});
});
$('.chineseFood').click(function(){
	$('input[name=Food]').attr({"value" : "중식"});
});
$('.japaneseFood').click(function(){
	$('input[name=Food]').attr({"value" : "일식"});
});
$('.dessert').click(function(){
	$('input[name=Food]').attr({"value" : "카페/디저트"});
});


$('#modalsearchBtn').click(function(){

	if($('.orderbyAvg').hasClass("check") == false && $('.orderbyHit').hasClass("check") == false) {
		alert('검색순을 체크해주세요');
		return false;
	}else if($('.firstPrice').hasClass("check") == false && $('.secondPrice').hasClass("check") == false
			&& $('.thirdPrice').hasClass("check") == false && $('.fourthPrice').hasClass("check") == false 
			&& $('.fifthPrice').hasClass("check") == false){
		alert('가격순을 체크해주세요');
		return false;
	}else if($('.koreanFood').hasClass("check") == false && $('.westernFood').hasClass("check") == false
			&& $('.chineseFood').hasClass("check") == false && $('.japaneseFood').hasClass("check") == false 
			&& $('.dessert').hasClass("check") == false){
		alert('음식카테고리를 체크해주세요');
		return false;
	}else{
		document.modalForm.submit();
	}
	
});

 
</script>

<!-- Vendor JS Files -->
 <script src="/FoodFighter/resources/assets/vendor/jquery/jquery.min.js"></script>
 <script src="../resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
 <script src="../resources/assets/vendor/jquery.easing/jquery.easing.min.js"></script>
 <script src="../resources/assets/vendor/php-email-form/validate.js"></script>
 <script src="../resources/assets/vendor/waypoints/jquery.waypoints.min.js"></script>
 <script src="../resources/assets/vendor/counterup/jquery.counterup.min.js"></script>
 <script src="../resources/assets/vendor/owl.carousel/owl.carousel.min.js"></script>
<!--  <script src="../../assets/vendor/typed.js/typed.min.js"></script> -->
 <script src="../resources/assets/vendor/venobox/venobox.min.js"></script>

<!--  Template Main JS File -->
 <!-- <script src="../resources/assets/js/main.js"></script>  -->
 <script src="/FoodFighter/resources/js/review/keyword.js"></script>
 <script src="/FoodFighter/resources/js/review/review_searchList.js"></script>	
 
<script>
</script>
</html>