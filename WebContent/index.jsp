<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>모아모아</title>
<style type="text/css">
	body{
		background : rgb(18, 32, 56);
		color : white;
	}
	nav{
		border:1px solid white;
		overflow : auto;
		width : 1200px;
		height : auto;
		padding:0;
		
	}
	nav li{
	list-style-type : none;
	}
	.dirList li{
	float:left;
	padding : 0px 20px;
	}
	.menu li{
	float:right;
	padding : 0px 20px;
	}
	.itemList{
		border : 2px dotted yellow;
		width : 900px;
		height: auto;
	}
	.item{
	border : 2px solid orange;
	width : 246px;
	height : 246px;
	}	
	.todoList{
	padding:0;
	width : 250px;
	height : auto;
	border : 2px dotted yellow;
	font-size : 18px;
	position : fixed;
	right : 50px;
	top : 150px;
	}
</style>
</head>
<body>
<!--헤더, 로고  -->
<h1>moamoa</h1>
<!--메뉴  -->
<nav>
	<ul class="dirList">
		<li><button id="addDir">폴더 추가</button></li>
	</ul>
	
	<ul class="menu">
		<li><button id="login" >로그인</button></li>
		<li>정렬</li>
	</ul>
</nav>


<!--본문 예시. 실제로는 추가되는 것만큼 표시  -->

<div class="itemList">
	<table>
		<tr>
			<td class="item">
			<img src="" alt="그림" class="itemImg">
			<p class = "itemName" >ddd</p>
			<p class="itemPrice">1,000</p>
			</td>
			<td class="item">
			<img src="" alt="그림" class="itemImg">
			<p class = "itemName" >ddd</p>
			<p class="itemPrice">1,000</p>
			</td>
			<td class="item">
			<img src="" alt="그림" class="itemImg">
			<p class = "itemName" >ddd</p>
			<p class="itemPrice">1,000</p>
			</td>
		</tr>
		<tr>
			<td class="item">
			<img src="" alt="그림" class="itemImg">
			<p class = "itemName" >ddd</p>
			<p class="itemPrice">1,000</p>
			</td>
			<td class="item">
			<img src="" alt="그림" class="itemImg">
			<p class = "itemName" >ddd</p>
			<p class="itemPrice">1,000</p>
			</td>
			<td class="item">
			<img src="" alt="그림" class="itemImg">
			<p class = "itemName" >ddd</p>
			<p class="itemPrice">1,000</p>
			</td>
		</tr>
		<tr>
			<td class="item">
			<img src="" alt="그림" class="itemImg">
			<p class = "itemName" >ddd</p>
			<p class="itemPrice">1,000</p>
			</td>
			<td class="item">
			<img src="" alt="그림" class="itemImg">
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