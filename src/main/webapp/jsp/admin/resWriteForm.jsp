<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>이미지 폼</title>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=x4xnbzhxl0"></script>
</head>
<body>
<!-- 파일을 업로드 하려면 enctype="multipart/form-data"가 꼭 있어야하는데 이는 post 방식으로만 처리한다  -->
<form name="resWriteForm" id="resWriteForm" method="post" enctype="multipart/form-data"
action="/FoodFighter/jsp/admin/resWriteForm">
	<table border="1" cellspacing="0" cellpadding="3">
		<tr>
			<td width="100" align="center">가게이름</td>
			<td>
				<input type="text" size="30" name="resName" id="resName" placeholder="가게이름 입력">
				<div id="resNameDiv"></div>
			</td>
		</tr>
		<tr>
			<td width="100" align="center">주소</td>
			<td>
				<input type="text" name="resAddress" id="resAddress" size=50 readonly placeholder="가게 주소입력">
				<div id="checkPostDiv"></div>
			</td>
		</tr>
		<tr>
			<td width="100" align="center">전화번호</td>
			<td>
				<input type="text" size="10" name="resTel1" id="resTel1">-
				<input type="text" size="10" name="resTel2" id="resTel2">-
				<input type="text" size="10" name="resTel3" id="resTel3">
				<div id="resTelDiv"></div>
			</td>
		</tr>
		<tr>
			<td width="100" align="center">평점</td>
			<td>
				<input type="text" size="30" name="resScore" id="resScore" placeholder="평점 입력(임의)">
				<div id="resScoreDiv"></div>
			</td>
		</tr>
		<tr>
			<td width="100" align="center">가게 테마</td>
			<td>
				<input type="text" size="30" name="resTheme" id="resTheme" placeholder="가게 테마">
				<div id="resThemeDiv"></div>
			</td>
		</tr>
		<tr>
			<td width="100" align="center">가격대</td>
			<td>
				<input type="text" size="30" name="resPrice" id="resPrice" placeholder="가격대">
				<div id="resPriceDiv"></div>
			</td>
		</tr>
		<tr>
			<td width="100" align="center">영업시간</td>
			<td>
				<input type="text" size="30" name="resHours" id="resHours" placeholder="영업시간 ">
				<div id="resHoursDiv"></div>
			</td>
		</tr>
		<tr>
			<td width="100" align="center">휴업일</td>
			<td>
				<input type="text" size="30" name="resClosing" id="resClosing" placeholder="휴업일">
				<div id="resClosingDiv"></div>
			</td>
		</tr>
		<tr>
			<td width="100" align="center">대표메뉴</td>
			<td>
				<input type="text" size="30" name="resMenu" id="resMenu" placeholder="대표메뉴">
				<div id="resMenuDiv"></div>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="file" name="img" id="resImage1" size="50">
				<div id="image1Div"></div>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="file" name="img" id="resImage2" size="50">
				<div id="image1Div"></div>
			</td>
		</tr>
		<!-- 이미지 드래그해서 보내는 부분 -->
		<tr>
			<td colspan="2">
				<input type="file" name="img[]" id="resImageImage3" size="50" multiple="multiple">
				<div id="image1Div"></div>
			</td>
		</tr>		
		<tr>
			<td colspan="2" align="center">		
			<input type="button" value="가게 등록" id="resWriteBtn"> 
			<input type="reset" value="다시작성 ">
			
			</td>
				
		</tr>
	</table>


</form>
</body>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">

$('#resWriteBtn').click(function(){
	$('#resNameDiv').empty();
	$('#resScoreDiv').empty();
	$('#resTelDiv').empty();
	$('#resAddressDiv').empty();
	$('#imageContentDiv').empty();
	$('#image1Div').empty();
	
	if($('#imageId').val() == 'img_' || $('#imageId').val() == ''){
		$('#imageIdDiv').text('상품코드를 입력하세요');
		$('#imageIdDiv').css('color', 'red');
		$('#imageIdDiv').css('font-size', '8pt');
		$('#imageIdDiv').css('font-weight', 'bold');
	}else if($('#imageName').val() == ''){
		$('#imageNameDiv').text('상품이름을 입력하세요');
		$('#imageNameDiv').css('color', 'red');
		$('#imageNameDiv').css('font-size', '8pt');
		$('#imageNameDiv').css('font-weight', 'bold');
	}else if($('#imagePrice').val() == ''){
		$('#imagePriceDiv').text('상품단가을 입력하세요(숫자만 입력)');
		$('#imagePriceDiv').css('color', 'red');
		$('#imagePriceDiv').css('font-size', '8pt');
		$('#imagePriceDiv').css('font-weight', 'bold');
	}else if($('#imageQty').val() == ''){
		$('#imageQtyDiv').text('상품갯수를 입력하세요(숫자만 입력)');
		$('#imageQtyDiv').css('color', 'red');
		$('#imageQtyDiv').css('font-size', '8pt');
		$('#imageQtyDiv').css('font-weight', 'bold');
	}else if($('#imageContent').val() == ''){
		$('#imageContentDiv').text('내용을 입력하세요');
		$('#imageContentDiv').css('color', 'red');
		$('#imageContentDiv').css('font-size', '8pt');
		$('#imageContentDiv').css('font-weight', 'bold');
	} else {
	//	document.imageBoardWriteForm.submit();
		$.ajax({
			type : 'post',
			enctype : 'multipart/form-data',
			processData : false,  // 문자열이 아닌 파일형식으로 보내줌
			contentType : false,
			url : '/FoodFighter/jsp/restaurant/resWriteForm',
			data : new FormData($('#resWriteForm')[0]),
			// imageBoardWriteForm 안에 있는 모든 데이터 다 가지고 간다
			success : function(){
				alert("이미지 저장 완료");
				location.href="../jsp/review/review_nonSearchList";
				
			},error : function(err){
				console.log(err);
			
			}
				
			});
		}
});
</script>
<script type="text/javascript" src="/FoodFighter/resources/js/admin/resAddress.js"></script>

</html>