<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- security -->
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />
<!-- address api -->
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=735ae71a38f530c8fd4270c8a6ebb0be&libraries=services"></script>
<title>이미지 폼</title>
</head>
<body>
<!-- 파일을 업로드 하려면 enctype="multipart/form-data"가 꼭 있어야하는데 이는 post 방식으로만 처리한다  -->
<form name="resWriteForm" id="resWriteForm" method="post" enctype="multipart/form-data" action="/FoodFighter/admin/resWrite">
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
				<input type="text" name="resAddress" id="resAddress" placeholder="주소">
				<input type="button" id="postSearchBtn" onclick="postSearch()" value="주소 검색"><br>
				<div id="resAddressDiv"></div>
				
			</td>
		</tr>
		<tr>
			<td width="100" align="center">전화번호</td>
			<td>
				<input type="text" size="10" name="resTel" id="resTel">
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
	<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
</form>
</body>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="/FoodFighter/resources/js/admin/resAddress.js"></script>
<!-- 주소입력 API -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function postSearch() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                
                document.getElementById("resAddress").value = addr;
              
            }
        }).open();
    }
</script>
<!-- 가게 데이터 등록 버튼 -->
<script type="text/javascript">
	$('#resWriteBtn').click(function(){
		$('#resNameDiv').empty();
		$('#resTelDiv').empty();
		$('#resScoreDiv').empty();
		$('#resAddress').empty();
		$('#resThemeDiv').empty();
		$('#resPriceDiv').empty();
		$('#resHoursDiv').empty();
		$('#resClosingDiv').empty();
		$('#image1Div').empty();
		
		
		if($('#resName').val() == ''){
			$('#resNameDiv').text('가게 이름을 입력하세요');
			$('#resNameDiv').css('color', 'red');
			$('#resNameDiv').css('font-size', '8pt');
			$('#resNameDiv').css('font-weight', 'bold');
		}else if($('#resAddress').val() == ''){
			$('#resAddressDiv').text('가게 주소를 입력하세요');
			$('#resAddressDiv').css('color', 'red');
			$('#resAddressDiv').css('font-size', '8pt');
			$('#resAddressDiv').css('font-weight', 'bold');
		}else if($('#resTel').val() == ''){
			$('#resTelDiv').text('전화번호를 입력하세요');
			$('#resTelDiv').css('color', 'red');
			$('#resTelDiv').css('font-size', '8pt');
			$('#resTelDiv').css('font-weight', 'bold');
		}else if($('#resScore').val() == ''){
			$('#resScoreDiv').text('평점을 입력하세요');
			$('#resScoreDiv').css('color', 'red');
			$('#resScoreDiv').css('font-size', '8pt');
			$('#resScoreDiv').css('font-weight', 'bold');
		}else if($('#resTheme').val() == ''){
			$('#resThemeDiv').text('가게테마를 입력하세요');
			$('#resThemeDiv').css('color', 'red');
			$('#resThemeDiv').css('font-size', '8pt');
			$('#resThemeDiv').css('font-weight', 'bold');
		}else if($('#resPrice').val() == ''){
			$('#resPriceDiv').text('가격대를 입력하세요');
			$('#resPriceDiv').css('color', 'red');
			$('#resPriceDiv').css('font-size', '8pt');
			$('#resPriceDiv').css('font-weight', 'bold');
		}else if($('#resHours').val() == ''){
			$('#resHoursDiv').text('영업시간을 입력하세요');
			$('#resHoursDiv').css('color', 'red');
			$('#resHoursDiv').css('font-size', '8pt');
			$('#resHoursDiv').css('font-weight', 'bold');
		}else if($('#resClosing').val() == ''){
			$('#resClosingDiv').text('휴업일을 입력하세요');
			$('#resClosingDiv').css('color', 'red');
			$('#resClosingDiv').css('font-size', '8pt');
			$('#resClosingDiv').css('font-weight', 'bold');
		}else {
			document.resWriteForm.submit();
			
			$.ajax({
				type : 'post',
				enctype : 'multipart/form-data',
				processData : false,
				contentType : false,
				url : '/FoodFighter/admin/resWrite',
				data : new FormData($('#resWriteForm')[0]),
				success : function(){
					alert("저장 완료");
					location.href="/FoodFighter/review/reviewNonSearchList";
				}, error : function(err){
					console.log(err);
				}
				
			});
		}
		
	});
$(document).ready(function(){
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    $(document).ajaxSend(function(e, xhr, options) {
        xhr.setRequestHeader(header, token);
    });
});
</script>
</html>