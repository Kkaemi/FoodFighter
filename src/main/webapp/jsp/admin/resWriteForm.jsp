<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- security -->
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />

<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">


 <link href="https://startbootstrap.github.io/startbootstrap-sb-admin-2/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
 <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
 <link href="https://startbootstrap.github.io/startbootstrap-sb-admin-2/css/sb-admin-2.min.css" rel="stylesheet">

<link rel="stylesheet" href="/FoodFighter/resources/css/admin/adminManagementStyle.css">
  
<link rel="stylesheet" href="/FoodFighter/resources/css/admin/adminResWriteForm.css">
<!-- address api -->
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=735ae71a38f530c8fd4270c8a6ebb0be&libraries=services"></script>
<title>이미지 폼</title>
</head>
<body>
<div id="wrapper">
	<!-- 사이드 메뉴 -->
    <ul class="navbar-nav bg-gradient-warning sidebar sidebar-dark accordion" id="accordionSidebar">

      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/FoodFighter">
        <div id="sidebar-logo-part" class="sidebar-brand-img"><img id="sidebar-logo" class="FFlogo" src="/FoodFighter/resources/img/logo.png"></div>
      </a>

      <hr class="sidebar-divider my-0">


      <li class="nav-item active">
        <a class="nav-link" href="/FoodFighter/admin/adminDashboard">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span>Dashboard</span></a>
      </li>


      <hr class="sidebar-divider">

      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
          <i class="fas fa-fw fa-cog"></i>
          <span>회원관리</span>
        </a>
        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <a class="collapse-item" href="/FoodFighter/admin/adminMemberManagement">회원목록</a>
          </div>
        </div>
      </li>

      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
          <i class="fas fa-fw fa-wrench"></i>
          <span>가게관리</span>
        </a>
        <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <a class="collapse-item" href="/FoodFighter/admin/adminShopManagement">가게 목록</a>
            <a class="collapse-item" href="/FoodFighter/admin/resWriteForm">가게 등록</a>
          </div>
        </div>
      </li>

      <hr class="sidebar-divider">
      <!-- Sidebar Toggler (Sidebar) -->
      <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div>

    </ul>
    <!-- 사이드 메뉴 끝 -->
    
    <div id="content-wrapper" class="d-flex flex-column">
      <!-- Main Content -->
      <div id="content">
        <!--  Page Content -->
        <div class="container-fluid">
        
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
							<input type="text" size="30" name="resTel" id="resTel">
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
					
					<tr>
						<td colspan="2" align="center">		
						<input type="button" value="가게 등록" id="resWriteBtn"> 
						<input type="reset" value="다시작성 ">
						
						</td>
							
					</tr>
				</table>
				<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
			
			</form>
		</div>
	 </div>
   </div>
</div>
</body>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="/FoodFighter/resources/js/admin/resAddress.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" ></script>
<script src="/FoodFighter/resources/js/admin/sb-admin-2.min.js"></script>
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
					location.href="/FoodFighter/";
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