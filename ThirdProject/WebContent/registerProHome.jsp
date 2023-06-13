<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="circleHome.CircleBean"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<meta charset="UTF-8">
<title>생성된 원</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
int x = Integer.parseInt(request.getParameter("x"));
int y = Integer.parseInt(request.getParameter("y"));
int radius = Integer.parseInt(request.getParameter("radius"));

CircleBean circle = new CircleBean();
circle.setX(x);
circle.setY(y);
circle.setRadius(radius);

out.println("생성된 원은 " + circle);
out.println("<p>생성된 원은 " + circle.printCircle() + "입니다.");
%>
</body>
</html>
