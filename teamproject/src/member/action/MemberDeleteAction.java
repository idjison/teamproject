package member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.MemberDAO;
import util.action.Action;
import util.action.ActionForward;

public class MemberDeleteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		
ActionForward forward = new ActionForward();
		
		// 세션이 가지고있는 로그인한 ID 정보를 가져온다
		HttpSession session = req.getSession();
		String id = session.getAttribute("sessionID").toString();
		if(id.equals("admin")) {
			id = req.getParameter("id");
		}
		String password = req.getParameter("password");
		
		MemberDAO dao = MemberDAO.getInstance();
		int check = dao.deleteMember(id, password);
		
		if(check == 1){
			if(session.getAttribute("sessionID").toString().equals("admin")) {
				forward.setRedirect(true);
				forward.setNextPath("Result.do");
			}
			else {
				
			
			session.invalidate(); // 회원정보 담긴 세션 삭제
			forward.setRedirect(true);
			forward.setNextPath("Result.do");
			}
		}
		else{
			System.out.println("회원 삭제 실패");
			return null;
		}
		
		return forward;
	}

}
