<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body>
<div class="container col-12">
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
            <div><button type="button" id="insertShopBtn" onclick="location.href='/FoodFighter/admin/resWriteForm'" >가게 등록</button></div>
            <table id="shopTable" class="table table-striped table-hover table-bordered tablesorter">
                <thead>
                    <tr>
                        <th>가게 관리 번호<i id="memberNumSort" class="fa fa-sort"></i></th>
                        <th>가게 이름<i id="dateSort" class="fa fa-sort"></i></th>
                        <th>가게 주소<i id="dateSort" class="fa fa-sort"></i></th>
                        <th>가게 전화<i id="dateSort" class="fa fa-sort"></i></th>
                        <th>가게 별점<i id="dateSort" class="fa fa-sort"></i></th>
                        <th>관리</th>
                    </tr>
                </thead>
                <tbody>
                 <c:if test="${list != null}">
  					<c:forEach var="RestaurantDTO" items="${list}">
                    <tr>
                        <td class="resSeq">${RestaurantDTO.resSeq}</td>
                        <td>${RestaurantDTO.resName}</td>
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
            <div class="clearfix">
              ${adminShopPaging.pagingHTML}
            </div>
        </div>
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
$('.view').on('click',function(){
	let resSeq = $(this).parent().prevAll(".resSeq").text();
	location.href='/FoodFighter/review/reviewView?resSeq='+resSeq
});
$('.delete').on('click',function(){
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



function adminShopPaging(pg){
	let searchKeyword = $('#shopSearchKeyword').val();
	if(searchKeyword == ""){
		location.href="/FoodFighter/admin/adminShopManagement?pg="+pg;
	}else{
		$('#pg').val(pg);
		$('#shopSearchKeyword').trigger('keydown','continue');
	}
	
}
</script>
</body>

