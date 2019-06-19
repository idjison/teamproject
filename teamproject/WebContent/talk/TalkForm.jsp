<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="talk.model.*" %>
<%@page import="java.util.ArrayList"%>
<%
	int currentPage = Integer.parseInt(request.getParameter("page"));
	TalkDAO dao = TalkDAO.getInstance();
	ArrayList<TalkBean> list = dao.TalkList(currentPage);
	int totalTalk = dao.TalkCount();
	System.out.print(totalTalk);
	int totalPage = totalTalk/5 + 1;
	System.out.print(totalPage);
%>
<html>
<head>
    <title>����</title>
    
    <style type="text/css">
        #wrap {
            margin: 0 auto 0 auto;
        }
        
        #comment{
            text-align :left;
        }
        
        #listGuestForm{
            text-align :center;
            overflow:scroll; 
            overflow-x:hidden; 
            height:500px;
        }
        
        #writeGuestForm, #pageForm{
            text-align :center;
        }

        
 
    </style>
    
    <script type="text/javascript">
        // �Է°� üũ
        function checkValue()
        {
            if(!document.gestbookInfo.guestbook_id.value){
                alert("�̸��� �Է��ϼ���.");
                return false;
            }
            
            if(!document.gestbookInfo.guestbook_password.value){
                alert("��й�ȣ�� �Է��ϼ���.");
                return false;
            }
            
            if(!document.gestbookInfo.guestbook_content.value){
                alert("������ �Է��ϼ���.");
                return false;
            }
        }
    	
        function openDelForm(talk_no)
        {
            window.name = "parentForm";
            window.open("TalkDeleteForm.do?num="+talk_no,
                    "delForm", "width=570, height=350, resizable = no, scrollbars = no");
        }

    </script>

</head>
<body>
 
    <br>
    <b><font size="6" color="gray">������ �� �ϱ�</font></b>
    <hr size="1" width="700">
    <br>
    
<div id="wrap">    
 
    <!-- �� ��� �κ� ����-->
    <div id="writeGuestForm">
        <form name="inputform" method="post" action="TalkWriteAction.do">
            <table width="700">
                <input type="hidden" name="pro" value="ins">
                <tr>
                    <td>�̸�</td>
                    <td><input type="text" name="guestbook_id"></td>
                    <td>��й�ȣ</td>
                    <td><input type="password" name="guestbook_password"></td>
                </tr>
                <tr><td colspan="4">&nbsp;</td></tr>
                <tr>
                    <td colspan="4">
                        <textarea rows="7" cols="80" name="guestbook_content"></textarea>
                    </td>
                </tr>
            </table>
            <br>
            <input type="submit" value="���">
        </form>
    </div>
    <!-- �� ��� �κ� ��-->

    <br><br>
    <!-- �� ��� �κ� ���� -->
    <div id="listGuestForm">
        <form method="post" name="listform">
            <input type="hidden" name="pro">
            <div id="comment">
            <%
            for(TalkBean bean:list){
            %>
                <hr size="1" width="700">
                <label><%=bean.getTalk_id() %></label>
                <label><%=bean.getTalk_date() %></label>
                <a href="#" onclick="openDelForm(<%=bean.getTalk_no()%>)">[����]</a><br>
                <%=bean.getTalk_content() %> <br>
                 <hr size="1" width="700">
                 
                 <%} %>
                 
            </div>
            <div id="pageForm">
            
            <%
            	if(totalPage != 1){
            		
            		
            		
            	for(int i = 1; i < totalPage+1; i++){
            %>
            
            	<a href='TalkForm.do?page=<%=i%>'><%=i%></a>
            	
            	
            	
              
                <%}} %>
                
            </div> 
            
        </form>
     </div>
      <!-- �� ��� �κ� �� -->
</div>
     
</body>
</html>