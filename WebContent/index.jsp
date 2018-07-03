<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
 %>
<!-- 구현해야할 것들 참고사항. 필수는 * 붙은거. 나중에 위시순위리스트로 바뀜 -->
<!-- <div class ="todoList">
	<ol>
	<li>*사이트링크에서 상품 사진, 가격, 이름 가져오기*</li>
	<li>*가져온 상품 추가하기-DB연동*</li>
	<li>*상품보여지는 화면 조정 : 한페이지당 9개 보이기(변동가능)*</li>
	<li>*아이템 정렬 (고가순/저가순)*</li>
	<li>폴더 추가</li>
	<li>아이템 정리(폴더 이동)(폴더 삭제)(아이템 삭제)(아이템 추가)</li>
	<li>*로그인*</li>
	<li>아이템 위시 순위 리스트</li>
	</ol>
</div> -->
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>모아모아</title>
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
	<h1>ʕ•ﻌ•ʔmoamoaʕ•ﻌ•ʔ</h1>
</header>

<!--메뉴 -->
<nav>
	<div id="comment">
		<p>안녕하세요. <%=userName%> 님. 총 <%=item%>개의 상품이 담겨있습니다.</p>
	</div>
	<div id="menu">
		<ul>
			<li><a href="#" id="add">추가</a></li>
			<li><a href="#" id="edit">편집</a></li>
			<li><a href="#" id="login">로그아웃</a></li>
			
		</ul>
		<ul id="tagList">
			<li><a href="#" id="redTag"><span class="red"></span>태그1</a></li>
			<li><a href="#" id="orangeTag"><span class="orange"></span>태그2</a></li>
			<li><a href="#" id="greenTag"><span class="green"></span>태그3</a></li>
			<li><a href="#" id="blueTag"><span class="blue"></span>태그4</a></li>
			<li><a href="#" id="violetTag"><span class="violet"></span>태그5</a></li>
		</ul>
	</div>
</nav>


<!--본문 예시. 실제로는 추가되는 것만큼 표시  -->
<div class="main">
<div class="itemList">
	<!-- <div class="remoteBtn"> -->
		<button id="leftBtn">왼쪽</button>
		<button id="rightBtn">오른쪽</button>
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