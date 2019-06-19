<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="member.model.*" %>
<%
	MemberDAO dao = MemberDAO.getInstance();
	String result = "-1";
	if(request.getAttribute("result") != null){
	result = (String) request.getAttribute("result");
	}
	System.out.println(result);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <title>���̵� �ߺ� üũ</title>
    
    <style type="text/css">
        #wrap {
            width: 490px;
            text-align :center;
            margin: 0 auto 0 auto;
        }
        
        #chk{
            text-align :center;
        }
        
        #cancelBtn{
            visibility:visible;
        }
        
        #useBtn{
             visibility:hidden;
        }
 
   </style>
    
    <script>
    
        
        // ȸ������â�� ���̵� �Է¶��� ���� �����´�.
        function pValue(){
            document.getElementById("userId").value = opener.document.userInfo.id.value;
        }
        
        // ���̵� �ߺ�üũ
        function idCheck(){
 
            var id = document.getElementById("userId").value;
 
            if (!id) {
                alert("���̵� �Է����� �ʾҽ��ϴ�.");
                return false;
            } 
            else if((id < "0" || id > "9") && (id < "A" || id > "Z") && (id < "a" || id > "z")){ 
                alert("�ѱ� �� Ư�����ڴ� ���̵�� ����Ͻ� �� �����ϴ�.");
                return false;
            }
            else
            {
            	var form = document.createElement("form");

                form.setAttribute("charset", "UTF-8");

                form.setAttribute("method", "Get"); // Get �Ǵ� Post �Է�

                form.setAttribute("action", "MemberCheckIdAction.do");

                 
                var hiddenField = document.createElement("input");

                hiddenField.setAttribute("type", "hidden");

                hiddenField.setAttribute("name", "id");

                hiddenField.setAttribute("value", id);

                form.appendChild(hiddenField);

                document.body.appendChild(form);
                form.submit();
            	
            }
        }
        
       
            
       
        
        // ����ϱ� Ŭ�� �� �θ�â���� �� ���� 
        function sendCheckValue(){
            // �ߺ�üũ ����� idCheck ���� �����Ѵ�.
            opener.document.userInfo.idDuplication.value ="idCheck";
            // ȸ������ ȭ���� ID�Է¶��� ���� ����
            opener.document.userInfo.id.value = document.getElementById("userId").value;
            
            if (opener != null) {
                opener.chkForm = null;
                self.close();
            }    
        }    
   </script>
 
</head>
<body onload="pValue()">

<div id="wrap">
    <br>
    <b><font size="4" color="gray">���̵� �ߺ�üũ</font></b>
    <hr size="1" width="460">
    <br>
     <div id="chk">
        <form id="checkForm">
            <input type="text" name="idinput" id="userId">
            <input type="button" value="�ߺ�Ȯ��" onclick="idCheck()">
        </form>
        <div id="msg"></div>
        <br>
        <input id="cancelBtn" type="button" value="���" onclick="window.close()"><br>
        <input id="useBtn" type="button" value="����ϱ�" onclick="sendCheckValue()">
    </div>
</div>    
<script>
<%if(!result.equals("-1")){%>
	<%if(result.equals("0")){%>
                alert("�̹� �����ϴ� ���̵��Դϴ�.");
                document.getElementById("cancelBtn").style.visibility='visible';
                document.getElementById("useBtn").style.visibility='hidden';
                document.getElementById("msg").innerHTML ="";
            <%}else{ %>
            document.getElementById("cancelBtn").style.visibility='hidden';
            document.getElementById("useBtn").style.visibility='visible';
            document.getElementById("msg").innerHTML = "��� ������ ���̵��Դϴ�.";

             
            <%}%>
 <%} %>
</script>  
</body>
</html>