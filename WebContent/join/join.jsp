<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<style>
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box}
/*  */
/* Full-width input fields */
input[type=text], input[type=password] { 
    width: 100%;
    padding: 15px;
    margin: 5px 0 22px 0;
    display: inline-block;
    border: none;
    background: #f1f1f1;
}

input[type=text]:focus, input[type=password]:focus {
    background-color: #ddd;
    outline: none;
}

hr {
    border: 1px solid #f1f1f1;
    margin-bottom: 25px;
}

/* Set a style for all buttons */
button {
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 100%;
    opacity: 0.9;
}

button:hover {
    opacity:1;
}

/* Extra styles for the cancel button */
.cancelbtn {
    padding: 14px 20px;
    background-color: #f44336;
}

/* Float cancel and signup buttons and add an equal width */
.cancelbtn, .signupbtn {
  float: left;
  width: 50%;
}

/* Add padding to container elements */
.container {
    padding: 16px;
}

/* Clear floats */
.clearfix::after {
    content: "";
    clear: both;
    display: table;
}

/* Change styles for cancel button and signup button on extra small screens */
@media screen and (max-width: 200px) {
    .cancelbtn, .signupbtn {
       width: 100%;
    }
}
</style>
<script>
	function close(){
		window.close();
	}
</script>
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
      <button type="button" class="cancelbtn" onclick="close()">취소</button>
      <button type="submit" class="signupbtn">가입하기</button>
    </div>
  </div>
</form>

</body>
</html>
    