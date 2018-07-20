<%@page import="java.text.DecimalFormat"%>
<%@page import="com.team1.dao.ItemDAO"%>
<%@page import="com.team1.vo.ItemVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String userName = (String) session.getAttribute("name"); // 사용자 닉네임 가져오기
	String email = (String) session.getAttribute("email"); // 로그인한 유저메일
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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
	
window.onload = function () {
		//북마크 초기화
	document.getElementById("bookmark").value = "0";
	console.log("start"+document.getElementById("bookmark").value);
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
	/*메뉴 탭 css*/
	var tab0 = $(".t0"),tab1 = $(".t1"),tab2 = $(".t2")
	,tab3 = $(".t3"),tab4 = $(".t4"),tab5 = $(".t5")
	,tab6 = $(".t6"),tab7 = $(".t7"),tab8=$(".t8");
	
	console.log(sortID);
	<%if(sortID.equals("0")){%>
		$(".t0").style.background="white";
		$(".t0").style.color="black";
	<%}else if(sortID.equals("1")){%>
		tab1.style.background="white";
		tab1.style.color="black";
	<%}else if(sortID.equals("2")){%>
		tab2.style.background="white";
		tab2.style.color="black";
	<%}else if(sortID.equals("3")){%>
		tab3.style.background="white";
		tab3.style.color="black";
	<%}else if(sortID.equals("4")){%>
		tab4.style.background="white";
		tab4.style.color="black";
	<%}else if(sortID.equals("5")){%>
		tab5.style.background="white";
		tab5.style.color="black";
	<%}else if(sortID.equals("6")){%>
		tab6.style.background="white";
		tab6.style.color="black";
	<%}else if(sortID.equals("7")){%>
		tab7.style.background="white";
		tab7.style.color="black";
	<%}else{%>
		tab8.style.background="white";
		tab8.style.color="black";
	<%}%>
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
/*아이템 수정*/
function updateInfo() {
	var u_idx = $('input[name=opt]:checked').val();
	var name = $("#name").val();   // 모달에서 id 값이 name 인 곳에 값 설정
	var email = $("#email").val();
	var phone = $("#phone").val();
	var pw = $("#pwd").val();
//  	alert(u_idx + " 번호를 수정 해야함");
//  	return ;
	// ajax 사용
	var path = getContextPath();
    $.ajax({
        type: 'POST',
        url: path + "/updateinfo.tm0",
        data: {
            "u_idx" : u_idx,
            "name" : name,
            "email" : email,
            "phone" : phone,
            "pw" : pw
        },
        success: function(data){
        	console.log(data);
            if($.trim(data) == 'OK'){
            	console.log('수정 완료');
            	alert("수정이 완료 되었습니다.");
            	// 페이지 새로 고침
            	location.reload();
            } else { 
            	console.log('수정 서버 에러');
            }
        }, 
    });    //end ajax 
}
/* 아이템 삭제 */
	function delItem(item_idx){
		var item = $("#item"+item_idx);
		item.css("display","none");
		
		/* var item_idx = $('input[name=opt]:checked').val(); */
		alert(item_idx + "삭제 하시겠습니까? ");
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
			<ul class="sort">
				<li><a class="tab t4" onclick="tab(this)" href="<%=path%>/SortServlet?sort=4" ><span class="Red"></span></a></li>
				<li><a class="tab t5" onclick="tab(this)" href="<%=path%>/SortServlet?sort=5" ><span class="Orange"></span></a></li>
				<li><a class="tab t6" onclick="tab(this)" href="<%=path%>/SortServlet?sort=6" ><span class="Green"></span></a></li>
				<li><a class="tab t7" onclick="tab(this)" href="<%=path%>/SortServlet?sort=7"><span class="Blue"></span></a></li>
				<li><a class="tab t8" onclick="tab(this)" href="<%=path%>/SortServlet?sort=8"><span class="Violet"></span></a></li>
				<li><a class="tab t0" onclick="tab(this)" href="<%=path%>/SortServlet?sort=0">등록 순</a></li>
				<li><a class="tab t1" onclick="tab(this)" href="/moamoa/SortServlet?sort=1">높은 가격 순</a></li>
				<li><a class="tab t2" onclick="tab(this)" href="/moamoa/SortServlet?sort=2">낮은 가격 순</a></li>
				<li><a class="tab t3" onclick="tab(this)" href="/moamoa/SortServlet?sort=3">북마크</a></li>
			</ul>
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
			<div class="item" id="item<%=item_idx%>">
			<!-- 편집 상자 -->
			<div class="modify">
				<p><%=item_idx%></p>
				<button class="btn" type="button" onclick="delItem(<%=item_idx%>)">삭제</button>
				<button class="btn" type="button" onclick=" getItemInfo(<%=item_idx%>)">수정</button>
			</div>
				<button class="btn delete" type="button" onclick="delItem(<%=item_idx%>)">X</button>
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
					<!-- item 북마크 : 토글버튼 구현하기 -->
						<%if(bookmark == 0){%>
						<%-- <span class="bookmark <%=tagColor %>">☆</span> --%>
						<button type="button" class="bookmark <%=tagColor %>" id="onBookmark" onclick="onCheck(this)">☆</button>
						<%}else{%>
						<%-- <span class="bookmark <%=tagColor %>">★</span> --%>
						<button	type="button" class="bookmark <%=tagColor %> hide" id="offBookmark" onclick="offCheck(this)">★</button>
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
	 <!-- Modal 시작 -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">아이템 수정</h4>
        </div>
        <div class="modal-body">
           <div class="form-group">
		    <label for="link">링크</label>
		    <input type="text" class="form-control" id="link">
		  </div>
		  <div class="form-group">
		    <label for="imgSrc">이미지</label>
		    <input type="text" class="form-control" id="imgSrc">
		  </div>
		  <div class="form-group">
		    <label for="itemName">이름</label>
		    <input type="text" class="form-control" id="itemName">
		  </div>
		  <div class="form-group">
		    <label for="itemPrice">가격</label>
		    <input type="number" class="form-control" id="itemPrice">
		  </div>
		  <div class="form-group">
		    <label for="tagColor">태그</label>
		    <input type="text" class="form-control" id="tagColor">
		  </div>
		  <div class="form-group">
		    <label for="bookmark">북마크</label>
		    <input type="text" class="form-control" id="bookmark">
		  </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-warning" onclick="updateInfo()" data-dismiss="modal">저장</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
        </div>
      </div>
      
    </div>
  </div>
<!--   모달 끝 -->  
</body>
</html>