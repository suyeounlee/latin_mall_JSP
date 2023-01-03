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

import com.oreilly.servlet.MultipartRequest;

public class ProductoDao {

	public static ProductoDao instance;
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	private ProductoDao() {
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
	
	public static ProductoDao getInstance() {
		if(instance==null) {
			instance = new ProductoDao();
		}
		return instance;
	}
	
	public int insertProducto(MultipartRequest mr) {
		System.out.println(mr.getParameter("pcategory"));
		System.out.println(mr.getParameter("pname"));
		
		int cnt = -1;
		
		String sql = "insert into producto values(pro_seq.nextval, ?,?,?,?,?,?,?,?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, mr.getParameter("pcategory"));
			ps.setString(2, mr.getParameter("porigin"));
			ps.setString(3, mr.getParameter("pname"));
			ps.setString(4, mr.getFilesystemName("pimage"));
			ps.setString(5, mr.getParameter("pqty"));
			ps.setString(6, mr.getParameter("price"));
			ps.setString(7, mr.getParameter("pdate"));
			ps.setString(8, mr.getParameter("pcontents"));
			
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
	}//insertProducto
	
	public ArrayList<ProductoBean> getAllProducto() {
		
		ArrayList<ProductoBean> list = new ArrayList<ProductoBean>();
		
		String sql = "select * from producto order by pnum";
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				ProductoBean pb = new ProductoBean();
				pb.setPnum(rs.getInt("pnum"));
				pb.setPcategory(rs.getString("pcategory"));
				pb.setPorigin(rs.getString("porigin"));
				pb.setPname(rs.getString("pname"));
				pb.setPimage(rs.getString("pimage"));
				pb.setPqty(rs.getInt("pqty"));
				pb.setPrice(rs.getInt("price"));
				pb.setPdate(rs.getString("pdate"));
				pb.setPcontents(rs.getString("pcontents"));
				
				list.add(pb);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if (ps != null)
					ps.close();
				if(rs != null)
					rs.close();
			} catch (SQLException e) {
				System.out.println("SQLException");
			}
		}//finally
		
		return list;
	}//getAllProducto
	
	public ProductoBean selectByPnum(String pnum) {
		ProductoBean pb = new ProductoBean();
		String sql = "select * from producto where pnum=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, pnum);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				pb.setPnum(rs.getInt("pnum"));
				pb.setPcategory(rs.getString("pcategory"));
				pb.setPorigin(rs.getString("porigin"));
				pb.setPname(rs.getString("pname"));
				pb.setPimage(rs.getString("pimage"));
				pb.setPqty(rs.getInt("pqty"));
				pb.setPrice(rs.getInt("price"));
				pb.setPdate(rs.getString("pdate"));
				pb.setPcontents(rs.getString("pcontents"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if (ps != null)
					ps.close();
				if(rs != null)
					rs.close();
			} catch (SQLException e) {
				System.out.println("SQLException");
			}
		}//finally
		return pb;
	}//selectByPnum
	
	public int updateProduct(MultipartRequest mr) {
		int cnt = -1;
		
	String sql = "update producto set pcategory=?, porigin=?, pname=?, pimage=?, pqty=?, price=?, pdate=?, pcontents=? where pnum=?";
	try {
		ps = conn.prepareStatement(sql);
		ps.setString(1, mr.getParameter("pcategory"));
		ps.setString(2, mr.getParameter("porigin"));
		ps.setString(3, mr.getParameter("pname"));
		String pimage2 = mr.getParameter("pimage2"); 
		String pimage = mr.getFilesystemName("pimage"); 
		if(pimage==null) {
			pimage = pimage2;
		}
		ps.setString(4, pimage);
		ps.setString(5, mr.getParameter("pqty"));
		ps.setString(6,mr.getParameter("price"));
		ps.setString(7, mr.getParameter("pdate"));
		ps.setString(8, mr.getParameter("pcontents"));
		ps.setString(9, mr.getParameter("pnum"));
		
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
	}//updateProduct
	
	public int deleteProduct(String pnum) {
		int cnt = -1;
	String sql = "delete from producto where pnum=?";
	try {
		ps = conn.prepareStatement(sql);
		ps.setString(1, pnum);
		
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
	}//deleteProduct

	public ArrayList<ProductoBean> selectByCategory(String pcategory1) {
		System.out.println("pcategory1�Դϴ�:" + pcategory1);
	
		ArrayList<ProductoBean> list = new ArrayList<ProductoBean>();
		
		String sql = "select * from producto where pcategory=? order by pnum desc";

		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, pcategory1);
			rs = ps.executeQuery();
			while(rs.next()) {
				ProductoBean pb = new ProductoBean();
				pb.setPnum(rs.getInt("pnum"));
				pb.setPcategory(rs.getString("pcategory"));
				pb.setPorigin(rs.getString("porigin"));
				pb.setPname(rs.getString("pname"));
				pb.setPimage(rs.getString("pimage"));
				pb.setPqty(rs.getInt("pqty"));
				pb.setPrice(rs.getInt("price"));
				pb.setPdate(rs.getString("pdate"));
				pb.setPcontents(rs.getString("pcontents"));
				list.add(pb);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null) {
					rs.close();
				}
				if(ps!=null) {
					ps.close();
				}
			}catch(SQLException e) {
			}
		}//finally 
		return list;
	}//selectByCategory
	
	public ArrayList<ProductoBean> selectByOrigin(String porigin2) {
		System.out.println("porigin2:" + porigin2);
		
		ArrayList<ProductoBean> list = new ArrayList<ProductoBean>();
		String sql = "select * from producto where porigin=?";

		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, porigin2);
			rs = ps.executeQuery();
			while(rs.next()) {
				ProductoBean pb = new ProductoBean();
				pb.setPnum(rs.getInt("pnum"));
				pb.setPcategory(rs.getString("pcategory"));
				pb.setPorigin(rs.getString("porigin"));
				pb.setPname(rs.getString("pname"));
				pb.setPimage(rs.getString("pimage"));
				pb.setPqty(rs.getInt("pqty"));
				pb.setPrice(rs.getInt("price"));
				pb.setPdate(rs.getString("pdate"));
				pb.setPcontents(rs.getString("pcontents"));
			
				list.add(pb);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null) {
					rs.close();
				}
				if(ps!=null) {
					ps.close();
				}
			}catch(SQLException e) {
			}
		}//finally 
		return list;
	}//selectByOrigin


}
