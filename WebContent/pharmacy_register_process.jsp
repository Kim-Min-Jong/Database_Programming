<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, Util.extractKorean, java.sql.Date, java.text.SimpleDateFormat"%>
<%@ include file="dbconn.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");

	String result;
	
	String msg;
	String errorMsg;
	String id = request.getParameter("phid");
	String name = request.getParameter("mediName");
	String effect = request.getParameter("mediEffect");
	

	String sql = "{call newmedicine(?,?,?,?)}";
	
	CallableStatement cstmt = conn.prepareCall(sql);
	
	cstmt.setString(1,id);
	cstmt.setString(2,name);
	cstmt.setString(3,effect);
	cstmt.registerOutParameter(4, java.sql.Types.VARCHAR); 
	try{
 		cstmt.execute();
 		result = cstmt.getString(4);
 		System.out.println(result);
 		conn.commit();
		%> 
		<script>  
			var msg = "<%=result%>";
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