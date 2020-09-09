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

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700">
<link rel="stylesheet" href="/FoodFighter/resources/css/admin/adminMainStyle.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/FoodFighter/resources/css/admin/adminManagementStyle.css">

</head>
<body>
<div class="adminMainContainer">
 <div class="adminMain">
 	<div id="sideMenu" class="sideMenu-part col-2">
 	  <div id="adminProfile"><img src="/FoodFighter/resources/img/member.png"><span>관리자</span></div>
 	  <div class="menu"><a href="/FoodFighter/admin/adminDashboard"><span>dashboard</span></a></div>
 	  <div class="menu"><a href="/FoodFighter/admin/adminMemberManagement"><span>회원 관리</span></a></div>
 	  <div class="menu"><a href="/FoodFighter/admin/adminShopManagement"><span>가게 관리</span></a></div>
 	</div>
 	<div class="displayDiv col-10"><jsp:include page="${display}"></jsp:include></div>
 </div>
</div>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" ></script>
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.9.1/jquery.tablesorter.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
    var token = $("meta[name='_csrf']").attr("content");
    var header = $("meta[name='_csrf_header']").attr("content");
    $(document).ajaxSend(function(e, xhr, options) {
        xhr.setRequestHeader(header, token);
    });
});

$(document).ready(function(){
	$('[data-toggle="tooltip"]').tooltip();
	 $("#memberTable").tablesorter();
});

$('memberTable .delete').on('click',function(){
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
	 			success:function(){
	 				console.log('검색 데이터');
	 			},
	 			error: function(err){
	 				console.log(err);
	 			}
	 	    });
	    }
		
	 }//엔터키
});



$('shopTable .delete').on('click',function(){
	let check = confirm("삭제처리 하시겠습니까?");
	let resSeq = $(this).parent().prevAll(".resSeq").text();
	if(check){
	 $.ajax({
		 	type: 'post',
	 		url: '/FoodFighter/admin/adminShopDelete',
	 		data: 'resSeq='+resSeq,
	 		success : function(){
	 			alert("삭제처리가 완료되었습니다.");
	 			location.href="/FoodFighter/admin/admiShopManagement"
	 		},
	 		error : function(e){
				console.log(e);
			}
	    });
	}
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
	 			success:function(){
	 				console.log('검색 데이터');
	 			},
	 			error: function(err){
	 				console.log(err);
	 			}
	 	    });
	    }
		
	 }//엔터키
});


function adminMemberPaging(pg){
	let searchKeyword = $('#memSearchKeyword').val();
	alert()
	if(searchKeyword == ""){
		location.href="/FoodFighter/admin/adminMemberManagement?pg="+pg;
	}else{
		$('#pg').val(pg);
		$('#memSearchKeyword').trigger('keydown','continue');
	}
	
}
function adminShopPaging(pg){
	let searchKeyword = $('#shopSearchKeyword').val();
	alert()
	if(searchKeyword == ""){
		location.href="/FoodFighter/admin/adminShopManagement?pg="+pg;
	}else{
		$('#pg').val(pg);
		$('#shopSearchKeyword').trigger('keydown','continue');
	}
	
}
</script>
</body>
</html>