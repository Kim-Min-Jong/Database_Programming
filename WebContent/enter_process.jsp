<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, Util.extractKorean"%>
<%@ include file="dbconn.jsp"%>
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	int age2 = Integer.parseInt(age);
	String sql = "{call EnterPerson(?,?,?,?)}";
	String chkSql = "select p_id from person where p_id=?";
	
	String msg;
	String errorMsg;
	String result;
	String chk_Dup = "";
	
	// 프로시저 처리
	CallableStatement cstmt = conn.prepareCall(sql);
	cstmt.setString(1, id);
	cstmt.setString(2, name);
	cstmt.setInt(3, age2);
	cstmt.registerOutParameter(4, java.sql.Types.VARCHAR);

	// 중복 체크를 위한 쿼리
	pstmt = conn.prepareStatement(chkSql);
	pstmt.setString(1,id);
	rs = pstmt.executeQuery();
	while(rs.next()){
		chk_Dup = rs.getString(1);
	}
	try {
		if(chk_Dup.equals(id)){
			%>
			<script>
				alert("에러: 이미 등록된 인원입니다. 다시 입력해 주세요.");
				location.href= "EnterPerson.jsp";
			</script>
			<% 
		}else{
			cstmt.execute();
			result = cstmt.getString(4);
			conn.commit();
			%>
			<script>
				var msg = "<%=result%>";
				alert(msg);
				location.href= "main.jsp";
			</script>
			<% 
		}
	} catch (SQLException e) {
		conn.rollback();
		System.out.println(e.getMessage());
		msg = e.getMessage();
		extractKorean ek = new extractKorean();
		errorMsg = ek.extract(msg);
		%>
		<script>
			var msg = "에러: " + "<%=errorMsg%>";
			alert(msg);
			location.href= "EnterPerson.jsp";
		</script>
		<%
	}
	conn.close();
%>