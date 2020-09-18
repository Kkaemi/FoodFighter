<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<form id="headerForm" name="headerForm" method="post" action="../review/getSearchList">
<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
	<div id="header-container">
	  <a class="header-logo" href="/FoodFighter"><img src="../resources/img/logo.png" width="250px;" height="55px;" align="left" style="margin-top: 10px; margin-left: 200px;"></a>
	     <ul id="header-menu">
		      <li class="header-items">
		  		<img src="../resources/img/search.png" class="header_searchIcon" width="30" height="30" align="center"> 
		   		<input type="search" class="header_searchInput" placeholder="&emsp;&emsp;식당 또는 음식 검색" id ="keyword" name="keyword" autocomplete="on" maxlength="50" >
		   		<button size="10" id="header_searchBtn">검색</button>
		      </li>
		       <li class="nav-item">
		           <a class="nav-link js-scroll active" href="/FoodFighter">Home</a>
		       </li>
		       <!-- <li class="nav-item">
	         	  <a class="nav-link js-scroll" href="/FoodFighter/review/reviewNonSearchList">리뷰 리스트</a>
	          </li> -->
	          <li class="nav-item">
	           <a class="nav-link js-scroll" href="/FoodFighter/community/communityMain">커뮤니티</a>
	          </li>
	          <li class="nav-item">
	            <a class="nav-link js-scroll" href="/FoodFighter/event/eventList">이벤트</a>
	          </li>
	          <li class="nav-item">
	         	  <a class="nav-link js-scroll" href="/FoodFighter/community/communityNotice">공지사항</a>
	          </li>
	          <li class="nav-item">
	            <a class="nav-link js-scroll">
		           <img src="/FoodFighter/resources/img/member.png" id="headerUser" class="header_searchIcon" width="30" height="30" align="center">
		        </a>
     	     </li>
	   	</ul>
	</div>
<!-- usermenu -->
    <div class="modal headUser-menu" id="headUser-menu" role="dialog">
  	  <div class="tri"></div>
  	  <c:if test="${memId == null}">
  	  	  <p>로그인 또는 회원가입을 하시면 <br> 더 많은 서비스를 <br>이용하실 수 있습니다.</p>
  		  <hr>
	  	  <button type="button" id="loginBtn" class="headUserMenu-Btn"  onclick="location.href='/FoodFighter/login/loginForm'" >로그인</button>
	  	  <button type="button" id="signupBtn" class="headUserMenu-Btn" onclick="location.href='/FoodFighter/member/signupChoice'" >회원가입</button>
  	  </c:if>
  	  <c:if test="${memId == 'admin@admin.com'}">
  		  <p>관리자로<br> 로그인 하셨습니다. </p>
  		  <hr>
	  	  <button type="button" id="adminBtn" class="headUserMenu-Btn"  onclick="location.href='/FoodFighter/admin/adminMain'" >관리자페이지</button>
	  	  <button type="button" id="logoutBtn" class="headUserMenu-Btn"  onclick="location.href='/FoodFighter/login/logout'">로그아웃</button>
  	  </c:if>
  	  <c:if test="${memId != null && sessionScope.memId != 'admin@admin.com'}">
  		  <p>맛집을 찾아보고 <br> 후기를 남겨보세요.</p>
  		  <hr>
	  	  <button type="button" id="mypageBtn" class="headUserMenu-Btn"  onclick="location.href='/FoodFighter/mypage/mypageMain'" >마이페이지</button>
	  	  <button type="button" id="logoutBtn" class="headUserMenu-Btn"  onclick="location.href='/FoodFighter/login/logout'">로그아웃</button>
  	  </c:if>
    </div>

</form>

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
            <button class="btn btn-default" type="button" onclick="location.href='eventList'">목록</button>
            <div class="pull-right">
                
                <!-- 취소버튼 -->
                <button class="btn btn-default" type="button" onclick="location.href='eventList'">취소</button>
                
                <!-- 글쓰기 버튼 -->
                <button class="btn btn-primary" type="button" id="write">글쓰기</button>
            </div>
        </form>
    </div>
</body>
<script src="/FoodFighter/resources/js/review/keyword.js"></script>
<script>
$('#headerUser').click(function(){
	$('#headUser-menu').modal();
});

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