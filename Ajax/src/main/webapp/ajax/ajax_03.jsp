<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

var xmlHttp = null;

function ajaxToServer() {
	console.log("ajaxToServer() called")
	
	// xmlHttp 객체 생성
	xmlHttp = new XMLHttpRequest();
	console.log("xmlHttp")
	
	// 입력받은 값 저장
	var userName = document.getElementsByName('username')[0].value;
	console.log(userName)
	
	////////////////////
	// Ajax 요청 전 설정
	////////////////////
	
	// 요청 URL
	var url = "./ajax_03_ok.jsp"
	
	// 요청 Method
	var method = "post"
	
	// 요청 파라미터
	var params = "userName=" + userName
	
	////////////////////////
	// 서버의 응답 데이터 처리하기
	////////////////////////
	
	// readyState가 변경될 때마다 호출되는 리스너
	xmlHttp.onreadystatechange = callback
	
	// Ajax 요청 준비
	xmlHttp.open(method, url)
	xmlHttp.setRequestHeader(
			"Content-Type"
			, "application/x-www-form-urlencoded")

	// Ajax요청 보내기
	xmlHttp.send(params)
	
}

function callback() {
	console.log("collback() called")

	if ( xmlHttp.readyState == 4 ) { // DONE, 응답 완료 상태
		
		console.log("응답 받기 완료")
		
		console.log("=== 응답 ===")
		// ajax_02_ok.jsp가 xmlHttp.responseText에 담겨있다
		console.log( xmlHttp.responseText)
		
		// 결과값을 id = "resultLayout"인 곳에 HTML 추가 
		result.innerHTML = xmlHttp.responseText
		
		// 입력창 초기화
		document.getElementsByName('username')[0].value = ""
		
		// input#num1에 포커스
		document.getElementsByName('username')[0].focus()
	}
}
</script>

</head>
<body>

<!-- Quiz -->
<!-- username을 입력하고 "입력" 버튼을 누르면 -->
<!-- "안녕하세요, XXXX님" 으로 문구가 div#result가 채워지도록 한다 -->

<h1>AJAX 03</h1>
<hr>

<form name="f">
	
	<!-- 	엔터키를 이용한 submit 방지용 input태그 -->
	<input type="text" style="display:none;">
	
	<input type="text" name="username">
	
	<button type="button" onclick="ajaxToServer();">입력</button>


</form>

<div id="result"></div>


</body>
</html>