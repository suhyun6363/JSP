<%@ page language= "java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>	
<%@ page import="java.sql.*"%>
<%@ page import="advisor.StudentBean"%>

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
//out.println(directory);

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
String saved_filename = multi_request.getFilesystemName("image");         // 파일명을 이름으로 할 경우 동명이인이면 파일 이름이 같아 다르기 위해 필요
student.setImage(saved_filename);

int advisor_id=1;

Connection con = null;
ResultSet rs = null;
PreparedStatement pstmt = null;
String jdbcUrl ="jdbc:mysql://localhost:3306/advisordb" +
		"?serverTimezone=Asia/Seoul&allowPublicKeyRetrieval=true&useSSL=false";
String dbUser = "root";
String dbPass = "duksung";

try {
	Class.forName("com.mysql.jdbc.Driver");
} catch(ClassNotFoundException e) {
	out.println("mysql driver loading error!");
	out.println(e.toString());
	System.out.println("mysql driver loading error!");
	return;
}

try {
	con = DriverManager.getConnection(jdbcUrl, dbUser, dbPass);
} catch(SQLException e) {
	out.println("mysql connection error!");
	out.println(e.toString());
	return;
}

try {
	String query = "select pid from professor where name=?";
	pstmt = con.prepareStatement(query);
	pstmt.setString(1,student.getAdvisor_name());
	rs = pstmt.executeQuery();
	if(rs.next()) { //해당 교수가 있으면
		advisor_id = rs.getInt(1);
	} else {
		return;
	}
	query = "insert into student values(?,?,?,?,?,?,?)";
	pstmt = con.prepareStatement(query);
	pstmt.setInt(1,student.getSnum());
	pstmt.setString(2,student.getName());
	pstmt.setString(3,student.getId());
	pstmt.setString(4,student.getPasswd());
	pstmt.setString(5,student.getPhone());
	pstmt.setInt(6,advisor_id);
	pstmt.setString(7, student.getImage());
	pstmt.executeUpdate();
	out.println("회원 추가");
} catch(SQLException e) {
	out.println(e.toString());
}

try {
	if(pstmt != null) pstmt.close();
	if(con != null) con.close();
} catch(SQLException e) {
	out.println(e.toString());
}
//response.sendRedirect("index.jsp");
%>
</body>
</html>