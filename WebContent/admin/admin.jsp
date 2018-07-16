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
<link rel="stylesheet" type="text/css" href="<%=path%>/admin/style.css?ver=2">
<%
	System.out.println(path);
%>

</head>
<body background="cityBg.gif">
<!-- <script type="text/javascript"> 
var str = "http://localhost/moamoa/mycart/mycart.jsp";
function goReplace(str) { location.replace("http://localhost/moamoa/mycart/mycart.jsp"); } 
</script> -->

<!-- 네온사인 간판 헤더 -->
<header>
	<h1 id="neonsign"><a href="#">MOA MOA</a></h1>
</header>
<%-- 	<%
		if (name != null) {
	%>
	<%=name%>
	님 환영합니다.
	<%
		} else{		
	%>

	<%} %> --%>
<div id="buttons">
	<!-- <button id="addWish" onclick="goReplace('mycart/mycart.jsp')">add wish</button> -->
	
	<a id="addWish" href="#wishPage">add wish</a>
	<a id="goCart" href="<%=path%>/mycart/mycart.jsp">my cart</a>
	<a id="logout" href="<%=path%>/LogoutServlet">log out</a>
	
</div>
<div id="night">
	<div id="moon"><div id="moonShadow"></div></div>
</div>
<!-- 아이템 추가 부분 -->
<div id="wishPage">
	<form action="<%=path %>/AddItem" method="post">
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
</div>
<!--모아모아 정보 페이지 -->
<footer>
	<div id = "moamoaPage">
	<h2>m o a m o a</h2>
	
	<div id = "info_page">
		<div id = "how_to_use">
			<h4>사이트 이용 방법</h4>
			<div id = "use_info">
				1. 회원가입<br>
				2. 로그인<br>
				3. 쇼핑몰의 원하는 품목 페이지에  접속<br>
				4. 주소창의 링크 복사<br>
				5. AddItem 창에 링크 붙여넣기<br>
				5-1. 목록이 자동으로 채워지지 않을 경우 수동 입력<br>
				6. 태그 및 즐겨찾기 여부 지정 후 저장
			</div>
		</div>
			
		<div id = "disposable_site_list">
			<h4>이용가능한 사이트 목록</h4>
			<div id = "site_info">
				♧ 옥션<br>
				♧ 지마켓<br>
				♧ 11번가<br>
				♧ 쿠팡<br>
				♧ 티몬<br>
				<br>
				♣ 이 외의 사이트는 직접 입력<br>
				♣ 추후 업데이트<br>
			</div>
		</div>
		
		<div id = "connect_to_team">
			<h4>건의 사항</h4>
			<div id = "connect_info">
				Email : aaa@aaa.com<br><br>
				Phone : 02)111-1111<br><br>
				Adress : OO시 OO구 OO동 OOO길00-1
			</div>
		</div>
	</div>
	
	</div>
	<div id = "member_info">
		<h2>TEAM 1</h2>
		<h3>강주연  │  예강훈  │  최혜인  │  황종윤</h3>
	</div>
</footer>
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
	var path =  '/' + location.pathname.split('/')[1]; 
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