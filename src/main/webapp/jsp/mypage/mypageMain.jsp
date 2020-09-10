<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700">
<!-- 별 css -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css"><!-- 슬라이드  -->
<title>Bootstrap Sign up Form Horizontal</title>
<link rel="stylesheet" href="/FoodFighter/resources/css/mypage/mypageStyle.css">
</head>
<body>
<!--================ Header ================-->
	<div id="header-container">
	  <a class="header-logo" href="/FoodFighter/">로고 자리</a>
	      <ul id="header-menu">
		     <li class="header-items">
		  		<img src="/FoodFighter/resources/img/search.png" class="header_searchIcon" width="30" height="30" align="center"> 
		   		<input type="search" class="header_searchInput" placeholder="&emsp;&emsp;식당 또는 음식 검색" value = "${keyword}" autocomplete="on" maxlength="50" >
		   		<button size="10" id="header_searchBtn" >검색</button>
		      </li>
		      <li class="header-items">
		         <a class="header-link" href="/FoodFighter/">Home</a>
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
		       <a class="header-link" href="communityMain.jsp"><img src="/FoodFighter/resources/img/member.png" class="header_searchIcon" width="30" height="30" align="center"></a>
	    	 </li>
	   	</ul>
	</div>
<!-- ============main ============== -->
<div class="container">
  <div id="row1" class="row">
  	<input type="hidden" id="memId" value=${sessionScope.memId }>
	<div class="col-12">
	   <div id="top">
	   
		  <div id="profileImgBox" class="offset-1" >
		  	<c:choose>
		  	  <c:when test="${memberDTO.profile == null}">
           		<img id="profileImg" src="/FoodFighter/resources/img/mypage/basic.png">	
			  </c:when>
			  <c:otherwise>	
		  		<img id="profileImg" src="/FoodFighter/storage/profile/${memberDTO.profile}">
		  	  </c:otherwise>	
		  	</c:choose>
		  </div>
		  
		  <div id="profileInfoBox" class="col-7 offset-2">
		  	<div id="info">
		  		<div id="name">${memberDTO.name }</div>
		  		<button type="button" id="modifyBtn" class="btn btn-primary" onclick="location.href='/FoodFighter/mypage/modifyCheckPwd'">정보수정</button>
		  	</div>
		  	
		  	<div id="alramBox">
		  		<div class="alram-part">리뷰</div>
		  		<div class="alram-part">게시글</div>
		  		<div class="alram-part">댓글</div>
		  	</div>
		  
		  </div>
		</div><!-- top -->
	</div><!-- col  -->
  </div><!-- row1  -->
  
  <!-- ==============================================================탑 -->
  
  <div id="row2" class="row">
	<div class="col-12">
		<nav id="menu" class="border-top">
		  <div id="menuTextBox" class="col-10  offset-1" >
			  	<a id="myReview" class="first menu-part" href="/FoodFighter/mypage/myReview">
			  	  <span class="glyphicon glyphicon-list-alt"></span>
			  	  <span>내가 쓴 리뷰</span>
			  	</a>

			  	<a id="myPost"  class="menu-part" href="/FoodFighter/mypage/myPost">
			  	  <span class="glyphicon glyphicon-comment"></span>
			  	  <span>내가 쓴 글</span>
			  	</a>

			
			  	<a id="myShop" class="menu-part" href="/FoodFighter/mypage/myShop">
			  	  <span class="glyphicon glyphicon-bookmark"></span>
			  	  <span>북마크</span>
			  	</a>
			  
			  	<a id="myAsk" class="menu-part" href="/FoodFighter/mypage/myAsk">
			  	  <span class="glyphicon glyphicon-question-sign"></span>
			  	  <span>문의</span>
			  	</a>

		  </div><!-- menuTextBox  -->
		</nav>		
		
		
	</div>
  </div><!-- row2  -->
  <!-- =========================================================메뉴바 -->
   <div id="row3" class="row">
	<div id="listDiv" class="col-12">
		 <jsp:include page="${display}"></jsp:include>
	</div>
  </div><!-- row3  -->
   <!-- =========================================================메인 div -->
   <div id="row4" class="row">
	<div class="col-12">
		 
	</div>
  </div><!-- row4  -->
  <!-- =========================================================풋터 -->
  
</div><!--★★★container★★★  -->

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

<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<!--슬라이드  -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
<!-- 부트스트랩 js -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" ></script>
<script type="text/javascript">
$(document).ready(function(){
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    $(document).ajaxSend(function(e, xhr, options) {
        xhr.setRequestHeader(header, token);
    });
});


//header부분 키워드 입력 시, 검색 버튼 나타는 기능
$('.header_searchInput').click(function(){
	$('#header_searchBtn').addClass('show');
});


$('#menuTextBox a').click(function(){
	$('#menuTextBox a').removeClass('first');
	$('#menuTextBox a').removeClass('now');
	$(this).addClass('now');
});

/* 리뷰리스트 쪽  */
$(document).ready(function(){
	$.ajax({
		data:'pg='+$('#pg').val(),
	    url:"/FoodFighter/mypage/myreviewGetList",
	    type: "post",
	    dataType: "json",
	    success: function(data){

	    	let pg = parseInt($('#pg').val());
	        $.each(data.list, function(index, items){
	        	
	        	
	        	if(index ==0 || index==3 ){
			
	            	 let html ='<div id="inner-row'+(pg)+'" class="row">' 
	            		+'<div id="re" class="review col-3 ">'
	            		+'<input type="hidden" id="seq_review" value='+items.seq_review+'>'
	            		+'<div id="reviewImg-Div" class="review-part">'
	            	    +'<img src="/FoodFighter/storage/review/'+items.image1+'" class="img-responsive">'
	            	    +'</div>'
	            	    
	            	    +'<div id="review-score" class="review-part">'
	            	    +'<span class="fa fa-star checked"></span>'
	            	    +'<span class="fa fa-star checked"></span>'
	            	    +'<span class="fa fa-star checked"></span>'
	            	    +'<span class="fa fa-star"></span>'
	            	    +'<span class="fa fa-star"></span>'
	            	    +'</div>'
	            	    
	            	    +'<div id="review-content" class="review-part">'
	            	    +'<span>'+items.content+'</span>'
	            	    +'</div>'
	            	    +'</div>'
	            	    +'</div>'
	            	    
	            	    if(index == 0){
	            	    	$("#reviewListDiv").last().prepend(html);
	            	    }else if(index ==3){
	            	    	$("#reviewListDiv .row").last().after(html);
	            	    }
	            	    
	            	    
	            		
	            		
	        	} else if(index%3 == 1||index%3 == 2){
	        		
	        		
	        		let html = '<div id="re" class="review col-3 ">'
	        			+'<input type="hidden" id="seq_review" value='+items.seq_review+'>'
	            	    +'<div id="reviewImg-Div" class="review-part">'
	            	    +'<img src="/FoodFighter/storage/review/'+items.image1+'" class="img-responsive">'
	            	    +'</div>'
	            	    
	            	    +'<div id="review-score" class="review-part">'
	            	    +'<span class="fa fa-star checked"></span>'
	            	    +'<span class="fa fa-star checked"></span>'
	            	    +'<span class="fa fa-star checked"></span>'
	            	    +'<span class="fa fa-star"></span>'
	            	    +'<span class="fa fa-star"></span>'
	            	    +'</div>'
	            	    
	            	    +'<div id="review-content" class="review-part">'
	            	    +'<span>'+items.content+'</span>'
	            	    +'</div>'
	            	    +'</div>'
	            	    
	            	    $("#reviewListDiv .row").last().append(html);
					
	            	    
	        	} 

	        })
	        
	        
	        pg++;
	        $('#pg').val(pg);
	    }
	});
	
});

let totPg;
$('#addReviewList').click(function(){
	if($('#pg').val() >= totPg){ //총 페이지를 계산해서 마지막 pg값 정해지면 스크롤 내려도 계속 return 해서 메소드에서 나가도록(나머지 수정!!!)
        alert("마지막 페이지입니다.");
		return;
    }else{
		$.ajax({
			data:'pg='+$('#pg').val(),
		    url:"/FoodFighter/mypage/myreviewGetList",
		    type: "post",
		    dataType: "json",
		    success: function(data){
		      let length = data.list.length;
	
		    	
		    	let pg = parseInt($('#pg').val());
		    	
		    	if(length <= 5){
			    	  totPg = pg;
			      }
		        $.each(data.list, function(index, items){
		        	
		        	
		        	if(index ==0 || index==3 ){
				
		            	 let html ='<div id="inner-row'+(pg)+'" class="row">' 
		            		+'<div id="re" class="review col-3 ">'
		            		+'<input type="hidden" id="seq_review" value='+items.seq_review+'>'
		            		+'<div id="reviewImg-Div" class="review-part">'
		            	    +'<img src="/FoodFighter/storage/review/'+items.image1+'" class="img-responsive">'
		            	    +'</div>'
		            	    
		            	    +'<div id="review-score" class="review-part">'
		            	    +'<span class="fa fa-star checked"></span>'
		            	    +'<span class="fa fa-star checked"></span>'
		            	    +'<span class="fa fa-star checked"></span>'
		            	    +'<span class="fa fa-star"></span>'
		            	    +'<span class="fa fa-star"></span>'
		            	    +'</div>'
		            	    
		            	    +'<div id="review-content" class="review-part">'
		            	    +'<span>'+items.content+'</span>'
		            	    +'</div>'
		            	    +'</div>'
		            	    +'</div>'
		            	    
		            	   
		            	    	$("#reviewListDiv .row").last().after(html);
		            	   
		            	    
		            		
		            		
		        	} else if(index%3 == 1||index%3 == 2){
		        		
		        		
		        		let html = '<div id="re" class="review col-3 ">'
		        			+'<input type="hidden" id="seq_review" value='+items.seq_review+'>'
		            	    +'<div id="reviewImg-Div" class="review-part">'
		            	    +'<img src="/FoodFighter/storage/review/'+items.image1+'" class="img-responsive">'
		            	    +'</div>'
		            	    
		            	    +'<div id="review-score" class="review-part">'
		            	    +'<span class="fa fa-star checked"></span>'
		            	    +'<span class="fa fa-star checked"></span>'
		            	    +'<span class="fa fa-star checked"></span>'
		            	    +'<span class="fa fa-star"></span>'
		            	    +'<span class="fa fa-star"></span>'
		            	    +'</div>'
		            	    
		            	    +'<div id="review-content" class="review-part">'
		            	    +'<span>'+items.content+'</span>'
		            	    +'</div>'
		            	    +'</div>'
		            	    
		            	    $("#reviewListDiv .row").last().append(html);
						
		            	    
		        	} 
	
		        })
		        
		        
		        pg++;
		        $('#pg').val(pg);
		    }
		});
    }
});

$('#listDiv').on('click','.review',function(){
	 $('.modal-body').empty();
	
	let seq_review = $(this).children('#seq_review').val();
	
	 $.ajax({
	       data:'seq_review='+seq_review,
	        url:"/FoodFighter/mypage/getModalView",
	        type: "post",
	        dataType: "json",
	        success: function(data){
	        	let modalView='<div class="swiper-container">'
    	            +'<div class="swiper-wrapper">' 
    	        	+'<div id="modalViewImg-Div" class="swiper-slide modalView-part">'
               	    +'<img src="/FoodFighter/storage/review/'+data.image1+'" class="modalViewImg img-responsive">'
               	    +'</div>'
               	 	+'<div id="modalViewImg-Div" class="swiper-slide modalView-part">'
               	    +'<img src="/FoodFighter/storage/review/'+data.image2+'" class="modalViewImg img-responsive">'
               	    +'</div>'
               	 	+'<div id="modalViewImg-Div" class="swiper-slide modalView-part">'
               	    +'<img src="/FoodFighter/storage/review/'+data.image3+'" class="modalViewImg img-responsive">'
               	    +'</div>'
               	    +'</div>'
               	 	+'<div class="swiper-button-next"></div>'/* 다음 */
             		+'<div class="swiper-button-prev"></div>'/* 이전 버튼  */
               	    +'</div>'
               	    +'<div id="modalView-score" class="modalView-part">'
               	    +'<span class="fa fa-star checked"></span>'
               	    +'<span class="fa fa-star checked"></span>'
               	    +'<span class="fa fa-star checked"></span>'
               	    +'<span class="fa fa-star"></span>'
               	    +'<span class="fa fa-star"></span>'
               	    +'</div>'
               	    +'<div id="modalView-content" class="modalView-part">'
               	    +'<span>'+data.content+'</span>'
               	    +'</div>'
               	    
    				$('.modal-body').append(modalView);
	        	
	        	
	        }
	   
	   });  
	 
	 $('div.modal').modal(); 
	 
	 
/* 	 new Swiper( '.swiper-container', {
		    navigation : { // 네비게이션
		        nextEl : '.swiper-button-next', // 오른쪽(다음) 화살표
		        prevEl : '.swiper-button-prev', // 왼쪽(이전) 화살표
		    },
		}); */
	 
});


</script>
</body>
</html>