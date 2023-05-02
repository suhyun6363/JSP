<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
float num1 = Float.parseFloat(request.getParameter("num1"));
String operator = request.getParameter("operator");
float num2 = Float.parseFloat(request.getParameter("num2"));

if (operator.equals("+")) {
	out.println(num1 + " " + operator + " " + num2 + " = " + (num1+num2) + "<br>");
	String straddCount = (String) application.getAttribute("addCounter");
	int addCount = (straddCount == null) ? 0 : Integer.valueOf(straddCount);	
	out.println("덧셈 총횟수 : " + ++addCount + "<p>");
	application.setAttribute("addCounter", String.valueOf(addCount));
} 
else if (operator.equals("-")) {
	out.println(num1 + " " + operator + " " + num2 + " = " + (num1-num2) + "<br>");
	String strminCount = (String) application.getAttribute("minCounter");
	int minCount = (strminCount == null) ? 0 : Integer.valueOf(strminCount);	
	out.println("뺄셈 총횟수 : " + ++minCount + "<p>");
	application.setAttribute("minCounter", String.valueOf(minCount));
} 
else if (operator.equals("*")) {
	out.println(num1 + " " + operator + " " + num2 + " = " + (num1*num2) + "<br>");
	String strmulCount = (String) application.getAttribute("mulCounter");
	int mulCount = (strmulCount == null) ? 0 : Integer.valueOf(strmulCount);	
	out.println("곱셈 총횟수 : " + ++mulCount + "<p>");
	application.setAttribute("mulCounter", String.valueOf(mulCount));
} 
else {
	out.println(num1 + " " + operator + " " + num2 + " = " + (num1/num2) + "<br>");
	String strdivCount = (String) application.getAttribute("divCounter"); 
	int divCount = (strdivCount == null) ? 0 : Integer.valueOf(strdivCount);	
	out.println("나눗셈 총횟수 : " + ++divCount + "<p>");
	application.setAttribute("divCounter", String.valueOf(divCount));
}
%>