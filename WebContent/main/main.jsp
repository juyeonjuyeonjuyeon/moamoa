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
<style type="text/css">
*{
box-sizing : border-box;
}
body{
	background : #14356b;
	margin : 0;
	padding : 0;
}
/* 메뉴바 */
#buttons{
	width : 300px;
	height : 1000px;;
	position: relative;
	background: grey;
}
#buttons button{
	width : 100px;
	height : 150px;
	position : absolute;
	background : black;
	border : 3px inset white;;
	color : white;
	font-size: 30px;
}
#buttons button:hover{
	background: yellow;
	color:black;
}
/* #buttons a{
	display:block;
	width : 100%;
	height : 100%;
	color : white;
	text-decoration: none;
} */
 #buttons a{
	display:block;
	width : 100px;
	height : 150px;
	position : absolute;
	background : black;
	border : 3px inset white;;
	color :white;
	font-size: 30px;
	text-decoration: none;
	text-align: center;
	
	
}

#buttons a:hover{
	background : yellow;
	color :black;
}

#addWish{
	top:300px;
	left : 20px;
}
#goCart{
	top:300px;
	left : 140px;
}
#login{
	top : 100px;
	left:140px;
}

/* 그냥 */
#moon{
position: absolute;
top : 80px;
right : 80px;
background : yellow;
border-radius: 50%;
width : 100px;
height : 100px;

}
</style>
</head>
<body>

<!-- <script type="text/javascript"> 
var str = "http://localhost/moamoa/mycart/mycart.jsp";
function goReplace(str) { location.replace("http://localhost/moamoa/mycart/mycart.jsp"); } 
</script> -->

<div id="buttons">
	<!-- <button id="addWish" onclick="goReplace('mycart/mycart.jsp')">add wish</button> -->
	<button id="addWish">add wish</button>
<!-- <button id="goCart" > -->
	<a id="goCart" href="<%=path%>/mycart/mycart.jsp">my cart</a>
<!-- </button> -->
	<button id="login">login</button>
</div>
<div id="moon"></div>
</body>
</html>