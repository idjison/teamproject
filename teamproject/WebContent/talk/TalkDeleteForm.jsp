<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="talk.model.*" %>
<%
	TalkDAO dao = TalkDAO.getInstance();
	int num = Integer.parseInt(request.getParameter("num"));
%>
<html>
<head>
    <title>���� ����</title>
 
    <style type="text/css">
        #wrap {
            width: 550px;
            text-align: center;
            margin: 0 auto 0 auto;
        }
        
        #deleteReplyForm{
            text-align: center;
        }
    </style>
    
    <script type="text/javascript">
    
        var httpRequest = null;
        
        
        // ��й�ȣ ���Է½� ���â
        function checkValue(){
 
            var form = document.forms[0];
            var num = form.guestbook_no.value;
            var pw = form.guestbook_password.value;
            
            if (!form.guestbook_password.value) {
                alert("��й�ȣ�� �Է����� �ʾҽ��ϴ�.");
                return false;
            }
            else if(form.guestbook_password.value == <%=dao.getPassword(num)%>) // ��й�ȣ �Է½� Ajax�� �̿��� �����õ�
            {
            	<%
               	dao.deleteTalkbook(num);
               %>
            	if (opener != null) {
                    // ����(�θ�â) ���ΰ�ħ
                    window.opener.document.location.reload(); 
                    opener.delForm = null;
                    self.close();
     
                   	return true;
                }
            }
            else{
            	alert("��й�ȣ�� Ʋ���ϴ�.");
            	return false;
            }
                     
            }
        
        
        function checkFunc(){
            if(httpRequest.readyState == 4){
                // ������� �����´�.
                var resultText = httpRequest.responseText;
                if(resultText == 0){
                    alert("��й�ȣ�� Ʋ���ϴ�.");
                } 
                else{ // ��й�ȣ ��ġ�� ������ â�� �ݴ´�.
                    if (opener != null) {
                        // ����(�θ�â) ���ΰ�ħ
                        window.opener.document.location.reload(); 
                        opener.delForm = null;
                        self.close();
                    }
                }
            }
        }
    </script>
    
</head>
<body>
 
<div id="wrap">
    <br>
    <b><font size="5" color="gray">����</font></b>
    <hr size="1" width="550">
    <br>
 
    <div id="deleteReplyForm">
        <form name="delGuestbook" target="parentForm">
            <input type="hidden" name="guestbook_no"/>
            ��й�ȣ :
            <input type="password" name="guestbook_password" maxlength="50">    
            <br><br><br>
            <input type="button" value="����" onclick="checkValue()">
            <input type="button" value="â�ݱ�" onclick="window.close()">
        </form>
    </div>
</div>    
 
</body>
</html>
