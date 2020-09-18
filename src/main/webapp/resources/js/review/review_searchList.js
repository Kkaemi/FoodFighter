let keyword = document.getElementById("keyword").value;
let pg = document.getElementById("pg").value;
//더보기 기능
$(document).ready(function(){
$(".moreBtn").click(function(){
	 pg++;
	var obj = {"keyword":keyword,"pg":pg};
    
	$.ajax({
		type : "POST",
		data :JSON.stringify(obj),
		dataType : 'json',
		url : "moreSearchList",
		beforeSend : function(xhr){
			xhr.setRequestHeader("Content-type","application/json; charset=utf-8");
		},
		success : function(data){
			$.each(data, function(index, items){
				
				let row = $('<div class = "row"/>');
				let col3 = $('<div class = "col-sm-3"/>');
					let img = $('<img src = "/FoodFighter/storage/restaurant/'+items.resImage1 + '"class = "row_StoreImg">');
				let col9 = $('<div class = "col-sm-9"/>');
					let storeMain = $('<ul class = "storeMain"/>');
						let resN = $('<li><span class = "resName">'+items.resName+ '&emsp;&emsp;&emsp;&emsp;</span></li>');
						let resS = $('<li><span class = "resScore">'+items.resScore+'</span></li>');
					let storeD = $('<ul class = "storeDetail" align="left">');
						let resAd = $('<li>주소:&emsp;&emsp;&emsp;'+items.resAddress+'</li>');
						let resTh = $('<li>카테고리:&emsp;'+ items.resTheme+'</li>');
						let resPr = $('<li>가격대:&emsp;&emsp;'+items.resPrice+'</li>');
					let storeMore = $('<div class = "storeMore"/>');
						let detailPage = $('<a id="gotoReviewView" class = "reviewList_detailPage" href = "/FoodFighter/review/reviewView?resSeq='+items.resSeq+'&resName='+items.resName+'" style ="color : #ffc34d;">가게이름 상세보기 ></a>');

			col3.append(img).appendTo(row);
			storeMain.append(resN).append(resS);
			storeD.append(resAd).append(resTh).append(resPr);
			storeMore.append(detailPage);

			col9.append(storeMain).append($('<br>')).append($('<br>')).append(storeD).append(storeMore);
			col9.appendTo(row);
			row.appendTo($('.containerRow'));
			$('.containerRow').append($('<hr/>'));
			
			});	
		},
		error: function(err){
		console.log(err)
		}
				
			});	 
	});
});


//검색필터 중복 및 선택해제
$('.modal-body button').click(function(){
	if($(this).hasClass("check") == true) {
		 $(this).removeClass('check'); 
	}else {
		$(this).addClass('check');
	}
});

//모달 필터
$('.filter').click(function(){
	   var filter = $(this).attr('value');
	   alert(filter);
});