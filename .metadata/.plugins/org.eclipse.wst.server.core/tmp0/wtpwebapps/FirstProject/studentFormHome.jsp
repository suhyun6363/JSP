<%@ page language= "java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<meta charset="UTF-8">
<title>학생 정보</title>
<script>
	function send() {
		document.getElementById("form").submit();
	}
</script>
</head>
<body>
  <h2>학생 정보 입력 </h2>
	<form id="form" action="studentProHome.jsp" method="get">
		이름 : <input type="text" name="name"><p>
		나이 : <input type="text" name="age"><p>
		성별 : <input type="radio" name="sex" value="남성입니다" checked>남
			 <input type="radio" name="sex" value="여성입니다">여<p>
		거주지 : <select name="residence">
		        <option>서울</option>
		        <option>경기도</option>
		        <option>강원도</option>
		      </select><p>
		<input type="button" onclick="send()" value="보내기">
	</form>
</body>
</html>