<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글등록</title>
</head>
<body>
<h1 style="position:absolute; top:40%; left:45%;"> 게시글 등록</h1>

<form method="post" action="/project1/board_insert">
<table class="table table-hover" style="position:absolute; top:50%; left:25%; width:50%;">
	<tr>
		<td class="table-info" style="text-align:center;">글제목</td>
		<td class="table-light form-group"><input type="text" name="title" class="form-control" id="inputDefault"></td>
	</tr>
	<tr>
		<td class="table-info" style="text-align:center;"colspan="2">글내용</td>
	</tr>
	<tr>
		<td class="table-light form-group" colspan="2"><textarea name="content"rows="30" cols="100" class="form-control" id="inputDefault"></textarea></td>
	</tr>
	<tr class="table-light" style="text-align:center;">
		<td colspan="2"><input type="submit" value="글등록"></td>
	</tr>
</table>
</form>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>  
</body>
</html>