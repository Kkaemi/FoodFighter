<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form id="checkPostForm">
<table id="postTable" border="1" cellspacing="0" cellpadding="3" align="center">

 <tr>
  <th>도로명</th>
  <td colspan="3">
   <input type="text" size="45" name="roadname" id="roadname">
   <input type="button" id="postSearchBtn" value="검색">
   <div id="roadnameDiv"></div>
  </td>
 </tr>

</table>
</form>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="/FoodFighter/resources/js/admin/resAddress.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
        }
    }).open();
</script>












