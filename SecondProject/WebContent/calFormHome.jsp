<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<meta charset="UTF-8">
<title>계산기</title>
<style type="text/css">
  .parent {
  	display : table;
    width : 200px;
    height : 100px;
  }
  .child{
  	display : table-cell;
  	vertical-align : middle;
  }
</style>

<script src="js/jquery-3.6.4.min.js"></script>
<script>
$(document).ready(function() {
	  $("#b1").click(function() {
		  $.ajax({
			   type: "post",
			   url: "calProHome.jsp",
			   data: {num1:$("#t1").val(), operator:$("#operator option:selected").val(), num2:$("#t2").val()},
			   success: function(data) {
				 $(".child").html(data);
			   },
			   error: function() {
				 alert("로드실패");
			   }
	  	  });
	  });
});
</script>
</head>
<body>
<b>계산할 실수와 연산자를 입력하세요.</b><p>
<input type="text" id="t1" size=5>
<select id="operator" name="operator">
		       <option selected value="+">+ </option>
		       <option value="-">- </option>
		       <option value="*">* </option>
		       <option value="/">/ </option>
</select>
<input type="text" id="t2" size=5><p>
<div class="parent">
	<div class="child">결과</div>
</div><p>
<button id="b1">입력완료</button>
</body>
</html>
