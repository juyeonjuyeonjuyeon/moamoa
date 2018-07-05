<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MOAMOA</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
/* $(document).addDIR(function(){
    $("#addDir").click(function(){
        $("#dirList").prepend("<li>새폴더</li>");
    });
}); */
</script>
<link rel="stylesheet" type="text/css" href="style.css">
<%
String userName = "홍길동";  
int item = 0;
%>
</head>
<body>
<!--헤더, 로고  -->
<header>
	<h1><a href="<%=path%>/main/main.jsp" >ʕ•ﻌ•ʔmoamoaʕ•ﻌ•ʔ</a></h1>
</header>

<!--메뉴 -->
<nav>
	<div id="comment">
		<p>안녕하세요. <%=userName%> 님. 총 <%=item%>개의 상품이 담겨있습니다.</p>
	</div>
	<div id="menu">
		<ul>
			<li><a href="javascript:window.open('<%=path%>/addItem.jsp','write your wish','width=500,height=500,location=no,status=no,scrollbars=yes');" id="add">추가</a></li>
			<li><a href="#" id="edit">편집</a></li>
			<li><a href="#" id="logout">로그아웃</a></li>
			<li><a href="<%=path%>/main/main.jsp" id="home">홈</a></li>
		</ul>
		<ul id="tagList">
			<li><a href="#" id="redTag"><span class="Red"></span>태그1</a></li>
			<li><a href="#" id="orangeTag"><span class="Orange"></span>태그2</a></li>
			<li><a href="#" id="greenTag"><span class="Green"></span>태그3</a></li>
			<li><a href="#" id="blueTag"><span class="Blue"></span>태그4</a></li>
			<li><a href="#" id="violetTag"><span class="Violet"></span>태그5</a></li>
		</ul>
	</div>
</nav>


<!--본문 예시. 실제로는 추가되는 것만큼 표시  -->
<div class="main">
<div class="itemList">
	<!-- <div class="remoteBtn"> -->
	<!-- <button id="leftBtn">왼쪽</button>
		<button id="rightBtn">오른쪽</button> -->
	<!-- </div> -->
	
	<table>
		<tr>
			<td class="item">
				<img src="item1.jpg" alt="그림" class="itemImg">
				<p class = "itemName" >ddd</p>
				<p class="itemPrice">1,000</p>
			</td>
			<td class="item">
				<img src="item1.jpg" alt="그림" class="itemImg">
				<p class = "itemName" >ddd</p>
				<p class="itemPrice">1,000</p>
			</td>
			<td class="item">
				<img src="item1.jpg" alt="그림" class="itemImg">
				<p class = "itemName" >ddd</p>
				<p class="itemPrice">1,000</p>
			</td>
		</tr>
		<tr>
			<td class="item">
				<img src="item1.jpg" alt="그림" class="itemImg">
				<p class = "itemName" >ddd</p>
				<p class="itemPrice">1,000</p>
			</td>
			<td class="item">
				<img src="item1.jpg" alt="그림" class="itemImg">
				<p class = "itemName" >ddd</p>
				<p class="itemPrice">1,000</p>
			</td>
			<td class="item">
				<img src="item1.jpg" alt="그림" class="itemImg">
				<p class = "itemName" >ddd</p>
				<p class="itemPrice">1,000</p>
			</td>
		</tr>
		<tr>
			<td class="item">
				<img src="item1.jpg" alt="그림" class="itemImg">
				<p class = "itemName" >ddd</p>
				<p class="itemPrice">1,000</p>
			</td>
			<td class="item">
				<img src="item1.jpg" alt="그림" class="itemImg">
				<p class = "itemName" >ddd</p>
				<p class="itemPrice">1,000</p>
			</td>
			<td class="item">
				<img src="item1.jpg" alt="그림" class="itemImg">
				<p class = "itemName" >ddd</p>
				<p class="itemPrice">1,000</p>
			</td>
		</tr>
	</table>
	<ul id="pageList">
		<li><a href="#">1</a></li>
		<li><a href="#">2</a></li>
		<li><a href="#">3</a></li>
	</ul>
</div>

	<div class = "sideMenu">
		<form action="" method="">
			<label><input type="radio" name="align" value="highPrice" >높은 가격 순</label><br>
			<label><input type="radio" name="align" value="lowPrice" >낮은 가격 순</label><br>
			<label><input type="radio" name="align" value="starCheck" >북마크</label><br>
			<button>적용</button>
		</form>
		
	<!-- 태그 모음 : 자바스크립트 이용, 태그 누르면 해당 태그 아이템 출력-->
	<!-- 	<div id="tagList">
		<a href="#" id="redTag">태그1</a><br>
		<a href="#" id="orangeTag">태그2</a><br>
		<a href="#" id="greenTag">태그3</a><br>
		<a href="#" id="blueTag">태그4</a><br>
		<a href="#" id="pinkTag">태그5</a>
		</div> -->
	</div>
</div>
</body>
</html>