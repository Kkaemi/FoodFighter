$(document).ready(function(){
	var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    $(document).ajaxSend(function(e, xhr, options) {
        xhr.setRequestHeader(header, token);
    });
});

/* 자유게시판 글 가져오기 */
$(document).ready(function(){
	$.ajax({
		type : 'GET',
		url : 'communityMainGetBoard',
		dataType : 'json',
		success : function(data){
			var cboard = '';
			$.each(data.bList, function(index, items){
				cboard += '<tr id ="cboardTr">';
				cboard += '<td scope = "col"><div class = "text-center">'+items.bseq+'</div></td>';
				cboard += '<td scope = "col"><div class = "text-left"><a href = "communityBoardView?bseq='+items.bseq+'" class = "'+items.bseq+'">'+items.subject+'</a></div></td>';
				cboard += '<td scope = "col"><div class = "text-center">'+items.nickname+'</div></td>';
				cboard += '<td scope = "col"><div class = "text-center">'+items.logtime+'</div></td>';
				cboard += '<td scope = "col"><div class = "text-center">'+items.hit+'</div></td>';
				cboard += '</tr>';
			});
			
			$('#cbList').html(cboard);
		},
		error : function(err){
			console.log(err);
		}
	});
	
	$.ajax({
		type : 'GET',
		url : 'communityMainGetNotice',
		dataType : 'json',
		success : function(data){
			var cnotice = '';
			$.each(data.nList, function(index, items){
				cnotice += '<tr id = "cnoticeTr" >';
				cnotice += '<td><div class = "text-left" id = "cnoticeDv"><a href = "communityNoticeView?nseq='+items.nseq+'">'+items.subject+'</a></div></td></tr>';
			});
			$('#cnList').html(cnotice);
		},
		error : function(err){
			console.log(err);
		}
	});
	
	$.ajax({
		type : 'GET',
		url : 'communityMainGetUserRank',
		dataType : 'json',
		success : function(data){
			var uList = data.uList.slice(0,5);
			var userRank = '';
			$.each(uList, function(index, items){
				userRank += '<tr>';
				userRank += '<td>';
				userRank += '<div class ="text-center">';
				userRank += '<div class="tb-center" style="font-size: 20pt; font-weight: bold;">'+(index+1)+'</div>';
				userRank += '</div>';
				userRank += '</td>';
				userRank += '<td>';
				userRank += '<div class = "ranker">'+items.nickname+'</div>';
				userRank += '</td>';
				userRank += '</tr>';
			});
			$('#userRank').html(userRank);
		},
		error : function(err){
			console.log(err);
		}
	});
	
	$.ajax({
		type : 'GET',
		url : 'communityMainGetResRank',
		dataType : 'json',
		success : function(data){
			var rList = data.rList.slice(0,5);
			var resRank = '';
			$.each(rList, function(index, items){
				resRank += '<tr>';
				resRank += '<td>';
				resRank += '<div class ="text-center">';
				resRank += '<div class="tb-center" style="font-size: 20pt; font-weight: bold;">'+(index+1)+'</div>';
				resRank += '</div>';
				resRank += '</td>';
				resRank += '<td>';
				resRank += '<div class = "ranker">'+items.resName+'</div>';
				resRank += '</td>';
				resRank += '</tr>';
			});
			$('#resRank').html(resRank);
		},
		error : function(err){
			console.log(err);
		}
	});
	
	$.ajax({
		type : 'GET',
		url : 'communityMainGetEvent',
		dataType : 'json',
		success : function(data){
			var event = '';
			$.each(data.eList, function(index, items){
				event += '<tr id ="eventTr">';
				event += '<td scope = "col"><div class = "text-center">'+items.seq_event+'</div></td>';
				event += '<td scope = "col"><div class = "text-left"><a href = "/FoodFighter/event/eventView?seq_event='+items.seq_event+'&pg=1" class = "'+items.seq_event+'">'+items.subject+'</a></div></td>';
				event += '<td scope = "col"><div class = "text-center">'+items.nickname+'</div></td>';
				event += '<td scope = "col"><div class = "text-center">'+items.logtime+'</div></td>';
				event += '<td scope = "col"><div class = "text-center">'+items.hit+'</div></td>';
				event += '</tr>';
			});
			
			$('#eventList').html(event);
		},
		error : function(err){
			console.log(err);
		}
	});
	
});