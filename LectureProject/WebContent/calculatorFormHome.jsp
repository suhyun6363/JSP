<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<meta charset="UTF-8">
<title>계산기</title>
</head>
<body>
	<form action="calculatorProHome2.jsp" method="post" enctype="multipart/form-data">
		<b>이미지 등록(1타 이미지 사용!) </b><p>
		<input type="file" name="image"><p>
		
		계산할 실수와 연산자를 입력하세요.<p>
		<input type="text" size="5" name="operand1">
		<select name="operator">
		       <option selected value="+">+ </option>
		       <option value="-">- </option>
		       <option value="*">* </option>
		       <option value="/">/ </option>
		 </select>
		 <input type="text" size="5" name="operand2"><p>
		<input type="submit" value="계산">
	</form>
</body>
</html>
