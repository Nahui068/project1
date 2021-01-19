<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/admin-header.jsp" %>

<!DOCTYPE html>
<html>
<head>
	<link href="resources/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<meta charset="UTF-8">
	<title>직원등록</title>
</head>
<body>
<h1 style="position:absolute; top:40%; left:45%;">직원 등록</h1>
<form method="post" action="/project1/insert">
	<table class="table table-hover" style="position:absolute; top:50%; left:35%; width:30%;">
		<tr>
			<td class="table-info" style="text-align:center;">이름</td><td><input type="text" name="name" class="form-control" id="inputDefault"></td>
		</tr>
		<tr>
			<td class="table-info" style="text-align:center;">id</td><td><input type="text" name="id" class="form-control" id="inputDefault"> </td>
		</tr>

		<tr>
			<td class="table-info" style="text-align:center;">비밀번호</td><td><input type="password" name="pw" class="form-control" id="inputDefault"></td>
		</tr>
		<tr>
			<td colspan="2" style="text-align: center;"><input type="submit" value="등록"></td>
		</tr>
	</table>
</form>
</body>
</html>