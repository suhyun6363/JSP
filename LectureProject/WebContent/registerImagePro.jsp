<%@ page language= "java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<title>가입 처리</title>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");

String root = application.getRealPath(java.io.File.separator);
String directory = root + "/uploaded";
int sizeLimit = 100*1024*1024;		//100MB 제한
MultipartRequest multi_request = new MultipartRequest(request, directory,
		sizeLimit, "UTF-8", new DefaultFileRenamePolicy());

advisor.StudentBean student = new advisor.StudentBean();
student.setSnum(Integer.parseInt(multi_request.getParameter("snum")));
student.setName(multi_request.getParameter("name"));
student.setId(multi_request.getParameter("id"));
student.setPasswd(multi_request.getParameter("passwd"));
student.setPhone(multi_request.getParameter("phone"));
student.setAdvisor_name(multi_request.getParameter("advisor_name"));

String received_filename = multi_request.getOriginalFileName("image");
String saved_filename = multi_request.getFilesystemName("image");
student.setImage(saved_filename);

out.println("학생 객체의 주소값 = " + student);
out.println("<h3>학생 정보는 " + student.printStudent() + "입니다</h3>");
String imageStr = "<img src='uploaded/" + saved_filename + "' width='240'/>";
out.println(imageStr);
out.println(received_filename + " 등록완료!!");
%>
</body>
</html>