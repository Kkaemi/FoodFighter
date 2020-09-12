/* 자유게시판 상세보기 */

/* 회원일 때만 글쓰기 가능 */
if(id != ''){
	$('#write').show();
	$('.reply').show();
}

/* 작성자일 때만 수정,삭제 보이기 */
let author = $('.nickname').text();
if(id == author){
	$('.modify').show();
	$('.delete').show();
}

$(document).ready(function(){
	var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    $(document).ajaxSend(function(e, xhr, options) {
        xhr.setRequestHeader(header, token);
    });
});

/* 글쓰기 이동 */
$('#write').click(function(){
	if(id == ''){
		alert("로그인 후 이용 가능한 서비스입니다.");
		location.href='/FoodFighter/login/loginForm';
	}else {
		if (bSrchOption != '' && bKeyword != ''){
			location.href = 'communityBoardWriteForm?bseq='+bseq+'&bSrchOption='+bSrchOption+'&bKeyword='+bKeyword;
		}else {
			location.href = 'communityBoardWriteForm?bseq='+bseq;
		}
	}
});

/* 글수정 이동*/
$('.modify').click(function(){
	if(id != author){
		alert("작성자 본인만 이용 가능한 서비스입니다.");
	}else {
		if (bSrchOption != '' && bKeyword != ''){
			location.href = 'communityBoardModifyForm?bseq='+bseq+'&bSrchOption='+bSrchOption+'&bKeyword='+bKeyword;
		}else {
			location.href = 'communityBoardModifyForm?bseq='+bseq;
		}
	}
});

/* 글 삭제 */
$('.delete').click(function(){
	if(id != author){
		alert("작성자 본인만 이용 가능한 서비스입니다.");
	}else {
		if(confirm("정말로 삭제하시겠습니까?")){
			$.ajax({
				type : "POST",
				url : 'communityBoardDelete',
				data : 'bseq='+bseq,
				success: function() {
			    	alert("선택한 글을 삭제했습니다.");
			    	location.href='communityBoard';
	       		},
		        error : function(err){
			       alert("실패"+JSON.stringify(err));
		        }
			});
		}
	}
});

/* 답글쓰기 이동 */
$('.reply').click(function(){
	if(id == ''){
		alert("로그인 후 이용 가능한 서비스입니다.");
		location.href='/FoodFighter/login/loginForm';
	}else {
		if (bSrchOption != '' && bKeyword != ''){
			location.href = 'communityBoardReplyForm?bseq='+bseq+'&bSrchOption='+bSrchOption+'&bKeyword='+bKeyword;
		}else {
			location.href = 'communityBoardReplyForm?bseq='+bseq;
		}
	}
});

/* 댓글 작성 */
let secret = 'n';
$('#cmtWrite').click(function(){
	rcontent = $('#cmnt_write').val();
	if(id == ''){
		alert("로그인 후 이용 가능한 서비스입니다.");
		location.href='/FoodFighter/login/loginForm';
	}else {
		if(rcontent == ''){
			alert("댓글 내용을 입력해주세요");
		}else {
			$.ajax({
				type : "POST",
				url : 'communityBoardCmnt',
				data :{'bseq' : bseq,
						'rcontent' : rcontent,
						'rnickname' : id,
						'secret' : secret},
				success: function() {
			    	alert("일단 ㅇㅋ");
			    	$('#cmnt_write').val("");
			    	
	       		},
		        error : function(err){
			       alert("실패"+JSON.stringify(err));
		        }
			});
		}
	}
});

/* 댓글 쓰는 창에 있는 비밀댓글버튼 */
$(document).on('click', '.comment_write .btnTab span#lock', function(){
	if($(this).hasClass('ico_lock')){
		$(this).removeClass('ico_lock');
		$(this).addClass('ico_lock_on');
		secret = 'y';
		
	}else {
		$(this).removeClass('ico_lock_on');
		$(this).addClass('ico_lock');
		secret = 'n';
	}
});

/* 댓글 리스트 */
$(document).ready(function(){
	$.ajax({
		type : "GET",
		url : 'communityBoardCmntList',
		data :{'bseq' : bseq,
				'nickname' : author},
		dataType : 'json',
		success : function(data){
			if(data == null){
			}else {
			$.each(data, function(index, items){
				/*
	    		let li = $('<li class = "comment_section" id = "cmt'+index+'"/>');
	    			let picDiv = $('<div class = "pic"/>');
	    				let pic = $('<img src = "/FoodFighter/storage/profile/'+items.profile+'"/>');
	    			let info = $('<div class = "info"/>');
	    				let cmnt_post = $('<div class = "comment_post"/>');
	    					let data = $('<div class = "data"/>');
	    						let txt_name = $('<span class = "txt_name">'+items.rnickname+'</span>');
	    					let txt_date = $('<span class = "txt_date">'+items.rlogtime+'</span>');
	    					let cmnt_cont = $('<div class = "comment_cont">'+items.rcontent+'</div>');
	    			let option = $('<div class = "option">');
	    				let dropdown = $('<div class = "dropdown" style ="visibility: hidden;">');
	    					let dropBtn = $('<button type = "button" data-toggle = "dropdown" class ="dropdown-toggle">');
	    						let dropBtnImg = $('<span class = "ico_bbs ico_more"></span>');
	    						let dropMenu = $('<ul class = "dropdown-menu">');
	    							let recmnt_modify = $('<li><a id = "recmnt_modify">수정</a></li>');
	    							let recmnt_delete = $('<li><a id = "recmnt_delete">삭제</a></li>');
	    				let cmnt_reply = $('<div class = "comment_reply" id = "comment_reply">');
	    					let cmnt_replyBtn = $('<a href ="javascript:" id ="cmt_reply'+index+'">답글</a>');
    			picDiv.append(pic);
    			info.append(cmnt_post.append(data.append(txt_name)).append(txt_date).append(cmnt_cont));
    			dropdown.append(dropBtn.append(dropBtnImg)).append(dropMenu.append(recmnt_modify).append(recmnt_delete));
    			cmnt_reply.append(cmnt_replyBtn);
    			option.append(dropdown).append(cmnt_reply);
    			li.append(picDiv).append(info).append(option).appendTo($('.comment_list'));
    			*/
    			let html = '<li class = "comment_section" id = "cmt_'+index+'">'
								+ '<div class = "pic">'
									+ '<img src = "/FoodFighter/storage/profile/'+items.profile+'"/>'
								+ '</div>'
								+ '<div class ="info">'
									+ '<div class ="comment_post">'
										+ '<div class = "data">'
											+ '<span class = "txt_name">'+items.rnickname+'</span>'
										+ '</div>'
										+ '<span class = "txt_date">'+items.rlogtime+'</span>'
										+ '<div class = "comment_cont">'+items.rcontent+'</div>'
									+ '</div>'
								+ '</div>'
								+ '<div class ="option">'
									+ '<div class ="dropdown" style ="visibility: hidden;">'
										+ '<button type = "button" data-toggle = "dropdown" class ="dropdown-toggle">'
											+ '<span class ="ico_bbs ico_more"></span>'
										+ '</button>'
										+ '<ul class = "dropdown-menu">'
											+ '<li><a id = "recmnt_modify">수정</a></li>'
											+ '<li><a id = "recmnt_delete">삭제</a></li>'
										+ '</ul>'
									+ '</div>'
									+ '<div class = "comment_reply" id = "comment_reply">'
										+ '<a href ="javascript:" id ="cmt_reply'+index+'" onclick = "cmt_reply('+this.rseq+')">답글</a>'
									+ '</div>'
								+ '</div>'
							+ '</li>'
				$('.comment_list').append(html);
    			if(items.rnickname == id){
					$('.dropdown').removeAttr('style');
				}
				});
			}
   		},
        error : function(err){
	       alert("실패"+JSON.stringify(err));
        }
	});
});

/* 댓글 수정 */

/* 댓글 삭제 */
/* 댓글의 답글 */
//$('#cmt').on('click', '#cmt_reply', function(event){
function cmt_reply(rseq){
	let rseq = resq;
	if($('#cmt_reply'+resq).text() == '답글') {
		reply.html('접기');
		let comment_replyWrite = $('<div class ="comment_replyWrite'+rseq+'"/>'); 
		let inner_text_write = $('<div class = "inner_text_write"/>');
		let box_textarea = $('<div class = "box_textarea"/>'); 
		let reply_content = $('<textarea id ="reply_content" placeholder="인터넷은 우리가 함께 만들어가는 소중한 공간입니다. 댓글 작성 시 타인에 대한 배려와 책임을 담아주세요" maxlength="600" style ="height : 86px;"></textarea>');
		let wrap_menu = $('<div class = "wrap_menu"/>');
		let area_l = $('<div class = "area_l"/>');
		let btnTab = $('<button class = "btnTab"/>');
		let area_r = $('<div class = "area_r"/>');
		let num_text = $('<span class ="num_text"/>');
		let sr_only1 = $('<span class = "sr_only">글자수</span>');
		let num_count = $('<span class = "num_count">0</span>');
		let sr_only2 = $('<span class= "sr_only">총 글자 개수</span>');
		let btn_group = $('<div class = "btn_group"/>');
		let cmntWriteBtn = $('<button class = "plain-btn" id = "cmntWrite" style ="background-color: red; color: white;">등록</button>');
		
		box_textarea.append(reply_content);
		
		area_l.append(btnTab.append($('<span class ="ico_bbs ico_lock" id = "lock">비밀글</span>',{}))).appendTo(wrap_menu);
		area_r.append(num_text.append(sr_only1).append(num_count.append(' / ')).append(sr_only2.append(' 600')));
		area_r.append(btn_group.append(cmntWriteBtn));
		area_r.appendTo(wrap_menu);

		inner_text_write.append(box_textarea).append(wrap_menu);
		comment_replyWrite.append(inner_text_write);
		comment_replyWrite.appendTo($('.comment_section'));
	} else {
		reply.html('답글');
		$('.comment_replyWrite').remove();
	}
}
//});

/* 동적으로 생기는 대댓 쓰는 창에 있는 비밀댓글버튼 */
$(document).on('click', '.comment_replyWrite .btnTab span#lock', function(){
	if($(this).hasClass('ico_lock')){
		$(this).removeClass('ico_lock');
		$(this).addClass('ico_lock_on');
		secret = 'y';
	}else {
		$(this).removeClass('ico_lock_on');
		$(this).addClass('ico_lock');
		secret = 'n';
	}
});

$(document).on('click', '#cmntWrite', function(){
	alert("비밀댓글 ?"+secret);
});
