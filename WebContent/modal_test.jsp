<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
  <button type="button" class="btn btn-warning" onclick="getUserInfo()">수정</button>
  <button type="button" class="btn btn-danger" onclick="delInfo()">삭제</button>
  
  
	<!-- Modal 시작 -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">회원 정보 변경</h4>
        </div>
        <div class="modal-body">
           <div class="form-group">
		    <label for="name">이름</label>
		    <input type="text" class="form-control" id="name">
		  </div>
		  <div class="form-group">
		    <label for="email">이메일</label>
		    <input type="email" class="form-control" id="email">
		  </div>
		  <div class="form-group">
		    <label for="phone">전화번호</label>
		    <input type="text" class="form-control" id="phone">
		  </div>
		  <div class="form-group">
		    <label for="pwd">패스워드</label>
		    <input type="password" class="form-control" id="pwd">
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