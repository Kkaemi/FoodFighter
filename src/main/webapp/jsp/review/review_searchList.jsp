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
<input type="hidden" value="1" id="pg" name="pg">
<form id="headerForm" name="headerForm" method="get" action="../review/getSearchList">
	<!--================ Header ================-->
	<div id="header-container">
	  <a class="header-logo" href="/FoodFighter"><img src="../resources/img/logo.png" width="250px;" height="55px;" align="left" style="margin-top: 10px; margin-left: 200px;"></a>
	      <ul id="header-menu">
		      <li class="header-items">
		  		<img src="../resources/img/search.png" class="header_searchIcon" width="30" height="30" align="center"> 
		   		<input type="search" class="header_searchInput" placeholder="&emsp;&emsp;식당 또는 음식 검색" id ="keyword" name="keyword" autocomplete="on" maxlength="50" >
		   		<button size="10" id="header_searchBtn">검색</button>
		      </li>
		       <li class="nav-item">
		           <a class="nav-link js-scroll active" href="/FoodFighter">Home</a>
		       </li>
		       <li class="nav-item">
	         	  <a class="nav-link js-scroll" href="/FoodFighter/review/reviewNonSearchList">리뷰 리스트</a>
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
 </form>
 <form method="post" id="searchListForm" name="searchListForm"> 	
	<!--================ Container ================-->
    <div class="container">
    <!-- Page Keyword -->
      <div class="keywordZone">
		<div id="keyword_name" name="keyword_name" align="center" style="width: 100%; font-size:60px; text-align:center; font-weight:bold;"><%=keyword%></div><br>
			<ul class="keword_issue" align="center">
  				<li>#여름</li>
  				<li>#아이스크림</li>
  				<li>#냉면</li>
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
					           <button type="button"class="soonFilter" value="avgsoon">평점순</button>
			                   <button type="button" class="soonFilter" value="searchsoon">조회순</button>
					          <hr>
					        </div>
					         <div class="modal-body" align="center">
					      	  <p  align="left">가격순 </p><br>
					           <button type="button"class="priceFilter" value="firstPrice" >1만원미만</button>
			                   <button type="button" class="priceFilter" value="secondPrice">1만원대</button> 
			                   <button type="button" class="priceFilter" value="thirdPrice">2만원대</button> 
	                           <button type="button" class="priceFilter" value="fourthPrice">3만원대</button> 
	                           <button type="button" class="priceFilter" value="fifthPrice">4만원이상</button> 
							<hr>
					        </div>
					         <div class="modal-body" align="center">
					          <p  align="left">음식 카테고리 </p><br>
					           <button type="button"class="foodFilter" value=" koreanFood"> 한식</button>
			                   <button type="button" class="foodFilter" value="WesternFood">양식</button>
			                   <button type="button" class="foodFilter" value="ChineseFood">중식</button>
	                           <button type="button" class="foodFilter" value="JapaneseFood">일식</button>
                               <button type="button" class="foodFilter" value="Dessert">카페/디저트</button>
					        </div>
					       	<div class="modal-footer">
					          <button type="submit" class="btn btn-default" data-dismiss="modal" style="background-color:#ffc34d; outline: none; border-style:none;">검색</button>
					       </div>
					   </div><!-- modal-content -->
				    </div><!-- modal-dialog -->
				  </div><!-- Modal -->
				</div><!-- modalZone -->
  				</li>
			</ul>
 	 </div><br> <!-- keywordZone -->
 	 
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

<c:if test="${!empty list}">
		<c:forEach var="restaurantDTO" items="${list}">
			<div class="row">
    				  <div class="col-sm-3"><a href="" ><img src="${restaurantDTO.resImage1}" class="row_StoreImg"></a></div>
	   		  <div class="col-sm-9">	
		       	<ul class="storeMain">
					<li><span class="resName">${restaurantDTO.resName} &emsp;&emsp;&emsp;&emsp;</span></li>
					<li><span class="resScore">${restaurantDTO.resScore}</span></li>
					<li><img src="../resources/img/bookmark.png" id="bookmark" align="right" onclick="bookmarkEvent()"></li>
				</ul><br><br>
				<ul class="storeDetail" align="left">
		  			<li>주소:&emsp;&emsp;&emsp; ${restaurantDTO.resAddress}</li>
		  			<li>카테고리:&emsp; ${restaurantDTO.resTheme}</li>
		  			<li>가격대:&emsp;&emsp;${restaurantDTO.resPrice}</li>
		  		</ul>
	  		<div class="storeMore"><a class="reviewList_detailPage" href="#" style="color: #ffc34d;">가게이름 상세보기 ></a></div>
   		</div><!-- col-sm-9 -->
   </div><hr><!-- row -->
	</c:forEach>
</c:if> 

    <!--================ 더보기 버튼 ================-->    
  <div class="contentMore">
  	<button type="button" class="moreBtn"><font style="color: #ffc34d;">더보기</font></button>
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
</form>

<!-- Vendor JS Files -->
<!-- <script src="../../assets/vendor/jquery/jquery.min.js"></script>  -->
 <!-- <script src="../resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script> -->
 <script src="../resources/assets/vendor/jquery.easing/jquery.easing.min.js"></script>
 <script src="../resources/assets/vendor/php-email-form/validate.js"></script>
 <script src="../resources/assets/vendor/waypoints/jquery.waypoints.min.js"></script>
 <script src="../resources/assets/vendor/counterup/jquery.counterup.min.js"></script>
 <script src="../resources/assets/vendor/owl.carousel/owl.carousel.min.js"></script>
<!--  <script src="../../assets/vendor/typed.js/typed.min.js"></script> -->
 <script src="../resources/assets/vendor/venobox/venobox.min.js"></script>

<!--  Template Main JS File -->
 <script src="../resources/assets/js/main.js"></script> 
 <script src="/FoodFighter/resources/js/review/keyword.js"></script>
 <script src="/FoodFighter/resources/js/review/review_searchList.js"></script>	
</html>