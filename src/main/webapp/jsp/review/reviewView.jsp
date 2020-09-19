<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
request.setCharacterEncoding("utf-8");
String keyword = request.getParameter("keyword");
String resName = request.getParameter("resName");
String resSeq = request.getParameter("resSeq");
%> 
<!DOCTYPE html>
<html lang="kor">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta id="_csrf" name="_csrf" content="${_csrf.token}" />
	<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel= "stylesheet" type="text/css" href="/FoodFighter/resources/css/review/reviewView.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <title>리뷰보기</title>
<!-- security -->
 <meta id="_csrf" name="_csrf" content="${_csrf.token}" />
 <meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />

</head>
<style>
#reviewWriteBtn {
	margin : 50px;
}

</style>
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


<!--리뷰 페이지-->
<div class="reviewView-container">
	<!--타이틀 및 점수-->
    <div class="title">
        <span id="title"></span>
        <span class="review-score"></span>   
    </div>

    <!--리뷰 정보- 조회수, 리뷰수, 북마크-->
    <div class="review-info">
        <!--조회수-->
        <span class="glyphicon glyphicon-eye-open" id="eye-icon"></span>
        <span class="watch-count">3,500</span>

        <!--리뷰 수 -->
        <span class="glyphicon glyphicon-pencil" id="pencil-icon"></span>
        <span class="write-count">12</span>

        <!--북마크-->
        <span class="glyphicon glyphicon-star" id="star-icon"></span>
        <span class="bookmark-count">100</span>

      
    </div>

    <!--가게 정보-->
    <div class="restaurant-info">
   		
        <div class="table-div">
            <table class="table">
                <tbody>
                    <tr class="table">
                        <th>주소</th>
                        <td><span id="resAddress"></span></td>
                    </tr>
                    <tr>
                        <th>전화번호</th>
                        <td><span id="resTel"></span></td>
                    
                    </tr>
                    <tr>
                        <th>음식 종류</th>
                        <td><span id="resTheme"></span></td>
                    </tr>
                    <tr>
                        <th>가격대</th>
                        <td><span id="resPrice"></span></td>
                    </tr>
                    <tr>
                        <th>영업시간</th>
                        <td><span id="resHours"></span></td>
                    </tr>
                    <tr>
                        <th>휴일</th>
                        <td><span id="resClosing"></span></td>
                    </tr>
                  
                    <tr>
                        <th>메뉴</th>
                        <td>
                            <div class="menu">
                                <span id="menu-text"></span>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <div class="tags">
                                <button class="tag-item"># 냉면</button>
                                <button class="tag-item"># 2020푸드파이터인기맛집</button>
                                <button class="tag-item"># 강남맛집</button><br>
                                <button class="tag-item"># 함흥냉면</button>
                                <button class="tag-item"># 냉면맛집</button>
                            </div>
                        </td>
                    </tr>
                    
                </tbody>
            </table>
            <span class="resImages">
	       		<img id="resImage1">
	       		<img id="resImage2">
       		</span>
        </div>
		
        <div class="map-container">
            <div id="map" style="width:400px;height:350px;"></div>
            
        </div>
      
  
       
    </div>  
 
    <div class="line"></div>
    
      <span class="review-count">
        <button class="review-count-btn-selected">전체(72)</button>
        |
        <button class="review-count-btn">맛있다(65)</button>
        |
        <button class="review-count-btn">괜찮다(6)</button>
        |
        <button class="review-count-btn">별로(1)</button>
		

		
     </span>
      	
    <!-- 리뷰쓰기 버튼 -->
	<span class="writeBtn">
      	<input type="button" id="reviewWriteBtn" name="reviewWriteBtn" value="리뷰쓰기">
      	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
      	<input type="hidden" name="resName" value="<%=resName%>">
    </span> 
      	

  

 	<!--리뷰-->
 	<div class="review-container"></div>	
 	
</div>

<!--footer-->
<footer>
    <div class="footer-container" id="footer-container">
        <p style="text-align:left;">
          ㈜ 푸드파이터<br>서울 서초구 강남대로 459(백암빌딩) 202호<br>대표이사: FOODFIGHTER<br>사업자 등록번호: 2020-020-22222 
       <br>고객센터: 0507-1414-9601<br><br>
        </p>
          <div class="copyright-box">
            <p class="copyright">&copy; Copyright <strong>foodFighter</strong>. All Rights Reserved</p>
              <p>Designed by foodFighter</p>
          </div>
    </div>
  </footer>
  <!-- End  Footer -->
</body>

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
<!--모달 script-->
<script src="/FoodFighter/resources/js/review/keyword.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=x4xnbzhxl0&submodules=geocoder"></script>
<script type="text/javascript">

$(document).ready(function(){
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    $(document).ajaxSend(function(e, xhr, options) {
        xhr.setRequestHeader(header, token);
    });

    
    $.ajax({
		type : 'post',
		url : '/FoodFighter/review/getRestaurantDTOAndReviewList',
		data : 'resSeq=${resSeq}&resName=${resName}',
		dataType : 'json',
		success : function(data){
			
			let resAddress = data.restaurantAndReviewMap.restaurantDTO.resAddress;
			
			// 가게 데이터
			$('#title').text(data.restaurantAndReviewMap.restaurantDTO.resName);
			$('#resAddress').text(data.restaurantAndReviewMap.restaurantDTO.resAddress);
			$('#resTel').text(data.restaurantAndReviewMap.restaurantDTO.resTel);
			$('#resTheme').text(data.restaurantAndReviewMap.restaurantDTO.resTheme);
			$('#resPrice').text(data.restaurantAndReviewMap.restaurantDTO.resPrice);
			$('#resHours').text(data.restaurantAndReviewMap.restaurantDTO.resHours);
			$('#resClosing').text(data.restaurantAndReviewMap.restaurantDTO.resClosing);
			$('#menu-text').text(data.restaurantAndReviewMap.restaurantDTO.resMenu);
			$('#resImage1').attr('src', '/FoodFighter/storage/restaurant/'+data.restaurantAndReviewMap.restaurantDTO.resImage1);
			$('#resImage1').attr('width','80px');
			$('#resImage1').attr('height', '90px');
			$('#resImage2').attr('src', '/FoodFighter/storage/restaurant/'+data.restaurantAndReviewMap.restaurantDTO.resImage2);
			$('#resImage2').attr('width','80px');
			$('#resImage2').attr('height', '90px');
			// 리뷰 데이터
			$.each(data.restaurantAndReviewMap.reviewList, function(index, items) {
				$('<div/>', {
					class : 'review'
				}).append($('<div/>', {
					class : 'user-info'
				}).append($('<p/>', {
					
					class : 'user-name',
					text : items.nickname
					
				}))).append($('<div/>', {
					class : 'review-text'
				}).append($('<span/>', {
					
					class : 'review-date',
					text : moment(items.reviewDate).format('YYYY MM DD HH:mm:ss')
					
				})).append($('<br/>')).append($('<div/>', {
					
					class : 'review-content',
					text : items.content
					
				})).append($('<div/>', {
					class : 'review-images'
				}).append($('<img/>', {
					
					class : 'review-image1',
					src : '/FoodFighter/storage/review/' + items.image1,
					width : '100px',
					height : '100px'
					
				})).append($('<img/>', {
					
					class : 'review-image2',
					src : '/FoodFighter/storage/review/' + items.image2,
					width : '100px',
					height : '100px'
					
				}))).append($('<div/>', {
					class : 'line2'
				}))).appendTo('.review-container');
			});
			
		    naver.maps.Service.geocode({
		        query: resAddress
		    }, function(status, response) {
			        if (status !== naver.maps.Service.Status.OK) {
			            return alert('Something wrong!');
			        }
			
			        var result = response.v2, // 검색 결과의 컨테이너
			            items = result.addresses; // 검색 결과의 배열
					/* alert(items[0].x+', '+items[0].y+', '+typeof items[0].x+', '+typeof items[0].y); */
			            
			        // do Something
			        
			    	//지도에 마커찍기 
			    	let x = parseFloat(items[0].x);
			    	let y = parseFloat(items[0].y);
			    	
			    	
			    	
			    	var map = new naver.maps.Map('map', {
			    	    center: new naver.maps.LatLng(y, x),
			    	    zoom: 19
			    	});
			
			    	var marker = new naver.maps.Marker({
			    	    position: new naver.maps.LatLng(y, x),
			    	    map: map
			    	});
		
		    });
			
		}, error : function(err){
			console.log(err);
		}
	});
    
});


//리뷰페이지 이동
$('#reviewWriteBtn').click(function(){
	location.href="/FoodFighter/review/review_writeForm?resSeq=<%=resSeq%>&resName=<%=resName%>";
});

</script>

</html>