<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<meta charset="UTF-8">
	<title>Home</title>
	<style>
		html, body {margin: 0; padding: 0;}
		#body {width: 800px; margin-left: calc(50vw - 400px);}
		h1 {text-align: center;}
		input {float: right; display: inline-block; width: 70%;}
		#button {width: 100%; height: 100px; font-size: 2rem; font-weight: bold; border-radius: 10px; cursor: pointer;}
	</style>
</head>
<body>
	<div id="body">
		<h1>학생 정보 알아보기 실행</h1>
		<form action="select" method="post">
			<p>학생 이름 : <input type="text" name="name" placeholder="학생이름을 영어로 작성하시오.(GD)"></p>
			<p>학생 IP : <input type="text" name="ip" placeholder="학생 IP를 작성하시오.(192.168.3.?)"></p>
			<input type="submit" id="button" value="호출하기">
		</form>
	</div>
</body>
</html>
