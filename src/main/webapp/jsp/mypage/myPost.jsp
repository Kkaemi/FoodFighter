<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="postListDiv" class="menuDefualtDiv">
	<input type="hidden" id="pg" name="pg" value="1">
	<div id="postEmptyDiv" class="row emptyDiv">
		<c:if test="${list.size() == 0}">
		    <div class="emptyDivContent">
				<span>&emsp;작성한 글이 없습니다.<br>커뮤니티에 글을 남겨보세요.</span>
			</div>
		</c:if>
		<c:if test="${list.size() != 0}">
			<table id="cBoardTable" class="table table-striped table-hover table-bordered tablesorter">	
	            <thead>
	                <tr>
	                    <th>NO<i id="dataSort" class="fa fa-sort"></i></th>
	                    <th>글 제목<i id="dateSort" class="fa fa-sort"></i></th>
	                    <th>작성일<i id="dateSort" class="fa fa-sort"></i></th>
	                    <th>조회수<i id="dateSort" class="fa fa-sort"></i></th>
	                    <th>관리</th>
	                </tr>
	            </thead>
	            <tbody>
				<c:forEach var="cBoardDTO" items="${list}">
	                <tr>
	                    <td class="bseq">${cBoardDTO.bseq}</td>
	                    <td><a id = "subjectA" href="/FoodFighter/community/communityBoard/communityBoardView?bseq=${cBoardDTO.bseq}">${cBoardDTO.subject}</a></td>
	                    <td>${cBoardDTO.logtime}</td>
	                    <td>${cBoardDTO.hit}</td>
	                    <td>
	                        <a href="#" class="delete" title="Delete" data-toggle="tooltip"><i class="material-icons">&#xE872;</i></a>
	                    </td>
	                </tr>
	              </c:forEach>     
	            </tbody>
	        </table>
	        <div id="mypagePagingDiv" class="clearfix">
			   ${mypagePaging.pagingHTML}
			</div>
		</c:if>
	</div>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" ></script>
<script type="text/javascript">
function mypagePaging(pg){

	location.href="/FoodFighter/mypage/myPost?pg="+pg;


}
</script>
</div>