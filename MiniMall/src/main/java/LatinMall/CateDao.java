package LatinMall;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class CateDao {

	public static CateDao instance;
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	private CateDao() {
		Context initContext;
		try {
			initContext = new InitialContext();
			Context envContext = (Context)initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource)envContext.lookup("jdbc/OracleDB");
			conn = ds.getConnection();
			System.out.println("conn:" + conn);

		} catch (NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static CateDao getInstance() {
		if(instance==null) {
			instance = new CateDao();
		}
		return instance;
	}
	
	public int insertCate(CateBean cb) {
		int cnt = -1;
	String sql = "insert into categoria values(cate_seq.nextval, ?, ?)";
	try {
		ps = conn.prepareStatement(sql);
		ps.setString(1, cb.getCorigin());
		ps.setString(2, cb.getCategory());
		
		cnt = ps.executeUpdate();
		
	} catch (SQLException e) {
		e.printStackTrace();
	}finally {
		try {
			if (ps != null)
				ps.close();
		} catch (SQLException e) {

		}
	}
		return cnt;
	} //insertCate
	
	public ArrayList<CateBean> getAllCates() {
		ArrayList<CateBean> list = new ArrayList<CateBean>();
		
	String sql = "select * from categoria order by cnum asc";
	try {
		ps = conn.prepareStatement(sql);
		rs = ps.executeQuery();
		while(rs.next()) {
			int cnum = rs.getInt("cnum");
			String corigin = rs.getString("corigin");
			String category = rs.getString("category");
			
			CateBean cb = new CateBean();
			cb.setCnum(cnum);
			cb.setCorigin(corigin);
			cb.setCategory(category);
			
			list.add(cb);
		}
	} catch (SQLException e) {
		e.printStackTrace();
	}finally {
		try {
			if (ps != null)
				ps.close();
			if (rs != null)
				rs.close();
		} catch (SQLException e) {
		}
	}
	return list;
	}//getAllCates
	
	public int deleteCates(String cnum) {
		System.out.println(cnum);
		int cnt = -1;
	String sql = "delete from categoria where cnum=?";
	try {
		ps = conn.prepareStatement(sql);
		ps.setString(1,cnum);
		
		cnt = ps.executeUpdate();
	} catch (SQLException e) {
		e.printStackTrace();
	}finally {
		try {
			if (ps != null)
				ps.close();
		} catch (SQLException e) {
		}
	}
		return cnt;
	}//deleteCates
}
