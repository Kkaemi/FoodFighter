//header부분 키워드 입력 시, 검색 버튼 나타는 기능
$('.header_searchInput').click(function(){
	$('#header_searchBtn').addClass('show');
});

//검색 클릭 시, 키워드전송
$('#header_searchBtn').click(function(){
	if($('#keyword').val() == ''){
		alert('검색어를 입력하세요');
		return false;
	}else{
		document.headerForm.submit(); 
	}
});

//메인 검색
$('#Intro_searchBtn').click(function(){
	document.searchMainForm.submit(); 
});

