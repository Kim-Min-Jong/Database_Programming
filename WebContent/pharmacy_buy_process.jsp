<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, Util.extractKorean, java.sql.Date, java.text.SimpleDateFormat"%>
<%@ include file="dbconn.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");
	String result1;
	String result2;
	String result3;
	
	String msg;
	String errorMsg;
	String id = request.getParameter("phid");
	String symptom = request.getParameter("symptom");

	String sql = "{call buyingmedicine(?,?,?,?,?)}";
	
	CallableStatement cstmt = conn.prepareCall(sql);
	
	cstmt.setString(1,symptom);
	cstmt.setString(2,id);
	cstmt.registerOutParameter(3, java.sql.Types.VARCHAR);
	cstmt.registerOutParameter(4, java.sql.Types.VARCHAR); 
	cstmt.registerOutParameter(5, java.sql.Types.VARCHAR);
	try{
 		cstmt.execute();
 		result1 = cstmt.getString(3);
 		result2 = cstmt.getString(4);
 		result3 = cstmt.getString(5);
 		System.out.println(result1);
 		System.out.println(result2);
 		System.out.println(result3);  
 		conn.commit();
		%> 
		<script>  
			var msg = "<%=result1%>" +"\n<%=result2%>";
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