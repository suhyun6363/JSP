<%@ page language= "java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<title>소속직원 검색</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function() {
	$("#search1").click(function(){
		  var query = {dept:$("#dept").val()};
		  $.ajax({
		     type: "post",
		     url: "advisorProHome.jsp",
		     data: query,
		     success: function(data){
		    	 $("#employees").html(data);
		     },
			 error: function() {
				 alert("검색 실패");
			 }
		  });
	});
	$("#search2").click(function(){
		  var query = {emplid:$("#emplid").val()};
		  $.ajax({
		     type: "post",
		     url: "advisorProHome2.jsp",
		     data: query,
		     success: function(data){
		    	 $("#employee").html(data);
		     },
			 error: function() {
				 alert("검색 실패");
			 }
		  });
	});
});
</script>
</head>
<body>
<b>부서를 선택하면 소속직원들이 표시됩니다~</b><p>
부서: <select id="dept" name="dept">
			<option selected value="임원">임원</option>
			<option value="영업부">영업부</option>
			<option value="인사부">인사부</option>
			<option value="경리부">경리부</option>
			<option value="회계부">회계부</option>
	</select><p>
<button id="search1">검색</button>
<div id="employees" style="overflow:auto; width:400px; height:150px"></div>
<br>
<b>사번을 입력하면 이름과 현 소속부서가 표시됩니다~</b><p>
사번: <input id="emplid" type="text" size=5><p>
<button id="search2">검색</button>
<div id="employee" style = "width:400px; height:150px;"></div>
</body>
</html>