<%@page import="com.team1.vo.ItemVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String u_idx = (String) session.getAttribute("u_idx");
String userName = (String) session.getAttribute("name"); // 사용자 닉네임 가져오기
String phone = (String) session.getAttribute("phone");
String email = (String) session.getAttribute("email");
String pw = (String) session.getAttribute("pw");
    %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
@import url('https://fonts.googleapis.com/css?family=Jua');
@import url('https://fonts.googleapis.com/css?family=Nanum+Pen+Script');
@import url('https://fonts.googleapis.com/css?family=Handlee');
@import url('https://fonts.googleapis.com/css?family=Chela+One');
@import url('https://fonts.googleapis.com/css?family=Fugaz+One');
*{
	box-sizing : border-box;
}
/* 크롬 인풋 기본 스타일 제거 */
	input:focus {
  		outline: none;
	}
a{
	text-decoration: none;
}
ul li{
	list-style: none;
}
header{
	text-align : center;
	font-family: 'Fugaz One', cursive;
}
header a{
	color : white;
}
body { background : #efe492;}

.hide{
	display : none;
}
.wrap{
		margin : auto;
		padding : 20px;
		border : 1px solid white;
		background : white;
		width : 500px;
		height : 500px;
		font-size : 18px;
	}
.page{
	margin : auto;
	padding : 0;
	width : 400px;
	height : 400px;
}
input { 
	border : none;
	background : none;
	font-size : 18px;
}
#buttons{
	margin : auto;
	width : 500px;
	height: 50px;
}
.btn{
	border : none;
	background : none;
	font-size : 18px;
	width : 100px;
	height :40px;
	cursor: pointer;
}
.btn:hover{
	background : white;
	color : orange;
}
.userImg{
	margin : auto;
	width : 150px;
	height: 150px;
	border : 1px solid grey;
	border-radius : 50%;
	overflow : hidden;
}
.userImg img{
	width : 150px;
	height : 150px;
}

</style>
</head>
<body>
<%
/* ArrayList<UserVO> user = UserDAO.getUser(u-idx);
	for (UserVO vo : user) {
		String u_idx = vo.
		String name = vo.getItemName();
		String phone = vo.getItemPrice();
		String email = vo.getTagColor();
		String pw = vo.getBookmark();
	} */

%>
<header>
		<h1><a href="<%=path%>/main/main.jsp" >MOA MOA</a></h1>
</header>
<div class="wrap">
	<div class="userImg">
	<img class="profile" src="<%=path%>/img/profile.png" alt="유저 정보">
	</div>
	<form id="update-user" class="page hide">
		<ul>
			<li><input type="text" id="u_idx" value="<%=u_idx %>"></li>
			<li>이름 <input id="name" type ="text" name ="userName" value="<%=userName%>" placeholder="입력하세요"></li>
			<li>이메일 <input id="email" type ="text" name ="email" value="<%=email%>" disabled></li>
			<li>비밀번호 <input id="pw" type ="password" name ="pw" placeholder="입력하세요"></li>
			<li>비밀번호 확인 <input type ="password" name ="confirm-pw" placeholder="입력하세요"></li>
			<li>전화번호 <input id="phone" type ="text" name ="phone" value="<%=phone%>" ></li>
		</ul>
		<input type="button" onclick="updateUser()" value="저장" class="btn">
	</form>
	<div id="userinfo" class="page">
	<span>이름 : </span><%=userName %>
	<br>
	<span>전화번호 : </span><%=phone %>
	<br>
	<span>이메일 : </span><%=email %>
	<br>
	<span>비밀번호 : </span><%=pw %>
	<br>
	</div>
</div>
<div id="buttons">
	<button class="btn" onclick="updateUserPage()">정보수정</button>
	<button class="btn">회원탈퇴</button>
</div>
<script>
	/*정보 수정 페이지 오픈*/
 	function updateUserPage(){
 		$("#update-user").toggle(20);
 		$("#userinfo").toggle(20);
 	}
	/*유저 정보 수정 */
 	function updateUser(){
 		var u_idx = $("#u_idx").val();
 		var name = $("#name").val();   // 모달에서 id 값이 name 인 곳에 값 설정
 		var email = $("#email").val();
 		var phone = $("#phone").val();
 		var pw = $("#pw").val();

 		console.log(u_idx + name + email + phone + pw);
 		var path = '/' + location.pathname.split('/')[1];
		var postUrl = path + "/UpdateUser"; //서버주소
 		
 	    $.ajax({
 	        type: 'POST',
 	        url: postUrl,
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
 	            	location.reload();
 	            } else { 
 	            	console.log('수정 서버 에러');
 	            }
 	        }, 
 	    });    //end ajax 
 	}
</script>
</body>
</html>