<%@ page contentType = "text/html; charset=utf-8" %>
<%@page import="java.sql.*"%>
<%
	request.setCharacterEncoding("utf-8");
	String profName = request.getParameter("advisor");
	
	Class.forName("com.mysql.jdbc.Driver");
	String jdbcUrl ="jdbc:mysql://localhost:3306/advisordb?serverTimezone=Asia/Seoul&allowPublicKeyRetrieval=true&useSSL=false";
	String user = "root";
	String password = "duksung";
	Connection conn = DriverManager.getConnection(jdbcUrl, user, password);
	
	String sql = "select student.snum, student.name from professor, student ";
	sql = sql + "where professor.pid=student.advisor_id and professor.name=?";

	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, profName);
	ResultSet rs = pstmt.executeQuery();
%>
<html>
<head><title>지도학생‹</title></head>
<body>
<%= profName %> 교수님의 지도학생
<hr>
<%
	int snum=-1;
	String studentName=null;
	while(rs.next()) {
		snum = rs.getInt(1);
	  studentName = rs.getString(2);
%>
<h5><%= studentName %> (<%= snum %>)</h5>
<%
	}
	rs.close();
	pstmt.close();
	conn.close();
%>
</body>
</html>
