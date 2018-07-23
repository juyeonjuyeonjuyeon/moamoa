<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String userName = (String) session.getAttribute("name"); // 사용자 닉네임 가져오기
String phone = (String) session.getAttribute("phone");
String email = (String) session.getAttribute("email");
String pw = (String) session.getAttribute("pw");
    %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보</title>
<style>
@import url('https://fonts.googleapis.com/css?family=Jua');
@import url('https://fonts.googleapis.com/css?family=Nanum+Pen+Script');
@import url('https://fonts.googleapis.com/css?family=Handlee');
@import url('https://fonts.googleapis.com/css?family=Chela+One');
@import url('https://fonts.googleapis.com/css?family=Fugaz+One');
*{
	box-sizing : border-box;
}
a{
	text-decoration: none;
}
header{
	text-align : center;
	font-family: 'Fugaz One', cursive;
}
header a{
	color : white;
}
body { background : #efe492;}
.page{
		margin : auto;
		padding : 20px;
		border : 1px solid white;
		background : white;
		width : 500px;
		height : 500px;
	}
.userImg{
	margin : auto;
	width : 150px;
	height: 150px;
	border : 1px solid grey;
}
</style>
</head>
<body>
<header>
<h1><a href="<%=path%>/main/main.jsp" >MOA MOA</a></h1>
</header>
<div class="page">
<div class="userImg">
<img src="" alt="유저 정보">
</div>
<span>이름 : </span><%=userName %>
<br>
<span>전화번호 : </span><%=phone %>
<br>
<span>이메일 : </span><%=email %>
<br>
<span>비밀번호 : </span><%=pw %>
<br>
<button>정보수정</button>
<button>회원탈퇴</button>
</div>
</body>
</html>