/* 댓글 비활성화 클릭 불가 */
$('.btnTab').click(function(){return false;});
$('#commentWrite').click(function(){return false;});
$('.cmt_num').click(function(){return false;});

$(document).ready(function(){
	var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    $(document).ajaxSend(function(e, xhr, options) {
        xhr.setRequestHeader(header, token);
    });
	$('.adminModify').css('display', 'none');
	$('.adminDelete').css('display', 'none');
	$('#adminWrite').attr({disabled : 'true',style : 'color : #bbb'});

	/* 댓글 비활성화 */
	$('#comment_info').attr({disabled : 'true', style : 'color : #bbb'});
	$('#commentWrite').attr({style : 'color : #bbb; cursor : default;'});
	$('.btnTab').attr({style : 'color : #bbb; cursor : default; outline : none;'});
	$('#reply').attr({disabled : true, style : 'cursor : default; outline : none;'});

	/* 관리자 모드 */
	if(id == '관리자'){
		$('.adminModify').show();
		$('.adminDelete').show();
		$('#adminWrite').removeAttr('disabled'); 
		$('#adminWrite').attr('style', 'color : red');
	}
});
$('#adminWrite').click(function(){
	if(id == '관리자'){
		if (nSrchOption != '' && nKeyword != ''){
			location.href = 'communityNoticeWriteForm?nseq='+nseq+'&nSrchOption='+nSrchOption+'&nKeyword='+nKeyword;
		}else {
			location.href = 'communityNoticeWriteForm?nseq='+nseq;
		}
	}else {
		alert("관리자만 작성할 수 있습니다.");
	}
});
$('.adminModify').click(function(){
	if (nSrchOption != '' && nKeyword != ''){
		location.href = 'communityNoticeModifyForm?nseq='+nseq+'&nSrchOption='+nSrchOption+'&nKeyword='+nKeyword;
	}else {
		location.href = 'communityNoticeModifyForm?nseq='+nseq;
	}
});
$('.adminDelete').click(function(){
	if(confirm("정말로 삭제하시겠습니까?")){
		$.ajax({
			type : "POST",
        	url : 'communityNoticeDelete',
        	data : 'nseq='+nseq,
        	success: function() {
		    	alert("선택한 글을 삭제했습니다.");
		    	location.href='communityNotice';
       		},
	        error : function(err){
		       alert("실패"+JSON.stringify(err));
	        }
		});
	}
});