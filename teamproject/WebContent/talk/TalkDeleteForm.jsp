<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="talk.model.*" %>
<%
	TalkDAO dao = TalkDAO.getInstance();
	int num = Integer.parseInt(request.getParameter("num"));
%>
<html>
<head>
    <title>방명록 삭제</title>
 
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
        
        
        // 비밀번호 미입력시 경고창
        function checkValue(){
 
            var form = document.forms[0];
            var num = form.guestbook_no.value;
            var pw = form.guestbook_password.value;
            
            if (!form.guestbook_password.value) {
                alert("비밀번호를 입력하지 않았습니다.");
                return false;
            }
            else if(form.guestbook_password.value == <%=dao.getPassword(num)%>) // 비밀번호 입력시 Ajax를 이용해 삭제시도
            {
            	<%
               	dao.deleteTalkbook(num);
               %>
            	if (opener != null) {
                    // 방명록(부모창) 새로고침
                    window.opener.document.location.reload(); 
                    opener.delForm = null;
                    self.close();
     
                   	return true;
                }
            }
            else{
            	alert("비밀번호가 틀립니다.");
            	return false;
            }
                     
            }
        
        
        function checkFunc(){
            if(httpRequest.readyState == 4){
                // 결과값을 가져온다.
                var resultText = httpRequest.responseText;
                if(resultText == 0){
                    alert("비밀번호가 틀립니다.");
                } 
                else{ // 비밀번호 일치시 삭제후 창을 닫는다.
                    if (opener != null) {
                        // 방명록(부모창) 새로고침
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
    <b><font size="5" color="gray">삭제</font></b>
    <hr size="1" width="550">
    <br>
 
    <div id="deleteReplyForm">
        <form name="delGuestbook" target="parentForm">
            <input type="hidden" name="guestbook_no"/>
            비밀번호 :
            <input type="password" name="guestbook_password" maxlength="50">    
            <br><br><br>
            <input type="button" value="삭제" onclick="checkValue()">
            <input type="button" value="창닫기" onclick="window.close()">
        </form>
    </div>
</div>    
 
</body>
</html>
