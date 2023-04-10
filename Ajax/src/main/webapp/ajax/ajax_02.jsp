<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	var xmlHttp = null;

	function calc() {
		console.log("calc() called")
		xmlHttp = new XMLHttpRequest();
		console.log("xmlHttp")

		var n1 = num1.value
		var n2 = num2.value
		var op = oper.value
		console.log(n1, n2, op)

		// AJAX 요청 전 설정
		// 요청 URL
		var url = "./ajax_02_ok.jsp"

		// 요청 Method
		var method = "post"

		// 요청 Parameter
		var params = "num1=" + n1 + "&num2=" + n2 + "&oper=" + op
		
		// 서버의 응답 데이터 처리하기
		// => readyState가 변경될 때마다 호출되는 이벤트 리스너
		xmlHttp.onreadystatechange = callback
		

		// AJAAX 요청 준비
		xmlHttp.open(method, url)
		xmlHttp.setRequestHeader("Content-Type",
				"application/x-www-form-urlencoded")

		// AJAX 요청 보내기
		xmlHttp.send(params)

	}
	
	// 응답 데이터를 처리하는 콜백함수
	function callback() {
		console.log("collback called")

		if ( xmlHttp.readyState == 4 ) { // DONE, 응답 완료 상태
			console.log("응답 받기 완료")
			
			console.log("=== 응답 ===")
			// ajax_02_ok.jsp가 xmlHttp.responseText에 담겨있다
			console.log( xmlHttp.responseText)
			
			// 결과값을 id = "resultLayout"인 곳에 HTML 추가 
			resultLayout.innerHTML = xmlHttp.responseText
			
			// 입력창 초기화
			num1.value = ""
			num2.value = ""
			oper.value = "add"
			
			// input#num1에 포커스
			num1.focus()
			
			
		}
		
		
	}
	
</script>

</head>
<body>

	<h1>계산기 02</h1>
	<h3>AJAX HTTP통신 (비동기식)</h3>
	<hr>

	<input type="text" id="num1">
	<select id="oper">
		<option value="add">더하기</option>
		<option value="sub">빼기</option>
		<option value="mul">곱하기</option>
		<option value="div">나누기</option>
	</select>
	<input type="text" id="num2">
<!-- 	<input type="button" value="=" onclick="calc();"> -->
	<button value="=" onclick="calc();">=</button>
	<hr>

	<!-- AJAX 요청에 대한 응답을 적용할 DIV -->
	<div id="resultLayout">
	</div>



</body>
</html>