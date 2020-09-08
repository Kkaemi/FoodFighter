<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- bootstraps -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> 
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script> 
<!-- css -->
	<link rel = "stylesheet" href="../resources/css/review/reviewWrite.css">
<!-- jquery -->
	<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- security -->
 <meta id="_csrf" name="_csrf" content="${_csrf.token}" />
 <meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />
<title>reviewWriteForm</title>
</head>
<body>
<head>

</head>
<form id="headerForm" name="headerForm" method="post" action="../review/getSearchList">
<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">  
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
<!--================ Container ================-->
<form id="reviewForm" name="reviewForm" method="post" enctype = "multipart/form-data">
	<div class="container">
		  <div class="title" align="left">
			  <font class="storeName"><strong>코스믹커피</strong></font>&emsp;<strong>에 대한 솔직한 리뷰를 작성해주세요.</strong> &emsp;&emsp;&emsp;&emsp;&emsp;
				 <div class="starRev">
				 	<input type="hidden" id="resScore" name="resScore">
				     <span class="starR1 on" id = star1_Left data-value="0.5" >별1_왼쪽</span>
				     <span class="starR2" id = star1_Right data-value ="1.0">별1_오른쪽</span>
				     <span class="starR1" id = star2_Left data-value ="1.5">별2_왼쪽</span>
				     <span class="starR2" id = star2_Right data-value ="2.0">별2_오른쪽</span>
				     <span class="starR1" id = star3_Left data-value ="2.5">별3_왼쪽</span>
				     <span class="starR2" id = star3_Right data-value ="3.0">별3_오른쪽</span>
				     <span class="starR1" id = star4_Left data-value ="3.5">별4_왼쪽</span>
				     <span class="starR2" id = star4_Right data-value ="4.0">별4_오른쪽</span>
				     <span class="starR1" id = star5_Left data-value ="4.5">별5_왼쪽</span>
				     <span class="starR2" id = star5_Right data-value ="5.0">별5_오른쪽</span>
				   </div>
				   
		  </div><br><!-- title -->

		  <div class="form-group">
			  <textarea id="content" name="content" class="form-control" rows="10" placeholder="000님 주문하신 메뉴는 어떠셨나요? 상점에 대한 진솔하면서도 고운말 부탁드립니다"></textarea>
			 	   <div class="upload-group" align="left"> 
			  			<div class="filebox" width="100%" align="left">
       						<label for="ex_file">+</label>
							<div id="imageView"></div>
        					<input type="file" name="img[]" class="file_input" id="ex_file" multiple> 	
   						 </div>
		  				<br>
		  				<div class="ReviewPictureCounter" style="/* top: 58%; left: 18%; */ display: block;">
          					  <span class="ReviewPictureCounter__CurrentLength">0</span>
          					  <span class="ReviewPictureCounter__Divider">/</span>
         					   <span class="ReviewPictureCounter__MaxLength">5</span>
          				</div>
				  </div>
					
		 		
			 <div class="button-group">
			 	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
		 			<button type="button" class="btn btn-outline-light text-dark" id="reviewBtn">리뷰 작성</button>
		  			<button type="reset" class="btn btn-outline-light text-dark" id="resetBtn">다시 작성</button>
		 		 	<div id="reviewDiv"></div>
			</div>
		</div><!-- form-group -->
	 
		  <div class="card" style="width:300px" align="center" >
			    <img class="card-img-top" src="../resources/img/store1.jpeg" alt="Card image" style="align:center">
			    <div class="card-body" align="center">
			      <h4 class="card-title" align="center"><font style="color:#fff;"><strong>코스믹 커피</strong></font></h4>
		      	  <h6><font style="color:#fff;">가격대:&emsp; 1만원-2만원대</font></h6>
			      <h6 ><font style="color:#fff;">카테고리:&emsp; 카페/디저트</font></h6>
		    </div>
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
</body>
<script type="text/javascript">
let id = '${memberDTO.nickname}';
</script>
<!-- Vendor JS Files -->
<!-- <script src="../../assets/vendor/jquery/jquery.min.js"></script>  -->
 <script src="../resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
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
  <script src="/FoodFighter/resources/js/review/review_writeForm.js"></script>
</html>