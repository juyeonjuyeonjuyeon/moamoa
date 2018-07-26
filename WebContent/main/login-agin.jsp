<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String path = request.getContextPath();%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>MOAMOA 로그인</title>
	<link rel="shortcut icon" type="image/x-icon" href="<%=path %>/img/favicon.ico" />
	<link rel="stylesheet" type="text/css" href="<%=path %>/main/style2.css?ver=1">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script
  		src="https://code.jquery.com/jquery-3.3.1.js"
  		integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
  		crossorigin="anonymous"></script>
</head>
<body>
	<header>
		<h1><a href="<%=path%>/main/main.jsp" >MOA MOA</a></h1>
	</header>
	<div id="loginPage">
	<form action="<%=path %>/LoginProc" method="post">
	<h3>login</h3>
	<table>
		<tr>
		<td><input type="text" name="userId" placeholder="이메일을 입력해주세요" required></td>
		<td rowspan="2"><input class="btn loginBtn" type="submit" value="login"></td>
		</tr>
	<tr>
		<td><input type="password" name="userPw" placeholder="비밀번호를 입력해주세요" required></td>
	</tr>
	</table>
	<span class="error">
		가입하지 않은 아이디이거나 잘못된 비밀번호를 입력하였습니다.
		다시 입력해 주세요.
	</span>
	</form>
	</div>
</body>
</html>