<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
</head>
<body>


<form action="/action_page.php" style="border:1px solid #ccc">
  <div class="container">
    <h1>회원가입</h1>
    <p> 계정을 생성합니다.</p>
    <hr>
    
    <label for="닉네임">닉네임</label>
    <input type="text" placeholder="Nickname 입력" name="Nickname" required>

    <label for="아이디">아이디</label>
    <input type="text" placeholder="ID 입력" name="ID" required>
    
    <label for="비밀번호">비밀번호</label>
    <input type="password" placeholder="Password 입력" name="psw" required>

    <label for="비밀번호 재입력">비밀번호 재입력</label>
    <input type="password" placeholder="Password 재입력" name="psw-repeat" required>
    
    <div class="clearfix">
    <button type="submit" class="signupbtn">가입하기</button>
    <input class="cancelBtn" type="button" value="닫기" onClick="self.close()"> 
    </div>
  </div>
</form>

</body>
</html>
    