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
		if(session.getAttribute("sessionID") == null) // �α����� �ȵǾ��� ��
		{ 
	%>
			<br><br><br>
			<br><br><br>
			<h1>�������!</h1>
			<br><br>	
	<%
		}else{ // �α��� ���� ���	
	%>
			<br><br><br>
			<font size=6 color="skyblue"><%=session.getAttribute("sessionID") %></font>
			<font size=6>�� ȯ���մϴ�.</font>
	<%	} %>
</body>
</html>