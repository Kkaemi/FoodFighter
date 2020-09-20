<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CS center</title>
    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="/FoodFighter/resources/css/community/headerCss.css">
    <link rel="stylesheet" href="/FoodFighter/resources/css/community/header_and_footer.css">
    <link rel="stylesheet" href="/FoodFighter/resources/css/community/sidenav.css">
    <style>
        figure.item {
            /* To correctly align image, regardless of content height: */
            vertical-align: top;
            display: inline-block;
            /* To horizontally center images and caption */
            text-align: center;
            /* The width of the container also implies margin around the images. */
            width: 350px;

        }

        .imagebtn {
            width: 200px;
            height: 200px;
            cursor: pointer;

        }

        .caption {
            /* Make the caption a block so it occupies its own line. */
            font-size: 20pt;
            display: block;
        }

        .mytr {
            padding-top: 2%;
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
        <a class="header-logo" href="/FoodFighter"><img src="/FoodFighter/resources/img/logo.png" width="250px;" height="55px;" align="left" style="margin-top: 10px; margin-left: 200px;"></a>
        <ul id="header-menu">
            <li class="header-items">
                <img src="/FoodFighter/resources/img/community/search.png" class="header_searchIcon" width="30" height="30" align="center">
                <input type="text" class="header_searchInput" placeholder="&emsp;&emsp;식당 또는 음식 검색" value=""
                    autocomplete="on" maxlength="50">
            </li>
            <li class="header-items">
                <a class="header-link" href="/FoodFighter/index">Home</a>
            </li>
            <li class="header-items">
                <a class="header-link" href="/FoodFighter/review/reviewNonSearchList">리뷰 리스트</a>
            </li>
            <li class="header-items">
                <a class="header-link" href="/FoodFighter/community/communityMain">커뮤니티</a>
            </li>
            <li class="header-items">
                <a class="header-link" href="/FoodFighter/event/eventList">이벤트</a>
            </li>
            <li class="header-items">
                <a class="header-link" href="communityMain.jsp"><img src="/FoodFighter/resources/img/member.png" class="header_searchIcon"
                        width="30" height="30" align="center"></a>
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

    <!-- 중앙 QnA와 FAQ -->
    <div style="text-align: center; margin-top: 300px; margin-bottom: 300px;">
        <figure class="item" style="margin-right: 50px;">
            <img src="/FoodFighter/resources/img/community/qna.png" class="imagebtn" onclick="location.href='/FoodFighter/community/qna'" />
            <figcaption class="caption">QnA</figcaption>
        </figure>
        <figure class="item">
            <img src="/FoodFighter/resources/img/community/faq.png" class="imagebtn" onclick="location.href='/FoodFighter/community/memberFAQ'" />
            <figcaption class="caption">FAQ</figcaption>
        </figure>
    </div>

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
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
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
</script>

</html>