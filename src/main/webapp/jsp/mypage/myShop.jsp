<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="shopListDiv" class="menuDefualtDiv">
<input type="hidden" id="pg" name="pg" value="1">
	<div id="shopEmptyDiv" class="row emptyDiv">' 
	    <div class="emptyDivContent">
			<span>&emsp;&emsp;&emsp;&emsp;북마크가 없습니다<br>지금 마음에 드는 가게를 북마크 해 보세요.</span>
		</div>
	</div>
	<!-- <div id="buttonRow">
		<div id="buttonDiv" class="col-12">
			<button type="button" id="addShopList" class="btn">더보기</button>	
		</div>
	</div> -->
</div>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>	
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

/*   

///북마크 쪽  
$(document).ready(function(){
	$.ajax({
		data:'pg='+$('#pg').val(),
	    url:"/FoodFighter/mypage/myShopGetList",
	    type: "post",
	    dataType: "json",
	    success: function(data){
	    	if(JSON.stringify(data) == '{"list":[]}'){
	    		$('#shopListDiv').children().last().remove();
	    		
	    		 let html ='<div id="shopEmptyDiv" class="row emptyDiv">' 
	    		 			+'<div class="emptyDivContent">'
							+'<span>&emsp;&emsp;북마크가 없습니다<br>지금 마음에 드는 가게를 북마크 해 보세요.</span>'
							+'</div>'
			         	    +'</div>'
			         	    
			     $('#shopListDiv').append(html);  
	    		
	    	}else{
		    	let pg = parseInt($('#pg').val());
		        $.each(data.list, function(index, items){
		        	
		        	
		        	if(index ==0 || index==3 ){
				
		            	 let html ='<div id="inner-row'+(pg)+'" class="row">' 
		            		+'<div id="re" class="shop col-3 ">'
		            		+'<input type="hidden" id="seq_shop" value='+items.resSeq+'>'
		            		+'<div id="shopImg-Div" class="shop-part">'
		            	    +'<img src="/FoodFighter/storage/review/'+items.resImage1+'" class="img-responsive">'
		            	    +'</div>'
		            	    
		            	    +'<div id="shopName" class="shop-part">'+items.resName+'</div>'
		            	    
		            	    +'<div id="shop-score" class="shop-part">'
		            	    +'<span class="fa fa-star checked"></span>'
		            	    +'<span class="fa fa-star checked"></span>'
		            	    +'<span class="fa fa-star checked"></span>'
		            	    +'<span class="fa fa-star"></span>'
		            	    +'<span class="fa fa-star"></span>'
		            	    +'<span>'+items.resScore+'</span>'
		            	    +'</div>'
		            	    
		            	    +'<div id="shop-content" class="shop-part">'
		            	    +'<span>'+items.content+'</span>'
		            	    +'</div>'
		            	    +'</div>'
		            	    +'</div>'
		            	    
		            	    if(index == 0){
		            	    	$("#shopListDiv").last().prepend(html);
		            	    }else if(index ==3){
		            	    	$("#shopListDiv .row").last().after(html);
		            	    }
		            	    
		            	    
		            		
		            		
		        	} else if(index%3 == 1||index%3 == 2){
		        		
		        		
		        		let html = '<div id="re" class="shop col-3 ">'
		        			+'<input type="hidden" id="seq_review" value='+items.resSeq+'>'
		            	    +'<div id="shopImg-Div" class="shop-part">'
		            	    +'<img src="/FoodFighter/storage/review/'+items.resImage1+'" class="img-responsive">'
		            	    +'</div>'
		            	    
		            	    +'<div id="shopName" class="shop-part">'+items.resName+'</div>'
		            	    
		            	    +'<div id="shop-score" class="shop-part">'
		            	    +'<span class="fa fa-star checked"></span>'
		            	    +'<span class="fa fa-star checked"></span>'
		            	    +'<span class="fa fa-star checked"></span>'
		            	    +'<span class="fa fa-star"></span>'
		            	    +'<span class="fa fa-star"></span>'
		            	    +'<span>'+items.resScore+'</span>'
		            	    +'</div>'
		            	    
		            	    +'<div id="shop-content" class="shop-part">'
		            	    +'<span>'+items.content+'</span>'
		            	    +'</div>'
		            	    +'</div>'
		            	    
		            	    $("#shopListDiv .row").last().append(html);
						
		            	    
		        	} 
	
		        })
		        
		        
		        pg++;
		        $('#pg').val(pg);
		    }//데이터 여부
		
		}//성공시
	});
	
});

let totPg;
$('#addShopList').click(function(){
	if($('#pg').val() >= totPg){ //총 페이지를 계산해서 마지막 pg값 정해지면 스크롤 내려도 계속 return 해서 메소드에서 나가도록(나머지 수정!!!)
        alert("마지막 페이지입니다.");
		return;
    }else{
		$.ajax({
			data:'pg='+$('#pg').val(),
		    url:"/FoodFighter/mypage/myShopGetList",
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
		            		+'<div id="re" class="shop col-3 ">'
		            		+'<input type="hidden" id="seq_review" value='+items.resSeq+'>'
		            		+'<div id="shopImg-Div" class="shop-part">'
		            	    +'<img src="/FoodFighter/storage/review/'+items.resImage1+'" class="img-responsive">'
		            	    +'</div>'
		            	    
		            	    +'<div id="shopName" class="shop-part">'+items.resName+'</div>'
		            	    
		            	    +'<div id="shop-score" class="shop-part">'
		            	    +'<span class="fa fa-star checked"></span>'
		            	    +'<span class="fa fa-star checked"></span>'
		            	    +'<span class="fa fa-star checked"></span>'
		            	    +'<span class="fa fa-star"></span>'
		            	    +'<span class="fa fa-star"></span>'
		            	    +'<span>'+items.resScore+'</span>'
		            	    +'</div>'
		            	    
		            	    +'<div id="shop-content" class="shop-part">'
		            	    +'<span>'+items.content+'</span>'
		            	    +'</div>'
		            	    +'</div>'
		            	    +'</div>'
		            	    
		            	   
		            	    	$("#shopListDiv .row").last().after(html);
		            	   
		            	    
		            		
		            		
		        	} else if(index%3 == 1||index%3 == 2){
		        		
		        		
		        		let html = '<div id="re" class="shop col-3 ">'
		        			+'<input type="hidden" id="seq_review" value='+items.resSeq+'>'
		            	    +'<div id="shopImg-Div" class="shop-part">'
		            	    +'<img src="/FoodFighter/storage/review/'+items.resImage1+'" class="img-responsive">'
		            	    +'</div>'
		            	    
		            	    +'<div id="shopName" class="shop-part">'+items.resName+'</div>'
		            	    
		            	    +'<div id="shop-score" class="shop-part">'
		            	    +'<span class="fa fa-star checked"></span>'
		            	    +'<span class="fa fa-star checked"></span>'
		            	    +'<span class="fa fa-star checked"></span>'
		            	    +'<span class="fa fa-star"></span>'
		            	    +'<span class="fa fa-star"></span>'
		            	    +'<span>'+items.resScore+'</span>'
		            	    +'</div>'
		            	    
		            	    +'<div id="shop-content" class="shop-part">'
		            	    +'<span>'+items.content+'</span>'
		            	    +'</div>'
		            	    +'</div>'
		            	    
		            	    $("#shopListDiv .row").last().append(html);
						
		            	    
		        	} 
	
		        })
		        
		        
		        pg++;
		        $('#pg').val(pg);
		    }
		});
    }
}); */

</script>