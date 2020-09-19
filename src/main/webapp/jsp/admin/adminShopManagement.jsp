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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">


 <link href="https://startbootstrap.github.io/startbootstrap-sb-admin-2/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
 <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
 <link href="https://startbootstrap.github.io/startbootstrap-sb-admin-2/css/sb-admin-2.min.css" rel="stylesheet">

<link rel="stylesheet" href="/FoodFighter/resources/css/admin/adminManagementStyle.css">
  
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
      <!-- Main Content -->
      <div id="content">
        <!-- Begin Page Content -->
        <div class="container-fluid">
        
		    <div class="table-responsive">
		        <div class="table-wrapper">
		            <div class="table-title">
		                <div class="row">
		                    <div class="col-sm-8"><h2>가게 관리</h2></div>
		                    	<input type="hidden" id ="pg" value="${pg}">
		                    <div class="col-sm-4">
		                        <div class="search-box">
		                            <i class="material-icons">&#xE8B6;</i>
		                            <input type="text" id="shopSearchKeyword" class="form-control" placeholder="검색">
		                        </div>
		                    </div>
		                </div>
		            </div>
		            <table id="shopTable" class="table table-striped table-hover table-bordered tablesorter">
		                <thead>
		                    <tr>
		                        <th>가게 관리 번호<i id="ShopNumSort" class="fa fa-sort"></i></th>
		                        <th>가게 이름<i id="dataSort" class="fa fa-sort"></i></th>
		                        <th>가게 주소<i id="dataSort" class="fa fa-sort"></i></th>
		                        <th>가게 전화<i id="dataSort" class="fa fa-sort"></i></th>
		                        <th>가게 별점<i id="dataSort" class="fa fa-sort"></i></th>
		                        <th>관리</th>
		                    </tr>
		                </thead>
		                <tbody>
		                 <c:if test="${list != null}">
		  					<c:forEach var="RestaurantDTO" items="${list}">
		                    <tr>
		                        <td class="resSeq">${RestaurantDTO.resSeq}</td>
		                        <td class="resName">${RestaurantDTO.resName}</td>
		                        <td>${RestaurantDTO.resAddress}</td>
		                        <td>${RestaurantDTO.resTel}</td>
		                        <td>${RestaurantDTO.resScore}</td>
		                        <td>
		                        	<a href="#" class="view" title="View" data-toggle="tooltip"><i class="material-icons">&#xE417;</i></a>
		                            <a href="javascript:void(0);" class="delete" title="Delete" data-toggle="tooltip"><i class="material-icons">&#xE872;</i></a>
		                        </td>
		                    </tr>
		                  </c:forEach>
		                  </c:if>   
		                </tbody>
		            </table>
		            <div id="adminShopPagingDiv" class="clearfix">
		              ${adminShopPaging.pagingHTML}
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
<!-- Custom scripts for all pages-->
  <script src="/FoodFighter/resources/js/admin/sb-admin-2.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    $(document).ajaxSend(function(e, xhr, options) {
        xhr.setRequestHeader(header, token);
    });
});
$('#shopSearchKeyword').keydown(function(key,str) {
	if(str != 'continue') $('#pg').val(1);	
	 if (key.keyCode == 13) {
	    if($('#shopSearchKeyword').val() == ''){
	    	alert('검색할 키워드를 입력해주세요');
	    }else{
	    	 $.ajax({
	    		 type:'post',
	 			url : '/FoodFighter/admin/getShopSearch',
	 			data: {	'pg':$('#pg').val(),
	 					'shopSearchKeyword' : $('#shopSearchKeyword').val()},
	 			dataType: 'json',
	 			success:function(data){
	 				
		 				$('#shopTable tr:gt(0)').remove();
						
						
		 				$.each(data.list, function(index, items){
		 					$('<tr/>').append($('<td/>',{
		 						text: items.resSeq,
		 						class:'resSeq'
		 					 })).append($('<td/>',{
		 					     text: items.resName,
		 					     class: 'resName'
		 					})).append($('<td/>',{
		 						text: items.resAddress
		 					})).append($('<td/>',{
		 						text: items.resTel
		 					})).append($('<td/>',{
		 						text: items.resScore
		 					})).append($('<td/>',{
							}).append('<a href="#" class="view" title="View" data-toggle="tooltip"><i class="material-icons">&#xE417;</i></a><a href="javascript:void(0);" class="delete" title="Delete" data-toggle="tooltip"><i class="material-icons">&#xE872;</i></a>')).appendTo($('#shopTable'));
		 				});//each
						
						//페이징처리
						$('#adminShopPagingDiv').html(data.adminShopPaging.pagingHTML);
	 				  
	 				},
	 			error: function(err){
	 				console.log(err);
	 			}
	 	    });
	    }
		
	 }//엔터키
});

$(document).on('click','.view',function(){
	let resSeq = $(this).parent().prevAll(".resSeq").text();
	let resName = $(this).parent().prevAll(".resName").text();
	location.href='/FoodFighter/review/reviewView?resSeq='+resSeq+'&resName='+resName;
});
$(document).on('click','.delete',function(){
	let check = confirm("삭제처리 하시겠습니까?");
	let resSeq = $(this).parent().prevAll(".resSeq").text();
	if(check){
	 $.ajax({
		 	type: 'post',
	 		url: '/FoodFighter/admin/adminShopDelete',
	 		data: 'resSeq='+resSeq,
	 		success : function(){
	 			alert("삭제처리가 완료되었습니다.");
	 			location.href="/FoodFighter/admin/adminShopManagement"
	 		},
	 		error : function(e){
				console.log(e);
			}
	    });
	}
});




function adminShopPaging(pg){
	let searchKeyword = $('#shopSearchKeyword').val();
	if(searchKeyword == ""){
		location.href="/FoodFighter/admin/adminShopManagement?pg="+pg;
	}else{
		$('#pg').val(pg);
		$('#shopSearchKeyword').trigger('keydown','continue');
	}
	
}

$(document).ready(function(){
	$('[data-toggle="tooltip"]').tooltip();
	 $("#shopTable").tablesorter();
});
</script>
</body>

