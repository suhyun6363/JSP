<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<title>로그린/회원가입</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
	$("#login").click(function(){
		  //입력된 사용자의 아이디와 비밀번호를 얻어냄
		  var query = {id:$("#id").val(), 
				       passwd:$("#passwd").val()};
		  $.ajax({
		     type: "post",
		     url: "loginPro.jsp",
		     data: query,
		     success: function(data){
		    	 if(data == 1) { //로그인 성공
		    	   document.location.href="advisorForm.jsp";
		    	 }
		    	 else if(data == 0){ //비밀번호 틀림
		    	  	 alert("비밀번호가 맞지 않습니다.");
		    	  	 $("#passwd").val("");
		    	  	 $("#passwd").focus();
		    	 }
		    	 else if(data == -1){ //아이디 틀림
		    		 alert("아이디가 맞지 않습니다.");
		    		 $("#id").val("");
		    		 $("#passwd").val("");
		    	  	 $("#id").focus();
		    	 }
		     },
		  });
	});
	$("#register").click(function() {
		  // 가입 폼 로드
		  document.location.href="registerForm.jsp";
	});
	
	$("#logout").click(function() {
		  // 로그아웃 처리
		  document.location.href="logoutPro.jsp";
	});
	
});
</script>
</head>
<body>
<div><img src="digitalmedia.png"></div><p>
아이디: <input id="id"><p>
비밀번호: <input id="passwd" type="password"><p>
<button id="login">로그인</button>
<button id="register">가입하기</button>
<button id="logout">로그아웃</button>
</body>
</html>