<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>join us</title>

<style>
	@import url('https://fonts.googleapis.com/css?family=Jua');
	@import url('https://fonts.googleapis.com/css?family=Nanum+Pen+Script');
	@import url('https://fonts.googleapis.com/css?family=Handlee');
	@import url('https://fonts.googleapis.com/css?family=Chela+One');
	@import url('https://fonts.googleapis.com/css?family=Fugaz+One');
	
	body {
		background: #072072;
		font-family: 'Jua', sans-serif;
		color : white;
	}
	
	.join_form {
		border:1px solid #ccc;
		width: 400px;
		margin: auto;
		text-align: center;
	}
	
	.container {
		margin: auto;
		text-align: center;
		margin-left: 20px;
		margin-right: 20px;
	}
	.user_input_info{
		padding : 0;
		vertical-align: center;
		font-size : 20px;
	}
	.user_input_info td{
		text-align: left;
		padding-left:10px;
	}
	.user_input_info input{
		background : none;
		border : none;
		border-bottom : 2px solid white;
		width : 150px;
		height: 30px;
		color :white;
		
	}
	.btn{
		display : inline-block;
		background : none;
		border:1px solid white;
		width : 100px;
		height : 50px;
		margin : 10px 0;
		font-size : 20px;
		font-family: 'Jua', sans-serif;
		color : white;
		cursor: pointer;
	}
	.btn:hover{
		background : white;
		color : #072072;
	}
	
	
</style>
</head>
<body>
<form action="JoinUsProc" method="post" class = "join_form">
  <div class="container">
    <h1>회원가입</h1>
    <p> 계정을 생성합니다.</p>
    <hr>
    
    <table class = "user_input_info">
    	<tr><td>이름 : </td><td><input type="text" name="name" required></td></tr>
	    <tr><td>전화번호 : </td><td><input type="text" name="phone" required></td></tr>
	    <tr><td>이메일 : </td><td><input type="email" name="userId" required></td></tr>
	    <tr><td>비밀번호 : </td><td><input type="password" name="userPw" required></td></tr>
	    <tr><td>비밀번호 확인 : </td><td><input type="password" name="psw-repeat" required></td></tr>
    </table>
    
    <div class="buttons">
    	<button type="submit" class="btn">가입하기</button>
   	 	<input class="btn" type="button" value="닫기" onClick="self.close()"> 
    </div>
  </div>
</form>

</body>
</html>
    