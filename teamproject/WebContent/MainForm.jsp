<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String contentPage=request.getParameter("contentPage");
	if(contentPage==null)
		contentPage="Welcome.jsp";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
		/* 
		���̾ƿ� ��ü ��� ���� �±�  
		- margin:0 auto 0 auto;(�ð�������� ��, ������, �Ʒ�, ����)
		����, ������ �ٱ������� auto�� �ָ� �߾������� �ȴ�. 
		
		��ü�� �����ִ� �±� #wrap 
		*/
		#wrap {
			margin: 0 auto 0 auto;
			width: 1000px;
		}
		
		#header {
			text-align: center;
			width: 1000px;
			height: 150px;
			padding: 60px 0px;
			border-bottom: 1px solid;
		}
		
		#main {
			width: 1000px;
			height: 1100px;
			text-align:center;
			vertical-align: middle;
			border-bottom: 1px solid;
		}
		#footer {
			width: 1000px;
			clear: left;
			height: 60px;
		}
</style>
<script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
	<div id="wrap">
		<div id="header">
			<jsp:include page="Header.jsp" />
		</div>
		<div id="main">
			<jsp:include page="<%=contentPage%>" />
		</div>
		<div id="footer"> 
			<jsp:include page="Footer.jsp" />
		</div>
	</div>
</body>
</html>