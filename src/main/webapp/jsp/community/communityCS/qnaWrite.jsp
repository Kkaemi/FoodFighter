<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>QnA게시판 글쓰기</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
    <link rel="stylesheet" href="/FoodFighter/recourses/css/community/headerCss.css">
    <link rel="stylesheet" href="/FoodFighter/recourses/css/community/communityBoard.css">
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
            <h2 class="text-center">QnA 글쓰기</h2>
              <p class="text-center">페이지 관리자에게 질문을 올려주세요</p>      
          </div>
    </div>

    <!-- SUMMERNOTE FORM-->
    <div class="page-body">
        <form method="post" class="form-horizontal">
            <!-- 제목 -->
            <div class="form-group">
                <label for="subject" class="col-sm-2 control-label" style="text-align: center;">제목</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="subject">
                </div>
            </div>
            <!-- summernote부분 -->
            <textarea id="summernote" name="editordata"></textarea>
            <!-- 비밀번호 -->
            <div class="form-group">
                <label for="password" class="col-sm-2 control-label" style="text-align: center;">비밀번호</label>
                <div class="col-sm-4">
                    <input type="password" class="form-control" id="password">
                </div>
            </div>
            <!-- 목록으로 돌아가기 버튼 -->
            <button class="btn btn-default" type="button">LIST</button>
            <div class="pull-right">
                <!-- 취소버튼 -->
                <button class="btn btn-default" type="button">CANCEL</button>
                <!-- 글쓰기 버튼 -->
                <button class="btn btn-primary" type="button">WRITE</button>
            </div>
        </form>
    </div>
</body>
<script>
    $(document).ready(function () {
            $('#summernote').summernote({
                height: 300,                 // 에디터 높이
                minHeight: null,             // 최소 높이
                maxHeight: null,             // 최대 높이
                focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
                lang: "ko-KR",					// 한글 설정
                placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정
            });
        });
</script>

</html>