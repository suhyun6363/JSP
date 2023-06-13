<%@ page language= "java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="advisor.*" %>
<%@ page import="java.util.ArrayList" %>

<%
request.setCharacterEncoding("utf-8");
String dept = request.getParameter("dept");

DataManager manager = DataManager.getInstance();
ArrayList<EmployeeBean> employeeArray = manager.getEmployees(dept);
for(int i=0; i<employeeArray.size(); i++) {
	EmployeeBean employee = employeeArray.get(i);
	out.println("<b>" + employee.getName() + "</b><p>");
}
%>
</body>
</html>
