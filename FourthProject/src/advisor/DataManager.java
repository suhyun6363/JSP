package advisor;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;

public class DataManager {   // singleton 클래스
	private static DataManager instance = new DataManager();
	// 딱 한 개 생성할 객체를 자신의 필드로 내부에서 생성
	private DataManager() {}
	// 이 클래스 밖에서 DataManager 객체를 밖에서 생성하는 방법을 막음
	public static DataManager getInstance() {
		return instance;
	}
	// servlet객체와 데이터베이스 사이를 단 하나의 유일한 manager 데이터베이스 전담 객체로 연결
	private Connection getConnection() throws Exception {
		String jdbcUrl ="jdbc:mysql://localhost:3306/empldb?serverTimezone=Asia/Seoul&allowPublicKeyRetrieval=true&useSSL=false";
		String dbUser = "root";
		String dbPass = "duksung";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection(jdbcUrl, dbUser, dbPass);
		return conn;
	}

	public void insertEmployee(EmployeeBean employee, int jobid, String startdate) {
		Connection conn=null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		try {			
			conn = getConnection();
			String query = "insert into employee values(?,?,?,?)";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1,employee.getEmplid());
			pstmt.setString(2,employee.getName());
			pstmt.setString(3,employee.getAddress());
			pstmt.setString(4,employee.getSsn());
			pstmt.executeUpdate();
			
			query = "insert into assignment values(?,?,?,?)";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1,employee.getEmplid());
			pstmt.setInt(2,jobid);
			pstmt.setString(3,startdate);
			pstmt.setString(4, null);
			pstmt.executeUpdate();
			
			if(pstmt != null) pstmt.close();
			if(rs != null) rs.close();
			if(conn != null) conn.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int userCheck(int emplid, String ssn) {
		Connection conn=null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		int x = -1;
		try {
			conn = getConnection();
			String query = "select ssn from employee where emplid = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1,emplid);

			rs = pstmt.executeQuery();
			while(rs.next()){
				String dbssn= rs.getString(1); 
				if(ssn.equals(dbssn))
					x = 1;
				else
					x = 0;
			}
			
			if(rs !=null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		} catch(Exception e ) {
			e.printStackTrace();
		}
		return(x);
	}
	
	public ArrayList<EmployeeBean> getEmployees(String dept) {
		Connection conn=null;	
		ArrayList<EmployeeBean> employeeArray = new ArrayList<EmployeeBean>(10);
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			String query = "select employee.emplid, employee.name,"
					+ " employee.address, employee.ssn"
					+ " from employee, job, assignment"
					+ " where employee.emplid = assignment.emplid" 
					+ " and job.jobid = assignment.jobid"
					+ " and job.dept=?" 
					+ " and assignment.termdate is null";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1,dept);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				EmployeeBean employee = new EmployeeBean();
				employee.setEmplid(rs.getInt(1));
				employee.setName(rs.getString(2));
				employee.setAddress(rs.getString(3));
				employee.setSsn(rs.getString(4));
				employeeArray.add(employee);
			}
			if(rs !=null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		} catch(Exception e ) {
			e.printStackTrace();
		}
		return employeeArray;
	}
		
	public HashMap<String, String> getNameNDept(int emplid) {
		HashMap<String, String> employeeMap = new HashMap<String, String>(2);
		Connection conn=null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			String query = "select employee.name, job.dept"
					+ " from employee, job, assignment"
					+ " where employee.emplid = assignment.emplid"
					+ " and job.jobid = assignment.jobid"
					+ " and employee.emplid = ?"
					+ " and assignment.termdate is null";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1,emplid);
			rs = pstmt.executeQuery();
			while(rs.next()){
				employeeMap.put("이름", rs.getString(1));
				employeeMap.put("부서", rs.getString(2));
			}	
			if(rs !=null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		} catch(Exception e ) {
			e.printStackTrace();
		}
		
		return employeeMap;
	}
}