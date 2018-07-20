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
	height: 430px;
	background : white;
}
h3{
	font-size :25px;
	margin : 0px -10px 20px -20px;
	font-family: 'Fugaz One', cursive;
}
/*툴팁*/
.ok-tooltip:hover .tooltip{
	width : 100px;
	display : block;
}
.tooltip{
	display :none;
	position:absolute;
	top : 210px;
	left : 350px;
	background : #ddd;
	color : black;
	font-size : 11px;
	text-align : center;
	padding : 1px;
	
}
/*이미지*/
#itemImg{
 	border : 1px solid grey;
}

/* 입력상자 */
.label{
	border-bottom : 1px solid grey;
	
}
[type = "text"],[type = "number"]{ 
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
	border : 2.5px solid #aaa;
}
		/*체크한 태그만 표시*/
input:checked + span{ 
	border : 6px solid #999;

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
    <input id="bookmark" class="hide" name="bookmark" type="checkbox" value="0" />
 <!-- 이미지 (출력부분과 전송부분)-->
	<img id="itemImg" src="<%=path %>/mycart/sample.jpg" alt="상품이미지"><br>
	<table>
		<tr>
		<td class="label">이미지
		<input id="imgSrc" name="imgSrc" type="text" placeholder="링크 붙여넣기"></td>
		</tr>
	<!-- 링크 -->
		<tr><td class="label">링크
		<input name="link" type="text" id="itemLink" placeholder=" 붙여넣기" required></td>
		<td class="ok-tooltip"><button class="ok btn" type="button" onclick="getLink()">ok</button>
		<span class="tooltip">클릭시 상품 정보를 가져옵니다</span>
		</td>
		</tr>
		<!-- 이름 -->
		<tr><td class="label">상품이름
		<input name="itemName" id="itemName" type="text" placeholder="적어주세요" required></td>
		</tr>
		<!-- 가격 -->
		<tr><td class="label">가격
		<input name="itemPrice" id="itemPrice" type="number" placeholder="얼마인가요?" required></td>
		</tr>
	</table>
	
<!-- 태그 -->
	<ul id="tagList">
			<li>
				<label>
				<input class ="hide" type="radio" name="tagColor" value="redTag" checked>
				<span class="Red tag"></span>
				</label>
			</li>
			<li>
				<label>
				<input class ="hide" type="radio" name="tagColor" value="orangeTag" >
				<span class="Orange tag"></span>
				</label>
			</li>
			<li>
				<label>
				<input class ="hide" type="radio" name="tagColor" value="greenTag" >
				<span class="Green tag"></span>
				</label>
			</li>
			<li>
				<label>
				<input class ="hide" type="radio" name="tagColor" value="blueTag" >
				<span class="Blue tag"></span>
				</label>
			</li>
			<li>
				<label><input class ="hide" type="radio" name="tagColor" value="violetTag" >
				<span onclick="clicked(this)" class="Violet tag"></span>
				</label>
			</li>
	</ul>
	<!-- 전송 버튼 -->
	<div class="buttons">
		<!-- 버튼 -->
		<input class="btn" type="submit" value="저장">
		<input class="btn" type="button" value="닫기" onClick='self.close()'> 
	</div>
	<!-- hide -->
	<input class="hide" type="text" name="userMail" value="<%=userMail%>">
</form>
<script>
window.onload = function () {
	document.getElementById("bookmark").value = "0";
	console.log("start"+document.getElementById("bookmark").value);
}
/* 북마크 버튼 작동 함수  */
function onCheck(obj){
	var checkbox = document.getElementById("bookmark"),
	other = document.getElementById("offBookmark");
	
	document.getElementById("bookmark").checked = true;
	document.getElementById("bookmark").value = "1";
	
	obj.style.display = "none";
	other.style.display = "inline-block";
	console.log("on"+document.getElementById("bookmark").value);
}
function offCheck(obj){
	var checkbox = document.getElementById("bookmark"),
	other = document.getElementById("onBookmark");
	
	document.getElementById("bookmark").checked = false;
	document.getElementById("bookmark").value = "0";
	
	obj.style.display = "none";
	other.style.display = "inline-block";
	console.log("off"+document.getElementById("bookmark").value);
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
		
			imgSrc.val(data.imgSrc);
			img.attr("src",data.imgSrc);
			
			 //이름
			 if(data.itemName == "0"){
				 name.attr("placeholder","직접 입력해 주세요");
			 }else{
				 name.val(data.itemName);
			 }
			//가격
			 if(data.itemPrice == 0){
				 price.attr("placeholder","직접 입력해 주세요");
			 }else{
				 price.val(data.itemPrice);
			 }
			 
	    }
		});
	}

</script>
</body>
</html>