<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript">
$( () => {

	$("#btnCalc").click( function() {
		console.log("#btnCalc click")
		
		// 요청 url
		var url = "./jqAjax_ok.jsp"
		
		// 요청 파라미터
		var data = {
			n1 : num1.value
			, n2 : num2.value
			, op : oper.value
		}
			
		// ----------------------------
		
// 		$.get(url, data, function (res) {
// 			console.log("AJAX 응답 성공")

// 			// 서버의 응답 데이터 확인
// 			console.log(res)
			
// 			// 응답 데이터를 #result에 반영하기
// 			$("#result").html(res)
		
// 			// 입력창 초기화
// 			num1.value = "";
// 			num2.value = "";
// 			oper.value = "add";
			
// 			num1.focus();
			
// 		}, "html")

		// ----------------------------
		
		$.post(url, data, function (res) {
			console.log("AJAX 응답 성공")

			// 서버의 응답 데이터 확인
			console.log(res)
			
			// 응답 데이터를 #result에 반영하기
			$("#result").html(res)
		
			// 입력창 초기화
			num1.value = "";
			num2.value = "";
			oper.value = "add";
			
			num1.focus();
			
		}, "html")
		
		
		
		
	})
	

})
</script>
</head>
<body>

<h1>jQuery AJAX 계산기 01</h1>
<hr>

<input type="text" id="num1">
<select id="oper">
	<option value="add">더하기</option>
	<option value="sub">빼기</option>
	<option value="mul">곱하기</option>
	<option value="div">나누기</option>
</select>
<input type="text" id="num2">

<button id="btnCalc"> = </button>
<hr>

<div id="result"></div>




</body>
</html>