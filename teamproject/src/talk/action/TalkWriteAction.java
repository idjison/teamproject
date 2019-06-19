package talk.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import talk.model.*;
import util.action.Action;
import util.action.ActionForward;

public class TalkWriteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub

		req.setCharacterEncoding("euc-kr"); // 인코딩
        ActionForward forward = new ActionForward();
        
        // 파리미터를 가져온다.
        String guestbook_id = req.getParameter("guestbook_id");
        String guestbook_password = req.getParameter("guestbook_password");
        String guestbook_content = req.getParameter("guestbook_content");
        
        TalkDAO dao = TalkDAO.getInstance();
        
        // 파라미터 값을 GuestbookBean에 세팅한다.
        TalkBean talk = new TalkBean();
        talk.setTalk_id(guestbook_id);
        talk.setTalk_password(guestbook_password);
        talk.setTalk_content(guestbook_content);
        
        boolean result = dao.TalkInsert(talk);
        
        if(result){
            forward.setRedirect(true);
            forward.setNextPath("TalkForm.do?page=1");
        }
        
        return forward;

	}

}
