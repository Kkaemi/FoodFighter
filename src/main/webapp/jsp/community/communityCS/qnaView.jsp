<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>QnA게시글 보기</title>
    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="/FoodFighter/recourses/css/community/headerCss.css">
    <link rel="stylesheet" href="/FoodFighter/recourses/css/community/normalize.css">
    <link rel="stylesheet" href="/FoodFighter/recourses/css/community/header_and_footer.css">
    <style>
        .page-body {
            position: relative;
            padding: 0px 400px;
        }
    
        div {
            display: block;
        }

        .myButton {
            background:linear-gradient(to bottom, #ffa64d 5%, #ffa64d 100%);
            background-color:#ffa64d;
            border-radius:1px;
            display:inline-block;
            cursor:pointer;
            color:#ffffff;
            font-family:Arial;
            font-size:17px;
            padding:8px 29px;
            text-decoration:none;
        }
        .myButton:hover {
            background:linear-gradient(to bottom, #ffa64d 5%, #ffa64d 100%);
            background-color:#ffa64d;
            text-decoration: none;
            color:#ffffff;
        }
        .myButton:active {
            position:relative;
            top:1px;
        }

        td, th {
            padding: 8px;
            border: 1px solid #ddd;
        }

        table {
            width: 100%;
            margin-top: 10%;
            border: 1px solid #ddd;
        }

        th {
            text-align: center;
        }

        .container {
            padding: 5px 120px 10px 120px;
        }

        .btn-group {
            width: 100%;
            margin-top: 2%;
            padding-top: 3%;
            border-top: 1px solid #ddd;
        }

    </style>
</head>

<body>
    <!-- 헤더부분 -->
    <div class="header">
        <img src="" class="header_SearchIcon" width="30" height="30" align="center">
        <input type="text" class="header_SearchInput" placeholder="식당 또는 음식 검색" value="" autocomplete="on"
            maxlength="50">
        &emsp;&emsp;리뷰리스트&emsp;|&emsp;커뮤니티&emsp;|&emsp;이벤트
    </div>

    <div class="page-body">
        <!-- 페이지 본문2 -->
        <table>
            <thead>
                <tr>
                    <th>RE:질문드립니다</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>
                        작성자 : <span style="font-weight: bold;">김영희</span>&ensp;
                        조회수 : <span style="font-weight: bold;">3</span>
                    </td>
                </tr>
                <tr>
                    <!-- 관리자 글 내용 -->
                    <td>
                        <br>
                        안녕하세요.<br><br>
                        거래처 입고 지연으로 발송이 지연되었습니다.<br><br>
                        정말 죄송합니다.<br><br>
                        내일 출고예정입니다.<br><br>
                        발송해드리고 운송장번호 보내드리겠습니다.<br><br>
                        감사합니다.
                        <br>
                    </td>
                </tr>
            </tbody>
        </table>

        <!-- 버튼그룹 -->
        <div class="btn-group">
            <a href="#" class="myButton">수정</a>
            <a href="#" class="myButton">삭제</a>
            <a href="#" class="myButton">답변</a>
            <span class="pull-right">
                <a href="#" class="myButton">글쓰기</a>
                <a href="#" class="myButton">목록보기</a>
            </span>
        </div>

        <!-- 내가 쓴 글과 관리자 답글을 보여줌 -->
        <table style="margin-top: 5%;">
            <colgroup>
                <col width="100">
                <col width="*">
                <col width="110">
                <col width="110">
                <col width="60">
            </colgroup>
            <thead>
                <tr>
                    <th>NO</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>작성일</th>
                    <th>조회수</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>1</td>
                    <td>질문드립니다</td>
                    <td>김영희</td>
                    <td>2020.08.09</td>
                    <td>3</td>
                </tr>
                
                <tr>
                    <td>2</td>
                    <td>답변입니다</td>
                    <td>관리자</td>
                    <td>2020.08.09</td>
                    <td>1</td>
                </tr>
            </tbody>
        </table>

    <!-- page-body끝 -->
    </div>

</body>

</html>