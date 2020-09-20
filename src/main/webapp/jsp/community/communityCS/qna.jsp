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
    <title>QnA게시판</title>
    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="/FoodFighter/resources/css/community/normalize.css">
    <link rel="stylesheet" href="/FoodFighter/resources/css/community/communityCSBoard.css">
    <link rel="stylesheet" href="/FoodFighter/resources/css/community/communityCSHeader.css">
    <link rel="stylesheet" href="/FoodFighter/resources/css/community/sidenav.css">
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
    <div id="mySidenav" class="sidenav" style="margin-top: 50px;">
	  	<a href="/FoodFighter/community/communityNotice"><span class="glyphicon glyphicon-exclamation-sign"></span>&emsp;공지사항</a>
	    <a href="/FoodFighter/community/communityBoard"><span class="glyphicon glyphicon-list"></span>&emsp;게시판</a>
	    <a href="/FoodFighter/community/communityRank"><span class="glyphicon glyphicon-star"></span>&emsp;랭킹</a>
	    <a href="/FoodFighter/community/csCenter"><span class="glyphicon glyphicon-question-sign"></span>&emsp;고객센터</a>
    </div>
    
    <!-- 제목부분 -->
    <div class="container">
        <div class="page-header">
            <h2 class="text-center">QnA</h2>
            <p class="text-center">페이지 관리자에게 질문을 올려주세요</p>
        </div>
    </div>
    <!-- 게시판 부분 -->
    <input type="hidden" id="pg" value="${pg }">
    <div class="page-body">
        <table class="table table-hover" id="qnaBoardListTable">
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
            </tbody>
        </table>

        <div class="content-wrapper">
        	<!-- 페이징처리 들어가는 곳 -->
            <div class="paging">
            </div>
            <div class="listBtnBox">
                <a href="javascript:void(0);" onclick="location.href='qna?pg=1'">
                    <span class="plain-btn">처음 목록</span></a>
                <a href="qnaWriteForm">
                    <span class="plain-btn">글쓰기</span></a>
            </div>
        </div>
        <div class="list-search">
        <input type="hidden" name="pg" value="1">
            <fieldset>
                <select name="search_type" id="search_type">
                    <option value="subject">제목</option>
                    <option value="content">본문</option>
                    <option value="nickname">닉네임</option>
                </select>
                <input type="text" placeholder="keyword" id="search_keyword">
                <input type="button" value="검색" class="plain-btn" id="searchBtn">
            </fieldset>
        </div>
    </div>
</body>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/FoodFighter/resources/js/community/sidenav.js"></script>
<script src="/FoodFighter/resources/js/review/keyword.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		var token = $("meta[name='_csrf']").attr("content");
	    var header = $("meta[name='_csrf_header']").attr("content");
	    $(document).ajaxSend(function(e, xhr, options) {
	        xhr.setRequestHeader(header, token);
	    });
	    
		$.ajax({
			type : 'post',
			url : '/FoodFighter/community/getQnaList',
			data : 'pg='+$('#pg').val(),
			dataType : 'json',
			success : function(data) {
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
						
					})).appendTo($('#qnaBoardListTable'));
					
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
					
				}); // <- each end
				
				// 페이징 처리
				$('.paging').html(data.boardPaging.pagingHTML);
				
				$('#qnaBoardListTable').on('click', '#subjectA', function() {
				
					// alert($(this).prop('
					
					let seq = $(this).attr('class');
					let pg = data.pg;
					location.href = '/FoodFighter/community/passwordPage?seq='+seq+'&pg='+pg;
				
				});
			},
			error : function(err) {
				console.log(err);
			}
		});
	});
	
	$('#searchBtn').click(function(event, str) {
		
		if ($('#search_keyword').val() == '') {
			alert("검색어를 입력해 주세요");
		} else {
			
			$('#boardPagingDiv').empty();
			
			$.ajax({
			
				type : 'post',
				url : '/FoodFighter/community/getBoardSearchList',
				data : {
				
					'pg' : $('input[name=pg]').val(),
					'search_type' : $('#search_type').val(),
					'search_keyword' : $('#search_keyword').val()
					
				},
				dataType : 'json',
				success : function(data) {
				
					$('#qnaBoardListTable tr:gt(0)').remove();
				
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
							
						})).appendTo($('#qnaBoardListTable'));
					});
					
					$('.paging').html(data.boardPaging.pagingHTML);
					
				},
				error : function(err) {
					console.log(err);
				}
			});
		}
	});
	
	function boardPaging(pg){
		
		let search_keyword = document.getElementById("search_keyword").value;
		
		if(search_keyword == ""){
			
			location.href="qna?pg="+pg;
			
		} else {
			
			$('input[name=pg]').val();
			$('#searchBtn').trigger('click', 'continue');
			
		}
		
	}
</script>
</html>