<%@ page language= "java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %> 
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<meta charset="UTF-8">
<title>계산 결과</title>
</head>
<body>
<%! //선언문-> 객체의 field역할
	String fix_img;
	//String image_filename = null;
	int totalCount = 0;
	int addCount = 0;	
	int subCount = 0;
	int multCount = 0;
	int divCount = 0;

%>
<%	//객체의 _jspService 메소드	_jspService.out 메소드을 통해 우리 눈에 보임
	totalCount++;
	request.setCharacterEncoding("UTF-8");

	String root = application.getRealPath(java.io.File.separator);
	String directory = root + java.io.File.separator + "uploaded";
	
	int sizeLimit = 100*1024*1024;		//100MB 제한
	MultipartRequest multi_request = new MultipartRequest(request, directory, //객체를 생성할 때, 이미지를 따로 빼서 directory에 저장
			sizeLimit, "UTF-8", new DefaultFileRenamePolicy());

	if(totalCount == 1) {
		fix_img = multi_request.getFilesystemName("image");
	}
	else {
		String img = multi_request.getFilesystemName("image"); //else문 삭제
	} // /* */ 확인
	float operand1 = Float.parseFloat(multi_request.getParameter("operand1"));
	float operand2 = Float.parseFloat(multi_request.getParameter("operand2"));
	String operator = multi_request.getParameter("operator");
%>
<%	/*
	if(image_filename == null) {
		String image_filename = multi_request.getFilesystemName("image");
	}
	*/
	String imageStr = "<img src='uploaded/" + fix_img + "' width='240'/>"; //240인치 비율 조정
	//String imageStr = "<img src='uploaded/" + image_filename + "' width='150'/>";
	out.println(imageStr);
%>
<p>
<%
if(operator.equals("+")) {
	addCount++;
	out.println(operand1 + " + " + operand2 + " = " + (operand1+operand2));
}
else if (operator.equals("-")){
	subCount++;
	out.println(operand1 + " - " + operand2 + " = " + (operand1-operand2));
}
else if(operator.equals("*")){
	multCount++;
	out.println(operand1 + " * " + operand2 + " = " + (operand1*operand2));
}
else{
	divCount++;
	out.println(operand1 + " / " + operand2 + " = " + (operand1/operand2));
}
%><br>
덧셈 총 횟수 : <%= addCount %><br>
뺄셈 총 횟수 : <%= subCount %><br>
곱셈 총 횟수 : <%= multCount %><br>
나눗셈 총 횟수 : <%= divCount %><p> 
</body>
</html>
