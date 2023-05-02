<%@ page language= "java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<meta charset="UTF-8">
<title>jQuery 테스트3</title>

<style type="text/css">
  div#result {
    width : 200px;
    height : 300px;
    border : 5px double #6699FF;
    background-color : white;
  }
</style>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
  $(document).ready(function() {
	  $("#b1").click(function() {
		  const image = $("#image")[0];	//다중 선택이 가능하기 때문에 배열로 생성-> 사진 한개 인덱스 0
		  //파일을 여러 개 선택할 수 있으므로 files라는 객체에 담긴다
		  if(image.files.length === 0) { //사용자가 파일을 하나도 선택하지 않고 버튼 누름
			  alert("파일을 선택해주세요");
			  return;
		  }
		  
		  const formData = new FormData(); //변수명 값을 넘기는 프로그램을 객체화함
		  formData.append("name", $("#t1").val());
		  formData.append("sid", $("#t2").val()); // ;없이도 실행이 된다
		  formData.append("image", image.files[0]);
		  //javascript내 formData 클래스 존재
		  
		  $.ajax({		// ajax: 서버 통신 함수(html form태그랑 유사) //아래 파라미터들을 여러 개 함		//요청페이지와 같은 페이지에 결과를 보여주기 위함
			  type: "post",
			  url: "jQImagePro.jsp",
			  processData: false,	// 텍스트, 바이너리 data 인 multipart request data를 보내는 것이기 때문에 정렬/구분 작업(딕셔너리 형태)하지 말고 그대로 보냄 		//default: True
			  contentType: false,	// 텍스트뿐이 아닌 multipart로 보내기 때문 			//default: True
			  data: formData,  //formData 객체를 보냄
			  success: function(data) {	// success했을 때 어떤 형식으로 결과를 내보내는지 보여주는 파라미터
				  $("#result").html(data);
				  alert("로드성공");
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
	이름: <input type="text" id="t1" size="5">
	학번: <input type="text" id="t2" size="5"></p>
	<input type="file" id="image">
	<button id="b1">전송</button>
	<div id="result">로딩 영역</div>	
</body>
</html>
