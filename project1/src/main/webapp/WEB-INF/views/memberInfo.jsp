<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
	<link href="resources/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<meta charset="UTF-8">
	<title>정보수정</title>
</head>
<body>
	<h1 style="position:absolute; top:40%; left:45%;">정보수정</h1>
	<form method="post" action="/project1/updateMember">
		<table class="table table-hover" style="position:absolute; top:50%; left:33%; width:30%;">
		<tr>
			<td  class="table-info" style="text-align:center;">id</td><td class="table-light" style="text-align:center;">${memInfo.id}</td>
			<input type="hidden" name="id" value="${memInfo.id}">
		</tr>
		
		<tr>
			<td  class="table-info" style="text-align:center;">이름</td><td class="table-light" style="text-align:center;">${memInfo.name}</td>
		</tr>
		
		<tr>
			<td  class="table-info" style="text-align:center;">비밀번호</td><td class="table-light" style="text-align:center;"><input type="password" name="pw" class="form-control" id="inputDefault"></td>
		</tr>
		<tr>
			<td colspan="2" style="text-align:center;"><input type="submit" value="수정"></td>
		</tr>
		</table>
	</form>
</body>
</html>