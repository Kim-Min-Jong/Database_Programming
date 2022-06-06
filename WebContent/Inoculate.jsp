<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link rel="stylesheet" href="./resources/css/all.css">
<link rel="stylesheet" href="./resources/css/signin.css" />
<title>Insert title here</title>
</head>

<body class="pt">
	<%@ include file="header.jsp"%>
	<div class="container">
		<div class="row">
			<%@ include file="menu.jsp"%>
		</div>
		<div class="mainMenu mainheight">
			<form class="form-signin" action="inoculate_process.jsp" method="post">
				<h2 class="form-signin-heading">접종 기록</h2>
				
				<label for="inputID" class="sr-only">ID</label> 
				<input type="text" id="inputID" class="form-control"
					placeholder="주민번호 입력" name="id" required/> 
					
				<label for="inputHID" class="sr-only">H_ID</label> 
				<input type="text" id="inputHID" class="form-control" placeholder="병원 코드 입력"
					name="hid" required />             
					
				<label for="inputCnt" class="sr-only">I_CNT</label> 
				<input type="number" id="inputCnt" class="form-control" placeholder= "횟수 입력(1)"
					name="cnt" required/>
				
				<label for="inputDate" class="sr-only">I_DATE</label> 
				<input type="date" id="inputDate" class="form-control" placeholder= "날짜 입력"
					name="date" required/>	
					
				<label for="inputMedi" class="sr-only">I_MEDICINE</label> 
				<input type="text" id="inputMedi" class="form-control" placeholder= "접종한 약품명 입력"
					name="medi" required/>
				<br> 
				
				<br>
				<input class="btn btn-lg btn-primary btn-block" type="submit"
					value="접종 정보 기록">
			</form>
			<div>
			<br> 
			<ul style="float:left; padding-right:100px; padding-left:200px;">
				병원 코드 목록
					<li>h-1000 (정내과)</li>
					<li>h-1001 (강내과)</li>
					<li>h-1002 (성종합병원)</li>
					<li>h-1003 (길의원)</li> 
					<li>h-1004 (나눔의원)</li>  
					<li>h-2000 (명품의원)</li>
					<li>h-2001 (안종합병원)</li>
			</ul>
			<ul>
				약품  목록
					<li>phizer (코로나19 백신)</li>
					<li>dSteal (파상풍 백신)</li>
					<li>Hcough (독감 백신)</li>
					<li>janssen (코로나19 백신)</li>
					<li>liver (b형간염 백신)</li>  
					<li>moski (일본뇌염 백신)</li>
			</ul>
			</div>
		</div>

	</div> 
</body> 
</html>