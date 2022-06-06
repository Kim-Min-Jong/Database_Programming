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
			<form class="form-signin" action="enter_process.jsp" method="post">
				<h2 class="form-signin-heading">인원 등록</h2>
				<label for="inputID" class="sr-only">ID</label> <input
			type="text" id="inputID" class="form-control"
					placeholder="주민번호 입력" name="id" required/> 
					<label for="inputName" class="sr-only">Name</label> 
					<input type="text"
					id="inputName" class="form-control" placeholder="이름 입력"
					name="name" required />             
					<label for="inputAge"
					class="sr-only">Age</label> <input type="number"
					id="inputAge" class="form-control" placeholder= "나이 입력"
					name="age" required/>
					 <br> <br>
				<input class="btn btn-lg btn-primary btn-block" type="submit"
					value="등록">

			</form>
		</div>
	</div>
</body> 
</html>