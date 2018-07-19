$('.form-action').click(function(){
 
    var form_id = $('.grop-from').attr('id');
      $('.icon-action').addClass('back');
  ;
    if($('#control-' + form_id).val() != ''){
    	console.log(form_id);
      switch (form_id) {
          case 'name':
              form_id = "phone";
              break;
          case "phone":
        	  console.log("폰입력창??");
        	  form_id = "email";
//        	    var phone_chk = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
//        	    var phone = $('#control-' + form_id).val();
//        	   
//        	    phone = '010-1234-1234';
//        	    console.log(phone);
//        	    $('#control-' + form_id).val(phone);
//        	    if (!phone_chk.test(phone)) {
//        	    	//alert("전화번호를 확인 하세요.");
//        	    	 $('#err-text').html('전화번호 확인');
////        	    	 $('#control-' + form_id).val('번호 확인');
//        	    	form_id = "phone";
//        	    } else {
//        	    	form_id = "email";
//        	    	$('#err-text').html('');
//        	    }
              break;
          case "email":
        	  console.log("이메일 입력 후 클릭을 하면 여기로 들어옴.");
        	  var email = $('#control-' + form_id).val();
        	  console.log('사용자가 입력한 내용: ' + email);
        	  var aa = id_check(email);
        	  console.log("사용 여부: " + aa);
        	  if (aa == false) {
        		  $('#err-text').html('중복된 email 이 있습니다');
        		  form_id = "email";   // 중복된 ID가 있으면 다시 이메일 폼
        	  } else {
        		  $('#err-text').html('');
        		  form_id = "password"; // 사용가능 ID 면 패스워드 폼으로
        	  }
        	  
        	  break;
        	  
             	  
        	  email_check($('#control-' + form_id).val());   // ajax 함수 호출
        	  em_check = $('#err-text').val();
        	  console.log("반환값: " + em_check);
        	  if (em_check == 'yes') {
        		  $('#control-' + form_id).val('');
        		  $('#err-text').html('중복된 이메일 입니다.');
        		  form_id = "email";
        	  } else {
        		  console.log("패스워드 입력");
        		  form_id = "password";  
        		  $('#err-text').html('');
        	  }
              break;
          case "password":
        	  console.log("패스워드==========");
              form_id = "password-repeat";
              break;
          case "password-repeat":
              form_id = "success";
              break;   
        case "success":
              form_id = "signup";
              break; 
      }
       $('.icon-action').addClass('back');
      
  }
  else{
     switch (form_id) {
          case 'name':
        	  console.log("name 빈값?");
        	  form_id = "signup";
              $('.icon-action').removeClass('back');
              
              break;
          case "phone":
              form_id = "name";
              break;
          case "email":
        	  console.log("email 빈값?");
              form_id = "phone";
              break;
          case "password":
        	  console.log("password 빈값?");
              form_id = "email";
              break;
          case "password-repeat":
              form_id = "password";
              break; 
         case "success":
              form_id = "signup";
              break; 
      }
     $('.icon-action').removeClass('back');
  }
 
  $('.grop-from').attr('id' , form_id);
  
});

$('input').keyup(function() {
	$('.grop-from').removeClass('error');
	$('.error-text').fadeOut();

	if ($(this).val() != '') {
		console.log("입력" + $(this).val());
		$('.icon-action').removeClass('back');
	} else {
		console.log("no 입력");
		$('.icon-action').addClass('back');
	}

});

function getContextPath() {
	var hostIndex = location.href.indexOf( location.host ) + location.host.length;
	return location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
}


function email_check(email) {
	console.log(getContextPath());
	var path = getContextPath();
	var postUrl = path + "/emailcheck.tm0";
	
	$.ajax({
		  type: 'POST',
		  url: postUrl,
		  data: {email: email},
		  success: function(data){
//  	    	console.log("status: " + status);
	    	console.log("data: " + data);
	    	if (data.trim() == "YES") {
	    		console.log("이미 있는");
	    		$('#err-text').val('yes');
	    		console.log('errcheck값: ' + $('#errcheck').val());
//	    		$('#control-email').val('email');
//	    		location.href= path +"/login.tm0";
	    	} else {
	    		console.log("없음");
	    		$('#errcheck').val('no');
	    	}
	    },
		  async:false
		});
	
//    $.post(postUrl,
//    	    {
//    	        email: email
//    	    },
//    	    function(data, status){
//    	    	console.log("status: " + status);
//    	    	console.log("data: " + data);
//    	    	
//    	    	if (status.trim() == "success" && data.trim() == "YES") {
//    	    		console.log("이미 있는");
//    	    		$('#errcheck').val('yes');
//    	    		console.log('errcheck값: ' + $('#errcheck').val());
////    	    		$('#control-email').val('email');
////    	    		location.href= path +"/login.tm0";
//    	    	} else {
//    	    		console.log("없음");
//    	    		$('#errcheck').val('no');
//    	    	}
//
//    	    });
//	return false;
}


function id_check(id) {
	var isID = false;
	var path = getContextPath();
    $.ajax({
        type: 'POST',
        url: path + '/idcheck.tm0',
        data: {
            "id" : id
        },
        success: function(data){
        	console.log(data);
            if($.trim(data) == 'OK'){
            	console.log('사용불가');
            	isID = false;
//                $('#checkMsg').html('<p style="color:blue">사용가능</p>');
            } else { 
            	console.log('사용가능');
            	isID = true;
//                $('#checkMsg').html('<p style="color:red">사용불가능</p>');
            }
        },
        async:false
    });    //end ajax 
    return isID;
}

