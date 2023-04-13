<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsonTest</title>
<script type="text/javascript">

// 자바스크립트 객체
var jsObj = {}
var jsObj = {
		"a":1
		, "b":2
		, "c":"Cherry"
		, "d":["Durian", 12345]
		, "e" : {"key":"value"} }

console.log( jsObj )

// JSON텍스트
var jsonText = '{ "a":1, "b":2, "c":"Cherry", "d":["Durian", 12345], "e" : {"key":"value"} }'

console.log( jsonText )

console.log("===============================")

// JSON 내장객체
// 	JSON형식 데이터를 다루는 JS내장 객체
//	JS데이터 <=> JSON 텍스트 변환 유틸 객체

// ** JS데이터 => JSON텍스트 변환 (마샬링 함수)
//	JSON.stringify( JS데이터 ) : JS텍스트

// ** JSON텍스트 => JS데이터 변환 (언마샬링 함수)
//	JSON.parse( JSON데이터 ) : JS데이터

// =====================================================
	
// JS객체 => JSON텍스트 변환 (Object타입)
var text = JSON.stringify( jsObj )
console.log(text)

var obj = JSON.parse( text )
console.log( obj )






</script>
</head>
<body>



</body>
</html>