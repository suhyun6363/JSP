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
<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String sex = request.getParameter("sex");
	String residence = request.getParameter("residence");

%>
<h2> 학생 정보 입력 결과 </h2>
    이름 :  <%= name%><p>
    나이 : <%= age%><p>
    성별 : <%= sex%><p>
    거주지 : <%= residence%><p>
</body>
</html>