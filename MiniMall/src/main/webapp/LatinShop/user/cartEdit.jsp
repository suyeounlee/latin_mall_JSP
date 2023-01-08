<%@page import="LatinMall.ProductoBean"%>
<%@page import="LatinMall.ProductoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="mallCart" class="LatinMall.CartBean" scope="session"/>

<% 
	String pnum = request.getParameter("pnum");
	String oqty = request.getParameter("oqty");
	System.out.println("수정할pnum:" + pnum);
	System.out.println("수정oqty:" + oqty);
	
	ProductoDao pdao = ProductoDao.getInstance();
	ProductoBean pb = pdao.selectByPnum(pnum);
	
	if(pb.getPqty() < Integer.parseInt(oqty)) { // 재고수량 < 주문수량
%>
	<script>
		alert("Qty is exceeded.");
		location.href="cartList.jsp";
	</script>
<%		
	return;
	}
	
	mallCart.setEdit(pnum,oqty);
%>
	<script>
		//alert("update success");
		location.href="cartList.jsp";
	</script>
