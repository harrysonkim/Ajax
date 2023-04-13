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
	//==============================================================
	// 1. xmlHttp 객체 생성
	//==============================================================
		
	xmlHttp = new XMLHttpRequest();
	console.log("xmlHttp")

	//==============================================================
	// 2. 서버의 응답을 처리하는 콜백 함수 지정하기
	//==============================================================
		
	xmlHttp.onreadystatechange = ajaxFromServer

	//==============================================================
	// 3. 입력받은 값 저장 (JS식 호출)
	//==============================================================
	var userName = document.getElementsByName('username')[0].value;
// 	var userName = document.querySelector('input[name="username"]');
	console.log(userName)
	
	///////////////////////
	// Ajax 요청 전 설정 //
	///////////////////////
	
	//==============================================================
	// 4-1. GET 방식		
	//==============================================================

// 	var method = "GET"
// 	var url = "./ajax_03_ok.jsp?userName=" + document.f.username.value
	
// 	// Ajax 요청 준비
// 	xmlHttp.open(method, url)

// 	xmlHttp.setRequestHeader(
// 		"Content-Type"
// 		, "application/x-www-form-urlencoded")

// 	// url에서 쿼리로 값을 주기 때문에 null로 send한다
// 	xmlHttp.send(null)

	//==============================================================
	// 4-2. POST 방식		
	//==============================================================

	// 요청 URL
	var url = "./ajax_03_ok.jsp"
	
	// 요청 Method
	var method = "POST"
	
	// 요청 파라미터
	var params = "userName=" + userName
	
	// Ajax 요청 준비
	xmlHttp.open(method, url)
	xmlHttp.setRequestHeader(
			"Content-Type"
			, "application/x-www-form-urlencoded")

	// Ajax요청 보내기
	xmlHttp.send(params)
	
}

function ajaxFromServer() {
	console.log("ajaxFromServer() called")

	if ( xmlHttp.readyState == 4 ) { // DONE, 응답 완료 상태
		
		if ( xmlHttp.status == 200){
			console.log("Ajax 요청/응답 완료")
			
			console.log("=== 응답 ===")
			// ajax_02_ok.jsp가 xmlHttp.responseText에 담겨있다
			console.log( xmlHttp.responseText)
			
			// 결과값을 id = "resultLayout"인 곳에 HTML 추가 
			result.innerHTML = xmlHttp.responseText
			
			// 입력창 초기화
			document.getElementsByName('username')[0].value = ""
// 			document.getquerySelector('input[name="username"]') = ""
			
			// input#num1에 포커스
			document.getElementsByName('username')[0].focus()
// 			document.getquerySelector('input[name="username"]').focus()
		
		} else {
			
			console.log("Ajax 요청/응답 실패")
			
		}
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