<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/include/admin-header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
</head>


<body>
	<h1 style="position:absolute; top:40%; left:45%;">글내용</h1>
	<form method="post" action="/project1/board_update">
	<input type="hidden" name="num" value="${content.num}">
	<table class="table table-hover" style="text-align:center; position:absolute; top:50%; left:25%; width:50%;">
		<tr>
			<td class="table-info">글 번호</td><td class="table-light" style="width:20%;">${content.num}</td>
			<td class="table-info">글제목</td><td class="table-light"><input type="text" name="title" class="form-control" id="inputDefault" value="${content.title}"></td>
			
		</tr>
		<tr>
			<td class="table-info">조회수</td><td class="table-light">${content.readcount}</td>
			<td class="table-info">등록일</td>
			<fmt:formatDate var="dateTempParse" pattern="yyyy-MM-dd" value="${content.reg}"/>
			<td class="table-light"><c:out value="${dateTempParse}"></c:out></td>
		</tr>
		<tr class="table-info">
			<td colspan="4">글내용</td>
		</tr>
		<tr>
			<td class="table-light form-group" colspan="4"><textarea rows="30" cols="100" class="form-control" id="inputDefault" name="content">${content.content}</textarea></td>
		</tr>
	</table>
		<button type="button" class="btn btn-outline-info" style="position:absolute; top:150%; left:47%;"onClick="location.href='/project1/admin_board'">목록으로</button>
		<input type="submit" class="btn btn-outline-info" style="position:absolute; top:150%; left:53%;" value="수정하기">
	</form>
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>  
</body>
</html>