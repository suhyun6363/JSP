<%@ page language= "java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="advisor.*" %>
<%@ page import="java.util.ArrayList" %>
<%--
자바기본배열-[]: 1. 항목, 2. 크기 지정 필요
개선된배열 ArrayList 객체 1. 항목<type>, 2. 가변배열(사이즈 지정 필요x)
--%>>

<%
request.setCharacterEncoding("utf-8");
String advisor_name = request.getParameter("advisor");

DatabaseBean manager = DatabaseBean.getInstance();
ArrayList<StudentBean> studentArray = manager.getStudents(advisor_name);
for(int i=0; i<studentArray.size(); i++) {
	StudentBean student = studentArray.get(i);
//	out.println(student.getName() + "<br>");
	out.println(student.getName() + "<br>");
}
%>