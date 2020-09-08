//북마크이미지 변경
function bookmarkEvent() {
    if (document.getElementById("bookmark").src.match("../resources/img/bookmark.png")) {
        document.getElementById("bookmark").src = "../resources/img/bookmarked.png";
    } else {
        document.getElementById("bookmark").src = "../resources/img/bookmark.png";
    }   
}

//검색필터 중복 및 선택해제
$('.modal-body button').click(function(){
	if($(this).hasClass("check") == true) {
		 $(this).removeClass('check'); 
	}else {
		$(this).addClass('check');
	}
});

//모달 필터
$('.filter').click(function(){
	   var filter = $(this).attr('value');
	   alert(filter);
});