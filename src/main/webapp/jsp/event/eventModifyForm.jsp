<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />
<meta charset="UTF-8">
<title></title>
<style type="text/css">
body, html {
    height: 100%;
}
</style>
<!-- CSS 파일 -->

<link rel="stylesheet" href="/FoodFighter/resources/css/event/normalize.css">
<link rel="stylesheet" href="/FoodFighter/resources/css/event/headerCss.css">
<link rel="stylesheet" href="/FoodFighter/resources/css/event/eventBoardView.css">


<!-- JS 파일 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> <!-- 부트스트랩 CSS  -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> <!-- 부트스트랩 JS -->
<!-- 썸머노트 -->
<link rel="stylesheet"  href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
</head>
<body>
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
            <h2 class="text-center">이벤트 글 수정</h2>
              <p class="text-center">...</p>      
          </div>
    </div>

    <!-- SUMMERNOTE FORM-->
    <div class="page-body">
        <form  id ="ModifyForm" name="ModifyForm" class="form-horizontal">
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
		
		<input type="hidden" name="seq_event"  id="seq_event" value="${seq_event}">
		<input type="hidden" name="pg" id="pg" value="${pg}">
            
            <!-- 제목 -->
            <div class="form-group">
                <label for="subject" class="col-sm-2 control-label" style="text-align: center;">제목</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="subject" id="subject">
                </div>
            </div>
            
            <!-- summernote부분 -->
            <textarea id="summernote" name="content" class="content"></textarea>
            
            <!-- 목록으로 돌아가기 버튼 -->
            <button class="btn btn-default" type="button">목록</button>
            <div class="pull-right">
                
                <!-- 수정 버튼 -->
                <button class="btn btn-primary" type="button" id="modify">수정</button>
                
                <!-- 취소버튼 -->
                <button class="btn btn-default" type="button">취소</button>
            </div>
        </form>
    </div>
</body>

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
<script type="text/javascript">
$(document).ready(function(){
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    $(document).ajaxSend(function(e, xhr, options) {
        xhr.setRequestHeader(header, token);
    });
});
/* 썸머노트 */
$(document).ready(function(){
	$('#summernote').summernote({
	    tabsize: 2,
	    height: 400,
	    minHeight : null,
	    maxHeight : null,
	    placeholder: '최대 ~~~자까지 쓸 수 있습니다.',
	    lang : "ko-KR",
	    toolbar: [
		    // [groupName, [list of button]]
		    ['fontname', ['fontname']],
		    ['fontsize', ['fontsize']],
		    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
		    ['color', ['forecolor','color']],
		    ['table', ['table']],
		    ['para', ['ul', 'ol', 'paragraph']],
		    ['height', ['height']],
		    ['insert',['picture','link','video']],
		    ['view', ['fullscreen', 'help']]
		  ],
		fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
		fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
	  
	});
	
		$.ajax({
			type : 'post',
			url : '/FoodFighter/event/geteventBoardtView',
			data : 'seq_event='+$('#seq_event').val(),
			dataType : 'json',
			success : function(data){
				//alert(JSON.stringify(data));
				
				$('#subject').val(data.eventDTO.subject);
				$("#summernote").summernote('code',data.eventDTO.content);
			},
			error: function(err){
				console.log(err);
			}
		});
	
	
});

$('#modify').click(function(){
	if ($('#subject').val() == ''){
		alert("제목을 입력해주세요");
	}else if ($('#summernote').val() == ''){
		alert("내용을 입력해주세요");
		
		}else{
			$.ajax({
			type : 'post',
			url : '/FoodFighter/event/eventBoardModify',
			data : $('#ModifyForm').serialize(),
			success : function(){
				
				alert("글수정 완료");
				location.href = '/FoodFighter/event/eventList?pg='+$('#pg').val();
			},
			error: function(err){
				console.log(err);
			}
			
		});
	}
});


</script>
</body>
</html>