<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>틀린 패스워드 입력!!!</title>
	</head>
	<body>
		<input type="hidden" id="seq" name="seq" value="${seq }">
		<input type="hidden" id="pg" name="pg" value="${pg }">
	</body>
	<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script type="text/javascript">
		window.onload = function() {
			alert("올바른 비밀번호를 입력해 주세요!!!");
			location.href = '/FoodFighter/community/passwordPage?seq='+$('#seq').val()+'&pg='+$('#pg').val();
		}
	</script>
</html>