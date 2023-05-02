<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
<h1>이름과 암호 입력</h1>
		<form action ="basicProHome.jsp" method="post">
			이름: <input type="text" name="name">
			암호: <input type="text" name="pwd">
			<input type="submit" value="전송">
		</form>
</body>
</html>
