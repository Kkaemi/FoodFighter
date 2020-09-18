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
				cnotice += '<td><div class = "text-left" id = "cnoticeDv"><a href = "communityNoticeView?nseq='+items.nseq+'">'+items.subject+'</a></div></td>';
			});
			$('#cnList').html(cnotice);
		},
		error : function(err){
			console.log(err);
		}
	});
	
});