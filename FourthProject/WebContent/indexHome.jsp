<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<title>로그인/회원가입</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
	$("#login").click(function() {
		  //입력된 사용자의 사번과 주민등록번호를 얻어냄
		  var query = {emplid:$("#emplid").val(), 
				       ssn:$("#ssn").val()};
		  $.ajax({
		     type: "post",
		     url: "loginProHome.jsp",
		     data: query,
		     success: function(data) {
		    	 if(data == 1) { //로그인 성공
		    	   alert("환영합니다.");
		    	   document.location.href="advisorFormHome.jsp";
		    	 }
		    	 else if(data == 0) { //비밀번호 틀림
		    	  	 alert("비밀번호가 맞지 않습니다.");
		    	  	 $("#ssn").val("");
		    	  	 $("#ssn").focus();
		    	 }
		    	 else if(data == -1) { //아이디 틀림
		    		 alert("아이디가 맞지 않습니다.");
		    		 $("#emplid").val("");
		    		 $("#ssn").val("");
		    	  	 $("#emplid").focus();
		    	 }
		     },
		  });
	});
	$("#register").click(function() {
		  // 가입 폼 로드, registerFormHome.jsp로 넘김
		  document.location.href="registerFormHome.jsp";
	});
});
</script>
</head>
<body>
사번: <input id="emplid"><p>
주민등록번호(앞자리): <input id="ssn" type="password"><p>
<button id="login">로그인</button>
<button id="register">가입하기</button>
</body>
</html>