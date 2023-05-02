<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1.0" />
<meta charset="UTF-8">
<title>계산기</title>
</head>
<body>
	<%!String image_filename = null;
	int totalCount = 0;
	int addCount = 0;
	int subCount = 0;
	int multCount = 0;
	int divCount = 0;

	float compute(float x, float y, String op) {
		float result;
		if (op.equals("+")) {
			addCount++;
			result = x + y;
		} else if (op.equals("-")) {
			subCount++;
			result = x - y;
		} else if (op.equals("*")) {
			multCount++;
			result = x * y;
		} else {
			divCount++;
			result = x / y;
		}
		return result;
	}%>
	<%
	request.setCharacterEncoding("UTF-8");

	String root = application.getRealPath(java.io.File.separator);
	String directory = root + java.io.File.separator + "uploaded";

	int sizeLimit = 100 * 1024 * 1024; //100MB 제한
	MultipartRequest multi_request = new MultipartRequest(request, directory, //객체를 생성할 때, 이미지를 따로 빼서 directory에 저장
			sizeLimit, "UTF-8", new DefaultFileRenamePolicy());

	float operand1 = Float.parseFloat(multi_request.getParameter("operand1"));
	float operand2 = Float.parseFloat(multi_request.getParameter("operand2"));
	String operator = multi_request.getParameter("operator");
	
	if(image_filename == null) {
		image_filename = multi_request.getFilesystemName("image");
	}
	
	out.println("<img src='uploaded/" + image_filename + "' width='150'/>\n");
	out.print(operand1 + " " + operator + " " + operand2 + " = ");
	out.println(compute(operand1, operand2, operator));
	%><br>
덧셈 총 횟수 : <%= addCount %><br>
뺄셈 총 횟수 : <%= subCount %><br>
곱셈 총 횟수 : <%= multCount %><br>
나눗셈 총 횟수 : <%= divCount %><p> 
</body>
</html>
