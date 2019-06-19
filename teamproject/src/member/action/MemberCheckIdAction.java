package member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.*;
import util.action.Action;
import util.action.ActionForward;

public class MemberCheckIdAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub

		res.setContentType("text/html; charset=UTF-8");
		ActionForward forward = new ActionForward();
		String id = req.getParameter("id");
		
		PrintWriter out = res.getWriter();
		
		MemberDAO dao = MemberDAO.getInstance();
		boolean result = dao.duplicateIdCheck(id);
		
		if(result) {
			
			req.setAttribute("result", "0");
			
			out.println("<script>location.href='IdCheckForm.jsp';</script>");

			 
			

			forward.setRedirect(false);
			forward.setNextPath("IdCheckForm.jsp");
		}
		else {
			req.setAttribute("result", "1");
			
			 
			out.println("<script>location.href='IdCheckForm.jsp';</script>");


			forward.setRedirect(false);
			forward.setNextPath("IdCheckForm.jsp");
		}
		return forward;
	}

}
