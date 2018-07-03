<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>모아모아</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	/* $(document).ready(function(){
	    $("#addDir").click(function(){
	        $("#dirList").prepend("<li><a href="#">새폴더</a></li>");
	    });
	}); */
</script>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<!--헤더, 로고  -->
<header>
	<h1>ʕ•ﻌ•ʔmoamoaʕ•ﻌ•ʔ</h1>
</header>

<!--메뉴  -->
<nav>
	<ul id="dirList">
		<li><a href="#" class ="dir" >폴더 1</a></li>
		<li><button id="addDir">폴더 추가</button></li>
	</ul>
	
	<ul id="menu">
		<li><button id="login" >로그인</button></li>
		<li><button id="order">정렬</button></li>
	</ul>
</nav>


<!--본문 예시. 실제로는 추가되는 것만큼 표시  -->

<div class="itemList">
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
			<button>아이템 추가하기</button>
			</td>
		</tr>
	</table>
</div>

<!-- 구현해야할 것들 참고사항. 필수는 * 붙은거. 나중에 위시순위리스트로 바뀜 -->

<div class ="todoList">
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
</div>
</body>
</html>