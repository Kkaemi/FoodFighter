$('#headerUser').click(function(){
	$('#headUser-menu').modal();
});

/* 자유게시판 글쓰기 + 글수정 썸머노트*/
$(document).ready(function(){
	var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    $(document).ajaxSend(function(e, xhr, options) {
        xhr.setRequestHeader(header, token);
    });
    
	if(id == ''){
		alert("로그인 후 이용 가능한 서비스입니다.");
		location.href='/FoodFighter/login/loginForm';
	} else 
	$('#summernote').summernote({
	    tabsize: 2,
	    height: 450,
	    minHeight : null,
	    maxHeight : null,
	    placeholder: '최대 2084자까지 쓸 수 있습니다.',
	    callbacks: {
			onImageUpload: function(files, editor, welEditable) {
	            	boardWriteImage(files[0], editor, welEditable);
	        }
		},
	    lang : "ko-KR",
	    toolbar: [
				    ['fontname', ['fontname']],
				    ['fontsize', ['fontsize']],
				    ['style', ['bold', 'italic', 'underline']],
				    ['insert',['picture','link']],
				    ['view', ['fullscreen', 'help']]
		  		],
		fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
	  });
	  
	 function boardWriteImage(file, editor, welEditable) {
    	let data = new FormData();
    	data.append('file', file);
      	$.ajax({
        	data : data,
        	type : "POST",
        	url : 'uploadBoardImage',
        	cache : false,
        	contentType : false,
        	enctype : 'multipart/form-data',
        	processData : false,
        	success: function(data) {
        		if(data == "noimage"){
	        		alert("이미지 파일만 업로드 가능합니다.");
		        } else{
		        	$("#summernote").summernote('insertImage',data);
		       	}
       		},
	        error : function(err){
		        alert("실패"+JSON.stringify(err));
	        }
		});
	}
});

$("div.note-editable").on('drop',function(e){
     for(i=0; i< e.originalEvent.dataTransfer.files.length; i++){
     	onImageUpload(e.originalEvent.dataTransfer.files[i],$("#summernote")[0]);
     }
    e.preventDefault();
})

/* 자유게시판 글쓰기 */
$('#write').click(function(){
	if ($('#subject').val().trim() == ''){
		alert("제목을 입력해주세요");
		$('#subject').focus();
	}else if ($('#summernote').val() == ''){
		alert("내용을 입력해주세요");
	} else {
		var markupStr = $('#summernote').summernote('code');
	  	let content = markupStr.replace(/&nbsp;/g, " ");
	  	
		$.ajax({
        	type : "POST",
        	url : 'communityBoardWrite',
        	data : $('#communityBoardWriteForm').serialize(),
        	success: function() {
		    	alert("작성하신 글을 저장하였습니다.");
		    	location.href='communityBoard';
       		},
	        error : function(err){
		        alert(err);
	        }
		});
	}
});

/* 자유게시판 글수정 */
$('#modify').click(function(){
	if ($('#subject').val().trim() == ''){
		alert("제목을 입력해주세요");
		$('#subject').focus();
	}else if ($('#summernote').val() == ''){
		alert("내용을 입력해주세요");
	} else {
		var markupStr = $('#summernote').summernote('code');
	  	let content = markupStr.replace(/&nbsp;/g, " ");
	  	let bseq = $('#bseq').val();
	  	let bSrchOption = $('#bSrchOption').val();
	  	let bKeyword = $('#bKeyword').val();
		$.ajax({
        	type : "POST",
        	url : 'communityBoardModify',
        	data : $('#communityBoardModifyForm').serialize(),
        	success: function() {
		    	alert("작성하신 글을 수정하였습니다.");
		    	if (bSrchOption != '' && bKeyword != ''){
					location.href = "communityBoardView?bseq="+bseq+"&bSrchOption="+bSrchOption+"&bKeyword="+bKeyword;
				}else {
					location.href = "communityBoardView?bseq="+bseq;
				}
       		},
	        error : function(err){
		        alert(err);
	        }
		});
	}
});

/* 자유게시판 답글쓰기 */
$('#reply').click(function(){
	if ($('#subject').val().trim() == ''){
		alert("제목을 입력해주세요");
		$('#subject').focus();
	}else if ($('#summernote').val() == ''){
		alert("내용을 입력해주세요");
	} else {
		var markupStr = $('#summernote').summernote('code');
	  	let content = markupStr.replace(/&nbsp;/g, " ");
	  	$.ajax({
        	type : "POST",
        	url : 'communityBoardReply',
        	data : $('#communityBoardReplyForm').serialize(),
        	success: function() {
		    	alert("작성하신 글을 저장하였습니다.");
		    	location.href='communityBoard';
       		},
	        error : function(err){
		        alert(err);
	        }
		});
	}
});