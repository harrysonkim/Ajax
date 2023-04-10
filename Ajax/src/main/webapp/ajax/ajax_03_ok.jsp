<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<% String userName = request.getParameter("userName"); %>

<div>
	<%= "안녕하세요, " + userName + "님" %>
</div>