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
<script src="https://kit.fontawesome.com/a076d05399.js"></script> <!-- 사이드바 아이콘 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> <!-- 부트스트랩 JS -->
</head>
<body>

<!-- 헤더 --> 
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
				
				<span class = "hit" id="hitSpan"></span>		
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
		
		<div class ="cont_recommendation clearfix">
		<div class = "area_l">
			<a href = "#"><span class = "plain-btn">댓글</span></a>
		</div>
	</div>
<!-- 댓글 -->
	<div class = "cont_comment" id = "cont_comment">
		<ul class = "comment_list">
		</ul>
		
	<!-- 댓글쓰기 영역 -->
		<div class ="comment_write">
			<div class ="inner_text_write">
				<div class ="box_textarea">
					<textarea placeholder="인터넷은 우리가 함께 만들어가는 소중한 공간입니다. 댓글 작성 시 타인에 대한 배려와 책임을 담아주세요"	
					id = "cwrite_place" maxlength="600" style ="height : 86px;"></textarea>
				</div>
				<div class = "wrap_menu">
					<div class = "area_l">
						<button class = "btnTab">
							<span class ="ico_bbs ico_lock" id = "lock">비밀글</span>
						</button>
					</div>
					<div class = "area_r">
						<span class ="num_text">
							<span class ="sr_only">글자수</span>
							<span class ="num_count">0</span> / <span class ="sr_only">총 글자 개수</span> 600
						</span>
						<div class ="btn_group">
							<button class = "plain-btn" id = "cwrite" style ="background-color: red; color: white;">등록</button>
						</div>
					</div>
				</div>
			</div>
			<div class ="simple_paging">
			<a href ="now" title = "1페이지">
			<span>1</span>
			</a>
		</div>
		</div>
	<!-- 댓글쓰기 영역 -->
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
<script src="/FoodFighter/resources/js/review/keyword.js"></script>
<script type="text/javascript">
$(document).ready(function(){
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    $(document).ajaxSend(function(e, xhr, options) {
        xhr.setRequestHeader(header, token);
    });
});

$('#headerUser').click(function(){
	$('#headUser-menu').modal();
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
/* 글 보기 */
$(document).ready(function(){
	$.ajax({
		type : 'post',
		url : '/FoodFighter/event/geteventBoardtView',
		data : 'seq_event='+$('#seq_event').val(),
		dataType : 'json',
		success : function(data){
			//alert(JSON.stringify(data));
			
			$('#seq_eventSpan').text(data.eventDTO.seq_event);
			$('#subjectSpan').text(data.eventDTO.subject);
			$('#nicknameSpan').text(data.eventDTO.nickname);
			$('#dateSpan').text(data.eventDTO.logtime);
			$('#hitSpan').html(data.eventDTO.hit);
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
/* 댓글 쓰기*/
let secret = 'n';
$('#cwrite').click(function(){
	cocontent = $('#cwrite_place').val();
	if('${memId}' == ''){
			alert("로그인 후 이용 가능한 서비스입니다.");
		location.href='/FoodFighter/login/loginForm';
	}else {
		if(cocontent == ''){
			alert("댓글 내용을 입력해주세요");
		}else {
			seq_event = $('#seq_event').val();
			conickname = '${memberDTO.nickname}'
			$.ajax({
				type :'post',
				url :'/FoodFighter/event/eventboardcomment',
				data :{'seq_event' : seq_event,
						'cocontent' : cocontent,
						'conickname' : conickname,
						'secret' : secret},
				success: function() {
			    	//alert("111111");
			    	$('#cwrite_place').val("");
			    	
	       		},
		        error : function(err){
			       alert("실패"+JSON.stringify(err));
		        }
			});
		}
	}
});

$(document).ready(function(){
	commentList();
});
/* 댓글 리스트 */
 function commentList(){
	seq_event = $('#seq_event').val();
	conickname = '${memberDTO.nickname}'
	$.ajax({
		type : 'get',
		url : '/FoodFighter/event/eventboardcommentList',
		data :{'seq_event' : seq_event,
				'conickname' : conickname},
		dataType : 'json',
		success : function(data){
			var cmnt_N = "";
			$('.comment_list').empty();
			if(data == null){
			}else {
			$.each(data, function(index, items){
    			cmnt_N += '<li class = "comment_section" id = "comt'+index+'">';
    			cmnt_N += '<div class = "pic">';
    				cmnt_N += '<img src = "/FoodFighter/storage/profile/'+items.profile+'"/>';
    				cmnt_N += '</div>';
    					cmnt_N += '<div class ="info">';
    						cmnt_N += '<div class ="comment_post">';
    							cmnt_N += '<div class = "data">';
    								cmnt_N += '<span class = "txt_name">'+items.conickname+'</span>';
											cmnt_N += '</div>';
												cmnt_N += '<span class = "txt_date">'+items.clogtime+'</span>';
												cmnt_N += '<div class = "comment_cont">'+items.cocontent+'</div>';
												cmnt_N += '</div>';
													cmnt_N += '</div>';
														cmnt_N += '<div class ="option">';
								if(conickname != items.conickname){
									cmnt_N += '<div class ="dropdown" style ="visibility: hidden;">';
									//alert("1111111");
								
								}else{
									cmnt_N += '<div class ="dropdown">';
								}
								cmnt_N += '<button type = "button" data-toggle = "dropdown" class ="dropdown-toggle">';
									cmnt_N += '<span class ="ico_bbs ico_more"></span>';
										cmnt_N += '</button>';
											cmnt_N += '<ul class = "dropdown-menu">';
												cmnt_N += '<li><a id = "cmnt_modify" onclick = "cmnt_modify('+index+','+items.seq_eventco+')">수정</a></li>';
				
												cmnt_N += '<li><a id = "recmnt_delete" onclick = " recmnt_delete('+items.seq_eventco+')">삭제</a></li>';
												cmnt_N += '</ul>';
													cmnt_N += '</div>';
														cmnt_N += '<div class = "comment_reply" id = "comment_reply">';
															cmnt_N += '<a href ="javascript:" id ="cmnt_reply'+index+'" onclick = "cmnt_reply('+items.seq_eventco+')"></a>';
															cmnt_N += '</div>';
																cmnt_N += '</div>';
					
																cmnt_N += '</li>';
																
				$('.comment_list').html(cmnt_N);
					//cmnt_N = "";
					
				
				/* if(items.secret == 'y') {
					let cmnt_Y = '<li class = "comment_section" id = "comt'+index+'" style = " padding: 15px 0 15px 68px !important;">'
								+ '<div class = "secretIcon">'
								+ '<img class ="ico_bbs ico_lock" id = "lock" src = "/FoodFighter/resources/img/community/boardImg/lock.svg"/>'
								+ '</div>'
								+ '<div class = "comment_cont">'
								+ '<span id = "secret">해당 댓글은 작성자와 관리자만 볼 수 있습니다.</span>'
								+ '<span class = "txt_date" style = "float : initial !important;">'+items.clogtime+'</span>'
								+ '</div>'
								+ '</div>'
								+ '</li>'
					if (memberDTO.nickname != items.conickname && memberDTO.nickname != '관리자'){
						$('#comt'+index).replaceWith(cmnt_Y);
					} 
				}*/

    			/* 해당 댓글작성자만 수정 */
				if(items.conickname == ''){
					$('.dropdown').removeAttr('style');
				}
				
				});//each
			}
   		},
        error : function(err){
	       alert("실패"+JSON.stringify(err));
        }
	});
}
 
 

/* 댓글 수정 */
function cmnt_modify(index, seq_eventco){
	seq_event = $('#seq_event').val();
	$.ajax({
		type : 'get',
		url : '/FoodFighter/event/geteventBoardtcommentView',
		data :{'seq_event' : seq_event,
				'seq_eventco' : seq_eventco},
		dataType : 'json',
		success : function(data){
			//alert(JSON.stringify(data));
			let cmnt_modify = '<div class = "comment_modify" id = "comment_modify'+index+'">'
							+ '<div class ="inner_text_write">'
								+ '<div class = "box_textarea">'
								+ '<textarea placeholder="인터넷은 우리가 함께 만들어가는 소중한 공간입니다. 댓글 작성 시 타인에 대한 배려와 책임을 담아주세요"	class = "cmnt" id = "cmnt_cocontent'+index+'" maxlength="600" style ="height : 86px;"></textarea>'
								+ '</div>'
								+ '<div class = "wrap_menu">'
									+ '<div class = "area_l">'
										+ '<button class = "btnTab">'
											+ '<span class ="ico_bbs ico_lock_state" id ="lock'+index+'">비밀글</span>'
										+ '</button>'
									+ '</div>'
									+ '<div class = "area_r">'
										+ '<span class ="num_text">'
											+ '<span class ="sr_only">글자수</span>'
											+ '<span class ="num_count'+index+'" style = "color : black;">0</span> / <span class ="sr_only">총 글자 개수</span> 600'
										+ '</span>'
										+ '<div class ="btn_group">'
											+ '<button class = "plain-btn" id = "cmntModifyBtn'+index+'" style ="background-color: red; color: white;">등록</button></a>'
											+ '<button class = "plain-btn" id = "cmntModifyCancelBtn'+index+'" style = "margin-left : 5px;">취소</button></a>'
										+ '</div>'
									+ '</div>'
								+ '</div>'
							+ '</div>'
						+ '</div>'
						
						
			/* if($('#comment_replyWrite'+index).length){
				$('#comment_replyWrite'+index).remove();
			} else */if($('#comment_modify'+index).length) {
				$('#comment_modify'+index).remove();
			} else {
				$('#comt'+index).append(cmnt_modify);
			}
			$('#cmnt_cocontent'+index).val(data.rcontent);
			let rc = $('#cmnt_cocontent'+index).val().length;
		    $('.num_count'+index).html(rc); 
		    
			
			if(data.secret == 'y'){
				$('#lock'+index).removeClass('ico_lock_state');
				$('#lock'+index).addClass('ico_lock_on');
			} 
			
			//취소버튼을 누르면 수정창 사라지기
			$('#cmntModifyCancelBtn'+index).on('click', function(){ 
				$('#cmt_'+index+' > #comment_modify'+index).remove();
			});
			
			//댓글 수정
			$('#cmntModifyBtn'+index).on('click', function(){
				var cmnt_cocontent = $('#cmnt_cocontent'+index);
				if (cmnt_cocontent.val() == ''){
					alert("댓글 내용을 입력해주세요");
					cmnt_cocontent.focus();
				}else {
					$.ajax({
						type : 'post',
						url : '/FoodFighter/event/eventBoardcommentModify',
						data :{'seq_eventco' : seq_eventco,
							   'cocontent' : cmnt_cocontent.val()},
						success : function(){
							commentList();
						},//success
				        error : function(err){
					       //alert("실패"+JSON.stringify(err));
				        }
			    	});
				}
			});
			
		},//success
        error : function(err){
	       alert("실패"+JSON.stringify(err));
        }
    });//ajax 
}

function recmnt_delete(seq_eventco){
	if(confirm("정말로 삭제하시겠습니까?")){
		$.ajax({
			type : 'post',
			url : '/FoodFighter/event/eventBoardcommentDelete',
			data : {'seq_eventco' : seq_eventco},
			success: function() {
				//alert("성공");
				commentList();
       		},
	         error : function(err){
		       console.log("실패"+JSON.stringify(err));
	        } 
		});
	}
} 
 </script>
 </html>