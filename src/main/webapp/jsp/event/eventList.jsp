<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />
<title>이벤트 글목록</title>
<style type="text/css">
body, html {
    height: 100%;
}

</style>
<!-- CSS 파일 -->
<link rel="stylesheet" href="/FoodFighter/resources/css/event/normalize.css">
<link rel="stylesheet" href="/FoodFighter/resources/css/event/sidenav.css">
<link rel="stylesheet" href="/FoodFighter/resources/css/event/headerCss.css">
<link rel="stylesheet" href="/FoodFighter/resources/css/event/eventBoardList.css">

<!-- JS 파일 -->
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> <!-- 부트스트랩 CSS  -->
<script type="text/javascript" src ="/FoodFighter/resources/js/event/eventHeaderJS.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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

<style type="text/css">
.subjectA:link {color: black; text-decoration: none;}
.subjectA:visited {color: black; text-decoration: none;}
.subjectA:hover {color: green; text-decoration: underline;}
.subjectA:active {color: black; text-decoration: none;}
</style>

<!-- 본문 -->
<form id="eventBoardListForm" method="get" action="/FoodFighter/event/eventBoardListDelete">

<input type="hidden" id="pg" value="${pg }">
<input type="hidden" name="pg" value="1">
<div style = "clear: both;"></div>
<div class="container" style="margin-top : 95px;">
	<div class="page-header">
    	<h2 class="text-center">이벤트 게시글</h2>      
  		<p class="text-center"></p>      
  	</div>
</div>
<div class="page-body">
  <table class="table table-hover" id = "eventBoard">
  	<colgroup id ="colgroup">
  		<col width = "60">
  		<col width = "*">
  		<col width = "110">
  		<col width = "75">
  		<col width = "60">
  	</colgroup>
    <thead>
    
       <tr> 
      	<c:if test="${memberDTO.nickname == '관리자'}">
      		<th scope = "col" class ="text-center" id="admin">선택</th>	
      	</c:if> 
      	<th scope = "col" class="text-center">NO</th>
		<th scope = "col" class="text-center">제목</th>
		<th scope = "col" class="text-center">작성자</th>
		<th scope = "col" class="text-center">작성일</th>
		<th scope = "col" class="text-center">조회수</th>
      </tr>
    </thead>
    <tbody>
    </tbody>
  </table>

	<div class = "content-wrapper">
		<div id="eventPagingDiv" class="paging a"style="width:650px; align: left;"></div>
		
		<div class = "list-search" style=" align: center;">
		<fieldset>
		<select name = "where" id="where" >
			<option value = "subject">제목</option>
			<option value = "content">본문</option>
		</select>
		
		<input type = "search" placeholder = "검색어를 입력해주세요" name="inp" id ="inp" value="${requestScope.inp }"><!-- 검색어 입력 경고 (모달) -->
		<input type = "button" value = "검색" class = "plain-btn" id = "searchBtn">
		
		</div>
		</fieldset>
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
<script src="/FoodFighter/resources/js/review/keyword.js"></script>
<script type="text/javascript">
$('#headerUser').click(function(){
	$('#headUser-menu').modal();
});
</script>
<script type="text/javascript">
window.onload = function() {
	if ("${where}" == "subject" || "${where}" == "content") {
		document.getElementById("where").value = "${where}";
	}
}
function eventPaging(pg) {
	var inp = document.getElementById("inp").value;
	if (inp == "") {
		location.href = "eventList?pg=" + pg;
	} else {
		
		$('input[name=pg]').val(pg);
		$('#searchBtn').trigger('click', 'continue');
	}
} 
//리스트	
 $(document).ready(function(){
	$.ajax({
		type : 'get',
		url : '/FoodFighter/event/eventBoardList',
		data: 'pg='+$('#pg').val(),
		dataType: 'json',
		success : function(data){
			//alert(JSON.stringify(data));
			$.each(data.list, function(index, items){
				$('<tr/>').append($('<td/>',{}).addClass('adminDelete').append($('<div class = "tb-center"><input type ="checkbox" class = "select" value="'+items.seq_event+'"></div>',{})))
							.append($('<td/>',{align: 'center' ,text: items.seq_event}))
							.append($('<td/>',{}).append($('<a/>',{id: 'subjectA',href: '#',align: 'center',text: items.subject})))
							.append($('<td/>',{align: 'center',text: items.nickname}))
							.append($('<td/>',{align: 'center', text: items.logtime}))
							.append($('<td/>',{align: 'center',text: items.hit}))
							.appendTo($('#eventBoard'));  
				
				       
			}); //each
			
			//페이징 처리
			//alert(JSON.stringify(data.eventPaging.pagingHTML));
			$('#eventPagingDiv').html(data.eventPaging.pagingHTML);
			
			//로그인 여부 & 작성한 글 확인
			 $('#eventBoard').on('click', '#subjectA', function(){
				//alert($(this).prop('tagName'));
			
				let seq_event = ($(this).parent().prev().text()); 
				let pg = data.pg;
				location.href = '/FoodFighter/event/eventView?seq_event='+seq_event+'&pg='+pg;
				
				//}
			});
			 $('.adminDelete').css('display', 'none');
			 if('${memberDTO.nickname}' == '관리자'){
					$('.adminDelete').show();
					let col = document.createElement('col');
					col.setAttribute('width', '45');
					let colgroup = $('#colgroup');
					colgroup.prepend(col);
					$('#admin').show();	
					$('<tr class = "admin"/>').append($('<td id = "allCheck"/>',{
					}).append($('<input type = "checkbox"  id = "all"/>',{
					}))).append($('<td/>',{
						align: 'center',
						colspan : 3
					})).append($('<td/>',{
						align: 'center'
						}).append($('<input type = "button" value ="삭제" class = "plain-btn" id = "deleteBtn" />'),{
					})).append($('<td/>',{align: 'center'
						}).append($('<input type = "button" value ="글쓰기" class = "plain-btn" id = "writeBtn"/>'),{
					})).prependTo($('thead')); 
					
				} 
		},
		error: function(err){
			console.log(err);
		}
	}); //ajax
});

//검색
$('#searchBtn').click(function(event, str){
	if(str != 'continue') $('input[name=pg]').val(1);
	if($('#inp').val() == ''){
		alert('검색어를 입력하세요');
		$('#inp').focus();	
	}else{
		$.ajax({
			type : 'get',
			url : '/FoodFighter/event/getEventSearch',
			data: {'pg': $('input[name=pg]').val(),
				   'where': $('#where').val(),
				   'inp': $('#inp').val()},
			dataType: 'json',
			success : function(data){
				//alert(JSON.stringify(data));
				
				$('#eventBoard tr:gt(0)').remove(); 
					
				$.each(data.list, function(index, items){
					$('<tr/>').append($('<td/>',{
						align: 'center',
						text: items.seq_event
					})).append($('<td/>',{
						}).append($('<a/>',{
							id: 'subjectA',
							href: '#',
							align: 'center',
							text: items.subject,
							class: items.seq_event+''
					}))
					).append($('<td/>',{
						align: 'center',
						text: items.id
					})).append($('<td/>',{
						align: 'center',
						text: items.logtime
					})).append($('<td/>',{
						align: 'center',
						text: items.hit
					})).appendTo($('#eventBoard'));         
				}); //each
				
				//페이징 처리
				$('#eventPagingDiv').html(data.eventPaging.pagingHTML);
				
				$('#eventBoard').on('click', '#subjectA', function(){
					
					let seq_event = ($(this).parent().prev().text()); //$(this).attr('class');
					let pg = data.pg;
					location.href = '/FoodFighter/event/eventView?seq_event='+seq_event+'&pg='+pg;
					
				}); 
			
			},
			error: function(err){
				console.log(err);
			}
		});
	}
});

$(document).on('click', '#all', function(){
	let select = $('.select');
	
	let all = $(this).is(":checked");
	
	if(all) {
		select.prop('checked', true);
	}else  {
		select.prop('checked', false);
	}
}); 

$(document).on('click', '.select', function(){
	let select = $(this).is(":checked");
	let all = $('#all');
	if(select == select.length){
		all.prop('checked', true);
	}else {
		all.prop('checked', false);
	}
});

 $(document).ready(function(){
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    $(document).ajaxSend(function(e, xhr, options) {
        xhr.setRequestHeader(header, token);
    });
}); 


$(document).on('click', '#deleteBtn', function(){
	let select = $('.select');
	let count = 0;
	
	for(i=0; i < select.length; i++) {
		if(select[i].checked) {
			count++;
		}
	}
	if(count == 0){ /* 체크되어있지 않음 */ 
		alert("삭제할 항목을 선택하세요");
	}else { /* 체크 됨 */
		if(confirm("정말로 삭제하시겠습니까?")){
			let deleteSelect = [];
			$('.select:checked').each(function(i){
				deleteSelect.push($(this).val());
			});
			
			let list = {"deleteSelect" : deleteSelect};
			$.ajax({
				type : 'POST',
	        	url : '/FoodFighter/event/eventBoardListDelete',
	        	data : list,
	        	success: function() {
			    	alert("선택한 글을 삭제했습니다.");
			    	location.href='eventList';
	       		},
		        error : function(err){
			       alert("실패"+JSON.stringify(err));
		        }
			});
		}
	}
});

$(document).on('click', '#writeBtn', function(){
	location.href="/FoodFighter/event/eventWriteForm";
});

</script>
</body>
</html>