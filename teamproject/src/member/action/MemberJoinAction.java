package member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.*;
import util.action.Action;
import util.action.ActionForward;

public class MemberJoinAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		req.setCharacterEncoding("euc-kr");
		ActionForward forward = new ActionForward();
		
		MemberDAO dao = MemberDAO.getInstance();
		
		// 입력된 정보를 자바빈에 세팅한다.
		MemberBean member = new MemberBean();
		member.setId(req.getParameter("id"));
		member.setPassword(req.getParameter("password"));
		member.setName(req.getParameter("name"));
		member.setGender(req.getParameter("gender"));
		member.setBirthyy(req.getParameter("birthyy"));
		member.setBirthmm(req.getParameterValues("birthmm")[0]);
		member.setBirthdd(req.getParameter("birthdd"));
		member.setMail1(req.getParameter("mail1"));
		member.setMail2(req.getParameterValues("mail2")[0]);
		member.setPhone(req.getParameter("phone"));
		member.setAddress(req.getParameter("address"));
		
		// 회원가입 실행
		dao.insertMember(member);
		
		// 가입성공
		forward.setRedirect(true);
   		forward.setNextPath("Result.do");
		
   		// 가입성공 메시지를 세션에 담는다.
   		req.getSession().setAttribute("msg", "1");
   		
		return forward;
	}

}
