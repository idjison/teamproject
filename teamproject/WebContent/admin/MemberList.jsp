<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="member.model.*" %>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
	<style type="text/css">
		table{
			padding: 60px 0px;
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
	
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<br><br>
    <b><font size="6" color="gray">������ȸ</font></b>
    <br><br><br>
    
	<div id="wrap">
		<table border="1"> 
 
    <tr>
                <th>���̵�</th>    
                <th>��й�ȣ</th>
                <th>�̸�</th>
                <th>����</th>
                <th>�������</th>
                <th>�̸���</th>
                <th>��ȭ��ȣ</th>
                <th>�ּ�</th>
                <th>�Ŀ���</th>
                <th>���Գ�¥</th>
                <th>����</th>
                <th>����</th>
    
    </tr>
 
 
<%        
         ArrayList<MemberBean> list = (ArrayList<MemberBean>) request.getAttribute("list");
         for(MemberBean bean:list){
                     
%>
 
        <tr>
                <td><%=bean.getId() %></td>
                <td><%=bean.getPassword()%></td>
                <td><%=bean.getName()%></td>
                <td><%=bean.getGender()%></td>
                <td><%=bean.getBirthyy() %>��  <%=bean.getBirthmm() %>��  <%=bean.getBirthdd() %>��</td>
                <td><%=bean.getMail1() %>@<%=bean.getMail2() %></td>
                <td><%=bean.getPhone()%></td>
                <td><%=bean.getAddress() %></td>
                <td><%=bean.getMoney() %></td>
                <td><%=bean.getReg() %></td>
                <td>
                <form action="AdminModifyAction.do" method="Get">
                 	<input type="submit" name="delete" class="form-control" value="����">
                 	<input type="hidden" name="id" value="<%=bean.getId() %>">
                </form>
                </td>
                <td>
                <form action="MemberDeleteAction.do" method="Get">
                 	<input type="submit" name="delete" class="form-control" value="����">
                 	<input type="hidden" name="id" value="<%=bean.getId() %>">
                 	<input type="hidden" name="password" value="<%=bean.getPassword() %>">
                </form>
                </td>                             
        
        </tr>
 
 
 
<%
 
         } //for ���� ��
%>
	</table>
	</div>
</body>
</html>