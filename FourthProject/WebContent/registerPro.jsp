<%@ page language= "java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- 연동 인터페이스 위함 --%>
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
<% request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="student" class="advisor.StudentBean">
	<jsp:setProperty name="student" property="*"/>
</jsp:useBean>
<%
int advisor_id=1;

Connection con = null;
ResultSet rs = null;
PreparedStatement pstmt = null;
String jdbcUrl ="jdbc:mysql://localhost:3306/advisordb?serverTimezone=Asia/Seoul&allowPublicKeyRetrieval=true&useSSL=false";
String dbUser = "root";
String dbPass = "duksung";

try {
	Class.forName("com.mysql.jdbc.Driver");           // 1단계 // forName 메소드 -> try/catch문 사용
} catch(ClassNotFoundException e) {
	out.println("mysql driver loading error!");
	out.println(e.toString());
	System.out.println("mysql driver loading error!");
	return;
}

try {
	con = DriverManager.getConnection(jdbcUrl, dbUser, dbPass);        // 2단계 // 체크예외->try/catch문
} catch(SQLException e) {
	out.println("mysql connection error!");
	out.println(e.toString());
	return;
}

try {
	String query = "select pid from professor where name=?";
	pstmt = con.prepareStatement(query);      // 문장객체 생성 -> 빠르게 실행 가능
	pstmt.setString(1,student.getAdvisor_name());  // 숫자 물음표 개수
	rs = pstmt.executeQuery();        // 4단계    결과테이블을 받는거라면? executeQuery() 결과테이블->rs
	if(rs.next()){ //해당 교수가 있으면 // 커서 내려감
		advisor_id = rs.getInt(1);    // 첫번째 속성 값 얻어옴
	}

	query = "insert into student values(?,?,?,?,?,?)";
	pstmt = con.prepareStatement(query);
	pstmt.setInt(1,student.getSnum());
	pstmt.setString(2,student.getName());
	pstmt.setString(3,student.getId());
	pstmt.setString(4,student.getPasswd());
	pstmt.setString(5,student.getPhone());
	pstmt.setInt(6,advisor_id);
	pstmt.executeUpdate();       // 결과테이블 없음->executeUpdate
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