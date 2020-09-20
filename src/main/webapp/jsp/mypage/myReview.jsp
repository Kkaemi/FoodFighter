<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="reviewListDiv">
<input type="hidden" id="pg" name="pg" value="1">

	<div id="buttonRow">
		<div id="buttonDiv" class="col-12">
			<button type="button" id="addReviewList" class="btn">더보기</button>	
		</div>
	</div>
</div>


<!-- 리뷰 자세히 보는 모달 -->
	      <div class="modal" id="reviewModal" role="dialog">
	           <div class="modal-dialog">
	             <div class="modal-content">    
	               <!-- body -->
	               <div id="reviewModal-body" class="modal-body">
	               </div>
	             </div>
	           </div>
	         </div>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>	
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" ></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    $(document).ajaxSend(function(e, xhr, options) {
        xhr.setRequestHeader(header, token);
    });
    
    
});

/* 리뷰리스트 쪽  */
$(document).ready(function(){
	$.ajax({
		data:'pg='+$('#pg').val(),
	    url:"/FoodFighter/mypage/myreviewGetList",
	    type: "post",
	    dataType: "json",
	    success: function(data){
	    	if(JSON.stringify(data) == '{"list":[]}'){
	    		$('#reviewListDiv').children().last().remove();
	    		
	    		 let html ='<div id="reviewEmptyDiv" class="row emptyDiv">' 
	    		 			+'<div class="emptyDivContent">'
							+'<span>&emsp;&emsp;작성한 리뷰가 없습니다<br>방문한 맛집의 리뷰를 남겨보세요.</span>'
							+'</div>'
			         	    +'</div>'
			         	    
			     $('#reviewListDiv').append(html);  
	    		
	    	}else{
		    	let pg = parseInt($('#pg').val());
		        $.each(data.list, function(index, items){
		        	
		        	
		        	if(index ==0 || index==3 ){
				
		            	 let html ='<div id="inner-row'+(pg)+'" class="row">' 
		            		+'<div id="re" class="review col-3 ">'
		            		+'<input type="hidden" id="seq_review" value='+items.seq_review+'>'
		            		+'<div id="reviewImg-Div" class="review-part">'
		            	    +'<img src="/FoodFighter/storage/review/'+items.image1+'" class="img-responsive">'
		            	    +'</div>'
		            	    
		            	    +'<div id="review-resName" class="review-part">'
		            	    +'<span>'+items.resName+'</span>'
		            	    +'</div>'
		            	    
		            	    +'<div id="review-score" class="review-part">'
		            	    +'<span class="fa fa-star checked"></span>'
		            	    +'<span>'+items.resScore+'</span>'
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
		            	    
		            	    +'<div id="review-resName" class="review-part">'
		            	    +'<span>'+items.resName+'</span>'
		            	    +'</div>'
		            	    
		            	    +'<div id="review-score" class="review-part">'
		            	    +'<span class="fa fa-star checked"></span>'
		            	    +'<span>'+items.resScore+'</span>'
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
		    }//데이터 여부
		
		}//성공시
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
		            	    
		            	    +'<div id="review-resName" class="review-part">'
		            	    +'<span>'+items.resName+'</span>'
		            	    +'</div>'
		            	    
		            	    +'<div id="review-score" class="review-part">'
		            	    +'<span class="fa fa-star checked"></span>'
		            	    +'<span>&emsp;'+items.resScore+'</span>'
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
		            	    
		            	    +'<div id="review-resName" class="review-part">'
		            	    +'<span>'+items.resName+'</span>'
		            	    +'</div>'
		            	    
		            	    +'<div id="review-score" class="review-part">'
		            	    +'<span class="fa fa-star checked"></span>'
		            	    +'<span>'+items.resScore+'</span>'
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


$(document).on('click','#listDiv .review',function(){
	 $('.modal-body').empty();
	
	let seq_review = $(this).children('#seq_review').val();
	
	 $.ajax({
	       data:'seq_review='+seq_review,
	        url:"/FoodFighter/mypage/getModalView",
	        type: "post",
	        dataType: "json",
	        success: function(data){
	        	let modalView='<input type="hidden" id="seq_review" value='+seq_review+'>'
	        		+'<div class="swiper-container">'
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
		            
		            +'<div id="review-resName" class="review-part">'
            	    +'<span>'+data.resName+'</span>'
            	    +'</div>'
		            +'<div id="modalView-score" class="modalView-part">'
		       	    +'<span class="fa fa-star checked"></span>'
		       	  	+'<span>'+data.resScore+'</span>'
		       	    +'</div>'
		       	    +'<div id="modalView-content" class="modalView-part">'
		       	    +'<span>'+data.content+'</span>'
		       	    +'</div>'
		       	 	+'<div id="modalView-btn" class="modalView-part modalView-btn">'
		       	 	+'<button type="button" id="reviewDeleteBtn" class="btn">삭제</button>'
		       	    +'</div>'
              	    
   				$('.modal-body').append(modalView);
	        	
	        	
	        }
	   
	   });  
	 
	 $('#reviewModal').modal();
	 
	 var swiper = new Swiper('.swiper-container', {
	       nextButton: '.swiper-button-next',
	       prevButton: '.swiper-button-prev',
	});
	 
});

$(document).on('click','#reviewDeleteBtn',function(){
	let check = confirm("해당 리뷰를 삭제하시겠습니까?");
	let seq_review = $(this).parent().prevAll("#seq_review").val();
	if(check){
	 $.ajax({
		 	type: 'post',
	 		url: '/FoodFighter/mypage/deleteReview',
	 		data: 'seq_review='+seq_review,
	 		success : function(){
	 			alert("삭제되었습니다.");
	 			location.href="/FoodFighter/mypage/mypageMain"
	 		},
	 		error : function(e){
				console.log(e);
			}
	    });
	}
});



</script> 