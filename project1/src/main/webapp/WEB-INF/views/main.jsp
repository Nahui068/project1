<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>

<script>

//이전 버튼 이벤트

function fn_prev(page, range, rangeSize) {

		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;

		
		var url =  "${pageContext.request.contextPath}/board_select";
		url = url + "?page=" + page;
		url = url + "&range=" + range;

		location.href = url;
	}


//페이지 번호 클릭

function fn_pagination(page, range, rangeSize, searchType, keyword) {

		var url = "${pageContext.request.contextPath}/board_select";
		url = url + "?page=" + page;
		url = url + "&range=" + range;

		location.href = url;	

	}

//다음 버튼 이벤트

	function fn_next(page, range, rangeSize) {

		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;

		var url =  "${pageContext.request.contextPath}/board_select";

		url = url + "?page=" + page;
		url = url + "&range=" + range;

		location.href = url;

	}

</script>


<!DOCTYPE html>
<html>
<head>
	<link href="resources/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	<meta charset="UTF-8">
	<title>메인화면</title>
</head>
<body>
	<h1 style="position:absolute; top:40%; left:45%;">공지사항</h1>
	<table class="table table-hover" style="position:absolute; top:50%; left:25%; width:50%;">
		<tr class="table-info" style="text-align:center;">
			<th>번호</th>
			<th>제목</th>
			<th>조회수</th>
			<th>등록일</th>
		</tr>
	<c:forEach var="list" items="${boardList}">
		<tr class="table-light" style="text-align:center;">
			<td>${list.num}</td>
			<td><a href="/project1/content?num=${list.num}&title=${list.title}">${list.title}</a></td>
			<td>${list.readcount}</td>
			<fmt:formatDate var="dateTempParse" pattern="yyyy-MM-dd" value="${list.reg}"/>
			<td><c:out value="${dateTempParse}"></c:out></td>
		</tr>
	</c:forEach>
	</table>

		
	<ul class="pagination" style="position:absolute; top:120%; left:40%; width:50%;">
		<c:if test="${pagination.prev}">

			<li class="page-item"><a class="page-link" href="#" onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">Previous</a></li>

		</c:if>


		<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">

			<li class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> "><a class="page-link" href="#" onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}')"> ${idx} </a></li>

		</c:forEach>

				
		<c:if test="${pagination.next}">

			<li class="page-item"><a class="page-link" href="#" onClick="fn_next('${pagination.page}','${pagination.range}', '${pagination.rangeSize}')" >Next</a></li>

		</c:if>

	</ul>

<%@ include file="/WEB-INF/views/include/footer.jsp" %>  
</body>
</html>