<%@ page import="java.sql.*"%> 
<%
	Connection conn = null;	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	conn.setAutoCommit(false);
	try {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "system";
		String pwd = "";
		
		Class.forName(driver);
		conn = DriverManager.getConnection(url, user, pwd);
		out.println("loaded database.<br>");
		
	} catch (SQLException ex) {
		out.println("not loaded database.<br>");
		out.println("SQLException: " + ex.getMessage());
	}
		
%>