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

		sendRequest(
				"POST"
				, "./ajax_04_ok.jsp" 
				, "username="+document.f.username.value
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

<h1>AJAX 04</h1>
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