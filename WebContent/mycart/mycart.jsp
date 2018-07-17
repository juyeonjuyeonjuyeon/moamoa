<%@page import="com.team1.dao.ItemDAO"%>
<%@page import="com.team1.vo.ItemVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/*private int item_idx;    // 자동 증가 상품 등록순 번호
	private String link;  // 링크
	private String imgSrc;    // 이미지 주소
	private String itemName;  // 상품 이름
	private int itemPrice; // 상품가격
	private String tagColor; // 태그 컬러(1-red,2- orange,3- green,4-blue,5-violet)
	private int bookmark; //북마크 체크 여부(0-false, 1-true)*/

	//아이템 태그 색깔 : 데이터베이스에서 가져오기
	
	String path = request.getContextPath();
	String userName = (String) session.getAttribute("name");

	/* 아이템 개수 구하기 */
	int itemCnt = 0;
	ArrayList<ItemVO> getItemCnt = ItemDAO.getItem();
  	for (ItemVO vo : getItemCnt) {itemCnt++;}
  	
  	/*아이템 정보 변수 초기화*/
	int item_idx = -1;
	String link = "#";
	String imgSrc = "item1.jpg";
	String itemName = "name";
	int itemPrice = 100;
	String tagColor = "redTag";
	int bookmark = 0;
	
%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>MOAMOA</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=path %>/mycart/style.css?ver=4">
	<script
  		src="https://code.jquery.com/jquery-3.3.1.js"
  		integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
  		crossorigin="anonymous"></script>
<script>
/* 아이템 삭제 */
	function delItem(item_idx){
		var item = $("#item"+item_idx);
		item.css("display","none");
		
		/* var item_idx = $('input[name=opt]:checked').val(); */
		alert(item_idx + " 정보를 삭제 하시겠습니까? ");
		// ajax 사용
		var path = '/' + location.pathname.split('/')[1];
		var postUrl = path + "/DelItem"; //서버주소
	    $.ajax({
	        type: 'POST',
	        url: postUrl,
	        data: {
	            "item_idx" : item_idx
	        },
	        success: function(data){
	        	console.log(data);
	            if($.trim(data) == 'OK'){
	            	console.log('삭제완료');
	            	alert("삭제 되었습니다.");
	            	location.reload();   // 페이지 새로 고침
	            } else { 
	            	console.log('서버 에러');
	            }
	        }, 
	    });    //end ajax 
	}
/* 편집창 불러오기 */
	function modify(){
	$(".modify").fadeToggle(950);
	}
/*페이지 슬라이드*/
	/*이전버튼*/
	function goUp(){
		$(".item").animate({top:"-=220"},500);
	}  
	/*다음버튼*/
	function goDown(){
		$(".item").animate({top:"+=220"},500);
	} 
	
 
</script>
</head>
<body>
	<!--헤더, 로고  -->
	<header>
		<h1><a href="<%=path%>/main/main.jsp" >MOA MOA</a></h1>
	</header>

	<!--메뉴 -->
	<nav>
		<div id="comment">
			<p>안녕하세요. <%=userName%> 님. 총 <%=itemCnt%>개의 상품이 담겨있습니다.</p>
		</div>
		<div id="menu">
			<ul>
				<li><a id="add" href="javascript:window.open('<%=path%>/addItem.jsp','write your wish','width=500,height=500,location=no,status=no,scrollbars=yes');" >추가</a></li>
				<li><a href="#" onclick="modify()" id="edit">편집</a></li>
				<li><a href="<%=path%>/LogoutServlet" id="logout">로그아웃</a></li>
				<li><a href="<%=path%>/main/main.jsp" id="home">홈</a></li>
			</ul>
			<ul id="tagList">
				<li><a href="<%=path%>/SortServlet?sort=4" id="redTag"><span class="Red"></span>태그1</a></li>
			<li><a href="<%=path%>/SortServlet?sort=5" id="orangeTag"><span class="Orange"></span>태그2</a></li>
			<li><a href="<%=path%>/SortServlet?sort=6" id="greenTag"><span class="Green"></span>태그3</a></li>
			<li><a href="<%=path%>/SortServlet?sort=7" id="blueTag"><span class="Blue"></span>태그4</a></li>
			<li><a href="<%=path%>/SortServlet?sort=8" id="violetTag"><span class="Violet"></span>태그5</a></li>
			<li><a href="/moamoa/SortServlet?sort=1">높은가격 정렬</a></li>
			<li><a href="/moamoa/SortServlet?sort=2">낮은가격 정렬</a></li>
			<li><a href="/moamoa/SortServlet?sort=3">북마크 정렬</a></li>
			</ul>
		</div>
		
	</nav>
<!--본문  -->
	<div class="main">
	<!-- 이전,다음 버튼 -->
		<div class="remoteBtn">
			<div class="pre btn" onclick="goDown()">◀</div>
			<div class="next btn" onclick="goUp()">▶</div>
		</div>
	<!-- item -->
		<div class="itemList">
		<!-- 아이템 끝 -->
			<div class="end"></div>
			<%	
			//ArrayList<ItemVO> getList = ItemDAO.getItem();
			ArrayList<ItemVO> getList = (ArrayList<ItemVO>)request.getAttribute("itemList");
			  for (ItemVO vo : getList) { 
			  	item_idx = vo.getItem_idx();
			 	link = vo.getLink();
				imgSrc = vo.getImgSrc();
		 		itemName = vo.getItemName();
		 		itemPrice = vo.getItemPrice();
		 		tagColor = vo.getTagColor();
			 	bookmark = vo.getBookmark();
			 	
				// 이미지 소스를 불러오지 못햇을 경우 
				 if(imgSrc == null){
				 	imgSrc = "sample.jpg";
				 }
			 %>
			<!-- item 박스 -->
			<div class="item" id="item<%=item_idx%>">
			<!-- 편집 상자 -->
			<div class="modify">
				<p><%=item_idx%></p>
				<button class="btn" id="<%=item_idx%>" type="button" onclick="delItem(this.id)">삭제</button>
				<a class="btn" id="goLink" type="button" href="<%=link%>" target="_blank">구매하기</a>
			</div>
				<!-- item 이미지 영역 -->
				<div class="itemImg">
					<a href="<%=link%>" target="_blank">
					<img src="<%=imgSrc%>" alt="그림">
					</a>
				</div>
				<!-- item 정보 영역 -->
				<div class="item_info">
					<!-- item 정보 : 이름 -->
					<div class="itemName">
						<!-- item 북마크 : 토글버튼 구현하기 -->
						<%if(bookmark == 0){%>
						<span class="bookmark <%=tagColor %>">☆</span>
						<%}else{%>
						<span class="bookmark <%=tagColor %>">★</span>
						<%} %>
						<!-- 이름 -->
						<a href="<%=link%>" target="_blank"><%=itemName %></a>
					</div>
					<!-- item 정보 : 가격 -->
					<div class="itemPrice">
						<%=itemPrice %><span class="won">원</span>
					</div>
				</div>
			</div>
			<%} %>
			<!-- 아이템 끝 -->
			<div class="end"></div>
		</div>
		<!-- <div class="pageList">
			<ul>
				<li><a href="#">1</a></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
			</ul>
		</div> -->
	</div>
	
</body>
</html>