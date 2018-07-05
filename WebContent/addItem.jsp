<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>write your wish</title>
<style>
*{
	box-sizing: border-box;
}
body{
	margin:0;
	background : #ff8040;
}
 #wishPage{
	
	}
#wishPage .btn{
	width : 50px;
	height: 30px;
	background: #c0c0c0;
	border: none;
	position :relative;
	left:80px;
	bottom : -20px;
	
}
#wishPage .btn:hover{
	box-shadow: 3px 3px #ff8040;
}

form{
	position:relative;
	margin:100px 100px;
	padding : 20px;
	width : 300px;
	height: 300px;
	background : white;
	
}
ul{padding:0;}
ul li{
	margin:0;
	list-style-type: none;
	float : left;
}
.Red{
	background: red;	
}
.Orange{
	background: orange;	
}
.Green{
	background: green;	
}
.Blue{
	background: blue;	
}
.Violet{
	background: #8000ff;	
}
span{
	display: inline-block;
	border-radius : 50%;
	width : 15px;
	height : 15px;
}
#bookmark{
	position:absolute;
	top:25px;
	right : 20px;
	font-size: 30px;
	color : yellow;
} 
</style>
</head>
<body>
	<div id="wishPage">
	<form action="AddItem" method="post">
	<h3>write your wish</h3>
	<label id="bookmark"><input name="bookmark" type="checkbox" value="1" >★</label><br><!-- 체크되면 1로 반환 : true -->
	<label>링크<input type="text" name="link" required></label>
	<button>ok</button><br>
	<label>이름<input type="text" name="itemName"></label><br>
	<label>가격<input type="number" name="itemPrice"></label><br>
	<ul id="tagList">
			<li>
				<label>
				<input type="radio" name="tagColor" value="redTag" checked>
				<span class="Red"></span>
				</label>
			</li>
			<li>
				<label>
				<input type="radio" name="tagColor" value="orangeTag" >
				<span class="Orange"></span>
				</label>
			</li>
			<li>
				<label>
				<input type="radio" name="tagColor" value="greenTag" >
				<span class="Green"></span>
				</label>
			</li>
			<li>
				<label>
				<input type="radio" name="tagColor" value="blueTag" >
				<span class="Blue"></span>
				</label>
			</li>
			<li>
				<label><input type="radio" name="tagColor" value="violetTag" >
				<span class="Violet"></span>
				</label>
			</li>
	</ul>
	<br>
	
	<input class="btn addBtn" type="submit" value="○">
	<input class="btn cancelBtn" type="button" value="X">
	</form>
</div>
</body>
</html>