<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		String path = request.getContextPath();
		String name = (String) session.getAttribute("name");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MOAMOA</title>
<link rel="stylesheet" type="text/css" href="<%=path%>/main/style.css?ver=1">
</head>
<body>

<h1>메인페이지</h1>
	<%
		if (name != null) {
	%>
	<%=name%>
	님 환영합니다.

	<script type="text/javascript">
	location.href="<%=path%>/admin/admin.jsp";	
	
	</script>
	<%
		} else{		
	%>

	<%} %>
<!-- 메인 페이지 -->
<div id="buttons">
	<!-- <button id="addWish" onclick="goReplace('mycart/mycart.jsp')">add wish</button> -->
	
	<a id="goInfo" href="#moamoaPage">moa moa</a>
	<a id="goCart" href="<%=path%>/mycart/mycart.jsp">my cart</a>
	<a id="login" href="#loginPage">login</a>
</div>


<div id="night">
<div id="moon"><div id="moonShadow"></div></div>
</div>

<!-- 로그인 페이지 -->
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
<!--모아모아 정보 페이지 -->
<div id = "moamoaPage">
	<h3>moamoa</h3>
</div>

</body>
</html>