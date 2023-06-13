<%@ page language= "java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="advisor.DataManager" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입력 처리</title>
</head>
<body>
<% request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="employee" class="advisor.EmployeeBean">
	<jsp:setProperty name="employee" property="*"/>
</jsp:useBean>
<%
request.setCharacterEncoding("utf-8");
int jobid = Integer.parseInt(request.getParameter("jobid"));  
String startdate = request.getParameter("startdate");

DataManager manager = DataManager.getInstance();  
manager.insertEmployee(employee, jobid, startdate); 
response.sendRedirect("indexHome.jsp");
%>
</body>
</html>