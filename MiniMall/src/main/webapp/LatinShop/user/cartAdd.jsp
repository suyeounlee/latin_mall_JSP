<%@page import="LatinMall.ProductoBean"%>
<%@page import="LatinMall.ProductoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="mallCart" class="LatinMall.CartBean" scope="session"/>  

<% 
	request.setCharacterEncoding("UTF-8");
	String pnum = request.getParameter("pnum");
	String oqty = request.getParameter("oqty");
	
	ProductoDao pdao = ProductoDao.getInstance();
	ProductoBean pb = pdao.selectByPnum(pnum);
	   
	if(pb.getPqty() < Integer.parseInt(oqty)) {
%>
<script>
	alert("Qty excess");
	location.href="main.jsp";
</script>	
<%	
	return;
	}
	mallCart.addProduct(pnum,oqty); //장바구니에 담자마자
	response.sendRedirect("cartList.jsp");
	%>