<%@ page language= "java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="advisor.DatabaseBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가입 처리</title>
</head>
<body>
<% request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="student" class="advisor.StudentBean">
	<jsp:setProperty name="student" property="*"/>
</jsp:useBean>
<%
DatabaseBean manager = DatabaseBean.getInstance();  // 데이터베이스 전담 객체의 참조값 받음
manager.insertStudent(student); // 데이터베이스 전담객체 insertStudent 모듈 실행
response.sendRedirect("index.jsp");
%>
</body>
</html>