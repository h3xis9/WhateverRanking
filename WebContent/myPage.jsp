<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String inp_id = (String)request.getAttribute("inp_id");
	String inp_pw = (String)request.getAttribute("inp_pw");
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" type="text/css" href="css/style.css">
	</head>
	
	<body>
		login.jsp here!
		<br>
		<%=inp_id %>
		<br>
		<%=inp_pw %>
		
	</body>
</html>