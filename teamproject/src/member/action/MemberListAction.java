package member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.*;
import util.action.Action;
import util.action.ActionForward;

public class MemberListAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		res.setContentType("text/html; charset=UTF-8");
		ActionForward forward = new ActionForward();
		PrintWriter out = res.getWriter();
		HttpSession session = req.getSession();

		MemberDAO dao = MemberDAO.getInstance();
		req.setAttribute("list", dao.MemberList());

   		forward.setRedirect(false);
   		forward.setNextPath("MemberList.do");
		
		return forward;
	}

}
