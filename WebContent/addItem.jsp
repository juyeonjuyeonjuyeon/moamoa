<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String imgSrc = (String)request.getAttribute("imgSrc");
	String itemName = (String)request.getAttribute("itemName");
	String itemPrice = (String)request.getAttribute("itemPrice");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
  src="https://code.jquery.com/jquery-3.3.1.js"
  integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
  crossorigin="anonymous"></script>
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
.bookmark{
	position:absolute;
	top:0px;
	right : 0px; 
	padding : 0;
	margin : 0;
	font-weight:bold;
	font-size: 30px;
	color : #e8b212;
	background : none;
	border : none;
} 
.hide{
	display : none;
}
#itemImg{
	width:100px;
	height : 100px;
	margin : auto;
}
</style>
</head>
<body>
	<div id="wishPage">
		
	<h3>write your wish</h3>
	<form action="AddItem" method="post">
	<!-- 북마크 버튼 -->
    <button type="button" id="onBookmark" class="bookmark" onclick="onCheck(this)">☆</button>
    <button	type="button" id="offBookmark"  class="bookmark hide" onclick="offCheck(this)">★</button>
    <input id="bookmark" class="hide" name="bookmark" type="checkbox" value="1" />
	<!-- 링크 -->
	<label>링크<input type="text" id="itemLink" name="link" required></label>
	<button type="button" onclick="getLink()">ok</button><br>
	<!-- 이미지 -->
	<img id="itemImg" src="<%=path %>/mycart/sample.jpg" alt="상품이미지"><br>
	<!-- 이름 -->
	<label>이름<input id="itemName" type="text" name="itemName"></label><br>
	<label>가격<input id="itemPrice" type="text" name="itemPrice"></label><br>
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
	
	<input class="btn addBtn" type="submit" value="O">
	<input class="btn cancelBtn" type="button" value="X" onClick='self.close()'> 
	</form>
</div>
<script>
/* 북마크 버튼 작동 함수  */
function onCheck(obj){
	var checkbox = document.getElementById("bookmark"),
	other = document.getElementById("offBookmark");
	
	document.getElementById("bookmark").checked = true;
	document.getElementById("bookmark").value = "1";
	
	obj.style.display = "none";
	other.style.display = "inline-block";
}
function offCheck(obj){
	var checkbox = document.getElementById("bookmark"),
	other = document.getElementById("onBookmark");
	
	document.getElementById("bookmark").checked = false;
	document.getElementById("bookmark").value = "0";
	
	obj.style.display = "none";
	other.style.display = "inline-block";
}

function getLink() {
	var path = '/' + location.pathname.split('/')[1];
	var postUrl = path + "/Getlink";
	var link = $("#itemLink").val();
	var src=<%=imgSrc%>
		,name=<%=itemName%>
		,price=<%=itemPrice%>;
	$.ajax({
		  type: 'POST',
		  url: postUrl,
		  data: {link : link},
		  
		  success: function(data){
			  
			   $("#itemImg").attr("src",src);
			  $("#itemName").val(name);
			  $("#itemPrice").val(price);
	    	console.log("data: " + data);
	    	if (data.trim() == "YES") {
	    		console.log("이미 있는");
	    		$('#err-text').val('yes');
	    		console.log('errcheck값: ' + $('#errcheck').val());
//	    		$('#control-email').val('email');
//	    		location.href= path +"/login.tm0";
	    	} else {
	    		console.log("없음");
	    		$('#errcheck').val('no');
	    	}
	    },
		  async:false
		});
	}

</script>
</body>
</html>