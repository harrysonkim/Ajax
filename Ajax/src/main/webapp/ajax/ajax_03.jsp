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
		xmlHttp = new XMLHttpRequest();
		console.log("xmlHttp")
		
		var un = document.getElementsByName('test_name')[0].value;
		console.log(un)
		
		var url = "./ajax_03_ok.jsp"
		
		var method = "post"
		
		var params = "username=" + un
		
		xmlHttp.onreadystatechange = callback
		
		
		
		
	}

	function callback() {
		console.log("collback() called")
			
	}
	

</script>
</head>
<body>

<!-- Quiz -->
<!-- username을 입력하고 "입력" 버튼을 누르면 -->
<!-- "안녕하세요, XXXX님" 으로 문구가 dir#result가 채워지도록 한다 -->

<h1>AJAX 03</h1>
<hr>

<form name="f">
	
	<!-- 	엔터키를 이용한 submit 방지용 input태그 -->
	<input type="text" style="display:none;">
	
	<input type="text" name="username">
	
	<button type="button" onclick="ajaxToServer();">입력</button>


</form>

<div id="result">
	<% request.getParameter("username"); %>
</div>


</body>
</html>