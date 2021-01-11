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
	<h1>정보수정</h1>
	<form method="post" action="/project1/updateMember">
		<table>
		<tr>
			<td>id</td><td>${memInfo.id}</td>
			<input type="hidden" name="id" value="${memInfo.id}">
		</tr>
		
		<tr>
			<td>이름</td><td>${memInfo.name}</td>
		</tr>
		
		<tr>
			<td>비밀번호</td><td><input type="password" name="pw"></td>
		</tr>
		<tr>
			<td colspan="2" style="text-align:center;"><input type="submit" value="수정"></td>
		</tr>
		</table>
	</form>
</body>
</html>