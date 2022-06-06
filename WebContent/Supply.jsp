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
			<form class="form-signin" action="supply_process.jsp" method="post">
				<h2 class="form-signin-heading">공급 기록</h2>
				
				<label for="inputHID" class="sr-only">H_ID</label> 
				<input type="text" id="inputHID" class="form-control" placeholder="병원 코드 입력"
					name="hid" required /> 
				
				<label for="inputCID" class="sr-only">C_ID</label> 
				<input type="text" id="inputCID" class="form-control"
					placeholder="회사 코드 입력" name="cid" required/>            
		
				<label for="inputDate" class="sr-only">S_DATE</label> 
				<input type="date" id="inputDate" class="form-control" placeholder= "날짜 입력"
					name="date" required/>	
				
				<label for="inputMedi" class="sr-only">ㄴ_MEDICINE</label> 
				<input type="text" id="inputMedi" class="form-control" placeholder= "공급할 약품명 입력"
					name="medi" required/>
					
				<label for="inputCnt" class="sr-only">S_CNT</label> 
				<input type="number" id="inputCnt" class="form-control" placeholder= "공급량 입력"
					name="cnt" required/>
		
				
				<br>
				<input class="btn btn-lg btn-primary btn-block" type="submit"
					value="공급 정보 기록">
			</form>
			<div style="height:300px;">
				<br> 
				<ul style="float:left; padding-right:20px; padding-left:-50px;">
					병원 코드 목록
						<li>h-1000 (정내과)</li>
						<li>h-1001 (강내과)</li> 
						<li>h-1002 (성종합병원)</li>
						<li>h-1003 (길의원)</li> 
						<li>h-1004 (나눔의원)</li>  
						<li>h-2000 (명품의원)</li>
						<li>h-2001 (안종합병원)</li>
				</ul>
				<ul style="float:left; padding-right:40px; padding-left:20px;">
					약품  목록
						<li>phizer (코로나19 백신)</li>
						<li>dSteal (파상풍 백신)</li>
						<li>Hcough (독감 백신)</li>
						<li>janssen (코로나19 백신)</li>
						<li>liver (b형간염 백신)</li>  
						<li>moski (일본뇌염 백신)</li>
				</ul>
					<ul style="float:left; padding-left:20px;">
					회사 코드 목록
						<li>c-1111 (굿제약회사 - phizer, dSteal, Hcough 보유)</li>
						<li>c-1112 (최강제약 - dSteal, Hcough 보유)</li>
						<li>c-1113,(만능제약 - Hcough, janssen, liver 보유)</li>
						<li>c-1114 (KK제약 - janssen, liver 보유)</li>
						<li>c-1115 (KG제약 - liver 보유)</li>
				</ul>
			</div>
		</div>

	</div> 
</body> 
</html>