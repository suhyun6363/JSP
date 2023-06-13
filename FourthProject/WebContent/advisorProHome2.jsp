<%@ page language= "java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="advisor.*" %>
<%@ page import="java.util.HashMap" %>

<%
request.setCharacterEncoding("utf-8");
int emplid = Integer.parseInt(request.getParameter("emplid"));

DataManager manager = DataManager.getInstance();
HashMap<String, String> employeeMap = manager.getNameNDept(emplid);
out.println("이름: " + employeeMap.get("이름") + " / 부서: " + employeeMap.get("부서"));
%>
</body>
</html>
