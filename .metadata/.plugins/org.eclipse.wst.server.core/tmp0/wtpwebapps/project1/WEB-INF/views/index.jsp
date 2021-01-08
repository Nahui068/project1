<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
	<link href="resources/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<meta charset="UTF-8">
<title>로그인</title>
</head>	
<body>

<form method="post" action="/project1/login">
	<table class="table table-hover" style="position:absolute; top:20%; left:40%; width:20%;">
		<tr >
			<td class="table-info" style="text-align:center; width:10%;">아이디</td>
			<td class="table-light form-group"colspan="2" style="width:10%;"><input type="text" name="id" class="form-control" id="inputDefault"></td>
		</tr>
		<tr >
			<td class="table-info" style="text-align:center; width:10%;">비밀번호</td>
			<td class="table-light form-group" colspan="2" style="width:10%;"><input type="password" name="pw" class="form-control" id="inputDefault"></td>
		</tr>
		<tr class="table-info" style="text-align:center;">
			<td colspan="3" ><input type="submit" value="로그인"></td>
		</tr>
	</table>

</form>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>  
</body>
</html>