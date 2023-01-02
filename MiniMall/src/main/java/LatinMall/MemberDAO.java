package LatinMall;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MemberDAO {

	public static MemberDAO instance;
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
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
	
	
	public boolean search_email(String user_email) {
		boolean flag = false;
		
		String sql = "select * from latinmem where email=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, user_email);
			rs = ps.executeQuery();
			if(rs.next()) {
				flag = true;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)
					rs.close();
				if(ps!=null)
					ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return flag;
	} //search_email
	
	public String searchPw(String email, String name ) {
		System.out.println(email);
		System.out.println(name);
		
		String password = null;
		String sql = "select password from latinmem where email=? and name=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, name);
			rs = ps.executeQuery();
			if(rs.next()) {
				password = rs.getString("password");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)
					rs.close();
				if(ps!=null)
					ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return password;
	}//searchPw
	
	public MemberDTO getmemberInfo(String email, String password) {
		MemberDTO dto = null;
		String sql = "select * from latinmem where email=? and password=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ps.setString(2, password);
			rs = ps.executeQuery();
			if(rs.next()) {
				dto = new MemberDTO();
				dto.setId(rs.getInt("id"));
				dto.setEmail(rs.getString("email"));
				dto.setPassword(rs.getString("password"));
				dto.setName(rs.getString("name"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)
					rs.close();
				if(ps!=null)
					ps.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	 return dto;
	}//getmemberInfo
	
}
