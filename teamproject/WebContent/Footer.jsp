<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="member.model.*" %>
<%
	MemberDAO dao = MemberDAO.getInstance();
	
%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
		#wrap{
			text-align: center;
		}
</style>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div id="wrap">
	<br>
	�� ȸ���� : <%=dao.totalMembers() %>
	<br>
    ��ü ��α� : <%=dao.totalDonate() %>
    <br>
    </div>
</body>
</html>