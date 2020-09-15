function changeRank() {
    if (document.getElementById("img").src.match("/FoodFighter/resources/img/community/rankImg/home.png")) {
        document.getElementById("img").src = "/FoodFighter/resources/img/community/rankImg/simbol.png";
        $('.rank').text('유저');
        $('.rankList li').remove();
        
    } else {
        document.getElementById("img").src = "/FoodFighter/resources/img/community/rankImg/home.png";
        $('.rank').text('맛집');
        getRankRes();
    }
}

function getRankRes(){
	$.ajax({
		type : "GET",
		url : 'communityRankTopRes',
		dataType: 'json',
		success : function(data){
			let resName = "";
			var resRnk = "";
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
									resRnk += '<span class = "ninkName" id = "resName'+index+'">'+items.resName+'</span>';
								resRnk += '</div>';
								resRnk +=  '<div class = "grade">';
									resRnk += '<span class="fa fa-star fa-2x score"></span>';
									resRnk += '<span class="resScore">'+items.resScore+'</span>';
								resRnk += '</div>';
							resRnk += '</div>';
						resRnk += '</div>';
					resRnk += '</li>';
				$('.rankList').append(resRnk);
				
				getRankResRev(items.resName);
				
				resRnk = "";
			});
		},
		error : function(err){
			alert("실패"+JSON.stringify(err));
		}
    });
}

function getRankResRev(resName){
	let resNameList = [];
	resNameList.push(resName);
	
	let list = {"resNameList" : resNameList};
	
	$.ajax({
		type : "GET",
		url : 'communityRankTopResRev',
		data : list,
		//dataType: 'json',
		success : function(){
		 alert("dd");
		},
        error : function(err){
	       alert("실패"+JSON.stringify(err));
        }
	});
}

