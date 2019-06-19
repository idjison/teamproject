<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		if(session.getAttribute("sessionID") == null) // 로그인이 안되었을 때
		{ 
	%>
			<br><br><br>
			<br><br><br>
			<h1>어서오세요!</h1>
			<br><br>	
	<%
		}else{ // 로그인 했을 경우	
	%>
			<br><br><br>
			<font size=6 color="skyblue"><%=session.getAttribute("sessionID") %></font>
			<font size=6>님 환영합니다.</font>
	<%	} %>
</body>
</html>