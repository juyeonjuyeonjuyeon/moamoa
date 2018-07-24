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
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="description" content="Mind freaker stuff (Mindfreakerstuff.com) is a blog for Design inspiration, tutorials and latest mobile/Gadgets review . Learn Design Theory, Typography, Website Design, MS office Tips and latest android mobiles/apps more.">
<title>Simple html tab layout Jqurey - Mind Freaker Stuff</title>
<style type="text/css">
body {
	background: #42413C;
	margin: 0;
	padding: 0;
	font: 10px normal Verdana, Arial, Helvetica, sans-serif;
	color: black;
}
h1 {font-size: 3em; margin: 20px 0; color: #FFF;}
.container {width: 700px; margin: 10px auto;}
ul.tabs {
	margin: 0;
	padding: 0;
	float: left;
	list-style: none;
	height: 32px;
	border-bottom: 1px solid #999;
	border-left: 1px solid #999;
	width: 100%;
}
ul.tabs li {
	float: left;
	margin: 0;
	padding: 0;
	height: 31px;
	line-height: 31px;
	border: 1px solid #999;
	border-left: none;
	margin-bottom: -1px;
	background: blue;
	overflow: hidden;
	position: relative;
}
ul.tabs li a {
	text-decoration: none;
	color: black;
	display: block;
	font-size: 1.2em;
	padding: 0 20px;
	border: 1px solid #fff;
	outline: none;
}
ul.tabs li a:hover {
	font-weight: bold;
}	
html ul.tabs li.active, html ul.tabs li.active a:hover  {
	background: white;
	border-bottom: 1px solid white;
	color : black;
}
.tab_container {
	border: 1px solid #999;
	border-top: none;
	clear: both;
	float: left; 
	width: 100%;
	background: #fff;
	-moz-border-radius-bottomright: 5px;
	-khtml-border-radius-bottomright: 5px;
	-webkit-border-bottom-right-radius: 5px;
	-moz-border-radius-bottomleft: 5px;
	-khtml-border-radius-bottomleft: 5px;
	-webkit-border-bottom-left-radius: 5px;
}
.tab_content {
	padding: 20px;
	font-size: 1.2em;
}
.tab_content h2 {
	font-weight: normal;
	padding-bottom: 10px;
	border-bottom: 1px dashed #ddd;
	font-size: 1.8em;
}
.tab_content h3 a{
	color: #254588;
}
.tab_content img {
	float: left;
	margin: 0 20px 20px 0;
	border: 1px solid #ddd;
	padding: 5px;
}
</style>
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

/* 아이템 삭제 */
	function delItem(item_idx){
		
		
		/* var item_idx = $('input[name=opt]:checked').val(); */
		//confirm(item_idx + "삭제 하시겠습니까? ");
		if (!confirm(item_idx + "삭제 하시겠습니까? ")) {
	        return;
	    }else{
	    	var item = $("#item"+item_idx);
			item.css("display","none");
		}
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
	            	location.reload();   // 페이지 새로 고침
	            } else { 
	            	console.log('서버 에러');
	            }
	        }, 
	    });    //end ajax 
	}
	/* 북마크 추가 */
	function bookmark(item_idx){
		var item = $("#item"+item_idx),
		checkbox = $("#bookmark"+item_idx).val();
		console.log('bookmark');
		
		if(checkbox == 0){
		console.log(checkbox);
			checkbox.checked = true;
			checkbox = 1;
		console.log(checkbox);
		}else{
		console.log(checkbox);
			checkbox.checked = false;
			checkbox = 0;
		console.log(checkbox);
		}
		
		// ajax 사용
		var path = '/' + location.pathname.split('/')[1];
		var postUrl = path + "/BookmarkItem"; //서버주소
	    $.ajax({
	        type: 'POST',
	        url: postUrl,
	        data: {
	            "item_idx" : item_idx,
	            "bookmark" : checkbox
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

<div class="container">
<div id="comment">
			<p>안녕하세요. <%=userName%> 님. 총 <%=itemCnt%>개의 상품이 담겨있습니다.</p>
</div>

    <ul class="menu tabs">
    	<ul>
		<li><a href="javascript:window.open('<%=path%>/addItem.jsp','write your wish','width=500,height=500,location=no,toolbar=no,scrollbars=yes');" >
		추가</a></li>
		<!-- <li><a href="#" onclick="modify()">편집</a></li> -->
		<li><a href="<%=path%>/LogoutServlet">로그아웃</a></li>
		<%-- <li><a href="<%=path%>/myinfo.jsp">회원정보</a></li> --%>
		</ul>
        <li><a onclick="tab(this)" href="<%=path%>/SortServlet?sort=0">등록 순</a></li>
        <li><a onclick="tab(this)" href="/moamoa/SortServlet?sort=1">높은 가격 순</a></li>
        <li><a onclick="tab(this)" href="/moamoa/SortServlet?sort=2">낮은 가격 순</a></li>
        <li><a onclick="tab(this)" href="/moamoa/SortServlet?sort=3">북마크</a></li>
        <li><a href="<%=path%>/SortServlet?sort=4" ><span class="Red"></span></a></li>
        <li><a href="<%=path%>/SortServlet?sort=5" ><span class="Orange"></span></a></li>
        <li><a href="<%=path%>/SortServlet?sort=6" ><span class="Green"></span></a></li>
        <li><a href="<%=path%>/SortServlet?sort=7"><span class="Blue"></span></a></li>
         <li><a href="<%=path%>/SortServlet?sort=8"><span class="Violet"></span></a></li>
    </ul>
    
    <div class="tab_container">
        <div id="tab1" class="tab_content">
            <h2>Heading 1</h2>
        </div>
        <div id="tab2" class="tab_content">
             <h2>Heading 2</h2>
        </div>
        <div id="tab3" class="tab_content">
             <h2>Heading 3</h2>
        </div>
        <div id="tab4" class="tab_content">
            <h2>Heading 4</h2>
        </div>
        <div id="tab5" class="tab_content">
            <h2>Heading 5</h2>
        </div>
    </div>
</div>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> 
<script type="text/javascript">

$(document).ready(function() {

	//Default Action
	$(".tab_content").hide(); //Hide all content
	$("ul.tabs li:first").addClass("active").show(); //Activate first tab
	$(".tab_content:first").show(); //Show first tab content
	
	//On Click Event
	$("ul.tabs li").click(function() {
		$("ul.tabs li").removeClass("active"); //Remove any "active" class
		$(this).addClass("active"); //Add "active" class to selected tab
		$(".tab_content").hide(); //Hide all tab content
		var activeTab = $(this).find("a").attr("href"); //Find the rel attribute value to identify the active tab + content
		$(activeTab).fadeIn(); //Fade in the active content
		return false;
	});

});
</script>

</body>
</html>