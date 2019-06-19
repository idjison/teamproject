package talk.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class TalkDAO {
	private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

	
private static TalkDAO instance;
	
	// 싱글톤 패턴
	private TalkDAO(){}
	public static TalkDAO getInstance(){
		if(instance==null)
			instance=new TalkDAO();
		return instance;
	}

	public static Connection getConnection() {
		Connection conn = null;
		PreparedStatement pstmt = null;

		try {

			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(
					"jdbc:mysql://localhost/donate?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
					"user", "1234");
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패");
		}
		return conn;
	}
	
	public int getSeq() 
    {
        int result = 1;
        try {
            conn = getConnection();
 
            // 시퀀스 값을 가져온다. (DUAL : 시퀀스 값을 가져오기위한 임시 테이블)
            StringBuffer sql = new StringBuffer();
            sql.append("SELECT talk_no FROM DUAL");
 
            pstmt = conn.prepareStatement(sql.toString());
            rs = pstmt.executeQuery(); // 쿼리 실행
 
            if (rs.next())    result = rs.getInt(1);
 
        } catch (Exception e) {
            throw new RuntimeException(e.getMessage());
        }
 
        close();
        return result;
    } // end getSeq
	
	public boolean TalkInsert(TalkBean talk)
    {
        boolean result = false;
        
        try {
            conn = getConnection();
 
            // 자동 커밋을 false로 한다.
            conn.setAutoCommit(false);
            
            StringBuffer sql = new StringBuffer();
            sql.append("INSERT INTO talk");
            sql.append(" (tid, tpassword, tcontent)");
            sql.append(" VALUES(?,?,?)");

    
            pstmt = conn.prepareStatement(sql.toString());
            pstmt.setString(1, talk.getTalk_id());
            pstmt.setString(2, talk.getTalk_password());
            pstmt.setString(3, talk.getTalk_content());
 
            int flag = pstmt.executeUpdate();
            if(flag > 0){
                result = true;
                conn.commit(); // 완료시 커밋
            }
            
        } catch (Exception e) {
            try {
                conn.rollback(); // 오류시 롤백
            } catch (SQLException sqle) {
                sqle.printStackTrace();
            } 
            e.printStackTrace();
            throw new RuntimeException(e.getMessage());
        }
        
        close();
        return result;    
    } // end boardInsert();   
	
	public ArrayList<TalkBean> TalkList(int pagenum){

		ArrayList<TalkBean> list = new ArrayList<TalkBean>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		
		try {
            conn = getConnection();
 
            // 자동 커밋을 false로 한다.
            conn.setAutoCommit(false);
            
            StringBuffer sql = new StringBuffer();
            sql.append("select * from talk order by tdate desc");
            pstmt = conn.prepareStatement(sql.toString());
            rs = pstmt.executeQuery(); // 쿼리 실행
            if(pagenum != 0)
            rs.absolute((pagenum-1)*5);
            while(rs.next()) {
            	TalkBean bean = new TalkBean();
            	bean.setTalk_no(rs.getInt("tno"));
            	bean.setTalk_id(rs.getString("tid"));
            	bean.setTalk_password(rs.getString("tpassword"));
            	bean.setTalk_content(rs.getString("tcontent"));
            	bean.setTalk_date(rs.getString("tdate"));
            	
            	list.add(bean);
            	count++;
            	if(count == 5) break;
            }
            
        } catch (Exception e) {
            try {
                conn.rollback(); // 오류시 롤백
            } catch (SQLException sqle) {
                sqle.printStackTrace();
            } 
            e.printStackTrace();
            throw new RuntimeException(e.getMessage());
        }
		
		return list;
	}
	public int TalkCount()
    {
        int result = 0;
        
        try {
            conn = getConnection();
            
            StringBuffer sql = new StringBuffer();
            sql.append("SELECT COUNT(*) FROM talk");
            
            pstmt = conn.prepareStatement(sql.toString());
            rs = pstmt.executeQuery();
            if(rs.next())    result = rs.getInt(1);
            
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e.getMessage());
        }
        
        close();
        return result;    
    }
	
	public String getPassword(int talk_no)
    {
        String password = null;
        
        try {
            conn = getConnection();
            
            StringBuffer sql = new StringBuffer();
            sql.append("SELECT tpassword FROM talk where tno = ?");
            
            pstmt = conn.prepareStatement(sql.toString());
            pstmt.setInt(1, talk_no);
            
            rs = pstmt.executeQuery();
            if(rs.next()) password = rs.getString("tpassword");
            
        } catch (Exception e) {
            throw new RuntimeException(e.getMessage());
        }
        
        close();
        return password;
    } // end getPassword
    
    
    // 방명록 삭제
    public void deleteTalkbook(int talk_no) 
    {
        boolean result = false;
 
        try {
            conn = getConnection();
            conn.setAutoCommit(false); // 자동 커밋을 false로 한다.
 
            StringBuffer sql = new StringBuffer();
            sql.append("DELETE FROM talk where tno = ? ");
            
            
            pstmt = conn.prepareStatement(sql.toString());
            pstmt.setInt(1, talk_no);
            
            pstmt.executeUpdate();
            
            conn.commit(); // 완료시 커밋
                
            
        } catch (Exception e) {
            try {
                conn.rollback(); // 오류시 롤백
            } catch (SQLException sqle) {
                sqle.printStackTrace();
            }
            throw new RuntimeException(e.getMessage());
        }
 
        close();
    } // end deleteGuestbook    




    
    
    // DB 자원해제
    private void close()
    {
        try {
            if ( pstmt != null ){ pstmt.close(); pstmt=null; }
            if ( conn != null ){ conn.close(); conn=null;    }
        } catch (Exception e) {
            throw new RuntimeException(e.getMessage());
        }
    } // end close() 


}
