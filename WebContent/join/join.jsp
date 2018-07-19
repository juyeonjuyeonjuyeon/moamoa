<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		String path = request.getContextPath();
%>
<!DOCTYPE html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>회원가입</title>
	<link rel="stylesheet" type="text/css" href="<%=path%>/join/style.css?ver=2">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>	
</head>
<body>
	<form action="<%=path %>/JoinUsProc" method="post" class = "join_form">
  		<div class="container">
    	<p> 계정을 생성합니다.</p>
    	<hr>
    	<table class = "user_input_info">
    	<tr><td>이름
    	<input id="name" type="text" name="name" required></td></tr>
	    <tr><td>전화번호
	    <input id="phone" type="text" name="phone" required></td></tr>
	    <tr><td>이메일
	    <input id="email" type="email" name="email" required>
	    
	    </td></tr>
	    <tr><td>비밀번호
	    <input id="pw" type="password" name="pw" required></td></tr>
	    <tr><td>비밀번호 확인
	    <input id="pw_confirm" type="password" name="pw_confirm" required></td></tr>
    	</table>
    	<input type="hidden" id="errcheck" />
  		<span id="err-text"></span>
    
    	<div class="buttons">
    	<button type="button" class="btn" onclick="sendUser()">가입하기</button>
   	 	<input class="btn" type="button" value="닫기" onClick="self.close()"> 
    	</div>
  	</div>
	</form>
	<script src="<%=path %>/join/script.js"></script>
	<script>
	function sendUser(){
		var name = $('#name').val();
	    var phone = $('#phone').val();
	    var email = $('#email').val();
		var pw = $('#pw').val();
		var pw_chk = $('#pw_confirm').val();
		    
		var alpha_chk = /^[a-zA-Z0-9]+$/;
		var num_chk = /^[0-9]+$/;
		var email_chk = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		var phone_chk = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
		    
		//입력 체크
		if (pw != pw_chk) {
    		alert("패스워드를 확인 하세요.");
    		return;
    		}
		if (!phone_chk.test(phone)) {
		    alert("전화번호를 확인 하세요.");
		   	return;
		    }
		if (!email_chk.test(email)) {
	    	alert("이메일을 확인 하세요.");
		    return;
		    }
		var checkEmail = email_check(email);
		//console.log("사용 여부: " + checkEmail);
		if (checkEmail == false) {
   		  $('#err-text').html('중복된 email 이 있습니다');
   		  //form_id = "email";   // 중복된 ID가 있으면 다시 이메일 폼
   	  	} else {
   		  $('#err-text').html('');
   		 // form_id = "password"; // 사용가능 ID 면 패스워드 폼으로
   	  	}
		
		// 데이터 전송
		var path = '/' + location.pathname.split('/')[1];
		var postUrl = path + "/joinUsProc"; //서버주소
		$.post(postUrl,
				{
		    	  name: name,
		    	  phone: phone,
		    	  email: email,
		    	  pw: pw
		    	 },
		    	 function(data, status){
		    //console.log("status" + data);
		   //console.log("data" + data);
		   if (status.trim() == "success" && data.trim() == "OK") {
		    //console.log("데이터 저장 성공");
		   location.href="<%=path%>/main.jsp";
		    } else {
		    //console.log("데이터 저장 실패");
		    alert("가입에 실패 하였습니다.\n시스템 관리자에게 문의 바람");
		    }
		   //alert("Data: " + data + "\nStatus: " + status);
		   });
	}
	function email_check(email) {
		console.log(getContextPath());
		var path = '/' + location.pathname.split('/')[1];
		var postUrl = path + "/EmailCheck"; //서버주소
		
		$.ajax({
			  type: 'POST',
			  url: postUrl,
			  data: {email: email},
			  success: function(data){
//	  	    	console.log("status: " + status);
		    	console.log("data: " + data);
		    	if (data.trim() == "YES") {
		    		console.log("이미 있는");
		    		$('#err-text').val('yes');
		    		console.log('errcheck값: ' + $('#errcheck').val());
//		    		$('#control-email').val('email');
//		    		location.href= path +"/login.tm0";
		    	} else {
		    		console.log("없음");
		    		$('#errcheck').val('no');
		    	}
		    },
			  async:false
			});
	}
	</script>
</body>
</html>
    