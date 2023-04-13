<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../resources/js/httpRequest.js"></script>
<script type="text/javascript">
window.onload = () => {
	
	btnAction.onclick = () => {
		console.log("#btnAction click")
		
		// Ajax 요청 보내기
		sendRequest("POST", "./test01", "", callback)
		
		
		
		
	}
	
	
	
}

function callback() {
	console.log("callback called")
	if (httpRequest.readyState ==4 ) {
		if(httpRequest.status == 200) {
			console.log("AJAX 정상적인 요청/응답 성공")
			
			printData()
			
		}else {
			console.log("AJAX 정상적인 요청/응답 실패")
			
		}
	}


}
	
// 응답 결과를 처리하는 함수
function printData() {
	
	console.log("printData() call")
	
	//=============================================================

	// 1
	// AJAX 응답 데이터 확인
	var respText = httpRequest.responseText
	
	console.log("---respTest---")
	console.log(respText)
	
	// 언마샬링, JSON Text => JS Data
	var jsData = JSON.parse( respText )
	
	console.log("---jsData---")
	console.log(jsData)
	
	// div#result에 응답 데이터 반영하기
// 	result.innerHTML = "<h1>key : data</h1>" 
// 	result.innerHTML += "<h1>value : " + jsData.data + "</h1>" 
	
		
	// Person DTO로 응답한 데이터 처리
// 	result.innerHTML = "<h1>name : " + jsData.name + "</h1>" 
// 	result.innerHTML += "<h1>age : " + jsData.age + "</h1>" 
// 	result.innerHTML += "<h1>addr : " + jsData.addr + "</h1>" 
// 	result.innerHTML += "<h1>phone : " + jsData.phone + "</h1>" 
	
	//=============================================================

	// Member DTO로 응답한 데이터 처리
	var html =""
	
	for(var i = 0; i<jsData.length; i++) {
		html += "<h1>phone : " + jsData[i].id + " : " + jsData[i].pw + "</h1>" 
	}
	
	result.innerHTML = html

}
	
</script>

</head>
<body>

<h1>AJAX테스트 01</h1>
<hr>

<button id="btnAction">Ajax요청</button>

<div id="result"></div>

</body>
</html>