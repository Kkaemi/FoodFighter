<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
 <meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />
    <meta charset="UTF-8">
    <title>이벤트게시글</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
    <link rel="stylesheet" href="/FoodFighter/resources/css/event/eventBoardWrite.css">
    <link rel="stylesheet" href="/FoodFighter/resources/css/event/headerCss.css">
    <link rel="stylesheet" href="/FoodFighter/resources/css/event/sidenav.css">
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
            <h2 class="text-center">이벤트 글쓰기</h2>
              <p class="text-center">...</p>      
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
            <textarea id="summernote" name="editordata" class="content"></textarea>
            
            <!-- 목록으로 돌아가기 버튼 -->
            <button class="btn btn-default" type="button">목록</button>
            <div class="pull-right">
                
                <!-- 취소버튼 -->
                <button class="btn btn-default" type="button">취소</button>
                
                <!-- 글쓰기 버튼 -->
                <button class="btn btn-primary" type="button" id="write">글쓰기</button>
            </div>
        </form>
    </div>
</body>
<script>
$(document).ready(function(){
	var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    $(document).ajaxSend(function(e, xhr, options) {
        xhr.setRequestHeader(header, token);
    });
    
	$('#summernote').summernote({
	    tabsize: 2,
	    height: 450,
	    minHeight : null,
	    maxHeight : null,
	    placeholder: '최대 2084자까지 쓸 수 있습니다.',
	    callbacks: {
			onImageUpload: function(files, editor, welEditable) {
					eventWriteImage(files[0], editor, welEditable);
	        }
		},
	    lang : "ko-KR",
	    toolbar: [
				    ['fontname', ['fontname']],
				    ['fontsize', ['fontsize']],
				    ['style', ['bold', 'italic', 'underline']],
				    ['insert',['picture','link']],
				    ['view', ['fullscreen', 'help']]
		  		],
		fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
	  });
	  
	 function eventWriteImage(file, editor, welEditable) {
    	let data = new FormData();
    	data.append('file', file);
      	$.ajax({
        	data : data,
        	type : "POST",
        	url : 'eventWriteImage',
        	cache : false,
        	contentType : false,
        	enctype : 'multipart/form-data',
        	processData : false,
        	success: function(data) {
        		if(data == "noimage"){
	        		alert("이미지 파일만 업로드 가능합니다.");
		        } else{
		        	$("#summernote").summernote('insertImage',data);
		       	}
       		},
	        error : function(err){
		        alert("실패"+JSON.stringify(err));
	        }
		});
	}
}); 

$("div.note-editable").on('drop',function(e){
    for(i=0; i< e.originalEvent.dataTransfer.files.length; i++){
    	uploadSummernoteImageFile(e.originalEvent.dataTransfer.files[i],$("#summernote")[0]);
    }
   e.preventDefault();
});
$('#write').click(function(){
	if ($('#subject').val() == ''){
		alert("제목을 입력해주세요");
	}else if ($('#summernote').val() == ''){
		alert("내용을 입력해주세요");
	}else {
		$.ajax({
			type: 'post',
			url: '/FoodFighter/event/eventWrite',
			data: {'subject': $('#subject').val(),
				   'content': $('.content').val()},
			success: function(){
				alert('글쓰기 완료!!');
				location.href = '/FoodFighter/event/eventList';
			},
			error: function(err){
				console.log(err);
			}
		});
		
	}
});


</script>

</html>