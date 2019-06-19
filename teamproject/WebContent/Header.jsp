<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
		#wrap{
			text-align: center;
			
			height: 150px;
		}
</style>

<script type="text/javascript">
		
		function changeView(value){
			
			if(value == "0") // HOME ��ư Ŭ���� ùȭ������ �̵�
			{
				location.href="MainForm.do";
			}
			else if(value == "1") // �α��� ��ư Ŭ���� �α��� ȭ������ �̵�
			{
				location.href="AboutForm.do";
			}
			else if(value == "2") // ȸ������ ��ư Ŭ���� ȸ������ ȭ������ �̵�
			{
				location.href="DonateForm.do";
			}
			else if(value == "3") // �α׾ƿ� ��ư Ŭ���� �α׾ƿ� ó��
			{
				location.href="LoginForm.do";
			}
			else if(value == "4") // ������ ��ư Ŭ���� ȸ������ �����ִ� ȭ������ �̵�
			{
				location.href="JoinForm.do";
			}
			else if(value == "5") // ������ ��ư Ŭ���� ȸ������ �����ִ� ȭ������ �̵�
			{
				location.href="MemberLogoutAction.do";
			}
			else if(value == "6") // ������ ��ư Ŭ���� ȸ������ �����ִ� ȭ������ �̵�
			{
				location.href="MemberInfoAction.do";
			}
			else if(value == "7") // ������ ��ư Ŭ���� ȸ������ �����ִ� ȭ������ �̵�
			{
				location.href="MemberListAction.do";
			}
			else if(value == "8") // ������ ��ư Ŭ���� ȸ������ �����ִ� ȭ������ �̵�
			{
				location.href="TalkForm.do?page=1";
			}
		}
	</script>
</head>
<body>
	<div id = "wrap">
		<p>
			<button class="btn btn-success" onclick="changeView(0)">Home</button>
			<button class="btn btn-success" onclick="changeView(1)">About</button>
			<button class="btn btn-success" onclick="changeView(2)">�Ŀ��ϱ�</button>
			<button class="btn btn-info" onclick="changeView(8)">������ �� �ϱ�</button>
		<%
			// �α��� �ȵǾ��� ��� - �α���, ȸ������ ��ư�� �����ش�.
			if(session.getAttribute("sessionID")==null){ 
		%>
			<button id="loginBtn" class="btn btn-primary" onclick="changeView(3)">�α���</button>
			<button id="joinBtn" class="btn btn-primary" onclick="changeView(4)">ȸ������</button>
			
		<%
			//admin
			}else if(session.getAttribute("sessionID").equals("admin")){
		%>
			<button id="memberListBtn" class="btn btn-primary" onclick="changeView(7)">���� ��ȸ</button>
			<button id="logoutBtn" class="btn btn-primary" onclick="changeView(5)">�α׾ƿ�</button>
		<%
			// �α��� �Ǿ��� ��� - �α׾ƿ�, ������ ��ư�� �����ش�.
			}else{ 
		%>			
			<button id="logoutBtn" class="btn btn-primary" onclick="changeView(5)">�α׾ƿ�</button>
			<button id="updateBtn" class="btn btn-primary" onclick="changeView(6)">������</button>
		<%	}	%>	

		</p>
	</div>
</body>
</html>