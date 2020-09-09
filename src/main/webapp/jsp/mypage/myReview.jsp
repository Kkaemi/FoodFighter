<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="reviewListDiv">
<input type="hidden" id="pg" name="pg" value="1">

	<div id="buttonRow">
		<div id="buttonDiv" class="col-12">
			<button type="button" id="addShopList" class="btn">더보기</button>	
		</div>
	</div>
</div>


<!-- 리뷰 자세히 보는 모달 -->
	      <div class="modal" id="reviewModal" role="dialog">
	           <div class="modal-dialog">
	             <div class="modal-content">    
	               <!-- body -->
	               <div class="modal-body">
	               </div>
	             </div>
	           </div>
	         </div>
	
<script type="text/javascript">
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
</script> 