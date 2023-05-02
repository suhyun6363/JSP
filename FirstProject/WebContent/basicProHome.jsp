<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1.0" />
<meta charset="UTF-8">
<title>JSP Login</title>
</head>
<body>
<%! 
    int totalCnt = 0;
    int accessCnt = 0;
    
%>	

<%	
	totalCnt++;      //++totalCnt;
	out.println("<h1>" + totalCnt + "번째 접속</h1>");
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String pwd = request.getParameter("pwd");
	if (name.equals("정수현")) {
		if (pwd.equals("1234")) {
			accessCnt += 1;
			out.println("<h2>환영합니다 " + name + "님.</h2>");
			out.write(accessCnt + "번째 방문");
		}

		else {
			out.println("<h2>암호가 틀립니다.</h2>");
		}
	}
	else {
		out.println("<h2>회원이 아닙니다.</h2>");
	}
%>
</body>
</html>
