<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript" src="../resources/js/httpRequest.js"></script>
<script type="text/javascript">
window.onload = function() {

	btnAction.onclick = function() {
		console.log("#btnAction click")

		// AJAX요청 보내기
		sendRequest("POST", "./test02", "", callback)

	}

}

// AJAX응답 처리 콜백
function callback() {

	if (httpRequest.readyState == 4) {
		if (httpRequest.status == 200) {
			console.log("AJAX 성공")
			
			// 결과 처리 함수
			printData();
			
		} else {
			console.log("AJAX 실패")
		}
	}

}

function printData() {
	
	// 응답 데이터 확인
	console.log(httpRequest.responseText);
	
	result.innerHTML = httpRequest.responseText
}


</script>
</head>
<body>

	<h1>AJAX테스트 02</h1>
	<hr>

	<button id="btnAction">Ajax요청</button>

	<div id="result"></div>

</body>
</html>