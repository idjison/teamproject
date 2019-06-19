package member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.*;
import util.action.Action;
import util.action.ActionForward;

public class MemberModifyAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("euc-kr");
		ActionForward forward = new ActionForward();
		
		MemberDAO dao = MemberDAO.getInstance();
		
		HttpSession session = req.getSession();
		String id = req.getParameter("id");
		
		// 수정할 정보를 자바빈에 세팅한다.
		MemberBean member = new MemberBean();
		member.setId(id);
		member.setPassword(req.getParameter("password"));
		member.setMail1(req.getParameter("mail1"));
		member.setMail2(req.getParameterValues("mail2")[0]); 
		member.setPhone(req.getParameter("phone"));
		member.setAddress(req.getParameter("address"));
		
		dao.updateMember(member);

		forward.setRedirect(true);
   		forward.setNextPath("Result.do");
		
   		// 회원정보 수정 성공 메시지를 세션에 담는다.
   		session.setAttribute("msg", "0");
   		
		return forward;
	}

}
