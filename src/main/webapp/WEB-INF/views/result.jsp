<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>Home</title>
	<style>
		html, body {margin: 0; padding: 0;}
		#body {width: 800px; margin-left: calc(50vw - 400px);}
		h1 {text-align: center;}
		table {width: 100%;}
		a {text-decoration: none;}
	</style>
</head>
<body>
	<div id="body">
		<h1>학생 정보!</h1>
		<table>
		<tr>
			<td>학생 이름</td>
			<td>학생 ip</td>
			<td>접속 시간</td>
		</tr>
		<c:forEach var="item" items="${db}">
		   <tr>
		    <td>${item.NAME}</td>
		    <td>${item.ip}</td>
		    <td>${item.regDate}</td>
		   </tr>
		</c:forEach>
		</table>
		<a href="/app/">돌아가기</a>
	</div>
</body>
</html>
