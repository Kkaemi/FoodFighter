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
    <link rel= "stylesheet" type="text/css" href="/FoodFighter/resources/css/review/bootstrap.css">
    <link rel= "stylesheet" type="text/css" href="/FoodFighter/resources/css/review/reviewView.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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


<!--리뷰 페이지-->
<div class="reviewView-container">
	<!--타이틀 및 점수-->
    <div class="title">
        <span id="title"><span>
        <span class="review-score"></span>   
        <!--북마크-->
        <span id="bookmark-group"  onclick="bookmarkChange()">
            <span class="fa fa-bookmark-o" id="bookmark"></span>
            <p id="bookmark-name">찜하기<p> 
        </span>
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
        </div>
        <div class="map-container">
            <div id="map" style="width:400px;height:350px;"></div>
            
         
        </div>
    </div>  

    <div class="line"></div>

    <!--리뷰-->
    <div class="review-list">
    
        <div class="review-count">
            <button class="review-count-btn-selected">전체(72)</button>
            |
            <button class="review-count-btn">맛있다(65)</button>
            |
            <button class="review-count-btn">괜찮다(6)</button>
            |
            <button class="review-count-btn">별로(1)</button>
        </div>
		<!-- 리뷰쓰기 버튼 -->
         <input type="button" id="reviewWriteBtn" name="reviewWriteBtn" value="리뷰쓰기">
         <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
        <input type="hidden" name="resName" value="<%=resName%>">
        
        <div class="restaurant-images">
            <div id="direc-icon-left" class="glyphicon glyphicon-chevron-left"></div>
                <img class="restaurant-image" id="restaurant-image">
                <img class="restaurant-image">
                <img class="restaurant-image">

            
            <div id="direc-icon-right" class="glyphicon glyphicon-chevron-right"></div>

        </div>
         <!--modal-->
            <div id="myModal" class="modal">
                <span class="close">&times;</span>
                <img class="modal-content" id="img01">
                <div id="caption"></div>
            </div>

        <div class="review-div">

            <!--리뷰 1-->
            <div class="review1">
                <div class="user-info">
                    <img class="user-image" src="/FoodFighter/resources/img/review/reviewView-img/cat.png">
                    <p class="user-name">양아무개</p>
                </div>
                <div class="review-text">
                    <span class="review-date">2020-08-05</span><br>
                    <div class="review-content">
                        나쁘지 않아요. 고등어 구이가 어쩌고저쩌고...
                        또 가고 싶어요!!
                    </div>
                    <div class="review-images">
                        <img class="review-image1" src="/FoodFighter/resources/img/review/list-img/냉면1.jpg">
                        <img class="review-image2" src="/FoodFighter/resources/img/review/list-img/냉면2.jpg">
                    </div>
                </div>
            </div>

            <div class="line2"></div>
            <!--리뷰 2-->

        </div>
    </div>
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
		url : '/FoodFighter/review/getReviewView',
		data : 'resSeq=${resSeq}',
		dataType : 'json',
		success : function(data){
			//alert(JSON.stringify(data));
			/* $('#restaurant-image').attr('src', '/FoodFighter/src/webapp/storage/restaurant/'+data.restaurantDTO.resImage1); */
			
			let resAddress = data.restaurantDTO.resAddress;
			
			$('#title').text(data.restaurantDTO.resName);
			$('#resAddress').text(data.restaurantDTO.resAddress);
			$('#resTel').text(data.restaurantDTO.resTel);
			$('#resTheme').text(data.restaurantDTO.resTheme);
			$('#resPrice').text(data.restaurantDTO.resPrice);
			$('#resHours').text(data.restaurantDTO.resHours);
			$('#resClosing').text(data.restaurantDTO.resClosing);
			$('#menu-text').text(data.restaurantDTO.resMenu);
			
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

<<<<<<< HEAD

=======
>>>>>>> upstream/master
var modal = document.getElementById('myModal');
var img = document.getElementById('restaurant-image');
var modalImg = document.getElementById("img01");
var captionText = document.getElementById("caption");
img.onclick = function(){
  modal.style.display = "block";
  modalImg.src = this.src;
  captionText.innerHTML = this.alt;
}
var span = document.getElementsByClassName("close")[0];
span.onclick = function() { 
  modal.style.display = "none";
}
</script>

<!-- 북마크 클릭 시 색깔 바꾸기 -->
<script>
function bookmarkChange() {
    document.getElementById("bookmark").className="glyphicon glyphicon-bookmark";
    document.getElementById("bookmark").style.cssText ="color :#ffa64d; font-size : 40px; margin-left:543px;";
    document.getElementById("bookmark-name").style.cssText ="color :#ffa64d;";
}
</script>

</html>