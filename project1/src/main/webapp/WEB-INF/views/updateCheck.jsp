<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link href="resources/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<title>정보수정</title>
</head>
<body>
<form method="post" action="/project1/updateCheck">
	<input type="hidden" name="id" value="${sessionScope.id}">
	
	<table class="table table-hover" style="position:absolute; top:50%; left:45%; width:10%;">
		<tr>
			<td class="table-info" style="text-align:center;">비밀번호</td>
		</tr>
		<tr>
			<td class="table-light form-group" style="width:10%;"><input type="password" name="pw"  class="form-control" id="inputDefault"></td>
		</tr>
		<tr style="text-align:center;">
			<td><input type="submit" value="확인"></td>
		</tr>
	</table>
</form>	
</body>
</html>