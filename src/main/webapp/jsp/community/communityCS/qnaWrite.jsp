<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>QnA게시판 글쓰기</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/FoodFighter/resources/css/community/communityBoard.css">
    <link rel="stylesheet" href="/FoodFighter/resources/css/community/communityHeader.css">
    <link rel="stylesheet" href="/FoodFighter/resources/css/community/sidenav.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
    <script type="text/javascript" src="/FoodFighter/resources/js/community/summernote-ko-KR.js"></script>
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
        <a class="header-logo" href="#page-top">로고 자리</a>
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
	    <a href="/FoodFighter/community/communityBoardList"><span class="glyphicon glyphicon-list"></span>&emsp;게시판</a>
	    <a href="/FoodFighter/community/communityRank"><span class="glyphicon glyphicon-star"></span>&emsp;랭킹</a>
	    <a href="/FoodFighter/community/csCenter"><span class="glyphicon glyphicon-question-sign"></span>&emsp;고객센터</a>
    </div>

    <!-- 제목부분 -->
    <div class="container" style="margin-top: 65px;">
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
                    <input type="text" class="form-control" name="qna_subject" id="qna_subject">
                </div>
            </div>
            <!-- summernote부분 -->
            <textarea id="summernote" name="qna_content"></textarea>
            <!-- 비밀번호 -->
            <div class="form-group">
                <label for="password" class="col-sm-2 control-label" style="text-align: center;">비밀번호</label>
                <div class="col-sm-4">
                    <input type="password" class="form-control" name="qna_password" id="qna_password">
                </div>
            </div>
            <!-- 목록으로 돌아가기 버튼 -->
            <div style="border-top: 1px solid #eee; margin-bottom: 1%;">
            </div>
            <button class="btn btn-default" type="button" onclick="location.href='qna'">LIST</button>
            <div class="pull-right">
                <!-- 취소버튼 -->
                <button class="btn btn-default" type="button">CANCEL</button>
                <!-- 글쓰기 버튼 -->
                <button class="btn btn-primary" type="button" id="qna_writeBtn">WRITE</button>
                <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
            </div>
        </form>
    </div>
</body>
<script type="text/javascript" src="/FoodFighter/resources/js/community/sidenav.js"></script>
<script>
    $(document).ready(function () {
        $('#summernote').summernote({
            height: 300,                 // 에디터 높이
            minHeight: null,             // 최소 높이
            maxHeight: null,             // 최대 높이
            focus: false,                  // 에디터 로딩후 포커스를 맞출지 여부
            lang: "ko-KR",					// 한글 설정
            placeholder: '최대 2048자까지 쓸 수 있습니다' //placeholder 설정
        });
    });
    
    $('#qna_writeBtn').click(function() {
    	
    	let qna_subject = $('#qna_subject').val();
    	let qna_content = $('#summernote').summernote('code');
    	let qna_password = $('#qna_password').val();
    	
    	$.ajax({
    		
			type : 'post',
			url : '/FoodFighter/community/qnaWrite',
			data : {
				'subject' : qna_subject,
				'content' : qna_content,
				'password' : qna_password
			},
			success : function() {
				alert("글쓰기 완료");
				location.href='/FoodFighter/community/qna';
			},
			error : function(err) {
				console.log(err);
				alert("에러발생!!!");
			}
		
		});
    	
    });
</script>

</html>