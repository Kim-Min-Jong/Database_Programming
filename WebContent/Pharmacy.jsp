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
			<form class="form-signin" action="pharmacy_buy_process.jsp" method="post">
				<h2 class="form-signin-heading">약 구매 프로세스</h2>
				
				<label for="inputPHID" class="sr-only">PH_ID</label> 
				<input type="text" id="inputPHID" class="form-control" placeholder="약국 코드 입력"
					name="phid" required /> 
				
				<label for="symptom" class="sr-only">SYMPTOM</label> 
				<input type="text" id="symptom" class="form-control"
					placeholder="증상 입력" name="symptom" required/>            
					
				<br>
				<input class="btn btn-lg btn-primary btn-block" type="submit"
					value="약 구매 프로세스 시작">
				<div style="height:100px;">
				<ul style="float:left;  padding-left:-50px;">
					증상 목록
						<li>통증</li>
						<li>발열</li> 
						<li>염증</li> 
				</ul> 
				<ul style="width: 500px; padding-right:20px; padding-left:150px;">
					약국 코드 목록
						<li>ph-1110 (연계병원: 정내과)</li>
						<li>ph-1111 (연계병원: 강내과)</li> 
						<li>ph-1112 (연계병원: 성종합병원)</li>
						<li>ph-1113 (연계병원: 길의원)</li>
						<li>ph-1114 (연계병원: 나눔의원)</li> 
						<li>ph-2110 (연계병원: 명품의원)</li>
						<li>ph-2111 (연계병원: 안종합병원)</li>
				</ul>
				</div>
				<br><br> <br> 
			</form> 
			
			<form class="form-signin" action="pharmacy_search_process.jsp" method="post">
				<h2 class="form-signin-heading">약 검색 프로세스</h2>
				
				<label for="m_name" class="sr-only">M_NAME</label> 
				<input type="text" id="m_name" class="form-control" placeholder="약 이름 입력"
					name="mediName" required /> 
		           
				<br>
				<input class="btn btn-lg btn-primary btn-block" type="submit"
					value="약 정보 검색 ">
					<div>
					<ul style="float:left; padding-left:20px;"> 
					약 목록
						<li>타이레놀</li>
						<li>게보린</li>
						<li>부루펜</li>
						<li>서스펜</li>
						<li>타세놀</li>
					</ul>
					</div><br><br><br><br><br>
			</form>
			<br><br>
			<form class="form-signin" action="pharmacy_register_process.jsp" method="post">
				<h2 class="form-signin-heading">약 등록 프로세스</h2>
				
				<label for="inputPHID" class="sr-only">PH_ID</label> 
				<input type="text" id="inputPHID" class="form-control" placeholder="약국 코드 입력"
					name="phid" required /> 
				
				<label for="m_name" class="sr-only">M_NAME</label> 
				<input type="text" id="m_name" class="form-control" placeholder="약 이름 입력"
					name="mediName" required /> 
					
				<label for="m_effect" class="sr-only">M_EFFECT</label> 
				<input type="text" id="m_effect" class="form-control" placeholder="약 효과 입력"
					name="mediEffect" required /> 	         
					
				<br>
				<input class="btn btn-lg btn-primary btn-block" type="submit"
					value="신규 약 등록">
				<div style="height:300px;">
				<br> 

				<ul>
					약국 코드 목록
						<li>ph-1110 (연계병원: 정내과)</li>
						<li>ph-1111 (연계병원: 강내과)</li> 
						<li>ph-1112 (연계병원: 성종합병원)</li>
						<li>ph-1113 (연계병원: 길의원)</li>
						<li>ph-1114 (연계병원: 나눔의원)</li> 
						<li>ph-2110 (연계병원: 명품의원)</li>
						<li>ph-2111 (연계병원: 안종합병원)</li>
				</ul>

			</div>
			</form>

		</div>

	</div> 
</body> 
</html>