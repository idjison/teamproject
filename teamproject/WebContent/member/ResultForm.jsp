<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
	<title>��� ������</title>
</head>
<body>
	<br><br><br>
	<%
		String msg = (String)session.getAttribute("msg");
	
		if(msg != null)
		{
			if(msg.equals("0"))
				out.println("<font size='6'>ȸ�������� �����Ǿ����ϴ�.</font>");
			else if(msg.equals("1"))
				out.println("<font size='6'>ȸ�������� ���ϵ帳�ϴ�.</font>");
			else if(msg.equals("9"))
				out.println("<font size='6'>��ΰ� �Ϸ�Ǿ����ϴ�.</font>");
			
			session.removeAttribute("msg");
		}
		else
		{
			out.println("<font size='6'>ȸ�������� �����Ǿ����ϴ�.</font>");
		}
	%>
	<br><br>
	<input type="button" value="��������" onclick="javascript:window.location='MainForm.do'"/>
	
</body>
</html>