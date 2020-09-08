<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>QnA게시판</title>
    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="/FoodFighter/recourses/css/community/headerCss.css">
    <link rel="stylesheet" href="/FoodFighter/recourses/css/community/normalize.css">
    <link rel="stylesheet" href="/FoodFighter/recourses/css/community/communityBoard.css">
</head>

<body>
    <!-- 헤더부분 -->
    <div class="header">
        <img src="" class="header_SearchIcon" width="30" height="30" align="center">
        <input type="text" class="header_SearchInput" placeholder="식당 또는 음식 검색" value="" autocomplete="on"
            maxlength="50">
        &emsp;&emsp;리뷰리스트&emsp;|&emsp;커뮤니티&emsp;|&emsp;이벤트
    </div>
    <!-- 제목부분 -->
    <div class="container">
        <div class="page-header">
            <h2 class="text-center">QnA</h2>
            <p class="text-center">페이지 관리자에게 질문을 올려주세요</p>
        </div>
    </div>
    <!-- 게시판 부분 -->
    <div class="page-body">
        <table class="table table-hover">
            <colgroup>
                <col width="100">
                <col width="*">
                <col width="110">
                <col width="75">
                <col width="60">
            </colgroup>
            <thead>
                <tr>
                    <th scope="col" class="text-center">NO</th>
                    <th scope="col" class="text-center">제목</th>
                    <th scope="col" class="text-center">작성자</th>
                    <th scope="col" class="text-center">작성일</th>
                    <th scope="col" class="text-center">조회수</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>
                        <div class="tb-center">3</div>
                    </td>
                    <td>
                        <div class="tb-left">QnA게시판 관려해서 질문드립니다</div>
                    </td>
                    <td>
                        <div class="tb-center">김비트</div>
                    </td>
                    <td>
                        <div class="tb-center">2020.08.03</div>
                    </td>
                    <td>
                        <div class="tb-center">1</div>
                    </td>
                </tr>

                <tr>
                    <td>
                        <div class="tb-center">2</div>
                    </td>
                    <td>
                        &emsp;<img src="/FoodFighter/img/community/reply_icon.png" alt="" width="10" height="10">&nbsp;<span class="tb-left">QnA게시판
                            관려해서 질문드립니다</span>
                    </td>
                    <td>
                        <div class="tb-center">관리자</div>
                    </td>
                    <td>
                        <div class="tb-center">2020.08.03</div>
                    </td>
                    <td>
                        <div class="tb-center">1</div>
                    </td>
                </tr>

                <tr>
                    <td>
                        <div class="tb-center">1</div>
                    </td>
                    <td>
                        <div class="tb-left">질문드립니다</div>
                    </td>
                    <td>
                        <div class="tb-center">김영희</div>
                    </td>
                    <td>
                        <div class="tb-center">2020.08.01</div>
                    </td>
                    <td>
                        <div class="tb-center">0</div>
                    </td>
                </tr>
                
            </tbody>
        </table>

        <div class="content-wrapper">
            <div class="paging">
                <a href="#" title="prev">
                    <span><</span>
                </a>
                <a class="now" href="#" title="1페이지">
                    <span>1</span>
                </a>
                <a href="#" title="2페이지">
                    <span>2</span>
                </a>
                <a href="#" title="3페이지">
                    <span>3</span>
                </a>
                <a href="#" title="4페이지">
                    <span>4</span>
                </a>
                <a href="#" title="5페이지">
                    <span>5</span>
                </a>
                <a href="#" title="6페이지">
                    <span>6</span>
                </a>
                <a href="#" title="7페이지">
                    <span>7</span>
                </a>
                <a href="#" title="8페이지">
                    <span>8</span>
                </a>
                <a href="#" title="9페이지">
                    <span>9</span>
                </a>
                <a href="#" title="10페이지">
                    <span>10</span>
                </a>
                <a href="#" title="next">
                    <span>></span>
                </a>
            </div>
            <div class="listBtnBox">
                <a href="#">
                    <span class="plain-btn">처음 목록</span></a>
                <a href="#">
                    <span class="plain-btn">글쓰기</span></a>
            </div>
        </div>
        <div class="list-search">
            <fieldset>
                <select name="where">
                    <option value="subject">제목</option>
                    <option value="content">본문</option>
                    <option value="nickname">닉네임</option>
                </select>
                <input type="text" value="keyword" class="inp">
                <input type="button" value="검색" class="plain-btn" id="searchBtn">
            </fieldset>
        </div>
    </div>
</body>
<script src="js/jquery-3.5.1.min.js"></script>
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</html>