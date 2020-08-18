<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel= "stylesheet" type="text/css" href="/FoodFighter/resources/css/bootstrap.css">
    <link rel= "stylesheet" type="text/css" href="/FoodFighter/resources/css/reviewView.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=x4xnbzhxl0"></script>
    <title>Document</title>

</head>

<body> 

<nav class="navbar navbar-b navbar-trans navbar-expand-md fixed-top" id="mainNav">
    <div class="nav-container">
      <a class="navbar-brand js-scroll" href="/FoodFighter/">로고 자리</a>
      
      <div class="navbar-collapse collapse justify-content-end" id="navbarDefault">
        <ul id="navbar-nav">
	        <li class="nav-search">
	    		<img src="/FoodFighter/resources/img/search.png" class="header_searchIcon" width="30" height="30" align="center"> 
		    	<input type="text" class="header_searchInput" placeholder="&emsp;&emsp;식당 또는 음식 검색" value="" autocomplete="on" maxlength="50" >
	        </li>
	        <li class="nav-item">
	           <a class="nav-link js-scroll active" href="/FoodFighter/">Home</a>
	        </li>
	        <li class="nav-item">
	           <a class="nav-link js-scroll" href="/FoodFighter/review/reviewNonSearch">리뷰 리스트</a>
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
    </div>
  </nav>


</header>
<!--리뷰 페이지-->
<div class="reviewView-container">
    <!--타이틀 및 점수-->
    <div class="title">
        <span id="title">서울음식점<span>
        <span class="review-score">4.3</span>   
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
                        <td>서울 강남구 어쩌고 저쩌고 </td>
                    </tr>
                    <tr>
                        <th>전화번호</th>
                        <td>02-725-1557</td>
                    
                    </tr>
                    <tr>
                        <th>음식 종류</th>
                        <td>한정식 / 백반/ 정통 한식</td>
                    </tr>
                    <tr>
                        <th>가격대</th>
                        <td>만원 - 2만원</td>
                    </tr>
                    <tr>
                        <th>영업시간</th>
                        <td>10:00 - 18:00</td>
                    </tr>
                    <tr>
                        <th>휴일</th>
                        <td>월</td>
                    </tr>
                  
                    <tr>
                        <th>메뉴</th>
                        <td>
                            <div class="menu">
                                <span id="menu-text">서울앞바다 멍게 비빔밥 </span>
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
        <div class="map-container" >
            <div id="map"></div> 
            <!--지도 script-->
            <script>
                var mapOptions = {
                    center: new naver.maps.LatLng(37.3595704, 127.105399),
                    zoom: 10
                };
                                
                var map = new naver.maps.Map('map', {
                    center: new naver.maps.LatLng(37.3595704, 127.105399),
                    zoom: 15
                });

                var marker = new naver.maps.Marker({
                    position: new naver.maps.LatLng(37.3595704, 127.105399),
                    map: map
                });
            </script>
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

        <div class="restaurant-images">
            <div id="direc-icon-left" class="glyphicon glyphicon-chevron-left"></div>
                <img id="myImg" class="restaurant-image" src="/FoodFighter/resources/img/review/category-list/냉면2.jpg">
                <img class="restaurant-image" src="/FoodFighter/resources/img/review/category-list/냉면3.jpg">
                <img class="restaurant-image" src="/FoodFighter/resources/img/review/category-list/냉면4.jpg">
                <img class="restaurant-image" src="/FoodFighter/resources/img/review/category-list/냉면5.jpg">
                <img class="restaurant-image" src="/FoodFighter/resources/img/review/category-list/냉면6.jpg">
                <img class="restaurant-image" src="/FoodFighter/resources/img/review/category-list/냉면7.jpg">
            
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
                        <img class="review-image1" src="/FoodFighter/resources/img/review/category-list/냉면1.jpg">
                        <img class="review-image2" src="/FoodFighter/resources/img/review/category-list/냉면2.jpg">
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
<script type="text/javascript">    
var modal = document.getElementById('myModal');

var img = document.getElementById('myImg');

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