<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="member.model.*" %>    


<%
	// MemberInfoAction���� �ѱ� ȸ�������� �����Ѵ�.
	MemberBean member=(MemberBean)request.getAttribute("memberInfo");
%>


<html>
<head>
	<title>���� �������� ���ȭ��</title>
	
	<style type="text/css">
		table{
			margin-left:auto; 
			margin-right:auto;
			border:3px solid skyblue;
		}
		
		td{
			border:1px solid skyblue
		}
		
		#title{
			background-color:skyblue
		}
	</style>
	
	<script type="text/javascript">
	
		function changeForm(val){
			if(val == "-1"){
				location.href="MainForm.do";
			}else if(val == "0"){
				location.href="MemberModifyFormAction.do";
			}else if(val == "1"){
				location.href="DeleteForm.do";
			}
		}
		
	</script>
	
</head>
<body>
		<br><br>
		<b><font size="6" color="gray">�� ����</font></b>
		<br><br><br>
						<!-- ������ ȸ�������� ����Ѵ�. -->
		<table>
			<tr>
				<td id="title">���̵�</td>
				<td><%=member.getId() %></td>
			</tr>
						
			<tr>
				<td id="title">��й�ȣ</td>
				<td><%=member.getPassword() %></td>
			</tr>
					
			<tr>
				<td id="title">�̸�</td>
				<td><%=member.getName() %></td>
			</tr>
					
			<tr>
				<td id="title">����</td>
				<td><%=member.getGender()%></td>
			</tr>
					
			<tr>
				<td id="title">����</td>
				<td>
					<%=member.getBirthyy() %>�� 
					<%=member.getBirthmm() %>�� 
					<%=member.getBirthdd() %>��
				</td>
			</tr>
					
			<tr>
				<td id="title">�̸���</td>
				<td>
					<%=member.getMail1() %>@
					<%=member.getMail2() %>
				</td>
			</tr>
					
			<tr>
				<td id="title">�޴���ȭ</td>
				<td><%=member.getPhone() %></td>
			</tr>
			<tr>
				<td id="title">�ּ�</td>
				<td>
					<%=member.getAddress() %>
				</td>
			</tr>
			
			<tr>
				<td id="title">�Ŀ��ݾ�</td>
				<td><%=member.getMoney() %></td>
			</tr>
		</table>
		
		<br>
		<input type="button" value="�ڷ�" onclick="changeForm(-1)">
		<input type="button" value="ȸ������ ����" onclick="changeForm(0)">
		<input type="button" value="ȸ��Ż��" onclick="changeForm(1)">
</body>
</html>