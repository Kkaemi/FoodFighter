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
		                    <div class="col-sm-8"><h2>회원 관리</h2></div>
		                    <div class="col-sm-4">
		                        <div class="search-box">
		                            <i class="material-icons">&#xE8B6;</i>
		                            <input type="text" id="memSearchKeyword" class="form-control" placeholder="검색">
		                        </div>
		                    </div>
		                </div>
		            </div>
		            <input type="hidden" id ="pg" value="${pg}">
		            <table id="memberTable" class="table table-striped table-hover table-bordered tablesorter">	
		                <thead>
		                    <tr>
		                        <th>회원 번호<i id="memberNumSort" class="fa fa-sort"></i></th>
		                        <th>이메일<i id="dataSort" class="fa fa-sort"></i></th>
		                        <th>이름<i id="dataSort" class="fa fa-sort"></i></th>
		                        <th>닉네임<i id="dataSort" class="fa fa-sort"></i></th>
		                        <th>가입 구분<i id="dataSort" class="fa fa-sort"></i></th>
		                        <th>가입날짜<i id="dataSort" class="fa fa-sort"></i></th>
		                        <th>관리</th>
		                    </tr>
		                </thead>
		                <tbody>
		                <c:if test="${list != null}">
		  					<c:forEach var="memberDTO" items="${list}">
		                    <tr>
		                        <td class="member_seq">${memberDTO.member_seq}</td>
		                        <td>${memberDTO.email}</td>
		                        <td>${memberDTO.name}</td>
		                        <td>${memberDTO.nickname}</td>
		                        <c:if test="${memberDTO.socialLogin == 0 }">
		                        	<td>일반</td>
		                        </c:if>
		                        <c:if test="${memberDTO.socialLogin == 1 }">
		                        	<td>카카오</td>
		                        </c:if>
		                        <td>${memberDTO.signupDate}</td>
		                        <td>
		                            <a href="#" class="delete" title="Delete" data-toggle="tooltip"><i class="material-icons">&#xE872;</i></a>
		                        </td>
		                    </tr>
		                  </c:forEach>
		                  </c:if>      
		                </tbody>
		            </table>
		            <div id="adminMemberPagingDiv" class="clearfix">
		              ${adminMemberPaging.pagingHTML}
		            </div>
		        </div>
		    </div>
    <!-- 테이블 끝 -->  
    	</div>
     </div>
   </div>
</div>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" ></script>
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.9.1/jquery.tablesorter.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.27.0/moment.min.js"></script>
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

$('#memSearchKeyword').keydown(function(key,str) {
	if(str != 'continue') $('#pg').val(1);	
	 if (key.keyCode == 13) {
	    if($('#memSearchKeyword').val() == ''){
	    	alert('검색할 키워드를 입력해주세요');
	    }else{
	    	 $.ajax({
	    		 type:'post',
	 			url : '/FoodFighter/admin/getMemberSearch',
	 			data: {	'pg':$('#pg').val(),
	 					'memSearchKeyword' : $('#memSearchKeyword').val()},
	 			dataType: 'json',
	 			success:function(data){
	 				
		 				$('#memberTable tr:gt(0)').remove();
						
						
		 				$.each(data.list, function(index, items){
		 					let social = items.socialLogin
		 					if(social == 1){
		 					$('<tr/>').append($('<td/>',{
		 						text: items.member_seq,
		 						class: 'member_seq'
		 					 })).append($('<td/>',{
		 					      	text: items.email
		 					})).append($('<td/>',{
		 						text: items.name
		 					})).append($('<td/>',{
		 						text: items.nickname
		 					})).append($('<td/>',{
		 							text: '카카오'
		 					})).append($('<td/>',{
		 						text: moment(items.signupDate).format('YYYY-MM-DD')
		 					})).append($('<td/>',{
		 						
							}).append($('<a/>',{
								href: '#',
								title: 'Delete',
								class: 'delete'
							}).append('<i class="material-icons">&#xE872;</i>'))).appendTo($('#memberTable'));
		 				
		 				}else {
		 					$('<tr/>').append($('<td/>',{
		 						text: items.member_seq,
		 						class: 'member_seq'
		 					 })).append($('<td/>',{
		 					      	text: items.email
		 					})).append($('<td/>',{
		 						text: items.name
		 					})).append($('<td/>',{
		 						text: items.nickname
		 					})).append($('<td/>',{
		 							text: '일반'
		 					})).append($('<td/>',{
		 						text: moment(items.signupDate).format('YYYY-MM-DD')
		 					})).append($('<td/>',{
		 						
							}).append($('<a/>',{
								href: '#',
								title: 'Delete',
								class: 'delete'
							}).append('<i class="material-icons">&#xE872;</i>'))).appendTo($('#memberTable'));
		 				
		 					}
		 				});//each
						//페이징처리
						$('#adminMemberPagingDiv').html(data.adminMemberPaging.pagingHTML);
	 				  
	 				},
	 			error: function(err){
	 				console.log(err);
	 			}
	 	    });
	    }
		
	 }//엔터키
});


$(document).on('click','.delete',function(){
	let check = confirm("탈퇴처리 하시겠습니까?");
	let member_seq = $(this).parent().prevAll(".member_seq").text();
	if(check){
	 $.ajax({
		 	type: 'post',
	 		url: '/FoodFighter/admin/AdminWithdraw',
	 		data: 'member_seq='+member_seq,
	 		success : function(){
	 			alert("탈퇴처리가 완료되었습니다.");
	 			location.href="/FoodFighter/admin/adminMemberManagement"
	 		},
	 		error : function(e){
				console.log(e);
			}
	    });
	}
});

function adminMemberPaging(pg){
	let searchKeyword = $('#memSearchKeyword').val();
	if(searchKeyword == ""){
		location.href="/FoodFighter/admin/adminMemberManagement?pg="+pg;
	}else{
		$('#pg').val(pg);
		$('#memSearchKeyword').trigger('keydown','continue');
	}
	
}


$(document).ready(function(){
	$('[data-toggle="tooltip"]').tooltip();
	 $("#memberTable").tablesorter();
});

</script>
</body>
</html>
