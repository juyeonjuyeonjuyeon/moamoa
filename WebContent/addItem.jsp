<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String imgSrc = (String)request.getAttribute("imgSrc");
	String itemName = (String)request.getAttribute("itemName");
	String itemPrice = (String)request.getAttribute("itemPrice");
	String userMail = (String) session.getAttribute("email");
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
.shadow{
	 box-shadow: 0 10px 18px #888888;
}
#wishPage{
	padding : 10px 40px;
	position:relative;
	margin:30px 50px;
	width : 400px;
	height: 400px;
	background : white;
}
h3{
	font-size :25px;
	margin : 0px -10px 20px -20px;
	font-family: 'Fugaz One', cursive;
}
/* 입력상자 */
.label{
	border-bottom : 1px solid grey;
	
}
[type = "text"]{ 
	/* margin : 3px 0px; */
	border : none;
	width : 200px;
	height : 30px;
}
/* 버튼 */
.buttons{
	clear : both;
}
.btn{
	width :40px;
	height: 30px;
	background : none;
	border: none;
	position :relative;
	left:100px;
	bottom : -20px;
	font-size : 16px;
	cursor: pointer;
}
.ok{
	font-family: 'Chela One', cursive;
	margin : 0;
	position :static;
	}

.btn:hover{
	color : #ff8040;
}
.ok:hover{
	background : #ff8040;
	color : white;
	width : 30px;
	height: 30px;
	border-radius : 50%;
	animation: bounce 0.5s alternate infinite cubic-bezier(.5,0.05,1,.5);
}


/* 태그 */
ul{padding:0;}
ul li{
	margin:0;
	padding-right : 10px;
	list-style-type: none;
	float : left;
}
.Red{background: red;}
.Orange{background: orange;}
.Green{background: green;}
.Blue{background: blue;}
.Violet{background: #8000ff;}
.tag{
	display: inline-block;
	border-radius : 50%;
	width : 20px;
	height : 20px;
	text-align: center;
	font-weight : bold;
	color : rgba(0,0,0,1);
}
.tag:hover{
	border : 2.5px solid #ff8040;
}
.tag:checked{
	border : 2.5px solid #ff8040;
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
	margin :0 100px;
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

	<table>
	<!-- 링크 -->
		<tr><td class="label">링크
		<input name="link" type="text" id="itemLink" placeholder=" 붙여넣기" required></td>
		<td><button class="ok btn" type="button" onclick="getLink()">ok</button></td>
		</tr>
		<!-- 이름 -->
		<tr><td class="label">상품이름
		<input name="itemName" id="itemName" type="text" placeholder="적어주세요" required></td>
		</tr>
		<!-- 가격 -->
		<tr><td class="label">가격
		<input name="itemPrice" id="itemPrice" type="text" placeholder="얼마인가요?" required></td>
		</tr>
	</table>
	
<!-- 태그 -->
	<ul id="tagList">
			<li>
				<label>
				<input type="radio" name="tagColor" value="redTag" checked>
				<span class="Red tag"></span>
				</label>
			</li>
			<li>
				<label>
				<input type="radio" name="tagColor" value="orangeTag" >
				<span class="Orange tag"></span>
				</label>
			</li>
			<li>
				<label>
				<input type="radio" name="tagColor" value="greenTag" >
				<span class="Green tag"></span>
				</label>
			</li>
			<li>
				<label>
				<input type="radio" name="tagColor" value="blueTag" >
				<span class="Blue tag"></span>
				</label>
			</li>
			<li>
				<label><input type="radio" name="tagColor" value="violetTag" >
				<span onclick="clicked(this)" class="Violet tag"></span>
				</label>
			</li>
	</ul>
	<div class="buttons">
		<!-- 버튼 -->
		<input class="btn" type="submit" value="저장">
		<input class="btn" type="button" value="닫기" onClick='self.close()'> 
	</div>
	<!-- hide -->
	<input class="hide" type="text" name="userMail" value="<%=userMail%>">
	<!--  -->
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
/*링크 따오기*/
function getLink() {
	var path = '/' + location.pathname.split('/')[1];
	var postUrl = path + "/Getlink"; //서버주소
	var link = $("#itemLink").val(), //서버로 전송하는 데이터
		img=$("#itemImg"), // 이미지 출력
		imgSrc=$("#imgSrc"), //저장할 이미지 소스
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
			/*  //이미지
			 if(data.imgSrc == 0){
				imgSrc.val("sample.jpg");
				img.attr("src","sample.jpg");
			 }else{ */
				imgSrc.val(data.imgSrc);
				img.attr("src",data.imgSrc);
			/*  } */
			 //이름
			 if(data.itemName == 0){
				 name.attr("placeholder","직접입력해 주세요");
			 }else{
				 name.val(data.itemName);
			 }
			//가격
			 if(data.itemPrice == 0){
				 price.attr("placeholder","직접입력해 주세요");
			 }else{
				 price.val(data.itemPrice);
			 }
			 
	    }
		});
	}

</script>
</body>
</html>