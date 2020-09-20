$(document).ready(function() {

	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
    $(document).ajaxSend(function(e, xhr, options) {
        xhr.setRequestHeader(header, token);
    });

	getRankMemList();
	
});

function changeRank() {
    if (document.getElementById("img").src.match("/FoodFighter/resources/img/community/rankImg/home.png")) {
        document.getElementById("img").src = "/FoodFighter/resources/img/community/rankImg/simbol.png";
        $('.rank').text('유저');
        $('.rankList li').remove();
        getRankMemList();
        
    } else {
        document.getElementById("img").src = "/FoodFighter/resources/img/community/rankImg/home.png";
        $('.rank').text('맛집');
        $('.rankList li').remove();
        getRankRes();
    }
}

function getRankRes(){
	$.ajax({
		type : "GET",
		url : 'communityRankTopRes',
		dataType: 'json',
		success : function(data){
			var resRnk = "";
			var resRev = "";
			$('.rankList').empty();
			$.each(data.list, function(index, items){
				resRnk += '<li class = "rankItem" id = "rankItem'+index+'">';
					resRnk += '<div class = "rankInner" id = "rankInner'+index+'">';
						resRnk += '<div class = "ranking">';
							resRnk += '<span>'+(index+1)+'</span>';
						resRnk += '</div>';
						resRnk += '<div class = "rankerInfo" id = "rankerInfo'+items.resSeq+'">';
							resRnk += '<div class = "infoPic">';
								resRnk += '<img src = "/FoodFighter/storage/restaurant/'+items.resImage1+'">';
							resRnk += '</div>'
							resRnk += '<div class = "infoText">';
								resRnk +=  '<div class = "infoName">';
									resRnk += '<span class = "ninkName" id = "resName'+index+'"><a href = "/FoodFighter/review/reviewView?resSeq='+items.resSeq+'&resName='+items.resName+'">'+items.resName+'</a></span>';
								resRnk += '</div>';
								resRnk +=  '<div class = "grade">';
									resRnk += '<span class="fa fa-star fa-2x score"></span>';
									resRnk += '<span class="resScore">'+items.resScore+'</span>';
								resRnk += '</div>';
							resRnk += '</div>'; //infoText
							resRnk +=  '<div class = "infoRes">';
								resRnk += '<div><span class = "lis">음식 종류 : </span><span class="res">'+items.resTheme+'</span></div>';
								resRnk += '<div><span class = "lis">대표 메뉴 : </span><span class="res">'+items.resMenu+'</span></div>';
								resRnk += '<div><span class = "lis">주소 : </span><span class="res">'+items.resAddress+'</span></div>';
							resRnk += '</div>';
						resRnk += '</div>'; //rankerInfo
						
						resRev += '<div class = "rankerBoardWrap" id = "rankerBoardWrap'+index+'">';
							resRev += '<div class = "postList" id = "'+items.resName+'">';
								resRev = '<div class = "postItem" id = "postItem'+index+'">';
									resRev += '<div class ="review" id = "review'+index+'">';
										resRev += '<a href = "/FoodFighter/review/reviewView?resSeq='+items.resSeq+'&resName='+items.resName+'" class = "reviewLink">';
										if(items.image1 == ''){
											resRev += '<img class = "reviewThumb" src = "/FoodFighter/resources/img/logo.png">';
										}else {
											resRev += '<img class = "reviewThumb" src = "/FoodFighter/storage/review/'+items.image1+'">';
										}
											resRev += '<div class ="reviewText">';
												resRev += '<strong class = "reviewTextSum"><p>'+items.content+'</p></strong>';
											resRev += '</div>';
										resRev += '</a>';
									resRev += '</div>';
								resRev += '</div>';
							resRev += '</div>';
						resRev += '</div>'; //rankBoardWrap
						resRnk += resRev;
						resRnk += '</div>'; //rankInner
				resRnk += '</li>';
						resRev = "";
				$('.rankList').append(resRnk);
				resRnk = "";
			});
		},
		error : function(err){
			alert("실패"+JSON.stringify(err));
		}
    });
}

function getRankMemList() {

	$.ajax({
	
		type : 'post',
		url : '/FoodFighter/community/getRankMemList',
		dataType : 'json',
		success : function(data) {
		
			$.each(data.list, function(index, items) {
		
				$('<li/>', {
				
					// 첫번째 li의 class
					class : 'rankItem'
					
				}).append($('<div/>', {
				
					// li안의 첫번째 div
					class : 'rankInner'
				
				}).append($('<div/>', {
				
					// rankInner안의 첫번째 div
					class : 'ranking'
				
				}).append($('<span/>', {
				
					// ranking안의 span
					text : index + 1
					
				}))).append($('<div/>', {
				
					// rankInner안의 두번째 div
					class : 'rankerInfo'
				
				}).append($('<div/>', {
				
					// rankerInfo안의 첫번째 div
					class : 'infoPic'
				
				}).append($('<img/>', {
				
					// infoPic안의 img
					src : '/FoodFighter/storage/profile/' + items.profile
				
				}))).append($('<div/>', {
				
					// rankerInfo안의 두번째 div
					class : 'infoText'
					
				}).append($('<div/>', {
				
					// infoText안의 첫번째 div
					class : 'infoName'
				
				}).append($('<span/>', {
				
					// infoName안의 span
					class : 'nickname',
					text : items.nickname
				
				}))))).append($('<div/>', {
					
					// rankInner안의 세번째 div
					id : items.resSeq,
					class : 'review ' + items.resName,
					style : 'text-align: center; cursor: pointer;'
					
				}).append($('<img>', {
				
					style : 'text-align: center;',
					src : '/FoodFighter/storage/review/' + items.image1,
					width : '75%',
					height : '75%'
					
				})).append($('<div/>', {
					
					style : 'font-size: 12pt; font-weight: bold; text-align: center; margin-top: 8px;',
					text : items.resName
					
				}))).append($('<div/>', {
					
					id : items.resSeq,
					class : 'reviewContent ' + items.resName,
					style : 'cursor: pointer;'
					
				}).append($('<p/>', {
				
					class : 'txt_line',
					text : items.content
				
				})).prepend($('<br/>')).prepend($('<span/>', {
				
					class : 'resScore',
					text : items.resScore
				
				})).prepend($('<span/>', {
				
					class : 'fa fa-star fa-2x score'
				
				})))).appendTo('.rankList');
					
			}); // <- each end
			
			$('.rankList').on('click', '.reviewContent', function() {
					
					let resSeq = $(this).attr('id');
					let resName = $(this).attr('class').replace('reviewContent ', '');
					location.href = '/FoodFighter/review/reviewView?resSeq='+resSeq+'&resName='+resName;
				
			});
			
			$('.rankList').on('click', '.review', function() {
					
					let resSeq = $(this).attr('id');
					let resName = $(this).attr('class').replace('review ', '');
					location.href = '/FoodFighter/review/reviewView?resSeq='+resSeq+'&resName='+resName;
				
			});
			
		}, // <- success end
		error : function(err) {
			console.log(err);
		}
	
	});

}
