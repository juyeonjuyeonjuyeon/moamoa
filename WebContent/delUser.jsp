<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="<%=path %>/img/favicon.ico" />
<title>회원탈퇴</title>
</head>
<body>
<script>
alert("회원탈퇴 처리 되었습니다.");
location.href="/moamoa/main/main.jsp";
</script>
</body>
</html>