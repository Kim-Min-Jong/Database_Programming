<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, Util.extractKorean, java.sql.Date, java.text.SimpleDateFormat"%>
<%@ include file="dbconn.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");
	String result;
	String msg;
	String errorMsg;
	String hid = request.getParameter("hid");
	String cid = request.getParameter("cid");
	String cnt = request.getParameter("cnt");
	String date = request.getParameter("date");
	String medi = request.getParameter("medi");
	
	Date d = Date.valueOf(date);
	
	int count = Integer.parseInt(cnt);
	
	String sql = "{call supply_medicine(?,?,?,?,?,?)}";
	
	CallableStatement cstmt = conn.prepareCall(sql);
	cstmt.setString(1,hid);
	cstmt.setString(2,cid);
	cstmt.setDate(3,d);
	cstmt.setString(4, medi);
	cstmt.setInt(5,count);
	cstmt.registerOutParameter(6, java.sql.Types.VARCHAR);
	
	try{
		cstmt.execute();
		result = cstmt.getString(6);
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
			location.href= "Supply.jsp";
		</script>
		<%
	}
	conn.close();
%>