<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, Util.extractKorean, java.sql.Date, java.text.SimpleDateFormat"%>
<%@ include file="dbconn.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");

	String result;
	String msg;
	String errorMsg;
	String id = request.getParameter("id");
	String code = request.getParameter("hid");
	String cnt = request.getParameter("cnt");
	String date = request.getParameter("date");
	String medi = request.getParameter("medi");
	
	Date d = Date.valueOf(date);

	int count = Integer.parseInt(cnt);
	
	String sql = "{call inoculate(?,?,?,?,?,?)}";
	
	CallableStatement cstmt = conn.prepareCall(sql);
	cstmt.setString(1,id);
	cstmt.setString(2,code);
	cstmt.setInt(3,count);
	cstmt.setDate(4, d);
	cstmt.setString(5,medi);
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
			location.href= "Inoculate.jsp";
		</script>
		<%
 	}
 	conn.close();
%>