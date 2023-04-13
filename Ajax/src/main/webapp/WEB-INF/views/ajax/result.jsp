<%@page import="java.util.List"%>
<%@page import="dto.Member" %>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% List<Member> list = ( List<Member> ) request.getAttribute("list"); %>

<table>
<% for( int i=0; i<list.size(); i++ ) { %>
	<tr>
		<td><%= list.get(i).getId() %></td>
		<td><%= list.get(i).getPw() %></td>
	</tr>
<% } %>
</table>
