<%@ page language= "java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<meta charset="UTF-8">
<title>학생 정보</title>
</head>
<body>
  <h2>학생 정보 입력 </h2>
	<form action="studentPro.jsp" method="post" enctype="multipart/form-data"> 
	
		이름 : <input type="text" name="name"><p>
		전번 : <input type="password" name="phone"><p>
		전공 : <select name="major">
		        <option>소프트웨어</option>
		        <option>컴퓨터공학</option>
		        <option>국어국문학</option>
		        <option>약학</option>
		      </select><p>
	
		사진 : <input type="file" name="image">
		<input type="submit" value="보내기">
	</form>
</body>
</html>