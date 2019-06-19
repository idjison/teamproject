package talk.model;

public class TalkBean {
	
	 	private int talk_no;            // 글번호
	    private String talk_id;        // 아이디
	    private String talk_password;    // 비밀번호
	    private String talk_content;    // 내용
	    private String talk_date;        // 작성일
		public int getTalk_no() {
			return talk_no;
		}
		public void setTalk_no(int talk_no) {
			this.talk_no = talk_no;
		}
		public String getTalk_id() {
			return talk_id;
		}
		public void setTalk_id(String talk_id) {
			this.talk_id = talk_id;
		}
		public String getTalk_password() {
			return talk_password;
		}
		public void setTalk_password(String talk_password) {
			this.talk_password = talk_password;
		}
		public String getTalk_content() {
			return talk_content;
		}
		public void setTalk_content(String talk_content) {
			this.talk_content = talk_content;
		}
		
		public String getTalk_date() {
			return talk_date;
		}
		public void setTalk_date(String talk_date) {
			this.talk_date = talk_date;
		}



}
