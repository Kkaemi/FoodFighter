// review 검색
$('#reviewSearchBtn').click(function(){
    var searchIcon = $('#reviewSearchInput').val();
    $('#reviewSearchInput').empty();
    

    // 검색어 미입력
    if($('#reviewSearchInput').val() == ''){
        alert('검색어를 입력해주세요');
    }else{
        $.ajax({
            type : 'post',
            url : 'something',// 컨트롤러 위치 
            data : searchIcon,
            success : function(data){
                alert("검색어 넘기기 성공");
                location.href = '/';
                // 검색어에 따른 페이지

            }, 
            error : function(err){
                console.log(err);
            }
        });
    }
});