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

	$("#btnCalc").click( function () {

		$.ajax({
			type: "get"
			, url : "./jqAjax_ok.jsp"
			, data : {
				n1 : num1.value
				, n2 : num2.value
				, op : oper.value
			}
			, dataType : "html"
			, success : function(res) {
				console.log("AJAX 성공")
				
				$("#result").html(res)
				
				$("#num1").val("")
				$("#num2").val("")
				$("#oper").val("add")
				
				$("num1").focus()
			}
			, error : function() {
				console.log("AJAX 실패")
				
				
			}
		})	
	
	})
		
	
	
	
})
</script>
</head>
<body>

<h1>jQuery AJAX 계산기 02</h1>
<h3>$.ajax() 이용</h3>
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