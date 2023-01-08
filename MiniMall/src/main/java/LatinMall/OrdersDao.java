package LatinMall;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


public class OrdersDao {
	public static OrdersDao instance;
	
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	private OrdersDao() {
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
	} //»ý¼ºÀÚ
	
	public static OrdersDao getInstance() {
		if(instance == null) {
			instance = new OrdersDao();
		}
		return instance;
	}
	
	public int insertOrders(ArrayList<ProductoBean> clist, int unum) {
		int cnt = -1;
		String sql = "insert into topay(orderId, memno, pnum, qty, amount) values(pay_seq.nextval, ?,?,?,?)";
		
		try {
			for(int i=0; i<clist.size(); i++) {
				ps = conn.prepareStatement(sql);
				ps.setInt(1, unum);
				ps.setInt(2, clist.get(i).getPnum());
				ps.setInt(3, clist.get(i).getPqty());
				ps.setInt(4, clist.get(i).getTotalPrice());
				
				cnt += ps.executeUpdate();
			}
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
	}//insertOrders
	
	public Vector<OrdersBean> getOrderList(String porigin) {
		Vector<OrdersBean> list = new Vector<OrdersBean>();
		String sql = "select p.porigin, p.pname, p.price, t.qty, t.amount from producto p inner join topay t on p.pnum = t.pnum where porigin=?";
		OrdersBean ob;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, porigin);
			rs = ps.executeQuery();
			while(rs.next()) {
				String pporigin = rs.getString("porigin");
				String pname = rs.getString("pname");
				int price = rs.getInt("price");
				int qty = rs.getInt("qty");
				int amount = rs.getInt("amount");
				ob= new OrdersBean();
				ob.setPorigin(rs.getString("porigin"));
				ob.setPname(rs.getString("pname"));
				ob.setPrice(rs.getInt("price"));
				ob.setAmount(rs.getInt("amount"));
				ob.setQty(rs.getInt("qty"));
				
				list.add(ob);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
				try {
					if(rs != null) 
					rs.close();
					if(ps != null) 
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}//finally
	
		return list;
	}//getOrderList
	




}
