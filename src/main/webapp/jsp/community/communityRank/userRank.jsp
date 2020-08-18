<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>랭킹</title>
    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="/FoodFighter/recourses/css/community/headerCss.css">
    <link rel="stylesheet" href="/FoodFighter/recourses/css/community/normalize.css">
    <link rel="stylesheet" href="/FoodFighter/recourses/css/community/communityBoard.css">
    <link rel="stylesheet" href="/FoodFighter/recourses/css/community/header_and_footer.css">
    <link rel="stylesheet" href="/FoodFighter/recourses/css/community/sidenav.css">
    <link rel="stylesheet" href="/FoodFighter/recourses/css/community/communityRankCss.css">
    <style type="text/css">
        body, html {
            height: 100%;
        }
    </style>
</head>

<body>
    <!--================ Header ================-->
    <div id="header-container">
        <!-- 햄버거버튼 -->
        <div class="hamberger pull-left" onclick="myFunction(this)">
            <div class="bar1"></div>
            <div class="bar2"></div>
            <div class="bar3"></div>
        </div>
		<!-- 로고 -->
		<a id="logo" class="navbar-brand js-scroll"
			href="/FoodFighter/"><img id="logo-img"
			src="/FoodFighter/img/streetfighter.gif"></a>
		<ul id="header-menu">
			<li class="header-items"><img
				src="/FoodFighter/resources/img/community/mainImg/search.png"
				class="header_searchIcon" width="30" height="30" align="center">
				<input type="text" class="header_searchInput"
				placeholder="&emsp;&emsp;식당 또는 음식 검색" value="" autocomplete="on"
				maxlength="50"></li>
			<li class="header-items"><a class="header-link"
				href="/FoodFighter/">Home</a></li>
			<li class="header-items"><a class="header-link"
				href="/FoodFighter/review/reviewNonSearchList">리뷰 리스트</a></li>
			<li class="header-items"><a class="header-link"
				href="/FoodFighter/community/communityMain">커뮤니티</a></li>
			<li class="header-items"><a class="header-link"
				href="/FoodFighter/event/eventList">이벤트</a></li>
			<li class="header-items"><a class="header-link" href=""><img
					src="/FoodFighter/img/community/mainImg/user.png"
					class="header_searchIcon" width="30" height="30" align="center"></a>
			</li>
		</ul>
	</div>

    <!-- 왼쪽 메뉴바 -->
    <div id="mySidenav" class="sidenav">
	    <a href="/FoodFighter/community/communityNotice"><span class="glyphicon glyphicon-exclamation-sign"></span>&emsp;공지사항</a>
	    <a href="/FoodFighter/community/communityBoard"><span class="glyphicon glyphicon-list"></span>&emsp;게시판</a>
	    <a href="/FoodFighter/community/communityRank"><span class="glyphicon glyphicon-star"></span>&emsp;랭킹</a>
	    <a href="/FoodFighter/community/csCenter"><span class="glyphicon glyphicon-question-sign"></span>&emsp;고객센터</a>
    </div>

    <!-- 본문 -->
    <div class="container">
        <div class="page-header">
            <h2 class="text-center">RANK</h2>
            <p class="text-center">이 달의 Top10 랭커가 되어보세요</p>
        </div>
    </div>
    <div class="page-body" style="z-index : 1;">
        <div style="margin-bottom: 30px;">
            <h4 class="rankTitle">
                푸드파이터
                <em style="color : #FF6A4D;">Top10</em>
                <div style="float : right!important;">
                    <img src="/FoodFighter/img/community/simbol.png" alt="" id="img" class="img-circle" width="50" height="50"
                        style="cursor: pointer;" onclick="changeRank()">
                </div>
            </h4>
        </div>
        <ul class="rankList">
            <li class="rankItem">
                <div class="rankInner">
                    <div class="ranking">
                        <img src="/FoodFighter/img/community/rank1.png" width="50" height="50">
                    </div>
                    <div class="rankerInfo">
                        <div class="infoPic">
                            <img src="/FoodFighter/img/community/simbol.png">
                        </div>
                        <div class="infoText">
                            <div class="infoName">
                                <span class="nickName">스누피</span>
                            </div>
                        </div>
                        <div class="grade">
                            <span>Lv.5 검정띠</span><img src="/FoodFighter/img/community/grade.png"
                                style="margin-left : 20px; width : 30px; height : 30px;">
                        </div>
                    </div><!-- rankerInfo -->
                    <div class="rankerBoardWrap">
                        <ul class="postList">
                            <li class="postItem">
                                <div class="review">
                                    <a href="#" class="reviewLink">
                                        <span class="reviewThumb"></span>
                                        <div class="reviewText">
                                            <strong class="reviewTextSum">
                                                <p>신논현 맛집 리뷰 : 할랄가이즈 가고 싶은 맛집</p>
                                            </strong>
                                        </div>
                                    </a>
                                </div>
                            </li>
                            <li class="postItem">
                                <div class="review">
                                    <a href="#" class="reviewLink">
                                        <span class="reviewThumb"></span>
                                        <div class="reviewText">
                                            <strong class="reviewTextSum">
                                                <p>신논현 맛집 리뷰 : 할랄가이즈 가고 싶은 맛집</p>
                                            </strong>
                                        </div>
                                    </a>
                                </div>
                            </li>
                            <li class="postItem">
                                <div class="review">
                                    <a href="#" class="reviewLink">
                                        <span class="reviewThumb"></span>
                                        <div class="reviewText">
                                            <strong class="reviewTextSum">
                                                <p>신논현 맛집 리뷰 : 할랄가이즈 가고 싶은 맛집</p>
                                            </strong>
                                        </div>
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div><!-- rankInner -->
            </li>
        </ul>
        <ul class="rankList">
            <li class="rankItem">
                <div class="rankInner">
                    <div class="ranking">
                        <img src="/FoodFighter/img/community/rank1.png">
                    </div>
                    <div class="rankerInfo">
                        <div class="infoPic">
                            <img src="/FoodFighter/img/community/simbol.png">
                        </div>
                        <div class="infoText">
                            <div class="infoName">
                                <span class="nickName">스누피</span>
                            </div>
                        </div>
                        <div class="grade">
                            <span>Lv.5 검정띠</span><img src="/FoodFighter/img/community/grade.png"
                                style="margin-left : 20px; width : 30px; height : 30px;">
                        </div>
                    </div><!-- rankerInfo -->
                    <div class="rankerBoardWrap">
                        <ul class="postList">
                            <li class="postItem">
                                <div class="review">
                                    <a href="#" class="reviewLink">
                                        <span class="reviewThumb"></span>
                                        <div class="reviewText">
                                            <strong class="reviewTextSum">
                                                <p>신논현 맛집 리뷰 : 할랄가이즈 가고 싶은 맛집</p>
                                            </strong>
                                        </div>
                                    </a>
                                </div>
                            </li>
                            <li class="postItem">
                                <div class="review">
                                    <a href="#" class="reviewLink">
                                        <span class="reviewThumb"></span>
                                        <div class="reviewText">
                                            <strong class="reviewTextSum">
                                                <p>신논현 맛집 리뷰 : 할랄가이즈 가고 싶은 맛집</p>
                                            </strong>
                                        </div>
                                    </a>
                                </div>
                            </li>
                            <li class="postItem">
                                <div class="review">
                                    <a href="#" class="reviewLink">
                                        <span class="reviewThumb"></span>
                                        <div class="reviewText">
                                            <strong class="reviewTextSum">
                                                <p>신논현 맛집 리뷰 : 할랄가이즈 가고 싶은 맛집</p>
                                            </strong>
                                        </div>
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div><!-- rankInner -->
            </li>
        </ul>
    </div><!-- pageBody -->

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

</body>
<script src="js/jquery-3.5.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script>
    function myFunction(x) {
        x.classList.toggle("change");
        if (document.getElementById("mySidenav").style.width == '250px') {
            document.getElementById("mySidenav").style.width = "0";
            return;
        }
        document.getElementById("mySidenav").style.width = "250px";
    }

    function changeRank() {
        if (document.getElementById("img").src.match("/FoodFighter/img/community/user.png")) {
            document.getElementById("img").src = "/FoodFighter/img/community/home.png";
        } else {
            document.getElementById("img").src = "/FoodFighter/img/community/user.png";
        }
    }
</script>

</html>