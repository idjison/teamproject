<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div id="wrap">
	
		<br><br>
		<b><font size="6" color="gray">�Ŀ��ϱ�</font></b>
		<br><br><br>
	
		<form name="loginInfo" method="get" action="MemberDonateAction.do" onsubmit="return checkValue()">
			
			<p>�ݾ�: <input type="text" name="money" maxlength="50"><br>
			<input type="submit" value="�Ŀ��ϱ�"/>
			<input type="button" value="���">
			</p>
			
		</form>
		
	</div>	
		
<script>
	<%
		if(session.getAttribute("sessionID") == null){
			
	%>
	alert('�α��� ���� ���ּ���');
	location.href='MainForm.jsp';
	<%}%>
</script>	
</body>
</html>