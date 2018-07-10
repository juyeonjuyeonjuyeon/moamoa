<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
  src="https://code.jquery.com/jquery-3.3.1.js"
  integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
  crossorigin="anonymous"></script>
<title>write your wish</title>
<style>
*{
	box-sizing: border-box;
}
body{
	margin:0;
	background : #ff8040;
}
 #wishPage{
	
	}
#wishPage .btn{
	width : 50px;
	height: 30px;
	background: #c0c0c0;
	border: none;
	position :relative;
	left:80px;
	bottom : -20px;
	
}
#wishPage .btn:hover{
	box-shadow: 3px 3px #ff8040;
}

form{
	position:relative;
	margin:100px 100px;
	padding : 20px;
	width : 300px;
	height: 300px;
	background : white;
	
}
ul{padding:0;}
ul li{
	margin:0;
	list-style-type: none;
	float : left;
}
.Red{
	background: red;	
}
.Orange{
	background: orange;	
}
.Green{
	background: green;	
}
.Blue{
	background: blue;	
}
.Violet{
	background: #8000ff;	
}
span{
	display: inline-block;
	border-radius : 50%;
	width : 15px;
	height : 15px;
}
.bookmark{
	/* position:absolute;
	top:25px;
	right : 20px; */
	padding : 0;
	margin : 0;
	font-weight:bold;
	font-size: 30px;
	color : #e8b212;
	background : none;
	border : none;
} 
.hide{
	display : none;
}
</style>
</head>
<body>
	<div id="wishPage">
	<form action="AddItem" method="post">
	<h3>write your wish</h3>
	<div id="btn_group">
		
		 <!--처음 보여지는 버튼-->
    	<button id="onBookmark" class="bookmark">☆</button>
    	<!--다음 보여지는 버튼-->
    	<button id="offBookmark" class="bookmark hide" >★</button>
    	<!--Hide Checkbox-->
    	<input id="bookmark" name="bookmark" type="checkbox" value="1" />
	</div>
	
	<!-- <label id="bookmark"><input name="bookmark" type="checkbox" value="1" >★</label><br>체크되면 1로 반환 : true -->
	<label>링크<input type="text" name="link" required></label>
	<button>ok</button><br>
	<label>이름<input type="text" name="itemName"></label><br>
	<label>가격<input type="number" name="itemPrice"></label><br>
	<ul id="tagList">
			<li>
				<label>
				<input type="radio" name="tagColor" value="redTag" checked>
				<span class="Red"></span>
				</label>
			</li>
			<li>
				<label>
				<input type="radio" name="tagColor" value="orangeTag" >
				<span class="Orange"></span>
				</label>
			</li>
			<li>
				<label>
				<input type="radio" name="tagColor" value="greenTag" >
				<span class="Green"></span>
				</label>
			</li>
			<li>
				<label>
				<input type="radio" name="tagColor" value="blueTag" >
				<span class="Blue"></span>
				</label>
			</li>
			<li>
				<label><input type="radio" name="tagColor" value="violetTag" >
				<span class="Violet"></span>
				</label>
			</li>
	</ul>
	<br>
	
	<input class="btn addBtn" type="submit" value="O">
	<input class="btn cancelBtn" type="button" value="X" onClick='self.close()'> 
	</form>
</div>
<script>
(function ($) {
    $.fn.simpleToggleBtn = function () {
	console.log("ok");
        var btns = $(this).find("button"), // 버튼 그룹 내 버튼들;
            checkBox = $("input:checkbox");
	console.log(btns);
            

        btns.on("click", function () { // 버튼들 중 클릭한 버튼에 함수;
            $(this).addClass("hide");
            $(this).siblings("button").removeClass("hide");
            // 첫번째 버튼 기준으로 input 요소 체크!
            $(this).first().hasClass("hide") ? checkBox.attr("checked",true) : checkBox.attr("checked",false);
        });
    }
}(jQuery));

// 실행
$("#btn_group").simpleToggleBtn();

/* function checkOn(this){
	var btns = $(this).find("button"), // 버튼 그룹 내 버튼들;
    checkbox = $("input:checkbox");
	$(this).addClass("hide");
    $(this).siblings("button").removeClass("hide");
	$("#onBookmark").hasClass("hide") ? checkbox.attr("checked",true) : checkbox.attr("checked",false);
} */


</script>
</body>
</html>