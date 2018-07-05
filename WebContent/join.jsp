<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>join us</title>
</head>
<body>
<form action="JoinUsProc" method="post" style="border:1px solid #ccc">
  <div class="container">
    <h1>회원가입</h1>
    <p> 계정을 생성합니다.</p>
    <hr>
    
    <input type="text" placeholder="이름 입력" name="name" required>
    <input type="email" placeholder="이메일 입력" name="userId" required>
    <input type="text" placeholder="전화번호 입력" name="phone" required>
    <input type="password" placeholder="비밀번호 입력" name="userPw" required>
    <input type="password" placeholder="비밀번호 재입력" name="psw-repeat" required>
    
    <div class="buttons">
    	<button type="submit" class="signupbtn">가입하기</button>
   	 	<input class="cancelBtn" type="button" value="닫기" onClick="self.close()"> 
    </div>
  </div>
</form>

</body>
</html>
    