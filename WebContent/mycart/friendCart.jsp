<%@page import="com.team1.vo.UserVO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.team1.dao.ItemDAO"%>
<%@page import="com.team1.vo.ItemVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	
	UserVO uvo = (UserVO)session.getAttribute("user_vo");
	if(uvo == null){ %>
		<script>
			alert("로그인 하세요");
			location.href="<%=path%>/main/main.jsp";
		</script>
	<% }
	String userName = uvo.getName(); // 사용자 닉네임 가져오기
	String email = uvo.getEmail(); // 로그인한 유저메일

	String friendEmail = (String)request.getAttribute("friendID");
	/* ArrayList<ItemVO> itemList = (ArrayList<ItemVO>)request.getAttribute("itemList"); */
	// 친구 이메일
	int itemCnt = 0;//아이템 개수
	String sortID = "0";//정렬 키 : 0최신순,1고가순,2저가순,3북마크,4레드,5주황,6그린,7블루,8보라)
	
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
	ArrayList<ItemVO> getList = (ArrayList<ItemVO>)request.getAttribute("itemList");
/*  	 ArrayList<ItemVO> getItemCnt = ItemDAO.getItem();  */
/*   	for (ItemVO vo : getItemCnt) {
  		userMail = vo.getUserMail();
	 	if(!userMail.equals(friendEmail)){
	 		continue;
	 	}
  		itemCnt++;
  	}  */
%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>MOAMOA</title>
	<link rel="shortcut icon" type="image/x-icon" href="<%=path %>/img/favicon.ico" />
	<link rel="stylesheet" type="text/css" href="<%=path %>/mycart/style.css?ver=1">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script
  		src="https://code.jquery.com/jquery-3.3.1.js"
  		integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
  		crossorigin="anonymous"></script>
	<script>
	
window.onload = function () {
		//북마크 초기화
	document.getElementById("bookmark").value = "0";
	console.log("start"+document.getElementById("bookmark").value);
	
}

/*아이템 가져오기*/
function getItemInfo(idx) {
	var item_idx = idx;// item_idx
	var item = $("#item"+item_idx); //item_idx 의 아이템
	
	//var item_idx = $('input[name=opt]:checked').val();
	//alert(item_idx + "수정 하시겠습니까? ");
	
	var path = '/' + location.pathname.split('/')[1];
	var postUrl = path + "/GetItemInfo"; //서버주소
    $.ajax({
        type: 'POST',
        url: postUrl,
        data: {
            "item_idx" : item_idx
        },
        success: function(data){
        	console.log(data);
        	var test = data.split('/');
        	console.log(test);
            if($.trim(test[0]) == 'OK'){
            	console.log('정보 불러 오기 성공');
//             	$("#link").val(data);
            	$("#link").val(test[1]);   // 모달에서 id 값이 name 인 곳에 값 설정
            	$("#imgSrc").val(test[2]);   
            	$("#itemName").val(test[3]);
            	$("#itemPrice").val(test[4]);
            	$("#tagColor").val(test[5]);
            	$("#bookmark").val(test[6]);
            	$("#userMail").val(test[7]);
            	$("#myModal").modal('show');
//             	alert("정보 불러 '오기' 성공");
            } else { 
            	console.log('서버 에러');
            }
        }, 
    });    //end ajax 
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
			<p>안녕하세요. <%=userName%> 님. 친구 <%=friendEmail %>님의 장바구니에는 총 <%=getList.size()%>개의 상품이 담겨있습니다.</p>
		</div>
		<div class="menu">
			<ul>
				<li><a href="<%=path%>/SortServlet">내 장바구니</a></li>
			</ul>
			<%-- <ul class="sort">
				<li><a onclick="tab(this)" href="<%=path%>/SortServlet?sort=4" ><span class="Red"></span></a></li>
				<li><a onclick="tab(this)" href="<%=path%>/SortServlet?sort=5" ><span class="Orange"></span></a></li>
				<li><a onclick="tab(this)" href="<%=path%>/SortServlet?sort=6" ><span class="Green"></span></a></li>
				<li><a onclick="tab(this)" href="<%=path%>/SortServlet?sort=7"><span class="Blue"></span></a></li>
				<li><a onclick="tab(this)" href="<%=path%>/SortServlet?sort=8"><span class="Violet"></span></a></li>
				<li><a onclick="tab(this)" href="<%=path%>/SortServlet?sort=0">등록 순</a></li>
				<li><a onclick="tab(this)" href="/moamoa/SortServlet?sort=1">높은 가격 순</a></li>
				<li><a onclick="tab(this)" href="/moamoa/SortServlet?sort=2">낮은 가격 순</a></li>
				<li><a onclick="tab(this)" href="/moamoa/SortServlet?sort=3">북마크</a></li>
			</ul> --%>
			<div class="clear"></div>
		</div>
	</nav>
	
<!--본문  -->
	<div class="main">
	<!-- 이전,다음 버튼 -->
		<div class="remoteBtn">
			<div class="top btn"><a href="#top">▲</a></div>
			<div class="bottom btn" ><a href="#bottom">▼</a></div>
		</div>
	<!-- item -->
		<div class="itemList">
		<div id="top"></div>
		<!-- 아이템 -->
			<%	
			
			  for (ItemVO vo : getList) { 
			  	item_idx = vo.getItem_idx();
			 	link = vo.getLink();
				imgSrc = vo.getImgSrc();
		 		itemName = vo.getItemName();
		 		itemPrice = vo.getItemPrice();
		 		tagColor = vo.getTagColor();
			 	bookmark = vo.getBookmark();
			 	userMail = vo.getUserMail();
			 	System.out.println(link);
			 	//아이템에 저장된 메일과 로그인한 메일이 다르면 다음 아이템 호출
			 /* 	if(!userMail.equals(friendEmail)){
			 		continue;
			 	} */
				// 이미지 소스를 불러오지 못햇을 경우 
				 if(imgSrc.equals("0")){
				 	imgSrc = path + "/mycart/sample.jpg";
				 	System.out.println(imgSrc);
				 }
				// 이름 없을 때
				 if(itemName.equals("0")){
					 itemName = "상품 이름";
				}
				// 가격 없을 때
				 if(itemPrice == 0){
					 itemPrice = 0;
				}
			 %>
				<!-- item 박스 -->
			<div class="friend item" id="item<%=item_idx%>">
				<!-- 사줄거야?박스 -->
				<div class="pop">
					<span>사줄거야? ฅ◕ᴥ◕ฅ </span>
				</div>
				<!-- item 이미지 영역 -->
				<div class="itemImg">
					<a href="<%=link%>" target="_blank">
					<img src="<%=imgSrc%>" style="border:1px solid #aaa" alt="그림">
					</a>
				</div>
				<!-- item 정보 영역 -->
				<div class="item_info">
					<!-- item 이름-->
					<div class="itemName">
					
					<!-- item 북마크 -->
						<%if(bookmark == 0){%>
						<div class="bookmark-area">
						<span class="bookmark <%=tagColor %>">☆</span>
						</div>
						<%}else{%>
						<div class="bookmark-area">
						<span class="bookmark <%=tagColor %>">★</span>
						</div>
						<%} %>
					
					<!-- item 정보 : 이름 -->
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
			<div class="clear"></div>
			<div id="bottom"></div>
			<!-- 아이템 끝 -->
		</div>
	</div>
	<script>
	/* 친구찾기 */
	function goFriend(){
		var friend = $("#friendID").val();
		console.log(friend);
		
		/* // ajax 사용
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
	            	location.reload();   // 페이지 새로 고침
	            } else { 
	            	console.log('서버 에러');
	            }
	        }, 
	    });    //end ajax  */
	}
	
	
	</script>
</body>
</html>