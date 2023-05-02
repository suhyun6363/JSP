<%@ page language= "java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Random"%> 
<%-- JSP 페이지 내에서 import 하기 위함이므로 page 지시문 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<title>JSP 기본 문법</title>
</head>
<body>
<!-- HTML 주석입니다. --> 
<h2>JSP 기본 예제</h2>
<%! //페이지 전체 영향을 줄 전역 변수 선언, 함수 정의 (선언문)
	// 자바 주석입니다. 필드 정의
    String name = "음두헌";
    int a = 5;
    int b = 15;
    // 메소드 정의
    public int sum(){
 		  return a + b;
 	}
%>	
<%-- JSP 주석입니다. JSP 표현식 --%>
a + b = <%=sum()%><p>
<%	//스크립트릿 Scriptlet 자바코드로 프로그래밍 구간, _jspService함수(전역함수) 내에 코드
	String name = "김말동";
 	String count = request.getParameter("count");
	int cnt = Integer.parseInt(count);
	Random generator = new Random();
  	for(int i=0; i<cnt; i++) {
  	 		out.println(name + "<p>"); //자기의 지역번수가 먼저
  	 		out.write("0과 9 사이의 난수: " + generator.nextInt(10) + "<p>");
  	}
%>
</body>
</html>