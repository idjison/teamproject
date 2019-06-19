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
	총 회원수 : <%=dao.totalMembers() %>
	<br>
    전체 기부금 : <%=dao.totalDonate() %>
    <br>
    </div>
</body>
</html>