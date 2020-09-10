/*자유게시판 목록*/
/* 관리자 모드 */
if(id == '관리자'){
	$('.adminDelete').show(); //지워야되는건지 확인?
	
	let col = document.createElement('col');
	col.setAttribute('width', '45');
	let colgroup = $('#colgroup');
	colgroup.prepend(col);
	$('.adminDelete').show();
	$('<tr id = "admin"/>').append($('<td id = "allCheck"/>',{
	}).append($('<input type = "checkbox" id = "allSelect"/>',{
	}))).append($('<td/>',{
		align: 'center',
		colspan : 4
	})).append($('<td/>',{
		align: 'center'
	}).append($('<input type = "button" value ="삭제" class = "plain-btn" id = "delete" />'),{
	})).prependTo($('thead'));
}

/* 회원일 때만 글쓰기 가능 */
if(id != ''){
	$('#write').show();
}

$(document).ready(function(){
	var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    $(document).ajaxSend(function(e, xhr, options) {
        xhr.setRequestHeader(header, token);
    });

	/* 검색 결과 */
	if($('.bSrchOption').val() == 'nickname') {
		$("#bSrchOption option:eq(2)").attr("selected", "select");
	}else if($('.bSrchOption').val() == 'content') {
		$("#bSrchOption option:eq(1)").attr("selected", "select");
	}else {
		$("#bSrchOption option:eq(0)").attr("selected", "select");
	}
});

/* 전체 선택 시 모든 체크박스 선택 */
$(document).on('click', '#allSelect', function(){
	let select = $('.select');
	
	let allSelect = $(this).is(":checked");
	
	if(allSelect) {
		select.prop('checked', true);
	}else  {
		select.prop('checked', false);
	}
});

/* 선택된 체크박스가 있으면 전체선택 해제 */
$('.select').on('click', function(){
	let select = $('.select').is(":checked");
	if(select == select.length){
		$('#allSelect').prop('checked', true);
	}else {
		$('#allSelect').prop('checked', false);
	}
});

/* 자유게시판 목록에서 글 삭제 */
$(document).on('click', '#delete', function(){
	let select = $('.select');
	let count = 0;
	
	for(i=0; i < select.length; i++) {
		if(select[i].checked) {
			count++;
		}
	}
	if(count == 0){ /* 체크되어있지 않음 */ 
		alert("삭제할 항목을 선택하세요");
	}else { /* 체크 됨 */
		if(confirm("정말로 삭제하시겠습니까?")){
			let deleteSelect = [];
			$('.select:checked').each(function(i){
				deleteSelect.push($(this).val());
			});
			
			let list = {"deleteSelect" : deleteSelect};
			$.ajax({
				type : "POST",
	        	url : 'communityBoardDeleteAdmin',
	        	data : list,
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

/* 자유게시판 검색 */
$('#bSrchBtn').click(function(){
	if($('#bKeyword').val() == ""){
		alert("검색어를 입력해주세요");
		$('#bKeyword').focus();
	}else {
		$('#boardSrch').submit();
	}
});

/* 공지사항 글 보기 */
$('#cBTable').on('click', '#subjectA', function(){
	let bseq = $(this).parent().parent().prev().text().trim();
	let bSrchOption = $('#bSrchOption').val();
	let bKeyword = $('#bKeyword').val();

	if(bKeyword == ''){
		$(location).attr("href", "communityBoardView?bseq="+bseq+"&pg="+$('#pg').val());
	}else {
		$(location).attr("href", "communityBoardView?bseq="+bseq+"&pg="+$('#pg').val()+"&bSrchOption="+bSrchOption+"&bKeyword="+bKeyword);
	}
});