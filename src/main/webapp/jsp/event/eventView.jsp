<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />
<title>이벤트 게시글</title>
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
<script type="text/javascript" src="/FoodFighter/resources/js/community/communityMainJs/sidebarJs.js"></script> <!-- 사이드바JS -->
<script src="https://kit.fontawesome.com/a076d05399.js"></script> <!-- 사이드바 아이콘 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> <!-- 부트스트랩 JS -->
</head>
<body>
<!-- 헤더 -->
<form id="headerForm" name="headerForm" method="post" action="../review/getSearchList">
<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">  
<!--================ Header ================-->
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


  <header>커뮤니티</header>
  <a href="#">
    <i class="far fa-comments"></i>
    <span>게시판</span>
  </a>
  <a href="#">
    <i class="fas fa-link"></i>
    <span>랭킹</span>
  </a>
  <a href="#">
    <i class="far fa-question-circle"></i>
    <span>고객센터</span>
  </a>
</div>
<!-- 본문 -->
<form name="eventViewForm">
<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
<input type="hidden" name="seq_event"  id="seq_event" value="${seq_event}">
<input type="hidden" name="pg"  value="${pg}">

<div class="container" style="margin-top : 65px;">
	<div class="page-header">
    	<h2 class="text-center">이벤트 체험단</h2>      
   	</div>
</div>
<div class="page-body" style = "z-index : 1;">
	<div class = "view-upper clearfix">
		<div class = "area_r" id="eventViewSpan">
			<a href = "#" onclick="mode(1)">
				<span class = "plain-btn">수정</span></a>
				
			<a href = "#" class="delete" onclick="">
				<span class = "plain-btn" style = "color : red;">삭제</span></a>
		</div>
	</div>
	<div class = "view_stat">
		<div class ="mphoto">
			<img src = "/FoodFighter/resources/img/community/mainImg/user.png">
		</div>
		<div class = "info">
			<h1>
				<span class = "subject" id="subjectSpan"> </span>
			</h1>
			<p>
				<span class = "nickname" id="nicknameSpan"></span>
				
				<span class = "date" id="dateSpan"></span>
			</p>
		</div>
	</div>
	<div class = "viewbox">
	
		<div class = "content" id="contentSpan">
			<p></p>
			<p></p>
			<p></p>
			<div class ="attach"></div>
		</div>
		</div>
		<div class ="cont_recommendation clearfix">
			<div class = "area_l">
				<a href = "#"><span class = "plain-btn">댓글</span></a>
		</div>
		
		
	<!-- 댓글 -->
	<div class = "cont_comment" id = "cont_comment">
		<ul class = "comment_list">
			<li class = "comment_section">
			
				<!-- 원댓 영역 -->
				<div class ="pic"><img src = "/FoodFighter/resources/img/community/boardImg/d.jpg"></div>
				<div class ="info">
					<div class ="comment_post">
						<div class = "data">
							<span class = "txt_name">가성비트캠프</span>
						</div>
						<span class ="txt_date">08.03 17:50</span>
						<div class ="comment_cont">
							신논현 근처에 맛집 없어요. 걍 아무거나 드세요
						</div>
					</div>
				</div>
				<div class ="option">
					<div class ="dropdown" style ="visibility: hidden;">
						<button type = "button" data-toggle = "dropdown" class ="dropdown-toggle">
							<span class ="ico_bbs ico_more"></span>
						</button>
						<ul class = "dropdown-menu">
							<li><a>수정</a></li>
							<li><a>삭제</a></li>
						</ul>
					</div>
					
					
					<div class = "comment_reply" id = "comment_reply">
						<a href ="javascript:" id ="cmt_reply">답글</a>
					</div>
				</div> <!-- 원댓 영역 (div option) -->
			<!-- </li>
			<li class = "comment_section">
				원댓 영역
				<div class ="pic"></div>
				<div class ="info">
					<div class = "data">
						<span class = "txt_name">집에갈거야</span>
					</div>
					<span class ="txt_date">08.05 20:50</span>
					<div class ="comment_cont">
						집에 가고 싶네
					</div>
				</div>
				<div class ="option">
					<div class ="dropdown">
						<button type = "button" data-toggle = "dropdown" class ="dropdown-toggle">
							<span class ="ico_bbs ico_more"></span>
						</button>
						<ul class = "dropdown-menu">
							<li><a>수정</a></li>
							<li><a>삭제</a></li>
						</ul>
					</div>
					<div class = "comment_reply" id = "comment_reply">
						<a href ="javascript:" id ="cmt_reply">답글</a>
					</div>
				</div> 원댓 영역 (div option)
				대댓 영역
				<div class = "reply_section">
					<div class ="pic"></div>
					<div class ="info">
						<div class = "data">
							<span class = "txt_name">김비트</span>
						</div>
						<span class ="txt_date">08.08 12:50</span>
						<div class ="comment_cont">
							너 집에 못가
						</div>
					</div>
					<div class ="option">
						<div class ="dropdown">
							<button type = "button" data-toggle = "dropdown" class ="dropdown-toggle">
								<span class ="ico_bbs ico_more"></span>
							</button>
							<ul class = "dropdown-menu">
								<li><a>수정</a></li>
								<li><a>삭제</a></li>
							</ul>
						</div>
						<div class = "comment_reply" id = "comment_reply">
							<a href ="javascript:" id ="cmt_reply">답글</a>
						</div>
					</div> 대댓 영역
					대댓 글쓰는 칸
					<div class = "comment_replyWrite">
						<div class ="inner_text_write">
							<div class ="box_textarea">
							<textarea placeholder="인터넷은 우리가 함께 만들어가는 소중한 공간입니다. 댓글 작성 시 타인에 대한 배려와 책임을 담아주세요"	
							maxlength="600" style ="height : 86px;"></textarea> 모달로 경고 띄우기
							</div>
							<div class = "wrap_menu">
								<div class = "area_l">
									<button class = "btnTab">
										<span class ="ico_bbs ico_lock" id ="lock">비밀글</span>
									</button>
								</div>
								<div class = "area_r">
									<span class ="num_text">
										<span class ="sr_only">글자수</span>
										<span class ="num_count">0</span> / <span class ="sr_only">총 글자 개수</span> 600
									</span>
									<div class ="btn_group">
										<a href = "#">
										<span class = "plain-btn" id = "commentWrite" style ="background-color: red; color: white;">등록</span></a>
									</div>
								</div>
							</div>
						</div>
					</div> 대댓 글쓰는 칸
				</div> 대댓 영역
				<div class = "reply_section">
					<div class ="pic"></div>
					<div class ="info">
						<div class = "data">
							<span class = "txt_name">김비트</span>
						</div>
						<span class ="txt_date">08.08 12:50</span>
						<div class ="comment_cont">
							나도 몰라 시발
						</div>
					</div>
					<div class ="option">
						<div class ="dropdown">
							<button type = "button" data-toggle = "dropdown" class ="dropdown-toggle">
								<span class ="ico_bbs ico_more"></span>
							</button>
							<ul class = "dropdown-menu">
								<li><a>수정</a></li>
								<li><a>삭제</a></li>
							</ul>
						</div>
						<div class = "comment_reply" id = "comment_reply">
							<a href ="javascript:" id ="cmt_reply">답글</a>
						</div>
					</div>
				</div>
			</li>
			<li class = "comment_section">
				<div class ="pic"><img src = "/fighter/resources/img/community/boardImg/d.jpg"></div>
				<div class ="info">
					<div class ="comment_post">
						<div class = "data">
							<span class = "txt_name">가성비트캠프</span>
						</div>
						<span class ="txt_date">08.03 17:50</span>
						<div class ="comment_cont">
							짜증난다 이거 왜 하냐?
						</div>
					</div>
				</div>
				<div class ="option">
					<div class ="dropdown">
						<button type = "button" data-toggle = "dropdown" class ="dropdown-toggle">
							<span class ="ico_bbs ico_more"></span>
						</button>
						<ul class = "dropdown-menu">
							<li><a>수정</a></li>
							<li><a>삭제</a></li>
						</ul>
					</div>
					<div class = "comment_reply" id = "comment_reply">
						<a href ="javascript:" id ="cmt_reply">답글</a>
					</div>
				</div>
				<div class = "reply_section">
					<div class ="pic"></div>
					<div class ="info">
						<div class = "data">
							<span class = "txt_name">김비트</span>
						</div>
						<span class ="txt_date">08.08 12:50</span>
						<div class ="comment_cont">
							나도 몰라 시발
						</div>
					</div>
					<div class ="option">
						<div class ="dropdown">
							<button type = "button" data-toggle = "dropdown" class ="dropdown-toggle">
								<span class ="ico_bbs ico_more"></span>
							</button>
							<ul class = "dropdown-menu">
								<li><a>수정</a></li>
								<li><a>삭제</a></li>
							</ul>
						</div>
						<div class = "comment_reply" id = "comment_reply">
							<a href ="javascript:" id ="cmt_reply">답글</a>
						</div>
					</div>
				</div>
			</li>
		</ul>
		<div class ="simple_paging">
			<a href ="#" title = "prev">
				<span><</span>
			</a>
			<a href ="#" title = "1페이지">
			<span>1</span>
			</a>
			<a href ="#" title = "2페이지">
				<span>2</span>
			</a>
			<a class = "now" href ="#" title = "3페이지">
				<span>3</span>
			</a>
			<a href ="#" title = "4페이지">
				<span>4</span>
			</a>
			<a href ="#" title = "5페이지">
				<span>5</span>
			</a>
			<a href ="#" title = "next">
				<span>></span>
			</a>
		</div>
		<div class ="comment_write">
			<div class ="inner_text_write">
				<div class ="box_textarea">
					<textarea placeholder="인터넷은 우리가 함께 만들어가는 소중한 공간입니다. 댓글 작성 시 타인에 대한 배려와 책임을 담아주세요"	
							maxlength="600" style ="height : 86px;"></textarea>모달로 경고 띄우기
				</div>
					<div class = "wrap_menu">
						<div class = "area_l">
							<button class = "btnTab">
								<span class ="ico_bbs ico_photo">이미지업로드</span>
							</button>
						</div>
						<div class = "area_r">
							<span class ="num_text">
								<span class ="sr_only">글자수</span>
								<span class ="num_count">0</span> / <span class ="sr_only">총 글자 개수</span> 600
							</span>
							<button class = "btnTab btn_item">
								<span class ="ico_bbs ico_lock">비밀글</span>
							</button>
							<div class ="btn_group">
								<a href = "#">
								<span class = "plain-btn" style ="background-color: red; color: white;">등록</span></a>
							</div>
						</div>
					</div>
				</div>
			</div> -->
			
			
			
			<div class ="clear"></div>
		</div>
	</div>
	<div class = "view-upper clearfix">
		<div class = "area_l">
			<a href = "/FoodFighter/event/eventList">
				<span class = "plain-btn">목록</span></a>
		</div>
		<span id="eventViewSpan" >
		<div class = "area_r">
		 <c:if test="${memberDTO.name == 'admin'}">
			<a href = "#">
				<span class = "d-btn"  onclick="mode(1)">수정</span></a>
				<a href = "#">
				<span class = "deleteBtn" onclick="mode(2)" style = "color : red;">삭제</span></a>
		</c:if>
		</div>
		</span>
	</div>
</div>
</form>
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
</body>
<script type="text/javascript">
$(document).ready(function(){
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    $(document).ajaxSend(function(e, xhr, options) {
        xhr.setRequestHeader(header, token);
    });
});

function mode(num){
	if(num==1){//글수정
		document.eventViewForm.method = 'post';
		document.eventViewForm.action = 'eventModifyForm';
		document.eventViewForm.submit();
		
	 }else if(num==2){//글삭제
		if(confirm("삭제하시겠습니까?")){
		document.eventViewForm.method = 'post';
		document.eventViewForm.action = 'eventBoardDelete';
		document.eventViewForm.submit();
		
		}
	}
}

$(document).ready(function(){
	$.ajax({
		type : 'post',
		url : '/FoodFighter/event/geteventBoardtView',
		//다른건 필요없고 seq_event값만 가져가면 된다.(한사람의 글만 뽑아오면 된다.)
		
		data : 'seq_event='+$('#seq_event').val(),
		dataType : 'json',
		success : function(data){
			//alert(JSON.stringify(data));
			
			$('#seq_eventSpan').text(data.eventDTO.seq_event);
			$('#subjectSpan').text(data.eventDTO.subject);
			$('#nickname').text(data.eventDTO.nickname);
			$('#contentSpan').html(data.eventDTO.content);
			
			 if(data.memId==data.eventDTO.email)
				$('#eventViewSpan').show();
			else
				$('#eventViewSpan').hide(); 
				
		},
		error: function(err){
			console.log(err);
		}
	});
	
});

$('.comment_reply').on('click', '#cmt_reply', function(){
	let reply = $('#cmt_reply');
	if(reply.text() == '답글') {
		reply.text('접기');
		let comment_replyWrite = $('<div class ="comment_replyWrite"/>'); 
		let inner_text_write = $('<div class = "inner_text_write"/>');
		let box_textarea = $('<div class = "box_textarea"/>'); 
		let reply_content = $('<textarea id ="reply_content" placeholder="인터넷은 우리가 함께 만들어가는 소중한 공간입니다. 댓글 작성 시 타인에 대한 배려와 책임을 담아주세요" maxlength="600" style ="height : 86px;"></textarea>');
		let wrap_menu = $('<div class = "wrap_menu"/>');
		let area_l = $('<div class = "area_l"/>');
		let btnTab = $('<button class = "btnTab"/>');
		let area_r = $('<div class = "area_r"/>');
		let num_text = $('<span class ="num_text"/>');

		box_textarea.append(reply_content);
		
		area_l.append(btnTab.append($('<span class ="ico_bbs ico_lock" id = "lock">비밀글</span>',{}))).appendTo(wrap_menu);
		area_r.append(num_text.append($('<span class = "sr_only">글자수</span>'),{}).append($('<span class = "num_count">0</span>').append(' / ')).append($('<span class= "sr_only">총 글자 개수</span>')).append(' 600')).appendTo(wrap_menu);

		inner_text_write.append(box_textarea).append(wrap_menu);
		comment_replyWrite.append(inner_text_write);
		comment_replyWrite.appendTo($('.comment_section'));
	} else {
		reply.text('답글');
		$('.comment_replyWrite').remove();
	}
});
/* 댓글 쓰는 창에 있는 비밀댓글버튼 */
$('.comment_write .btnTab span#lock').on('click', function(){
	if($('.comment_write .btnTab span#lock').hasClass('ico_lock')){
		$('.comment_write .btnTab span#lock').removeClass('ico_lock');
		$('.comment_write .btnTab span#lock').addClass('ico_lock_on');
	}else {
		$('.comment_write .btnTab span#lock').removeClass('ico_lock_on');
		$('.comment_write .btnTab span#lock').addClass('ico_lock');
	}
});

/* 동적으로 생기는 대댓 쓰는 창에 있는 비밀댓글버튼 */
$(document).on('click', '.comment_replyWrite .btnTab span#lock', function(){
	if($('.comment_replyWrite .btnTab span#lock').hasClass('ico_lock')){
		$('.comment_replyWrite .btnTab span#lock').removeClass('ico_lock');
		$('.comment_replyWrite .btnTab span#lock').addClass('ico_lock_on');
	}else {
		$('.comment_replyWrite .btnTab span#lock').removeClass('ico_lock_on');
		$('.comment_replyWrite .btnTab span#lock').addClass('ico_lock');
	}
});

</script>
</html>