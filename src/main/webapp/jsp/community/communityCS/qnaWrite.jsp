<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
request.setCharacterEncoding("utf-8");
String keyword = request.getParameter("keyword");
%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta id="_csrf" name="_csrf" content="${_csrf.token}" />
	<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />
    <title>QnA게시판 글쓰기</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/FoodFighter/resources/css/community/communityCSBoard.css">
    <link rel="stylesheet" href="/FoodFighter/resources/css/community/communityCSHeader.css">
    <link rel="stylesheet" href="/FoodFighter/resources/css/community/sidenav.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
    <script type="text/javascript" src="/FoodFighter/resources/js/community/summernote-ko-KR.js"></script>
</head>

<body>
    <!--================ Header ================-->
	<form id="headerForm" name="headerForm" method="post" action="../review/getSearchList">
	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
		<div id="header-container">
		<!-- 햄버거버튼 -->
        <div class="hamberger pull-left" onclick="myFunction(this)">
            <div class="bar1"></div>
            <div class="bar2"></div>
            <div class="bar3"></div>
        </div>
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
    
    <!-- 왼쪽 메뉴바 -->
    <div id="mySidenav" class="sidenav">
	  	<a href="/FoodFighter/community/communityNotice"><span class="glyphicon glyphicon-exclamation-sign"></span>&emsp;공지사항</a>
	    <a href="/FoodFighter/community/communityBoardList"><span class="glyphicon glyphicon-list"></span>&emsp;게시판</a>
	    <a href="/FoodFighter/community/communityRank"><span class="glyphicon glyphicon-star"></span>&emsp;랭킹</a>
	    <a href="/FoodFighter/community/csCenter"><span class="glyphicon glyphicon-question-sign"></span>&emsp;고객센터</a>
    </div>

    <!-- 제목부분 -->
    <div class="container">
        <div class="page-header">
            <h2 class="text-center">QnA 글쓰기</h2>
              <p class="text-center">페이지 관리자에게 질문을 올려주세요</p>      
          </div>
    </div>

    <div class="page-body">
	    <!-- SUMMERNOTE FORM-->
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
    
    <!-- 모달 -->
    <div class="modal fade" id="myModal" tabindex="-1"role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title">오류</h4>
	      </div>
	      <div class="modal-body">
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	      </div>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
</body>
<script type="text/javascript" src="/FoodFighter/resources/js/community/sidenav.js"></script>
<script src="/FoodFighter/resources/js/review/keyword.js"></script>
<script>
    $(document).ready(function () {
    	
    	var token = $("meta[name='_csrf']").attr("content");
	    var header = $("meta[name='_csrf_header']").attr("content");
	    $(document).ajaxSend(function(e, xhr, options) {
	        xhr.setRequestHeader(header, token);
	    });
	    
	    if ('${memId}' == '') {
	    	location.href='/FoodFighter/login/loginForm';
	    	alert('먼저 로그인해 주세요');
	    	return;
	    }
	    
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
    	
    	if (qna_subject == '') {
    		
    		$('.modal-body').text('제목을 입력해 주세요');
    		$('#myModal').modal('show');
    		$('#myModal').on('hide.bs.modal', function (e) {
    			  $('#qna_subject').focus();
    		});
    		
    	} else if ($('#summernote').val() == '') {
    		
    		$('.modal-body').text('내용을 입력해 주세요');
    		$('#myModal').modal('show');
    		$('#myModal').on('hide.bs.modal', function (e) {
    			  $('#summernote').summernote({focus: true});
    		});
    		
    	} else if (qna_password == '') {
    		
    		$('.modal-body').text('비밀번호를 입력해 주세요');
    		$('#myModal').modal('show');
    		$('#myModal').on('hide.bs.modal', function (e) {
    			  $('#qna_password').focus();
    		});
    		
    	} else {
    		
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
    	
    	}
    	
    });
</script>

</html>