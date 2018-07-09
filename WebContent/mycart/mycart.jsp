<%@page import="com.team1.dao.ItemDAO"%>
<%@page import="com.team1.vo.ItemVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
/*private int item_idx;    // 자동 증가 상품 등록순 번호
	private String link;  // 링크
	private String imgSrc;    // 이미지 주소
	private String itemName;  // 상품 이름
	private int itemPrice; // 상품가격
	private String tagColor; // 태그 컬러(1-red,2- orange,3- green,4-blue,5-violet)
	private int bookmark; //북마크 체크 여부(0-false, 1-true)*/

	//아이템 태그 색깔 : 데이터베이스에서 가져오기
	String link = "#";
	String imgSrc = "item1.jpg";
	String itemName = "name";
	int itemPrice = 100;
	String tagColor = "redTag";
	int bookmark = 0;
	
%>
<%
	String userName = "홍길동";  
	int item = 0;
%>
<!DOCTYPE html>
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


<!--본문  -->
<div class="main">
	<div class="itemList">
		<!-- <div class="remoteBtn"> -->
		<!-- <button id="leftBtn">왼쪽</button>
			<button id="rightBtn">오른쪽</button> -->
		<!-- </div> -->
		
		
		<%	
			ArrayList<ItemVO> getList = ItemDAO.getItem();
		  	for (ItemVO vo : getList) { 
		%>
		  
		<!-- item 박스 -->
		<div class="item">
		<%
		 	link = vo.getLink();
		 	imgSrc = vo.getImgSrc();
		 	itemName = vo.getItemName();
		 	itemPrice = vo.getItemPrice();
		 	tagColor = vo.getTagColor();
		 	bookmark = vo.getBookmark();
		 %>
		 	<!-- item 북마크 : 토글버튼 구현하기 -->
		<%if(bookmark == 0){%>
			<span class="bookmark" style="color : red; font-size:25px; font-wieght : bole;">☆</span>
		<%}else{%>
			<span class="bookmark" style="color : red; font-size:25px; font-wieght : bole;">★</span>
		<%} %>
		<!-- item 이미지 영역 -->
			<div class="itemImg">
				<a href="<%=link%>">
				<img src="<%=imgSrc%>" alt="그림" class="itemImg">
				</a>
			</div>
		<!-- item 정보 영역 -->
			<div class="item_info">
			<!-- item 정보 : 이름 -->
				<p class ="itemName"><%=itemName %></p>
			<!-- item 정보 : 가격 -->
				<p class="itemPrice"><%=itemPrice %><span class="won">원</span></p>
			<!-- item 정보 : 태그 -->
				<%if(tagColor.equals("redTag")){%>
					<div class="tagColor Red" style="width :10px; height: 10px;background : red;"></div>
				<%}else if(tagColor.equals("orangeTag")){%>
					<div class="tagColor Orange" style="width :10px; height: 10px;background : orange;"></div>
				<%}else if(tagColor.equals("greenTag")){%>
					<div class="tagColor Green" style="width :10px; height: 10px;background : green;"></div>
				<%}else if(tagColor.equals("blueTag")){%>
					<div class="tagColor Blue" style="width :10px; height: 10px;background : blue;"></div>
				<%}else{%>
					<div class="tagColor Violet" style="width :10px; height: 10px;background : #8000ff;"></div>
				<%} %>
			</div>
		</div>
			
		<%} %>
			
	</div>
	<!-- <div class="pageList">
		<ul>
			<li><a href="#">1</a></li>
			<li><a href="#">2</a></li>
			<li><a href="#">3</a></li>
		</ul>
	</div> -->
	
	
	


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