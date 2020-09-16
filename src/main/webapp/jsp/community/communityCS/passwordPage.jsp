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
    <title>QnA비밀번호</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/FoodFighter/resources/css/community/communityCSHeader.css">
    <link rel="stylesheet" href="/FoodFighter/resources/css/community/communityCSBoard.css">
    <link rel="stylesheet" href="/FoodFighter/resources/css/community/sidenav.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
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
            <h2 class="text-center">QnA</h2>
              <p class="text-center">비밀번호를 입력해 주세요</p>      
          </div>
    </div>

    <!-- 페이지 본문 -->
    <div class="page-body">
	    <form id="passwordForm" name="passwordForm">
		  	<input type="hidden" id="seq" name="seq" value="${seq }">
		  	<input type="hidden" id="pg" name="pg" value="${pg }">
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
		                        <input type="password" name="password" id="password">
		                    </div>
		                </td>
		            </tr>
		        </tbody>
		    </table>
		    <!-- 버튼 목록 -->
		    <div class="btn-group">
		        <a href="#" class="myButton" id="passwordCheckBtn">확인</a>
		        <a href="#" class="myButton" id="cancelBtn">취소</a>
		    </div>
	    </form>
    </div>
</body>
<script type="text/javascript" src="/FoodFighter/resources/js/community/sidenav.js"></script>
<script src="/FoodFighter/resources/js/review/keyword.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
	    
		var token = $("meta[name='_csrf']").attr("content");
	    var header = $("meta[name='_csrf_header']").attr("content");
	    $(document).ajaxSend(function(e, xhr, options) {
	        xhr.setRequestHeader(header, token);
	    });
	    
	    if ('${nickname}' == '') {	    	
	    	location.href='/FoodFighter/login/loginForm';
	    	alert('먼저 로그인해 주세요');
	    }
	    
	    if ('${nickname}' === '관리자') {
	    	location.href='qnaView?seq='+$('#seq').val()+'&pg='+$('#pg').val();
	    }
	    
	});
	
	$('#passwordCheckBtn').click(function() {
		
		$.ajax({
			
			type : 'post',
			url : '/FoodFighter/community/passwordCheck',
			data : $('#passwordForm').serialize(),
			dataType : 'json',
			success : function(data) {
				
				if ($.isEmptyObject(data)) {
					location.href='/FoodFighter/community/qnaPasswordWrong?seq='+$('#seq').val()+'&pg='+$('#pg').val();;
				} else {					
					location.href='/FoodFighter/community/qnaView?seq='+data.seq+'&pg='+data.pg;					
				}
				
			},
			error : function(err) {
				console.log(err);
			}
			
		});
		
	});
	
	$('#cancelBtn').click(function() {
		
		location.href='qna?pg='+$('#pg').val();
		
	});
</script>
</html>