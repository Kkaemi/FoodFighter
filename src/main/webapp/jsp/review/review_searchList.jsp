<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

 <link rel = "stylesheet" href="/FoodFighter/resources/css/review/reviewList.css">
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List 화면</title>
</head>
<body>

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
		         <a class="header-link" href="/FoodFighter/review/reviewNonSearch">리뷰 리스트</a>
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
  	
	<!--================ Container ================-->
    <div class="container">
    
      <!-- Page Keyword -->
      <div class="keywordZone">
		<div class="keyword" align="center"><p>카페</p></div> <br>
			<ul class="keword_issue" align="center">
  				<li>#여름</li>
  				<li>#아이스크림</li>
  				<li>#냉면</li>
  				<li><div class="modalZone" id="modalZone" align="right">
  				 	<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal" style="background: rgba(0,0,0,0); border: rgba(0,0,0,0); outline:none; ">
  				 	<img src="/FoodFighter/resources/img/filter.png" class="keyword_FilterIcon">
  					 </button>
					  <!-- Modal -->
					  <div class="modal fade" id="myModal" role="dialog">
					    <div class="modal-dialog">
					    
					      <!-- Modal content-->
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
  	<div class="row">
      <div class="col-sm-3"><a href="" ><img src="/FoodFighter/resources/img/store1.jpeg" class="row_StoreImg"></a></div>
	     <div class="col-sm-9">
		       	<ul class="storeMain">
					<li><span class="storeName">1. 코스믹커피 &emsp;&emsp;&emsp;&emsp;</span></li>
					<li><span class="storeAvg">4.3</span></li>
					<li><img src="/FoodFighter/resources/img/bookmark.png" id="bookmark" align="right" onclick="bookmarkEvent()"></li>
				</ul><br><br>
				<ul class="storeDetail" align="left">
		  			<li>주소:&emsp;&emsp;&emsp; 경기 오산시 오산대역로132번길 36 1층 코스믹커피</li>
		  			<li>카테고리:&emsp; 카페/디저트</li>
		  			<li>가격대:&emsp;&emsp;  5천원-1만원대</li>
		  		</ul>
	  		<div class="storeMore"><a class="reviewList_detailPage" href="#" style="color: #ffc34d;">가게이름 상세보기 ></a></div>
   		</div><!-- col-sm-9 -->
   </div><hr><!-- row -->
      
   <div class="row">
     <div class="col-sm-3"><a href="" ><img src="/FoodFighter/resources/img/store2.jpeg" width="220px;" height="200px;"></a></div>
       	<div class="col-sm-9">
	           <ul class="storeMain">
					<li><span class="storeName">2. 코뮨 &emsp;&emsp;&emsp;&emsp;</span></li>
	 				<li><span class="storeAvg">3.0</span></li>
 					<li><img src="/FoodFighter/resources/img/bookmark.png" id="bookmark" align="right"></li>
				</ul><br><br>
				<ul class="storeDetail" align="left">
	    			<li>주소:&emsp;&emsp;&emsp; 서울특별시 용산구 한남동 743-32 1층</li>
	    			<li>카테고리:&emsp; 카페/디저트</li>
	    			<li>가격대:&emsp;&emsp;  7천원-1만원대</li>
	    		</ul>
    		<div class="storeMore"><a class="reviewList_detailPage" href="#" style="color: #ffc34d;">가게이름 상세보기 > </a></div>
      </div>
   </div><hr>
      
   <div class="row">
     <div class="col-sm-3"><a href="" ><img src="/FoodFighter/resources/img/store3.jpeg" width="220px;" height="200px;"></a></div>
        <div class="col-sm-9">
           <ul class="storeMain">
				<li><span class="storeName">3. 코뮨 &emsp;&emsp;&emsp;&emsp;</span></li>
  				<li><span class="storeAvg">3.0</span></li>
				<li><img src="/FoodFighter/resources/img/bookmark.png" id="bookmark" align="right" ></li>
			</ul><br><br>
			<ul class="storeDetail" align="left">
    			<li>주소:&emsp;&emsp;&emsp; 서울특별시 용산구 한남동 743-32 1층</li>
    			<li>카테고리:&emsp; 카페/디저트</li>
    			<li>가격대:&emsp;&emsp;  7천원-1만원대</li>
    		</ul>
    	<div class="storeMore"><a class="reviewList_detailPage" href="#" style="color: #ffc34d;">가게이름 상세보기 > </a></div>
     </div>
  </div><hr>
      
  <div class="row">
    <div class="col-sm-3"><a href="" ><img src="/FoodFighter/resources/img/store4.jpeg" width="220px;" height="200px;"></a></div>
       <div class="col-sm-9">
           <ul class="storeMain">
				<li><span class="storeName">4. 코뮨 &emsp;&emsp;&emsp;&emsp;</span></li>
  				<li><span class="storeAvg">3.0</span></li>
				<li><img src="/FoodFighter/resources/img/bookmark.png" id="bookmark" align="right"></li>
			</ul><br><br>
			<ul class="storeDetail" align="left">
    			<li>주소:&emsp;&emsp;&emsp; 서울특별시 용산구 한남동 743-32 1층</li>
    			<li>카테고리:&emsp; 카페/디저트</li>
    			<li>가격대:&emsp;&emsp;  7천원-1만원대</li>
    		</ul>
    	<div class="storeMore"><a class="reviewList_detailPage" href="#" style="color: #ffc34d;">가게이름 상세보기 > </a></div>
     </div>
 </div><hr>
   
 <div class="row">
   <div class="col-sm-3"><a href="" ><img src="/FoodFighter/resources/img/store5.jpeg" width="220px;" height="200px;"></a></div>
      <div class="col-sm-9">
         <ul class="storeMain">
			<li><span class="storeName">4. 코뮨 &emsp;&emsp;&emsp;&emsp;</span></li>
			<li><span class="storeAvg">3.0</span></li>
			<li><img src="/FoodFighter/resources/img/bookmark.png" id="bookmark" align="right"></li>
			</ul><br><br>
			<ul class="storeDetail">
    			<li>주소:&emsp;&emsp;&emsp; 서울특별시 용산구 한남동 743-32 1층</li>
    			<li>카테고리:&emsp; 카페/디저트</li>
    			<li>가격대:&emsp;&emsp;  7천원-1만원대</li>
    		</ul>
    	<div class="storeMore"><a class="reviewList_detailPage" href="#" style="color: #ffc34d;">가게이름 상세보기 > </a></div>
     </div>
  </div><hr>
    
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
  <a href="#" class="back-to-top"><i class="fa fa-chevron-up"> <img src="/FoodFighter/resources/img/back-up.png" width="32px;" height="32px;"></i></a>
  <div id="preloader"></div>
  
<script type="text/javascript">
//검색필터 중복 및 선택해제
$('.modal-body button').click(function(){

	if($(this).hasClass("check") == true) {
		 $(this).removeClass('check'); 
		
	}else {
		$(this).addClass('check');
	}
});

//북마크이미지 변경
function bookmarkEvent() {
    if (document.getElementById("bookmark").src.match("http://localhost:8081/foodFighter/img/bookmark.png")) {
        document.getElementById("bookmark").src = "/FoodFighter/resources/img/bookmarked.png";
    } else {
        document.getElementById("bookmark").src = "/FoodFighter/resources/img/bookmark.png";
    }   
}



$('.filter').click(function(){
	   var filter = $(this).attr('value');
	   alert(filter);
});

</script>

 <!-- Vendor JS Files -->
  <script src="/FoodFighter/resources/assets/vendor/jquery/jquery.min.js"></script>
  <script src="/FoodFighter/resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="/FoodFighter/resources/assets/vendor/jquery.easing/jquery.easing.min.js"></script>
  <script src="/FoodFighter/resources/assets/vendor/php-email-form/validate.js"></script>
  <script src="/FoodFighter/resources/assets/vendor/waypoints/jquery.waypoints.min.js"></script>
  <script src="/FoodFighter/resources/assets/vendor/counterup/jquery.counterup.min.js"></script>
  <script src="/FoodFighter/resources/assets/vendor/owl.carousel/owl.carousel.min.js"></script>
  <!-- <script src="../../assets/vendor/typed.js/typed.min.js"></script> -->
  <script src="/FoodFighter/resources/assets/vendor/venobox/venobox.min.js"></script>

  <!-- Template Main JS File -->
  <script src="/FoodFighter/resources/assets/js/main.js"></script>
  
</body>
</html>