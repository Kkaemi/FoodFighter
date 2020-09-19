<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="askListDiv" class="menuDefualtDiv">
<input type="hidden" id="pg" name="pg" value="1">
	<div id="askEmptyDiv" class="row emptyDiv">'
		<c:if test="${list.size() == 0}"> 
		    <div class="emptyDivContent">
				<span>&emsp;문의사항이 있으시면<br> 문의게시판에 남겨주세요.</span>
			</div>
		</c:if>
		<c:if test="${list.size() != 0}">
			<table id="qnaBoardTable" class="table table-striped table-hover table-bordered tablesorter">	
				<thead>
					<tr>
						<th>NO<i id="dateSort"></i></th>
						<th>글 제목<i id="dateSort" ></i></th>
						<th>작성일<i id="dateSort"></i></th>
						<th>조회수<i id="dateSort" ></i></th>
						<th>답변여부<i id="dateSort"></i></th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="qnaBoardDTO" items="${list}">
					<tr>
						<td class="seq">${qnaBoardDTO.seq}</td>
						<td><a id = "subjectA" href="/FoodFighter/community/qnaView?seq=${qnaBoardDTO.seq}&pg=1">${qnaBoardDTO.subject}</a></td>
						<td>${qnaBoardDTO.logtime}</td>
						<td>${qnaBoardDTO.hit}</td>
						<c:if test="${qnaBoardDTO.reply == 0}">
							<td>답변 미완료</td>
						</c:if>
						<c:if test="${qnaBoardDTO.reply != 0}">
							<td>답변 완료</td>
						</c:if>
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

	location.href="/FoodFighter/mypage/myAsk?pg="+pg;


}
</script>
</div>