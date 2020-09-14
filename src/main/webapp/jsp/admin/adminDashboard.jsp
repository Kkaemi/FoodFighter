<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/FoodFighter/resources/css/admin/adminManagementStyle.css">
<!-- Custom fonts for this template-->
  <link href="https://startbootstrap.github.io/startbootstrap-sb-admin-2/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="https://startbootstrap.github.io/startbootstrap-sb-admin-2/css/sb-admin-2.min.css" rel="stylesheet">
  
  <link rel="stylesheet" href="/FoodFighter/resources/css/admin/adminNewMain.css">
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
      <!-- 겉 메인  -->
      <div id="content">
        <!-- 메인 요소들 -->
        <div class="container-fluid">
        	<div id="dashboardTitleDiv" class="d-sm-flex align-items-center justify-content-between mb-4">
            	<h1 id="dashboardTitle" class="h3 mb-0 text-gray-800">Dashboard</h1>
          	</div>
          	
          	 <div class="row">
	            <div class="col-xl-3 col-md-6 mb-4">
	              <div class="card border-bottom-danger shadow h-100 py-2">
	                <div class="card-body">
	                  <div class="row no-gutters align-items-center">
	                    <div class="col mr-2">
	                      <div class="text-xs font-weight-bold text-danger text-uppercase mb-1">오늘 리뷰 수 /전체 리뷰 수</div>
	                      <div class="h5 mb-0 font-weight-bold text-gray-800">${todayReview} / ${totalReview }</div>
	                    </div>
	                  </div>
	                </div>
	              </div>
	            </div>
	            <div class="col-xl-3 col-md-6 mb-4">
	              <div class="card border-bottom-warning shadow h-100 py-2">
	                <div class="card-body">
	                  <div class="row no-gutters align-items-center">
	                    <div class="col mr-2">
	                      <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">오늘 게시글 수 /전체 게시글 수</div>
	                      <div class="h5 mb-0 font-weight-bold text-gray-800">${todayPost} / ${totalPost } </div>
	                    </div>
	                  </div>
	                </div>
	              </div>
	            </div>
	            <div class="col-xl-3 col-md-6 mb-4">
	              <div class="card border-bottom-danger shadow h-100 py-2">
	                <div class="card-body">
	                  <div class="row no-gutters align-items-center">
	                    <div class="col mr-2">
	                      <div class="text-xs font-weight-bold text-danger text-uppercase mb-1">문의글 미답변 수/전체수</div>
	                          <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">${todayQna} / ${totalQna}</div>
	                    </div>
	                  </div>
	                </div>
	              </div>
	            </div>
	            <div class="col-xl-3 col-md-6 mb-4">
	              <div class="card border-bottom-warning shadow h-100 py-2">
	                <div class="card-body">
	                  <div class="row no-gutters align-items-center">
	                    <div class="col mr-2">
	                      <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">오늘 가입자 수 /전체 회원 수 </div>
	                      <div class="h5 mb-0 font-weight-bold text-gray-800">${todayJoin} / ${totalJoin }</div>
	                    </div>
	                  </div>
	                </div>
	              </div>
	            </div>
          	</div>
          	
          	
          <div id="dashboardTitleDiv" class="d-sm-flex align-items-center mb-4">
            	<h1 id="dashboardTitle" class="h3 mb-0 text-gray-800">Review</h1>
            	<h1 id="dashboardTitle" class="h3 offset-7 mb-0 text-gray-800">회원가입</h1>
          </div>	
          	
          	
        <div class="row">
        	
            <!-- 음식별 Pie Chart -->
            <div class="col-xl-4 col-lg-5">
              <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">음식별</h6>
                </div>
                <!-- Card Body -->
                <div class="card-body">
                  <div class="chart-pie pt-4 pb-2">
                    <canvas id="foodPieChart"></canvas>
                    <input type="hidden" id="kFood" value="${kFood}">
                    <input type="hidden" id="wFood" value="${wFood}">
                    <input type="hidden" id="cFood" value="${cFood}">
                    <input type="hidden" id="jFood" value="${jFood}">
                    <input type="hidden" id="dessert" value="${dessert}">
                  </div>
                  <div class="mt-4 text-center small">
                    <span class="mr-2">
                      <i class="fas fa-circle text-primary"></i> 한식
                    </span>
                    <span class="mr-2">
                      <i class="fas fa-circle text-success"></i> 양식
                    </span>
                    <span class="mr-2">
                      <i class="fas fa-circle text-info"></i> 중식
                    </span>
                    <span class="mr-2">
                      <i class="fas fa-circle text-warning"></i> 일식
                    </span>
                    <span class="mr-2">
                      <i class="fas fa-circle text-danger"></i> 카페/디저트
                    </span>
                  </div>
                </div>
              </div>
            </div>
            
            <!-- 가격대별 Pie Chart -->
            <div class="col-xl-4 col-lg-5">
              <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">가격대별</h6>
                </div>
                <!-- Card Body -->
                <div class="card-body">
                  <div class="chart-pie pt-4 pb-2">
                    <canvas id="pricePieChart"></canvas>
                    <input type="hidden" id="under1" value="${under1}">
                    <input type="hidden" id="manwon1" value="${manwon1}">
                    <input type="hidden" id="manwon2" value="${manwon2}">
                    <input type="hidden" id="manwon3" value="${manwon3}">
                    <input type="hidden" id="manwon4" value="${manwon4}">
                  </div>
                  <div class="mt-4 text-center small">
                    <span class="mr-2">
                      <i class="fas fa-circle text-primary"></i> 1만원미만
                    </span>
                    <span class="mr-2">
                      <i class="fas fa-circle text-success"></i> 1만원대
                    </span>
                    <span class="mr-2">
                      <i class="fas fa-circle text-info"></i> 2만원대
                    </span>
                    <span class="mr-2">
                      <i class="fas fa-circle text-warning"></i> 3만원대
                    </span>
                    <span class="mr-2">
                      <i class="fas fa-circle text-danger"></i> 4만원이상
                    </span>
                  </div>
                </div>
              </div>
            </div>
                   
            
            <!-- 소셜회원가입,일반회원가입 Pie Chart -->
            <div class="col-xl-4 col-lg-5">
              <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">회원가입 유형</h6>
                </div>
                <!-- Card Body -->
                <div class="card-body">
                  <div class="chart-pie pt-4 pb-2">
                    <canvas id="socialPieChart"></canvas>
                    <input type="hidden" id="joinKakao" value="${joinKakao}">
                    <input type="hidden" id="join" value="${join}">
                  </div>
                  <div class="mt-4 text-center small">
                    <span class="mr-2">
                      <i class="fas fa-circle text-yellow"></i> 카카오가입
                    </span>
                    <span class="mr-2">
                      <i class="fas fa-circle text-bBlue"></i> 일반가입
                    </span>
                  </div>
                </div>
              </div>
            </div>
            
          </div>
          
            
          
          
        	
        </div>
     </div>
   </div>
</div>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" ></script>
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.9.1/jquery.tablesorter.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.27.0/moment.min.js"></script>
<!-- admin -->
 <script src="https://startbootstrap.github.io/startbootstrap-sb-admin-2/vendor/jquery-easing/jquery.easing.min.js"></script>
 <script src="/FoodFighter/resources/js/admin/sb-admin-2.min.js"></script>
 <script src="https://startbootstrap.github.io/startbootstrap-sb-admin-2/vendor/chart.js/Chart.min.js"></script> 
 <script src="https://startbootstrap.github.io/startbootstrap-sb-admin-2/js/demo/chart-area-demo.js"></script>
<script type="text/javascript">
$(document).ready(function(){
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    $(document).ajaxSend(function(e, xhr, options) {
        xhr.setRequestHeader(header, token);
    });
});



var ctx = document.getElementById("foodPieChart");
var foodPieChart = new Chart(ctx, {
  type: 'doughnut',
  data: {
    labels: ["한식", "양식", "중식","일식","카페/디저트"],
    datasets: [{
      data: [$('#kFood').val(),$('#wFood').val(),$('#cFood').val(),$('#jFood').val(),$('#dessert').val()],
      backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc','#f6c23e','#e74a3b'],
      hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf','#ffcd12','#ff0000'],
      hoverBorderColor: "rgba(234, 236, 244, 1)",
    }],
  },
  options: {
    maintainAspectRatio: false,
    tooltips: {
      backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#858796",
      borderColor: '#dddfeb',
      borderWidth: 1,
      xPadding: 15,
      yPadding: 15,
      displayColors: false,
      caretPadding: 10,
    },
    legend: {
      display: false
    },
    cutoutPercentage: 80,
  },
});



var ctx = document.getElementById("pricePieChart");
var pricePieChart = new Chart(ctx, {
  type: 'doughnut',
  data: {
    labels: ["1만원미만", "1만원대", "2만원대","3만원대","4만원대"],
    datasets: [{
      data: [$('#under1').val(),$('#manwon1').val(),$('#manwon2').val(), $('#manwon3').val(), $('#manwon4').val()],
      backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc','#f6c23e','#e74a3b'],
      hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf','#ffcd12','#ff0000'],
      hoverBorderColor: "rgba(234, 236, 244, 1)",
    }],
  },
  options: {
    maintainAspectRatio: false,
    tooltips: {
      backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#858796",
      borderColor: '#dddfeb',
      borderWidth: 1,
      xPadding: 15,
      yPadding: 15,
      displayColors: false,
      caretPadding: 10,
    },
    legend: {
      display: false
    },
    cutoutPercentage: 80,
  },
});




var ctx = document.getElementById("socialPieChart");
var socialPieChart = new Chart(ctx, {
  type: 'doughnut',
  data: {
    labels: ["카카오", "일반"],
    datasets: [{
      data: [$('#joinKakao').val(),$('#join').val()],
      backgroundColor: ['#ffe400', '#5cd1e5'],
      hoverBackgroundColor: ['#faed7d', '#3db7cc'],
      hoverBorderColor: "rgba(234, 236, 244, 1)",
    }],
  },
  options: {
    maintainAspectRatio: false,
    tooltips: {
      backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#858796",
      borderColor: '#dddfeb',
      borderWidth: 1,
      xPadding: 15,
      yPadding: 15,
      displayColors: false,
      caretPadding: 10,
    },
    legend: {
      display: false
    },
    cutoutPercentage: 80,
  },
});
</script>
</body>
</html>