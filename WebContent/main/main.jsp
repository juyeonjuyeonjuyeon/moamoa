<%@page import="com.team1.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		String path = request.getContextPath();
		UserVO uvo = (UserVO)session.getAttribute("user_vo");
%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>MOAMOA</title>
	<link rel="shortcut icon" type="image/x-icon" href="<%=path %>/img/favicon.ico" />
	<link rel="stylesheet" type="text/css" href="<%=path%>/main/style.css?ver=1">
	<!-- 로그인 값이 있을 경우 admin화면으로 넘어간다 -->
	<%if (uvo != null) {%>
	<script type="text/javascript">location.href="<%=path%>/admin/admin.jsp";</script>
	<%}%>
</head>
<body>
	<!-- 네온사인 간판 헤더 -->
	<header id="neonsign">
		<h1><a href="#">MOA MOA</a></h1>
	</header>
	
	<!-- 메인 페이지 -->
	<div id="main-page">
	<div id="buttons">
		<a class="window" id="goInfo" href="#moamoaPage">moa moa</a>
		<div class="window" id="goCart"></div>
		<a class="window" id="login" href="#loginPage">login</a>
	</div>

	<div id="night">
	<div id="moon"><div id="moonShadow"></div></div>
	</div>
	</div>
<!-- 로그인 페이지 -->
<div id="loginPage">
	<form action="<%=path %>/LoginProc" method="post">
	<h3>login</h3>
	<table>
		<tr>
		<td><input type="text" name="userId" placeholder="이메일을 입력해주세요" required></td>
		<td rowspan="2"><input class="btn loginBtn" type="submit" value="login"></td>
		</tr>
	<tr>
		<td><input type="password" name="userPw" placeholder="비밀번호를 입력해주세요" required></td>
	</tr>
	</table>
	<button class="btn joinBtn" onclick="goJoin()">join</button>
	</form>
	<script>
		function goJoin(){
			window.open('<%=path%>/join/join.jsp','join us','width=500,height=500,location=no,status=no,scrollbars=yes');
		}
	</script>
</div>
<!--모아모아 정보 페이지 -->
<footer>
	<div id = "moamoaPage">
	<h2>m o a m o a</h2>
	
	<div id = "info_page">
		<div id = "how_to_use">
			<h4>사이트 이용 방법</h4>
			<div id = "use_info">
				1. 회원가입<br>
				2. 로그인<br>
				3. 쇼핑몰의 원하는 품목 페이지에  접속<br>
				4. 주소창의 링크 복사<br>
				5. AddItem 창에 링크 붙여넣기<br>
				5-1. 목록이 자동으로 채워지지 않을 경우 수동 입력<br>
				6. 태그 및 즐겨찾기 여부 지정 후 저장
			</div>
		</div>
			
		<div id = "disposable_site_list">
			<h4>이용가능한 사이트 목록</h4>
			<div id = "site_info">
				<a href="http://www.auction.co.kr/" target="_blank">♧ 옥션</a>
				<a href="http://www.gmarket.co.kr/" target="_blank">♧ 지마켓</a>
				<a href="http://www.11st.co.kr/html/main.html" target="_blank">♧ 11번가</a>
				<a href="http://www.coupang.com/" target="_blank">♧ 쿠팡</a>
				<a href="https://www.zara.com/kr/#utm_referrer=https%3A%2F%2Fwww.google.co.kr%2F" target="_blank">♧ ZARA</a>
				<br>♣ 이 외의 사이트는 직접 입력
				<br>♣ 추후 업데이트
			</div>
		</div>
		
		<div id = "connect_to_team">
			<h4>건의 사항</h4>
			<div id = "connect_info">
				Email : aaa@aaa.com<br><br>
				Phone : 02)111-1111<br><br>
				Adress : OO시 OO구 OO동 OOO길00-1
			</div>
		</div>
	</div>
	
	</div>
	<div id = "member_info">
		<h2>TEAM 1</h2>
		<h3>강주연  │  예강훈  │  최혜인  │  황종윤</h3>
	</div>
</footer>



</body>
</html>