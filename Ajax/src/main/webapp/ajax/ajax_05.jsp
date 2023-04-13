<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/httpRequest.js"></script>
<script type="text/javascript">

function ajaxToServer() {
	console.log("ajaxToServer call")

	var method = "POST"
	// 	var url = "./ajax_05_ok.jsp"
	var url = "<%= request.getContextPath()%>/ajax/ajax_05_ok.jsp"
	var u = username.value
	var c = content.value
	
	sendRequest(
			method
			, url
			, "username=" + u + "&content=" + c
			, ajaxFromServer)

}
function ajaxFromServer() {
	console.log ("ajaxFromServer call")
	
	if ( httpRequest.readyState == 4 ) { // DONE
		if ( httpRequest.status == 200) { // 200 ok
			console.log("AJAX 요청/응답 성공")
	
			result.innerHTML = httpRequest.responseText
			
		} else {
			console.log("AJAX 요청/응답 실패")
		}
	}
}
</script>
</head>
<body>
<!-- QUIZ. -->

<!-- 이름, <input>태그, id="username" -->
<!-- 내용, <input>태그, id="content" -->

<!-- 이름, 내용 두가지 데이터를 ajax_05_ok.jsp 로 전송 -->
<!-- 전송한 데이터를 이용하여 응답데이터로 작성한다 -->

<!-- 응답 받은 데이터를 이용하여 <div>를 생성하고 그 안에 데이터를 기록 -->
<!-- 형식

   <div>
      name: Alice
      content: 안녕하세요!
      
      Alice님, 안녕하세요!
   </div>

 -->
 
<label>이름<input id="username"><br></label>
<label>내용<input id="content"><br></label>
<button type="button" onclick="ajaxToServer();">입력</button>

<div id="result"></div>

</body>
</html>