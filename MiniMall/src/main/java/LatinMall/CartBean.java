package LatinMall;

import java.util.ArrayList;

import LatinMall.ProductoBean;

public class CartBean {

	private ArrayList<ProductoBean> clist;
	
	public CartBean() {
		clist = new ArrayList<ProductoBean>();
	}
	
	public void addProduct(String pnum, String oqty) {
		
		ProductoDao pdao = ProductoDao.getInstance();
		ProductoBean pb = pdao.selectByPnum(pnum);
		
		int pnum_new = Integer.parseInt(pnum); 
		int oqty_new = Integer.parseInt(oqty); 
		
		for(int i=0; i<clist.size(); i++) {
			int cPnum = clist.get(i).getPnum(); 
			if(cPnum == pnum_new) {
				int cPqty = clist.get(i).getPqty();
				clist.get(i).setPqty(cPqty+ oqty_new);
				clist.get(i).setTotalPrice(clist.get(i).getPrice() * (cPqty + oqty_new));
				
				return; 
			}
		}//for
		
		
		pb.setPqty(oqty_new);
		int totalPrice = oqty_new * pb.getPrice(); 
		
		pb.setTotalPrice(totalPrice);
		clist.add(pb);
		
	}//addProduct
	
	public ArrayList<ProductoBean> getAllProducts() {
		
		return clist;
	}//getAllProducts
	
	public void setEdit(String pnum, String oqty) {
		int pnum_new = Integer.parseInt(pnum);
		int oqty_new = Integer.parseInt(oqty);
		
		for(ProductoBean pb : clist) {
			if(pb.getPnum() == pnum_new) {
				pb.setPqty(oqty_new);
				
				pb.setTotalPrice(pb.getPqty() * pb.getPrice());
			}
		}
	
	}//setEdit
	
	public void removeProduct(String pnum) { 
		int pnum_new = Integer.parseInt(pnum);
		for( ProductoBean pb : clist) { 
			if(pnum_new == pb.getPnum()) {
				//clist.removeElement(pb); 
				clist.remove(pb);
				//vector removeElement
				break; 
			}
		}
	} //removeProduct
	
	public void removeAllProduct() { 
		clist.remove(clist);
	}//removeAllProduct
	
}




