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
<link rel="stylesheet" type="text/css" href="<%=path%>/admin/style.css">
<%
	System.out.println(path);
%>
</head>
<body background="cityBg.gif">
<!-- <script type="text/javascript"> 
var str = "http://localhost/moamoa/mycart/mycart.jsp";
function goReplace(str) { location.replace("http://localhost/moamoa/mycart/mycart.jsp"); } 
</script> -->
<h1>메인페이지</h1>
	<%
		if (name != null) {
	%>
	<%=name%>
	님 환영합니다.
	<%
		} else{		
	%>

	<%} %>
<div id="buttons">
	<!-- <button id="addWish" onclick="goReplace('mycart/mycart.jsp')">add wish</button> -->
	
	<a id="addWish" href="#wishPage">add wish</a>
	<a id="goCart" href="<%=path%>/mycart/mycart.jsp">my cart</a>
	<a id="logout" href="<%=path%>/LogoutServlet">logout</a>
	
</div>
<div id="night">
	<div id="moon"><div id="moonShadow"></div></div>
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