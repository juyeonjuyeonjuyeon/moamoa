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
@import url('https://fonts.googleapis.com/css?family=Jua');
@import url('https://fonts.googleapis.com/css?family=Nanum+Pen+Script');
@import url('https://fonts.googleapis.com/css?family=Handlee');
@import url('https://fonts.googleapis.com/css?family=Chela+One');
@import url('https://fonts.googleapis.com/css?family=Fugaz+One');

*{
	box-sizing: border-box;
}
body{
	margin:0;
	background : #ff8040;
}
.hide{
	display : none;
}
#wishPage{
	padding : 10px 50px;
	position:relative;
	margin:30px 70px;
	width : 350px;
	height: 400px;
	background : white;
	
}
h3{
	font-size :25px;
	margin : 0px -10px 20px -20px;
	font-family: 'Fugaz One', cursive;
}
/* 버튼 */
.btn{
	width : 50px;
	height: 30px;
	background: #c0c0c0;
	border: none;
	position :relative;
	left:70px;
	bottom : -20px;
	font-family: 'Fugaz One', cursive;
	cursor: pointer;
}
#okBtn{
	margin : 0;
	width : 40px;
	height: 30px;
	background : #c0c0c0;
	border : none;
	font-family: 'Fugaz One', cursive;
	cursor: pointer;
	}
#okBtn:hover,.btn:hover{
	box-shadow: 3px 3px #ff8040;
	animation: bounce 0.5s alternate infinite cubic-bezier(.5,0.05,1,.5);
}
/* 입력상자 */
[type = "text"]{ 
	margin : 3px 0px;
	width : 200px;
	height : 30px;
}

/* 태그 */
ul{padding:0;}
ul li{
	margin:0;
	list-style-type: none;
	float : left;
}
.Red{background: red;}
.Orange{background: orange;}
.Green{background: green;}
.Blue{background: blue;}
.Violet{background: #8000ff;}
span{
	display: inline-block;
	border-radius : 50%;
	width : 15px;
	height : 15px;
}
/* 북마크 */
.bookmark{
	position:absolute;
	top:10px;
	right : 20px; 
	padding : 0;
	margin : 0;
	font-weight:bold;
	font-size: 50px;
	color : #e8b212;
	background : none;
	border : none;
	font-family: 'Jua', cursive;
	cursor: pointer;
} 
/* 상품이미지 */
#itemImg{
	display :inline-block;
	width:100px;
	height : 100px;
	margin :0 70px;
}
/* 애니메이션 */
@keyframes bounce {
  from { transform: translate3d(0, 0, 0);     }
  to   { transform: translate3d(0, -10px, 0); }
}
</style>
</head>
<body>
	
<form id="wishPage" action="AddItem" method="post">
	<h3>write your wish</h3>
	
<!-- 북마크 버튼 -->
    <button type="button" id="onBookmark" class="bookmark" onclick="onCheck(this)">☆</button>
    <button	type="button" id="offBookmark"  class="bookmark hide" onclick="offCheck(this)">★</button>
    <input id="bookmark" class="hide" name="bookmark" type="checkbox" value="1" />
 <!-- 이미지 (출력부분과 전송부분)-->
	<img id="itemImg" src="<%=path %>/mycart/sample.jpg" alt="상품이미지"><br>
	<input id="imgSrc" name="imgSrc" type="text" class="hide">
<!-- 링크 -->
	<input name="link" type="text" id="itemLink" placeholder="상품링크 붙여넣기" required>
	<button id="okBtn" type="button" onclick="getLink()">ok</button><br>
<!-- 이름 -->
	<input name="itemName" id="itemName" type="text" placeholder="상품이름 입력"><br>
<!-- 가격 -->
	<input name="itemPrice" id="itemPrice" type="text" placeholder="상품가격 입력"><br>
<!-- 태그 -->
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
	var postUrl = path + "/Getlink"; //서버주소
	var link = $("#itemLink").val(), //서버로 전송하는 데이터
		img=$("#itemImg"),
		imgSrc=$("#imgSrc"),
		name=$("#itemName"), 
		price=$("#itemPrice"); // 받아올 데이터
		
	$.ajax({
		  type: "POST",
		  url: postUrl,
		  data: {link : link},
		  
		  success: function(data){
			 console.log(data.itemName);
			 console.log(data.imgSrc);
			 console.log(data.itemPrice);
			 
			 img.attr("src",data.imgSrc);
			 imgSrc.val(data.imgSrc);
			 name.val(data.itemName);
			 price.val(data.itemPrice);
	    }
		});
	}

</script>
</body>
</html>