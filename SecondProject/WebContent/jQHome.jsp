<%@ page language= "java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<meta charset="UTF-8">
<title>jQ Homework</title>
<script src="js/jquery-3.6.4.min.js"></script>
<script>
  $(document).ready(function() {
	  $("#b1").click(function() {
		  $(".p1").text("Hello world!");	//.p1->#test1 id로 변경
	  });
	  $("#b2").click(function() {
		  $(".p2").html("<b>Hello world!</b>");	//.p2-> #test2
		  // html 태그가 붙으면 html로 해석하라
	  });
	  $("#b3").click(function() {
		  var name = $("#test3").val();
		  alert(name + " 환영!");
		  // alert($("#test3").val() + " 환영!");
	  });
	  
  });
</script>
</head>
<body>
  <p class="p1">This is a paragraph.</p> 
  <p class="p2">This is another paragraph.</p>
  <p>Input field: <input type="text" id="test3"></p>
  <button id="b1">Set Text</button>
  <button id="b2">Set HTML</button>
  <button id="b3">Set Alert</button>
</body>
</html>