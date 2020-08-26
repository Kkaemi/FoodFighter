<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script> 

<link rel = "stylesheet" href="../resources/css/review/reviewWrite.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reviewWriteForm</title>
</head>
<body>
</head>
<form id="reviewForm" name="reviewForm" method="post" enctype = "multipart/form-data" action="/FoodFighter/review/writeReview?${_csrf.parameterName}=${_csrf.token}">
<!--================ Header ================-->
<div id="header-container">
  <a class="header-logo" href="#page-top"><img src="../resources/img/logo.jpeg" width="250px;" height="55px;" align="left" style="margin-top: 10px; margin-left: 200px;"></a>
      <ul id="header-menu">
	       <li class="header-items">
		  		<img src="../resources/img/search.png" class="header_searchIcon" width="30" height="30" align="center"> 
		   		<input type="search" class="header_searchInput" placeholder="&emsp;&emsp;식당 또는 음식 검색" id ="keyword" value = "${keyword}" autocomplete="on" maxlength="50" >
		   		<button size="10" id="header_searchBtn" onclick="searchBtn" >검색</button>
		   		<input type="hidden" name="keyword">
		      </li>
	      <li class="header-items">
	         <a class="header-link" href="/FoodFighter/index">Home</a>
	      </li>
	      <li class="header-items">
	         <a class="header-link" href="reviewNonSearchList">리뷰 리스트</a>
	      </li>
	      <li class="header-items">
	        <a class="header-link" href="communityMain">커뮤니티</a>
	      </li>
	      <li class="header-items">
	        <a class="header-link" href="eventList">이벤트</a>
	      </li>
	      <li class="header-items">
	       <a class="header-link" href="communityMain.jsp"><img src="../resources/img/member.png" class="header_searchIcon" width="30" height="30" align="center"></a>
    	 </li>
   	</ul>
</div>

<!--================ Container ================-->
	<div class="container">
		  <div class="title" align="left">
			  <font class="storeName"><strong>코스믹커피</strong></font>&emsp;<strong>에 대한 솔직한 리뷰를 작성해주세요.</strong> &emsp;&emsp;&emsp;&emsp;&emsp;
				 <div class="starRev">
				 	<input type="hidden" id="starAvg" name="starAvg">
				     <span class="starR1 on" id = star1_Left data-value="0.5" >별1_왼쪽</span>
				     <span class="starR2" id = star1_Right data-value ="1.0">별1_오른쪽</span>
				     <span class="starR1" id = star2_Left data-value ="1.5">별2_왼쪽</span>
				     <span class="starR2" id = star2_Right data-value ="2.0">별2_오른쪽</span>
				     <span class="starR1" id = star3_Left data-value ="2.5">별3_왼쪽</span>
				     <span class="starR2" id = star3_Right data-value ="3.0">별3_오른쪽</span>
				     <span class="starR1" id = star4_Left data-value ="3.5">별4_왼쪽</span>
				     <span class="starR2" id = star4_Right data-value ="4.0">별4_오른쪽</span>
				     <span class="starR1" id = star5_Left data-value ="4.5">별5_왼쪽</span>
				     <span class="starR2" id = star5_Right data-value ="5.0">별5_오른쪽</span>
				   </div>
				   
		  </div><br><!-- title -->

		  <div class="form-group">
			  <textarea id="content" name="content" class="form-control" rows="10" placeholder="000님 주문하신 메뉴는 어떠셨나요? 상점에 대한 진솔하면서도 고운말 부탁드립니다"></textarea>
			 	   <div class="upload-group" align="left"> 
			  			<div class="filebox" width="100%" align="left">
       						<label for="ex_file">+</label>
							<div id="imageView"></div>
        					<input type="file" name="img[]" class="file_input" id="ex_file" multiple> 	
   						 </div>
		  				<br>
		  				<div class="ReviewPictureCounter" style="/* top: 58%; left: 18%; */ display: block;">
          					  <span class="ReviewPictureCounter__CurrentLength">0</span>
          					  <span class="ReviewPictureCounter__Divider">/</span>
         					   <span class="ReviewPictureCounter__MaxLength">5</span>
          				</div>
				  </div>
					
		 		
			 <div class="button-group">
					<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">  
		 			<button type="button" class="btn btn-outline-light text-dark" id="reviewBtn">리뷰 작성</button>
		  			<button type="reset" class="btn btn-outline-light text-dark" id="resetBtn">다시 작성</button>
		 		 	<div id="reviewDiv"></div>
			</div>
		</div><!-- form-group -->
	 
		  <div class="card" style="width:300px" align="center" >
			    <img class="card-img-top" src="../resources/img/store1.jpeg" alt="Card image" style="align:center">
			    <div class="card-body" align="center">
			      <h4 class="card-title" align="center"><font style="color:#fff;"><strong>코스믹 커피</strong></font></h4>
		      	  <h6><font style="color:#fff;">가격대:&emsp; 1만원-2만원대</font></h6>
			      <h6 ><font style="color:#fff;">카테고리:&emsp; 카페/디저트</font></h6>
		    </div>
		  </div>
 	</div><!-- container -->
 
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
  
 <!--================ Up ================-->
 <a href="#" class="back-to-top"><i class="fa fa-chevron-up"> <img src="../resources/img/back-up.png" width="32px;" height="32px;"></i></a>
 <div id="preloader"></div>
 
</form> 
</body>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
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

//검색 클릭 시, 키워드전송
$('#header_searchBtn').click(function(){
	let keyword = document.getElementById("keyword").value;
	
		alert(keyword);
		if(keyword == ""){
			location.href="review_nonSearchList?pg="+pg;
		}else{
			
		}

});

//유효성검사
$(document).ready(function(){
	$('#reviewBtn').click(function(){
		if($('#content').val()==''){
			alert('내용을 입력해주세요');
		} else {
		  document.reviewForm.submit();
		} 
		/* return false; */
	});
});

//reset
$('#resetBtn').click(function(){
	if(confirm("지금까지 작성하신걸 지우시겠습니까?")){
		$('#content').empty();
		$('span.on').removeClass('on');
		$('.filebox div').not('div.file_input').remove();
		$('.ReviewPictureCounter__CurrentLength').text('0');
		document.getElementById("ex_file").disabled=false; 
	}else{
		return false;
	}
	
});

//별 평점
$('.starRev>span').click(function(){
   $(this).parent().children('span.on').removeClass('on');
   $(this).addClass('on').prevAll('span').addClass('on');
   let starAvg = $(this).attr('data-value');
	$('#starAvg').val(starAvg);
   
   return false;
});


let arr_total = 0;
//이지미업로드
$(document).ready(function (e){
  $("input[type='file']").change(function(e){

    //div 내용 비워주기
    $('#imageView').empty();

    let files = e.target.files;
    let arr =Array.prototype.slice.call(files);
	
    //업로드 가능 파일인지 체크
    for(let i=0;i<files.length;i++){
      if(!checkExtension(files[i].name,files[i].size)){
        return false;
      }
    }
    
    preview(arr);
    
    
  });//file change
  
  function checkExtension(fileName,fileSize){

  	let regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
  	let maxSize = 20971520;  //20MB
    
    if(fileSize >= maxSize){
      alert('파일 사이즈 초과');
      $("input[type='file']").val("");  //파일 초기화
      return false;
    }
    
    if(regex.test(fileName)){
      alert('업로드 불가능한 파일이 있습니다.');
      $("input[type='file']").val("");  //파일 초기화
      return false;
    }
    return true;
  }
  
  
  function preview(arr){
      arr_total += arr.length; 
  	if(arr_total < 6){
	    	arr.forEach(function(f){
	        //div에 이미지 추가
	        let str = '<div style="display:inline-block; list-style:none; line-height: 89px; text-align: center;">';
	        //이미지 파일 미리보기
	        if(f.type.match('image.*')){
      	 let reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
	          	reader.onload = function (e) { //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
	       		  str += '<img src="'+e.target.result+'"id=viewImg style="display:inline-block; list-style:none;"'+'"width=89px; height=89px; />';
	   	          str += '</div>';
	   	           $(str).prependTo('.filebox');
	  	          }
		          reader.readAsDataURL(f);
		        }
	      });//arr.forEach
      }//if
      else{
          alert('최대 5개만 업로드 가능합니다');
          arr_total -= arr.length; 
      }
      $('.ReviewPictureCounter__CurrentLength').text(arr_total); //사진개수 입력란
	}//preview
});


</script>
<!-- Vendor JS Files -->
<!-- <script src="../../assets/vendor/jquery/jquery.min.js"></script>  -->
 <script src="../resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
 <script src="../resources/assets/vendor/jquery.easing/jquery.easing.min.js"></script>
 <script src="../resources/assets/vendor/php-email-form/validate.js"></script>
 <script src="../resources/assets/vendor/waypoints/jquery.waypoints.min.js"></script>
 <script src="../resources/assets/vendor/counterup/jquery.counterup.min.js"></script>
 <script src="../resources/assets/vendor/owl.carousel/owl.carousel.min.js"></script>
<!--  <script src="../../assets/vendor/typed.js/typed.min.js"></script> -->
 <script src="../resources/assets/vendor/venobox/venobox.min.js"></script>

<!--  Template Main JS File -->
 <script src="../resources/assets/js/main.js"></script> 
 

</html>