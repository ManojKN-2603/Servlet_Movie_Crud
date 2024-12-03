<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- <h1>this is html code</h1>
	<%
	System.out.println("this is java");
	%>

	<%!int a = 6;%><!-- global variable -->

	<%
	int a = 8;
	%><!-- local variable  -->

	<%=a%>
	<br>

	<%=this.a%>

	<%
	List<Integer> x = Arrays.asList(1, 2, 3);
	%> --%>

	<%
	for (int i = 1; i <= 3; i++) {
	%>
	<div align="center">
		<div style="height: 100px; width: 100px; border: 1px solid black;">
			<%=i%>
		</div>
	</div>
	<%
	}
	%>

	<%-- <%@include file="home.html" %> --%>
</body>
</html>