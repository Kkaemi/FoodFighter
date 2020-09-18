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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta id="_csrf" name="_csrf" content="${_csrf.token}" />
	<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />
    <title>QnA게시글 보기</title>
    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="/FoodFighter/resources/css/community/normalize.css">
    <link rel="stylesheet" href="/FoodFighter/resources/css/community/communityCSBoard.css">
    <link rel="stylesheet" href="/FoodFighter/resources/css/community/communityCSHeader.css">
    <link rel="stylesheet" href="/FoodFighter/resources/css/community/sidenav.css">
    <link rel="stylesheet" href="/FoodFighter/resources/css/community/qnaView.css">
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
        
    </div>

    <div class="page-body">
        <!-- 페이지 본문 -->
        <form name="qnaViewForm">
	        <input type="hidden" name="seq" id="seq" value="${seq }">
			<input type="hidden" name="pg" id="pg" value="${pg }">
	        <table>
	            <thead>
	                <tr>
	                    <th>
	                    	<span id="subjectSpan"></span>
	                    </th>
	                </tr>
	            </thead>
	            <tbody>
	                <tr>
	                    <td>
	                        작성자 : <span id="nicknameSpan" style="font-weight: bold;"></span>&ensp;
	                        조회수 : <span id="hitSpan" style="font-weight: bold;"></span>
	                    </td>
	                </tr>
	                <tr>
	                    <!-- 관리자 글 내용 -->
	                    <td>
	                    	<span id="contentSpan"></span>
	                    </td>
	                </tr>
	            </tbody>
	        </table>
	
	        <!-- 버튼그룹 -->
	        <div class="btn-group">
	            <span class="pull-right">
	                <a href="javascript:void(0);" class="myButton" onclick="location.href='qna?pg=${pg}'">목록보기</a>
	            </span>
	            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	        </div>
        </form>

        <!-- 내가 쓴 글과 관리자 답글을 보여줌 -->
        <table style="margin-top: 5%;" id="qnaViewListTable">
            <colgroup>
                <col width="100">
                <col width="*">
                <col width="110">
                <col width="110">
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
            </tbody>
        </table>

    <!-- page-body끝 -->
    </div>

</body>
<script type="text/javascript" src="/FoodFighter/resources/js/community/sidenav.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		var token = $("meta[name='_csrf']").attr("content");
	    var header = $("meta[name='_csrf_header']").attr("content");
	    $(document).ajaxSend(function(e, xhr, options) {
	        xhr.setRequestHeader(header, token);
	    });
		
		$.ajax({
			
			type : 'post',
			url : '/FoodFighter/community/getQnaView',
			data : 'seq='+$('#seq').val(),
			dataType : 'json',
			success : function(data) {
				
				if (data.memberDTO == null) {
					
					alert('올바른 접근이 아닙니다!!!');
					location.href='qna';
					return;
					
				}
				
				$('#subjectSpan').text(data.qnaboardDTO.subject);
				$('#nicknameSpan').text(data.qnaboardDTO.nickname);
				$('#hitSpan').text(data.qnaboardDTO.hit);
				$('#contentSpan').html(data.qnaboardDTO.content);
				
				$.each(data.list, function(index, items) {
					$('<tr/>').append($('<td/>',{
					
						align : 'center',
						text : items.seq
						
					})).append($('<td/>',{
					}).append($('<a/>',{
					
						id : 'subjectA',
						href : '#',
						align : 'center',
						text : items.subject,
						class : items.seq
					
					}))).append($('<td/>',{
					
						align : 'center',
						text : items.nickname
						
					})).append($('<td/>',{
					
						align : 'center',
						text : items.logtime
						
					})).append($('<td/>',{
					
						align : 'center',
						text : items.hit
						
					})).appendTo($('#qnaViewListTable'));
					
					// 답글
					for (i=0; i<=items.lev; i++) {
						$('.' + items.seq).before('&emsp;');
					}
					
					if (items.pseq != 0) {
					
						$('.' + items.seq).before($('<img/>',{
							src : '/FoodFighter/resources/img/community/reply_icon.png',
							width : 10,
							height : 10
						}));
					
					}
					
					$('#qnaViewListTable').on('click', '#subjectA', function() {
						
						let seq = $(this).attr('class');
						let pg = $('#pg').val();
						location.href = '/FoodFighter/community/passwordPage?seq='+seq+'&pg='+pg;
					
					});
					
				});
				
				if (data.memberDTO.nickname != '관리자' && data.memberDTO.email != data.qnaboardDTO.email) return;
				
				$('.btn-group').append($('<a/>', {
					
					href : 'javascript:void(0);',
					class : 'myButton',
					onclick : 'mode(1)',
					style : 'margin-right: 5px;',
					text : '수정'
					
				})).append($('<a/>', {
					
					href : 'javascript:void(0);',
					class : 'myButton',
					onclick : 'mode(2)',
					style : 'margin-right: 5px;',
					text : '삭제'
					
				}));
				
				if (data.memberDTO.nickname != '관리자') return;
				
				$('.btn-group').append($('<a/>', {
					
					href : 'javascript:void(0);',
					class : 'myButton',
					onclick : 'mode(3)',
					text : '답변'
					
				}));
				
			},/* <- success end */
			error : function(err) {
				console.log(err);
			}
			
		});
		
	});
	
	function mode(num) {
		
		switch (num) {
		
		case 1:
			document.qnaViewForm.method = 'post';
			document.qnaViewForm.action = 'qnaModifyForm';
			document.qnaViewForm.submit();
			break;
		case 2:
			if (!(confirm("삭제하시겠습니까?"))) return;
			document.qnaViewForm.method = 'post';
			document.qnaViewForm.action = 'qnaDelete';
			document.qnaViewForm.submit();
			break;
		case 3:
			document.qnaViewForm.method = 'post';
			document.qnaViewForm.action = 'qnaReplyForm';
			document.qnaViewForm.submit();
			break;
			
		}
		
	}
</script>
<script type="text/javascript">
</script>
</html>