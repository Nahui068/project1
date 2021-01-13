<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/include/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>예약수정</title>
	<link href="resources/css/bootstrap.min.css" rel="stylesheet" type="text/css">
</head>
<body>
	<tr>
	  <td>예약 Id</td><td>${rlist.id}</td>
	</tr>	      		
	<tr>
	    <td>예약명 </td><input type="text" id="title" name="title"></td>
	    
	</tr> 
	<tr>
	    <td>예약일 </td><td><input type="text" id="res_date" name="res_date"></td>
	    <td>예약시간</td><td><input type="text" id="start_time" name="start_time"></td>     
	</tr>
	     
</body>
</html>