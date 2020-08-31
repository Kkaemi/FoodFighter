<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form id="checkPostForm">
<table id="postTable" border="1" cellspacing="0" cellpadding="3" align="center">

 <tr>
  <th>도로명</th>
  <td colspan="3">
   <input type="text" size="45" name="resAddress" id="resAddress">
   <input type="button" id="postSearchBtn" value="검색">
   <div id="resAddressDiv"></div>
  </td>
 </tr>

</table>
</form>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="/FoodFighter/resources/js/admin/resAddress.js"></script>












