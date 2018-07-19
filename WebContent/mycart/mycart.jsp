<%@page import="java.text.DecimalFormat"%>
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
	//`userMail` VARCHAR(1000) NOT NULL DEFAULT '0'*/
	//아이템 태그 색깔 : 데이터베이스에서 가져오기
	
	String path = request.getContextPath();
	String userName = (String) session.getAttribute("name"); // 사용자 닉네임 가져오기
	String email = (String) session.getAttribute("email"); // 로그인한 유저메일
	int itemCnt = 0;//아이템 개수
	
  	/*아이템 정보 변수 초기화*/
	int item_idx = -1;
	String link = "#";
	String imgSrc = "sample.jpg";
	String itemName = "name";
	int itemPrice = 0;
	String tagColor = "redTag";
	int bookmark = 0;
	String userMail = "0";//아이템에 저장된 유저메일
	
	/*아이템 개수 구하기*/
	ArrayList<ItemVO> getItemCnt = ItemDAO.getItem();
  	for (ItemVO vo : getItemCnt) {
  		userMail = vo.getUserMail();
	 	if(!userMail.equals(email)){
	 		continue;
	 	}
  		itemCnt++;
  	}
  	
	
%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>MOAMOA</title>
	<link rel="stylesheet" type="text/css" href="<%=path %>/mycart/style.css?ver=3">
	<style>
		.selecTab{
			background : white;
			color : black;
		}
	</style>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script
  		src="https://code.jquery.com/jquery-3.3.1.js"
  		integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
  		crossorigin="anonymous"></script>
<script>
/*메뉴 탭 css*/

/* 아이템 삭제 */

	function reload(){
		location.reload();
	}
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
	/*탭 이벤트*/
	function tab(obj){
	/* 	var i, defaultTab, tablinks;
		defaultTab = $(".home");
		tanlinks = $(".tab");
		for(i = 0; i<tablinks.length; i++){
			tanlinks[i].className.replace("active", "");
		}
		evt.currentTarget.className += " active"; */
		var i, tablinks;
		//탭
		tablinks = $(".tab");
		//다른 탭의 선택 효과 지우기
		for(i = 0; i<tablinks.length; i++){
			tablinks[i].removeClass(".active");
		}
		//현재 클릭한 탭에 효과 넣기
		//obj.addClass(".selectTab");
		obj.style.background="white";
		obj.style.color="black";
	}
	function test(obj){
		//obj.addClass(".selectTab");
		obj.style.background="white";
		obj.style.color="black";
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
		<div class="menu">
			<ul>
				<li><a href="javascript:window.open('<%=path%>/addItem.jsp','write your wish','width=500,height=500,location=no,toolbar=no,scrollbars=yes');" >
				추가</a></li>
				<li><a href="#" onclick="modify()">편집</a></li>
				<li><a href="<%=path%>/LogoutServlet">로그아웃</a></li>
			</ul>
			<ul id="sort">
				<li><a class="tab" onclick="tab(this)" href="<%=path%>/SortServlet?sort=4" ><span class="Red"></span>태그1</a></li>
				<li><a class="tab" onclick="tab(this)" href="<%=path%>/SortServlet?sort=5" ><span class="Orange"></span>태그2</a></li>
				<li><a class="tab" onclick="tab(this)" href="<%=path%>/SortServlet?sort=6" ><span class="Green"></span>태그3</a></li>
				<li><a class="tab" onclick="tab(this)" href="<%=path%>/SortServlet?sort=7"><span class="Blue"></span>태그4</a></li>
				<li><a class="tab" onclick="tab(this)" href="<%=path%>/SortServlet?sort=8"><span class="Violet"></span>태그5</a></li>
				<li><a class="tab active" onclick="tab(this)" href="<%=path%>/SortServlet?sort=0">등록 순</a></li>
				<li><a class="tab" onclick="tab(this)" href="/moamoa/SortServlet?sort=1">높은 가격 순</a></li>
				<li><a class="tab" onclick="tab(this)" href="/moamoa/SortServlet?sort=2">낮은 가격 순</a></li>
				<li><a class="tab" onclick="tab(this)" href="/moamoa/SortServlet?sort=3">북마크</a></li>
			</ul>
			<div class="clear"></div>
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
			<div class="top"></div>
			<%	
			ArrayList<ItemVO> getList = (ArrayList<ItemVO>)request.getAttribute("itemList");
			  for (ItemVO vo : getList) { 
			  	item_idx = vo.getItem_idx();
			 	link = vo.getLink();
				imgSrc = vo.getImgSrc();
		 		itemName = vo.getItemName();
		 		itemPrice = vo.getItemPrice();
		 		tagColor = vo.getTagColor();
			 	bookmark = vo.getBookmark();
			 	userMail = vo.getUserMail();
			 	
			 	//아이템에 저장된 메일과 로그인한 메일이 다르면 다음 아이템 호출
			 	if(!userMail.equals(email)){
			 		continue;
			 	}
				// 이미지 소스를 불러오지 못햇을 경우 
				 if(imgSrc.equals("0")){
				 	imgSrc = "/sample.jpg";
				 }
			 %>
			<!-- item 박스 -->
			<div class="item" id="item<%=item_idx%>">
			<!-- 편집 상자 -->
			<div class="modify">
				<p><%=item_idx%></p>
				<button class="btn" id="<%=item_idx%>" type="button" onclick="delItem(this.id)">삭제</button>
				<button class="btn" type="button" onclick="">수정</button>
				<%-- <a class="btn" id="goLink" type="button" href="<%=link%>" target="_blank">구매하기</a> --%>
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
						<%
						DecimalFormat Commas = new DecimalFormat("#,###");
						String itemPrice_comma = (String)Commas.format(itemPrice);
						%>
						<%=itemPrice_comma %><span class="won"> 원</span>
					</div>
				</div>
			</div>
			<%} %>
			<!-- 아이템 끝 -->
			<div class="end"></div>
		</div>
	</div>
	
</body>
</html>