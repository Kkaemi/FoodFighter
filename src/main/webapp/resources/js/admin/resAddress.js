// 가게 데이터 주소입력
$('#resAddress').click(function(){
	$('#resAddress').empty();
	window.open("/FoodFighter/jsp/admin/checkPost", "", "width=600,height=600,scrollbars=yes");

});


$('#postSearchBtn').click(function(){
	$('#resAddress').empty();
	
	if($('#resAddress').val() == ''){
		$('#resAddressDiv').text('주소 입력');
		$('#resAddressDiv').css('color', 'red');
		$('#resAddressDiv').css('font-size', '8pt');
		$('#resAddressDiv').css('font-weight', 'bold');
	}else{
		$.ajax({
			type: 'post',
			url: '/springProject/member/postSearch',
			data: $('#checkPostForm').serialize(),
			dataType: 'json',
			success : function(data){
				//console.log(JSON.stringify(data));
				
				$('#postTable tr:gt(2)').remove();
				
				$.each(data.list, function(index, items){
					let address = items.sido+' '
								+ items.sigungu+' '
								+ items.yubmyundong+' '
								+ items.ri+' '
								+ items.roadname+' '
								+ items.buildingname;
								
					address	= address.replace(/null/g, '');							
								
					$('<tr/>').append($('<td/>',{
						align: 'center',
						text: items.zipcode
					})).append($('<td/>',{
						colspan: '3'
						}).append($('<a/>',{
							href: '#',
							id: 'addressA',
							text: address
						}))
					).appendTo($('#postTable'));    
				});//each
				
				//a태그를 클릭했을 때
				$('a').click(function(){
					alert($(this).parent().prev().text());
					
					$('#zipcode', opener.document).val($(this).parent().prev().text());
					$('#addr1', opener.document).val($(this).text());
					$('#addr2', opener.document).focus();
					window.close();
				});
				
			},
			error: function(e){
				console.log(e);
			}
		});
	}
});

