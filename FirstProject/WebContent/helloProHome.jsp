<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<meta charset="UTF-8">
<title>JSP Login</title>
</head>
<body>
<%
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("nm");
		String pwd = request.getParameter("pwd");
		if(name.equals("정수현")) {	//name 변수의 값(xx)과 정수현 객체의 값(yy)을 == 비교 불가, 값이 다름
			if(pwd.equals("1234")) {
				out.println("<h2>환영합니다 정수현님.</h2>");
			}
			
			else {
				out.println("<h2>암호가 틀립니다.</h2>");
			}
		} else {
			out.println("<h2>회원이 아닙니다.</h2>");
		}
%>
</body>
</html>
