/*공지사항 글쓰기 + 글수정 썸머노트*/
$(document).ready(function(){
	var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    $(document).ajaxSend(function(e, xhr, options) {
        xhr.setRequestHeader(header, token);
    });
    
	if(id != '관리자'){
		alert("접근 권한이 없습니다");
		location.href='communityNotice';
	} else 
	$('#summernote').summernote({
	    tabsize: 2,
	    height: 450,
	    minHeight : null,
	    maxHeight : null,
	    placeholder: '최대 2084자까지 쓸 수 있습니다.',
	    callbacks: {
			onImageUpload: function(files, editor, welEditable) {
	            	noticeWriteImage(files[0], editor, welEditable);
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
	  
	 function noticeWriteImage(file, editor, welEditable) {
    	let data = new FormData();
    	data.append('file', file);
      	$.ajax({
        	data : data,
        	type : "POST",
        	url : 'uploadNoticeImage',
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

/* 공지사항 글쓰기 */
$('#write').click(function(){
	if ($('#subject').val().trim() == '[공지사항]' || $('#subject').val().trim() == ''){
		alert("제목을 입력해주세요");
		$('#subject').focus();
	}else if ($('#summernote').val() == ''){
		alert("내용을 입력해주세요");
	} else {
		var markupStr = $('#summernote').summernote('code');
	  	let content = markupStr.replace(/&nbsp;/g, " ");
	  	
		$.ajax({
        	type : "POST",
        	url : 'communityNoticeWrite',
        	data : $('#communityNoticeWriteForm').serialize(),
        	success: function() {
		    	alert("작성하신 글을 저장하였습니다.");
		    	location.href='communityNotice';
       		},
	        error : function(err){
		        alert(err);
	        }
		});
	}
});

/* 공지사항 글수정 */
$('#modify').click(function(){
	if ($('#subject').val().trim() == '[공지사항]' || $('#subject').val().trim() == ''){
		alert("제목을 입력해주세요");
		$('#subject').focus();
	}else if ($('#summernote').val() == ''){
		alert("내용을 입력해주세요");
	} else {
		var markupStr = $('#summernote').summernote('code');
	  	let content = markupStr.replace(/&nbsp;/g, " ");
	  	let nseq = $('#nseq').val();
	  	let nSrchOption = $('#nSrchOption').val();
	  	let nKeyword = $('#nKeyword').val();
		$.ajax({
        	type : "POST",
        	url : 'communityNoticeModify',
        	data : $('#communityNoticeModifyForm').serialize(),
        	success: function() {
		    	alert("작성하신 글을 수정하였습니다.");
		    	if (nSrchOption != '' && nKeyword != ''){
					location.href = "communityNoticeView?nseq="+nseq+"&nSrchOption="+nSrchOption+"&nKeyword="+nKeyword;
				}else {
					location.href = "communityNoticeView?nseq="+nseq;
				}
       		},
	        error : function(err){
		        alert(err);
	        }
		});
	}
});