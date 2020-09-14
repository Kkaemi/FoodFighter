//유효성검사 
$(document).ready(function(){
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    $(document).ajaxSend(function(e, xhr, options) {
        xhr.setRequestHeader(header, token);
    });
});

//다시작성 
$('#resetBtn').click(function(){
	if(confirm("지금까지 작성하신걸 지우시겠습니까?")){
		$('#content').empty();
		$('span.on').removeClass('on');
		$('.filebox div').not('div.file_input').remove();
		$('.ReviewPictureCounter__CurrentLength').text('0');
		document.getElementById("ex_file").disabled=false; 
	}else{
		return false;
	}
});

//별 평점
$('.starRev>span').click(function(){
   $(this).parent().children('span.on').removeClass('on');
   $(this).addClass('on').prevAll('span').addClass('on');
   let resScore = $(this).attr('data-value');
	$('#resScore').val(resScore);
   
   return false;
});

//이지미업로드
let arr_total = 0;
$(document).ready(function (e){
  $("input[type='file']").change(function(e){

    //div 내용 비워주기
    $('#imageView').empty();

    let files = e.target.files;
    let arr =Array.prototype.slice.call(files);
	
    //업로드 가능 파일인지 체크
    for(let i=0;i<files.length;i++){
      if(!checkExtension(files[i].name,files[i].size)){
        return false;
      }
    }
    
    preview(arr);
    
    
  });//file change
  
  function checkExtension(fileName,fileSize){

  	let regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
  	let maxSize = 20971520;  //20MB
    
    if(fileSize >= maxSize){
      alert('파일 사이즈 초과');
      $("input[type='file']").val("");  //파일 초기화
      return false;
    }
    
    if(regex.test(fileName)){
      alert('업로드 불가능한 파일이 있습니다.');
      $("input[type='file']").val("");  //파일 초기화
      return false;
    }
    return true;
  }
  
  
  function preview(arr){
      arr_total += arr.length; 
  	if(arr_total < 6){
	    	arr.forEach(function(f){
	        //div에 이미지 추가
	        let str = '<div style="display:inline-block; list-style:none; line-height: 89px; text-align: center;">';
	        //이미지 파일 미리보기
	        if(f.type.match('image.*')){
      	 let reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
	          	reader.onload = function (e) { //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
	       		  str += '<img src="'+e.target.result+'"id=viewImg style="display:inline-block; list-style:none;"'+'"width=89px; height=89px; />';
	   	          str += '</div>';
	   	           $(str).prependTo('.filebox');
	  	          }
		          reader.readAsDataURL(f);
		        }
	      });//arr.forEach
      }//if
      else{
          alert('최대 5개만 업로드 가능합니다');
          arr_total -= arr.length; 
      }
      $('.ReviewPictureCounter__CurrentLength').text(arr_total); //사진개수 입력란
	}//preview
});
