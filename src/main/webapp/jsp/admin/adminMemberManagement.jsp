<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

<body>
<div class="container col-12">
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
                        <th>이메일<i id="dateSort" class="fa fa-sort"></i></th>
                        <th>이름<i id="dateSort" class="fa fa-sort"></i></th>
                        <th>닉네임<i id="dateSort" class="fa fa-sort"></i></th>
                        <th>가입날짜<i id="dateSort" class="fa fa-sort"></i></th>
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
</div>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" ></script>
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.9.1/jquery.tablesorter.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.27.0/moment.min.js"></script>
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
		 					$('<tr/>').append($('<td/>',{
		 						text: items.member_seq
		 					 })).append($('<td/>',{
		 					      	text: items.email
		 					})).append($('<td/>',{
		 						text: items.name
		 					})).append($('<td/>',{
		 						text: items.nickname
		 					})).append($('<td/>',{
		 						text: moment(items.signupDate).format('YYYY-MM-DD')
		 					})).append($('<td/>',{
		 					}).append($('<a/>',{
								href: '#',
								title: 'Delete',
								class: 'delete'
						}).append($('<i/>',{	
								class:'material-icons'
						})))).appendTo($('#memberTable'));         
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


$('.delete').on('click',function(){
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




</script>
</body>

