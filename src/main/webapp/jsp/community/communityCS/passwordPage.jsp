<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>QnA비밀번호</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
    <link rel="stylesheet" href="/FoodFighter/resources/css/community/headerCss.css">
    <link rel="stylesheet" href="/FoodFighter/resources/css/community/communityBoard.css">
    <style>
        .myButton {
            box-shadow: 0px 0px 0px 0px #364d30;
            background-color:#FFA64D;
            border-radius:1px;
            display:inline-block;
            cursor:pointer;
            color:#ffffff;
            font-family:Arial, sans-serif;
            font-size:17px;
            font-weight:bold;
            padding:17px 36px;
            text-decoration:none;
        }
        .myButton:active {
            position:relative;
            top:1px;
        }
        .myButton:hover {
            text-decoration: none;
            color: white;
        }
        .btn-group {
            margin-left: 330px;
        }
    </style>
</head>
<body>
    <!-- 헤더 -->
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
              <p class="text-center">비밀번호를 입력해 주세요</p>      
          </div>
    </div>

    <!-- 페이지 본문 -->
    <div class="page-body">
        <table class="table table-hover">
            <colgroup>
                <col width="470">
                <col width="*">
            </colgroup>
            <thead>
            </thead>
            <tbody>
                <tr>
                    <td align="right">
                        <div>PASSWORD</div>
                    </td>
                    <td>
                        <div>
                            <input type="password">
                        </div>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
            </tbody>
        </table>
        <div class="btn-group">
            <a href="#" class="myButton">확인</a>
            <a href="#" class="myButton">취소</a>
            <a href="#" class="myButton">목록</a>
        </div>
    </div>
</body>
</html>