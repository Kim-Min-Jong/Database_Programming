<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, Util.extractKorean, java.sql.Date, java.text.SimpleDateFormat"%>
<%@ include file="dbconn.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");
	String result1;
	String result2;
	String msg;
	String errorMsg;
	String name = request.getParameter("mediName");


	String sql = "{call searchmedicine(?,?,?)}";
	
	CallableStatement cstmt = conn.prepareCall(sql);
	
	cstmt.setString(1,name);
	cstmt.registerOutParameter(2, java.sql.Types.VARCHAR);
	cstmt.registerOutParameter(3, java.sql.Types.VARCHAR);
	

	try{
 		cstmt.execute();
 		result1 = cstmt.getString(2);
 		result2 = cstmt.getString(3);
 		
 		System.out.println(result1);
 		System.out.println(result2);
 		conn.commit(); 
		%> 
		<script>  
			var msg = "<%=result1%>" + "<%=result2%>";
			alert(msg);
			location.href= "main.jsp";
		</script>
		<% 
	}catch(SQLException e){
		conn.rollback();
 		System.out.println(e.getMessage());
		msg = e.getMessage();
		extractKorean ek = new extractKorean();
		errorMsg = ek.extract(msg);
		%>
		<script>
			var msg = "에러: " + "<%=errorMsg%>";
			alert(msg);
			location.href= "Pharmacy.jsp";
		</script>
		<%
	}
	conn.close();
%>