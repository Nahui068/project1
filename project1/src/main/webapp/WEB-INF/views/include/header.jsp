<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1"> 
	
	<!-- JS --> 
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script> 
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

	
</head>
<body>
	<div class="jumbotron text-center mb-0"> 
		<a href="/project1/board_select"><h1>Homepage</h1></a>
		<p>예약시스템</p> 
	</div>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="/project1/board_select">AWESOME</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor03" aria-controls="navbarColor03" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarColor03">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="/project1/board_select">Home
          <span class="sr-only">(current)</span>
        </a>
      </li>
<!--       <li class="nav-item">
        <a class="nav-link" href="#">예약현황</a>
      </li> -->
      <li class="nav-item">
        <a class="nav-link" href="/project1/reservation">공간예약</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/project1/eq_reservation">장비예약</a>
      </li>
      <%-- <c:if test="${sessionScope.id == 'admin' || sessionScope.id == 'awesome1' || sessionScope.id == 'awesome2' || sessionScope.id == 'awesome3' || sessionScope.id == 'awesome4' || sessionScope.id == 'awesome5'}"> --%>
	     <c:if test="${fn:contains(sessionScope.id,'awesome')}">
	     <li class="nav-item dropdown">
	        <a class="nav-link dropdown-toggle" data-toggle="dropdown" href=# role="button" aria-haspopup="true" aria-expanded="false">관리자</a>
	        <div class="dropdown-menu">
	          <a class="dropdown-item" href="/project1/admin_board">게시글 관리</a> <!-- 게시글 등록 및 목록(수정,삭제) -->
	          <a class="dropdown-item" href="/project1/memberList">직원관리</a> <!-- 회원 등록, 수정, 삭제 -->
	          <!-- <a class="dropdown-item" href="#">Something else here</a>
	          <div class="dropdown-divider"></div>
	          <a class="dropdown-item" href="#">Separated link</a>
	        </div> -->
	      </li>
      </c:if>
    </ul>
 <c:if test="${sessionScope.id !=null}">
    ${sessionScope.id}&nbsp;&nbsp;
    <a href="/project1/updateCheck_form">정보수정</a>&nbsp;&nbsp;
    <a href="/project1/logout">로그아웃</a>

   </c:if>
 </div>

</nav>
</body>
</html>