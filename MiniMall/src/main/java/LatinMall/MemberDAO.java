package LatinMall;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MemberDAO {

	public static MemberDAO instance;
	Connection conn = null;
	PreparedStatement ps = null;

	private MemberDAO() {
		Context initContext;
		try {
			initContext = new InitialContext();
			Context envContext = (Context)initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource)envContext.lookup("jdbc/OracleDB");
			conn = ds.getConnection();
		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}    

	public static MemberDAO getInstance() {
		if(instance == null) {
			instance = new MemberDAO();
		}
		return instance;
	}

	public int insertMember(MemberDTO mb) {
		int cnt = -1;
		String sql = "insert into latinmem values(latin_seq.nextval, ?,?,?,?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, mb.getName());
			ps.setString(2,  mb.getEmail());
			ps.setInt(3, mb.getPhone());
			ps.setString(4, mb.getPassword());

			cnt = ps.executeUpdate();

		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if (ps != null)
					ps.close();
			} catch (SQLException e) {

			}
		}
		return cnt;
	}//insertLmember
}
