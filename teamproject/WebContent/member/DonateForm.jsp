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
		<b><font size="6" color="gray">후원하기</font></b>
		<br><br><br>
	
		<form name="loginInfo" method="get" action="MemberDonateAction.do" onsubmit="return checkValue()">
			
			<p>금액: <input type="text" name="money" maxlength="50"><br>
			<input type="submit" value="후원하기"/>
			<input type="button" value="취소">
			</p>
			
		</form>
		
	</div>	
		
<script>
	<%
		if(session.getAttribute("sessionID") == null){
			
	%>
	alert('로그인 먼저 해주세요');
	location.href='MainForm.jsp';
	<%}%>
</script>	
</body>
</html>