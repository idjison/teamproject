package member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.MemberBean;
import member.model.MemberDAO;
import util.action.Action;
import util.action.ActionForward;

public class MemberDonateAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		
		ActionForward forward = new ActionForward();
		
		// 세션이 가지고있는 로그인한 ID 정보를 가져온다
		HttpSession session = req.getSession();
		String id = session.getAttribute("sessionID").toString();
		String money = req.getParameter("money");
		int mon = Integer.parseInt(money);
		
		// 수정할 회원정보를 가져온다.
		MemberDAO dao = MemberDAO.getInstance();
		dao.donate(id, mon);		
		
		forward.setRedirect(true);
   		forward.setNextPath("Result.do");
		
   		// 회원정보 수정 성공 메시지를 세션에 담는다.
   		session.setAttribute("msg", "9");
   		
   		return forward;
	}

}
