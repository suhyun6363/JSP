<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="advisor.DataManager" %>

<% request.setCharacterEncoding("utf-8"); %>
<%
int emplid = Integer.parseInt(request.getParameter("emplid"));
String ssn  = request.getParameter("ssn");


DataManager manager = DataManager.getInstance();
int check = manager.userCheck(emplid, ssn);
out.println(check);
%>