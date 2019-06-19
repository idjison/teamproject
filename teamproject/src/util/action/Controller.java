package util.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.action.*;
import talk.action.TalkWriteAction;



public class Controller extends HttpServlet{
	public void doGet(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
			doProcess(req,res);
	}  	
		
	public void doPost(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
			doProcess(req,res);
	}   	  	      	   
		
	
	public void doProcess(HttpServletRequest req, HttpServletResponse res) 
		 	throws ServletException, IOException {
		
		
		String requestURI = req.getRequestURI();
		int cmdIdx = requestURI.lastIndexOf("/")+1;
		
		String command = requestURI.substring(cmdIdx);
		
		ActionForward forward = null;
		Action action = null;
				
		String memberForm = "MainForm.jsp?contentPage=member/";
		String adminForm = "MainForm.jsp?contentPage=admin/";
		String talkForm = "MainForm.jsp?contentPage=talk/";
				
		try {
			
			if(command.equals("MainForm.do")) 
			{
				forward=new ActionForward();
				forward.setRedirect(false);
				forward.setNextPath("MainForm.jsp");
			}
			else if(command.equals("JoinForm.do")) 
			{
				forward=new ActionForward();
				forward.setRedirect(false);
				forward.setNextPath(memberForm + "JoinForm.jsp");
			}
			else if(command.equals("AboutForm.do")) 
			{
				forward=new ActionForward();
				forward.setRedirect(false);
				forward.setNextPath(memberForm + "AboutForm.jsp");
			}
			else if(command.equals("LoginForm.do")) 
			{
				forward=new ActionForward();
				forward.setRedirect(false);
				forward.setNextPath(memberForm + "LoginForm.jsp");
			}
			else if(command.equals("DonateForm.do")) 
			{
				forward=new ActionForward();
				forward.setRedirect(false);
				forward.setNextPath(memberForm + "DonateForm.jsp");
			}
			else if(command.equals("ModifyForm.do")) 
			{
				forward=new ActionForward();
				forward.setRedirect(false);
				forward.setNextPath(memberForm + "ModifyForm.jsp");
			}
			else if(command.equals("UserInfoForm.do")) 
			{
				forward=new ActionForward();
				forward.setRedirect(false);
				forward.setNextPath(memberForm + "UserInfoForm.jsp");
			}
			else if(command.equals("DeleteForm.do")) 
			{
				forward=new ActionForward();
				forward.setRedirect(false);
				forward.setNextPath(memberForm + "DeleteForm.jsp");
			}
			else if(command.equals("MemberList.do")) 
			{
				forward=new ActionForward();
				forward.setRedirect(false);
				forward.setNextPath(adminForm + "MemberList.jsp");
			}
			else if(command.equals("TalkForm.do")) 
			{
				forward=new ActionForward();
				forward.setRedirect(false);
				forward.setNextPath(talkForm + "TalkForm.jsp");
			}
			else if(command.equals("TalkDeleteForm.do")) 
			{
				forward=new ActionForward();
				forward.setRedirect(false);
				forward.setNextPath("talk/TalkDeleteForm.jsp");
			}
			
			else if(command.equals("Result.do")) 
			{
				forward=new ActionForward();
				forward.setRedirect(false);
				forward.setNextPath(memberForm + "ResultForm.jsp");
			}
			else if(command.equals("MemberLoginAction.do")) // 로그인 처리
			{
				action = new MemberLoginAction();
				forward = action.execute(req, res);
			}
			else if(command.equals("MemberLogoutAction.do")) // 로그아웃 처리
			{
				action = new MemberLogoutAction();
				forward = action.execute(req, res);
			}
			else if(command.equals("MemberDeleteAction.do")) // 로그아웃 처리
			{
				action = new MemberDeleteAction();
				forward = action.execute(req, res);
			}
			else if(command.equals("MemberInfoAction.do")) // 로그아웃 처리
			{
				action = new MemberInfoAction();
				forward = action.execute(req, res);
			}
			else if(command.equals("MemberJoinAction.do")) // 로그아웃 처리
			{
				action = new MemberJoinAction();
				forward = action.execute(req, res);
			}
			else if(command.equals("MemberModifyAction.do")) // 로그아웃 처리
			{
				action = new MemberModifyAction();
				forward = action.execute(req, res);
			}
			else if(command.equals("MemberModifyFormAction.do")) // 로그아웃 처리
			{
				action = new MemberModifyFormAction();
				forward = action.execute(req, res);
			}
			else if(command.equals("MemberDonateAction.do")) // 로그아웃 처리
			{
				action = new MemberDonateAction();
				forward = action.execute(req, res);
			}
			else if(command.equals("MemberListAction.do")) // 로그아웃 처리
			{
				action = new MemberListAction();
				forward = action.execute(req, res);
			}
			else if(command.equals("MemberCheckIdAction.do")) // 로그아웃 처리
			{
				action = new MemberCheckIdAction();
				forward = action.execute(req, res);
			}
			else if(command.equals("AdminModifyAction.do")) // 로그아웃 처리
			{
				action = new AdminModifyAction();
				forward = action.execute(req, res);
			}
			else if(command.equals("TalkWriteAction.do")) // 로그아웃 처리
			{
				action = new TalkWriteAction();
				forward = action.execute(req, res);
			}
			
			
			if(forward != null){
				if (forward.isRedirect()) {
					res.sendRedirect(forward.getNextPath());
				} else {
					RequestDispatcher dispatcher = req
							.getRequestDispatcher(forward.getNextPath());
					dispatcher.forward(req, res);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}


