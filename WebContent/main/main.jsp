<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MOAMOA</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

<!-- <script type="text/javascript"> 
var str = "http://localhost/moamoa/mycart/mycart.jsp";
function goReplace(str) { location.replace("http://localhost/moamoa/mycart/mycart.jsp"); } 
</script> -->

<div id="buttons">
	<!-- <button id="addWish" onclick="goReplace('mycart/mycart.jsp')">add wish</button> -->
	
	<a id="addWish" href="#wishPage">add wish</a>
	<a id="goCart" href="<%=path%>/mycart/mycart.jsp">my cart</a>
	<a id="login" href="#loginPage">login</a>
</div>
<div id="night">
<div id="moon"></div>
</div>
<!-- 로그인 부분 -->
<div id="loginPage">
	<form action="<%=path %>/LoginProc" method="post">
	<h3>login</h3>
	<table>
	<tr>
	<td><input type="text" name="userId" placeholder="이메일을 입력해주세요" required></td>
	<td rowspan="2"><input class="btn loginBtn" type="submit" value="로그인"></td>
	</tr>
	<tr>
	<td><input type="password" name="userPw" placeholder="비밀번호를 입력해주세요" required></td>
	</tr>
	</table>
	<a class="btn joinBtn" href="javascript:window.open('<%=path%>/join.jsp','join us','width=500,height=500,location=no,status=no,scrollbars=yes');">회원가입</a>
	</form>
</div>
    
<!-- 아이템 추가 부분 -->
<div id="wishPage">

	<form action="" method="post">
	<h3>write your wish</h3>
	<label id="bookmark"><input type="checkbox" value="bookmark" >★</label><br>
	<label>링크<input type="text" name="itemLink" required></label>
	<button>ok</button>
	<br>
	<label>이름<input type="text" name="itemName"></label><br>
	<label>가격<input type="number" name="itemPrice"></label><br>
	<ul id="tagList">
			<li>
				<label>
				<input type="radio" name="tag" value="redTag" checked>
				<span class="Red"></span>
				</label>
			</li>
			<li>
				<label>
				<input type="radio" name="tag" value="orangeTag" >
				<span class="Orange"></span>
				</label>
			</li>
			<li>
				<label>
				<input type="radio" name="tag" value="greenTag" >
				<span class="Green"></span>
				</label>
			</li>
			<li>
				<label>
				<input type="radio" name="tag" value="blueTag" >
				<span class="Blue"></span>
				</label>
			</li>
			<li>
				<label><input type="radio" name="tag" value="violetTag" >
				<span class="Violet"></span>
				</label>
			</li>
	</ul><br>
	
	<input class="btn addBtn" type="button" value="○">
	<input class="btn cancelBtn" type="button" value="X">
	</form>
</div>
</body>
</html>