 /* 자유게시판 상세보기 */

/* 회원일 때만 글쓰기 가능 */
if(id != ''){
	$('#write').show();
	$('.reply').show();
	$('#cmnt_write').removeAttr('disabled');
	$('.modify').css('display', 'none');
	$('.delete').css('display', 'none');
} else {
	$('#write').css('display', 'none');
	$('.reply').css('display', 'none');
	$('.modify').css('display', 'none');
	$('.delete').css('display', 'none');
	$('#cmnt_write').attr({disabled : true, style : 'cursor : default; outline : none;'});
}
if (id == author){ /* 작성자일 때만 수정,삭제 보이기 */
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

$('#comment_info').click(function(){
	if($('.comment_list li').length){
		$('.comment_list li').remove();
		$('.simple_paging').css('display', 'none');
		$('.comment_write').css('display', 'none');
	} else {
		cmntList('1');
		$('.simple_paging').show();
		$('.comment_write').show();
	}
});

/* 댓글 작성 */
let secret = 'n';
$('#cmntWriteBtn').click(function(){
	rcontent = $('#cmnt_rcontent').val();
	if(id == ''){
		alert("로그인 후 이용 가능한 서비스입니다.");
		location.href='/FoodFighter/login/loginForm';
	}else {
		if(rcontent == ''){
			alert("댓글 내용을 입력해주세요");
			rcontent.focus();
		}else {
			$.ajax({
				type : "POST",
				url : 'communityBoardCmntWrite',
				data :{'bseq' : bseq,
						'rcontent' : rcontent,
						'rnickname' : id,
						'secret' : secret},
				success: function() {
			    	$('#cmnt_rcontent').val("");
			    	if($('#lock').hasClass('ico_lock_on')){
			    		$('#lock').removeClass('ico_lock_on');
			    		$('#lock').addClass('ico_lock_state');
			    	}
			    	cmntList('1');
	       		},
		        error : function(err){
			       alert("실패"+JSON.stringify(err));
		        }
			});
		}
	}
});

$('.cmnt').keyup(function (e){
    var rcontent = $(this).val();
    $('.num_count').html(rcontent.length); 

    if (rcontent.length > $(this).attr('maxlength')){
        $('.num_count').attr('style', 'color : red;');
    } else {
      	$('.num_count').removeAttr('style', 'color : red;');
	}
});

/* 댓글 쓰는 창에 있는 비밀댓글버튼 */
$('.comment_write').on('click', '.inner_text_write .btnTab span#lock', function(){
	if($(this).hasClass('ico_lock_state')){
		$(this).removeClass('ico_lock_state');
		$(this).addClass('ico_lock_on');
		secret = 'y';
	}else {
		$(this).removeClass('ico_lock_on');
		$(this).addClass('ico_lock_state');
		secret = 'n';
	}
});

$(document).ready(function(){
	cmntList(1);
});

/* 댓글 리스트 */
function cmntList(num){
	$.ajax({
		type : "GET",
		url : 'communityBoardCmntList',
		data :{'bseq' : bseq,
				'num' : num},
		dataType: 'json',
		success : function(data){
			var cmnt_N = "";
			var cmnt_Y = "";
			$('.comment_list').empty();
			if(data == null){
			}else {
				$('#comment_list').empty();
				$.each(data.list, function(index, items){
						if(items.rlev != 0){
							cmnt_N += '<div class = "reply_section" id = "cmt_'+index+'">';
						}else {
		    				cmnt_N 	+= '<li class = "comment_section'+bseq+'" id = "cmt_'+index+'">';
						}

						cmnt_N	+= '<div class = "pic">';
							if(items.profile != null){
								cmnt_N	+= '<img src = "/FoodFighter/storage/profile/'+items.profile+'"/>';
							} else {
							
							}
						cmnt_N	+= '</div>';
						cmnt_N	+= '<div class ="info">';
							cmnt_N	+= '<div class ="comment_post">';
								cmnt_N	+= '<div class = "data">';
									cmnt_N	+= '<span class = "txt_name'+index+'" id = "txt_name'+index+'">'+items.rnickname+'</span>';
								cmnt_N	+= '</div>';
								cmnt_N	+= '<span class = "txt_date">'+items.rlogtime+'</span>';
								cmnt_N	+= '<div class = "comment_cont">'+items.rcontent+'</div>';
							cmnt_N	+= '</div>';
						cmnt_N	+= '</div>';
						cmnt_N	+= '<div class ="option" id = "option'+index+'">';
					
						if(items.rnickname == id){ /* 해당 댓글작성자만 수정 */
							cmnt_N	+= '<div class ="dropdown">';
						} else {
							cmnt_N	+= '<div class ="dropdown" style ="visibility: hidden;">';
						}
								cmnt_N	+= '<button type = "button" data-toggle = "dropdown" class ="dropdown-toggle">';
									cmnt_N	+= '<span class ="ico_bbs ico_more"></span>';
								cmnt_N	+= '</button>';
								cmnt_N	+= '<ul class = "dropdown-menu">';
									cmnt_N	+= '<li id = "cmntM"><a id = "cmnt_modify_'+index+'" onclick = "cmnt_modify('+index+','+items.rseq+','+items.rlev+','+num+')">수정</a></li>';
									cmnt_N	+= '<li id = "cmntD"><a id = "cmnt_delete'+index+'" onclick = "cmnt_delete('+items.rseq+')">삭제</a></li>';
								cmnt_N	+= '</ul>';
							cmnt_N	+= '</div>';
							cmnt_N	+= '<div class = "comment_reply" id = "comment_reply">';
								cmnt_N	+= '<a href ="javascript:" id ="cmnt_reply'+index+'" onclick = "cmnt_reply('+index+','+items.rseq+','+items.rlev+','+num+')">답글</a>';
							cmnt_N	+= '</div>';
						cmnt_N	+= '</div>';
						
						if(items.rlev != 0){
							cmnt_N += '</div>';
						}else {
							cmnt_N	+= '</li>';
						}
					
						/* 비밀 댓글 */
						if(items.rlev != 0){
							cmnt_Y += '<div class = "reply_section" id = "cmt_'+index+'">';
						}else {
							cmnt_Y  += '<li class = "comment_section'+bseq+'" id = "cmt_'+index+'" style = " padding: 15px 0 15px 68px !important;">';
						}
						cmnt_Y	+= '<div class = "secretIcon">';
							cmnt_Y	+= '<img class ="ico_bbs ico_lock" id = "lock" src = "/FoodFighter/resources/img/community/boardImg/lock.svg"/>';
						cmnt_Y	+= '</div>';
						cmnt_Y	+= '<div class = "comment_cont">';
							cmnt_Y	+= '<span id = "secret">해당 댓글은 댓글 작성자와 글 작성자만 볼 수 있습니다.</span>';
							cmnt_Y	+= '<span class = "txt_date" style = "float : initial !important;">'+items.rlogtime+'</span>';
						cmnt_Y	+= '</div>';
						
						if(items.rlev != 0){
							cmnt_Y += '</div>';
						}else {
							cmnt_Y	+= '</li>';
						}
						
					if(items.secret.trim() == 'y'){
						if(id != items.rnickname && id != '관리자' && id != author){
                   			if(items.rlev != 0) {
                   				$('.comment_section'+bseq).append(cmnt_Y);
                   			}else {
	                       		$('.comment_list').append(cmnt_Y);
                   			}
                   		}else {
               				if(items.rlev != 0){
               					$('.comment_section'+bseq).append(cmnt_N);
               				}else {
	                   			$('.comment_list').append(cmnt_N);
               				}
                   		}
                    }else {
                    	if(items.rlev != 0){
           					$('.comment_section'+bseq).append(cmnt_N);
           				}else {
                   			$('.comment_list').append(cmnt_N);
           				}
                    }
               
               		cmnt_Y = "";
               		cmnt_N = "";
				});//each
				
				//페이징 처리
				$('#simple_paging').html(data.cmntPaging.pagingHTML);
			}//if(data == null or != null)
   		},//success
        error : function(err){
	       alert("실패"+JSON.stringify(err));
        }
	});
}

/* 댓글 수정 */
function cmnt_modify(index, rseq, rlev, num){
	$.ajax({
		type : "GET",
		url : 'communityBoardCmntView',
		data :{'bseq' : bseq,
				'rseq' : rseq},
		dataType : 'json',
		success : function(data){
			let cmnt_modify = '<div class = "comment_modify" id = "comment_modify'+index+'">'
							+ '<div class ="inner_text_write">'
								+ '<div class = "box_textarea">'
								+ '<textarea placeholder="인터넷은 우리가 함께 만들어가는 소중한 공간입니다. 댓글 작성 시 타인에 대한 배려와 책임을 담아주세요"	class = "cmnt" id = "cmnt_rcontent'+index+'" maxlength="600" style ="height : 86px;"></textarea>'
								+ '</div>'
								+ '<div class = "wrap_menu">'
									+ '<div class = "area_l">'
										+ '<button class = "btnTab">'
											+ '<span class ="ico_bbs ico_lock_state" id ="lock'+index+'">비밀글</span>'
										+ '</button>'
									+ '</div>'
									+ '<div class = "area_r">'
										+ '<span class ="num_text">'
											+ '<span class ="sr_only">글자수</span>'
											+ '<span class ="num_count'+index+'" style = "color : black;">0</span> / <span class ="sr_only">총 글자 개수</span> 600'
										+ '</span>'
										+ '<div class ="btn_group">'
											+ '<button class = "plain-btn" id = "cmntModifyBtn'+index+'" style ="background-color: red; color: white;">등록</button></a>'
											+ '<button class = "plain-btn" id = "cmntModifyCancelBtn'+index+'" style = "margin-left : 5px;">취소</button></a>'
										+ '</div>'
									+ '</div>'
								+ '</div>'
							+ '</div>'
						+ '</div>'
			if($('#comment_replyWrite'+index).length){
				$('#comment_replyWrite'+index).remove();
			} else if($('#comment_modify'+index).length) {
				$('#comment_modify'+index).remove();
			} else {
				if(rlev != 0) {
					$('#cmt_'+index).append(cmnt_modify);
				}else {
					$('#option'+index).after(cmnt_modify);
				}
			}
			//수정되기 전 댓글의 글자 수
			$('#cmnt_rcontent'+index).val(data.rcontent);
			let rc = $('#cmnt_rcontent'+index).val().length;
		    $('.num_count'+index).html(rc); 
			
			if(data.secret == 'y'){
				$('#lock'+index).removeClass('ico_lock_state');
				$('#lock'+index).addClass('ico_lock_on');
			}
			
			//취소버튼을 누르면 수정창 사라지기
			$('#cmntModifyCancelBtn'+index).on('click', function(){ 
				$('#cmt_'+index+' > #comment_modify'+index).remove();
			});
			
			//글자수 세기
			$('#cmnt_rcontent'+index).on('keyup', function (e){
				let cnt = $(this).val();
			    $('.num_count'+index).html(cnt.length);
			    let num_cnt = $('.num_count'+index);
			});
			
			/* 비밀댓글버튼 */
			let msecret = 'n';
			$('#comment_modify'+index).on('click', '#lock'+index, function(){
				if($(this).hasClass('ico_lock_state')){
					$(this).removeClass('ico_lock_state');
					$(this).addClass('ico_lock_on');
					msecret = 'y';
				}else {
					$(this).removeClass('ico_lock_on');
					$(this).addClass('ico_lock_state');
					msecret = 'n';
				}
			});
			
			//댓글 수정
			$('#cmntModifyBtn'+index).on('click', function(){
				var cmnt_rcontent = $('#cmnt_rcontent'+index);
				if (cmnt_rcontent.val() == ''){
					alert("댓글 내용을 입력해주세요");
					cmnt_rcontent.focus();
				}else {
					$.ajax({
						type : "POST",
						url : 'communityBoardCmntModify',
						data :{'rseq' : rseq,
							   'rcontent' : cmnt_rcontent.val(),
							   'secret' : msecret},
						success : function(){
							$('#comment_modify'+index).remove();
							cmntList(num);
						},//success
				        error : function(err){
					       alert("실패"+JSON.stringify(err));
				        }
			    	});
				}
			});
			
		},//success
        error : function(err){
	       alert("실패"+JSON.stringify(err));
        }
    });//ajax 
}

/* 댓글 삭제 */
function cmnt_delete(rseq){
	if(confirm("정말로 삭제하시겠습니까?")){
		$.ajax({
			type : "POST",
			url : 'communityBoardCmntDelete',
			data : 'rseq='+rseq,
			success: function() {
		    	cmntList();
       		},
	        error : function(err){
		       alert("실패"+JSON.stringify(err));
	        }
		});
	}
}

/* 대댓 작성 */
function cmnt_reply(index, rseq, rlev, num){
	if (id == ''){
					alert("로그인 후 이용 가능한 서비스입니다.");
					location.href='/FoodFighter/login/loginForm';
	} else {
		let cmnt_reply = '<div class = "comment_replyWrite" id = "comment_replyWrite'+index+'">'
						+ '<div class ="inner_text_write">'
						+ '<div class = "box_textarea">'
						+ '<textarea placeholder="인터넷은 우리가 함께 만들어가는 소중한 공간입니다. 댓글 작성 시 타인에 대한 배려와 책임을 담아주세요"	class = "cmntR" id = "cmntR_rcontent'+index+'" maxlength="600" style ="height : 86px;"></textarea>'
						+ '</div>'
						+ '<div class = "wrap_menu">'
						+ '<div class = "area_l">'
						+ '<button class = "btnTab">'
						+ '<span class ="ico_bbs ico_lock_state" id ="lock'+index+'">비밀글</span>'
						+ '</button>'
						+ '</div>'
						+ '<div class = "area_r">'
						+ '<span class ="num_text">'
						+ '<span class ="sr_only">글자수</span>'
						+ '<span class ="num_count'+index+'" style = "color : black;">0</span> / <span class ="sr_only">총 글자 개수</span> 600'
						+ '</span>'
						+ '<div class ="btn_group">'
						+ '<button class = "plain-btn" id = "cmntReplyBtn'+index+'" style ="background-color: red; color: white;">등록</button></a>'
						+ '</div>'
						+ '</div>'
						+ '</div>'
						+ '</div>'
						+ '</div>'
			//$('#cmt_'+index+' > #comment_replyWrite'+index).remove();
			
			
			if($('#comment_modify'+index).length){
				$('#comment_modify'+index).remove();
			} else if($('#comment_replyWrite'+index).length) {
				$('#comment_replyWrite'+index).remove();
				$('#cmnt_reply'+index).text('답글')
			} else {
				if(rlev != 0) {
					$('#cmt_'+index).append(cmnt_reply);
					$('#cmnt_reply'+index).text('접기')
				}else {
					$('#option'+index).after(cmnt_reply);
					$('#cmnt_reply'+index).text('접기')
				}
			}

			//글자수 세기
			$('#cmntR_rcontent'+index).on('keyup', function (e){
				let cnt = $(this).val();
			    $('.num_count'+index).html(cnt.length);
			    let num_cnt = $('.num_count'+index);
			});
			
			/* 비밀댓글버튼 */
			let rsecret = 'n';
			$('#comment_replyWrite'+index).on('click', '#lock'+index, function(){
				if($(this).hasClass('ico_lock_state')){
					$(this).removeClass('ico_lock_state');
					$(this).addClass('ico_lock_on');
					rsecret = 'y';
				}else {
					$(this).removeClass('ico_lock_on');
					$(this).addClass('ico_lock_state');
					rsecret = 'n';
				}
			});

			//대댓글 작성
			$('#cmntReplyBtn'+index).on('click', function(){
				var cmntR_rcontent = $('#cmntR_rcontent'+index);
				if (cmntR_rcontent.val() == ''){
					alert("댓글 내용을 입력해주세요");
					cmntR_rcontent.focus();
				}else {
					var rnick = $('#txt_name'+index).text();
					
					$.ajax({
						type : "POST",
						url : 'communityBoardCmntReply',
						data :{'bseq' : bseq,
							   'rseq' : rseq,
							   'rcontent' : cmntR_rcontent.val(),
							   'rnickname' : rnick, //원댓 작성자
							   'rcnickname' : id, //대댓쓰는 작성자
							   'secret' : rsecret},
						success : function(){
							$('#comment_replyWrite'+index).remove();
							$('#cmnt_reply'+index).text('답글')
							cmntList(num);
						},//success
				        error : function(err){
					       alert("실패"+JSON.stringify(err));
				        }
			    	});//ajax
				}
			});
		}
}

