<%@page import="LatinMall.OrdersDao"%>
<%@page import="LatinMall.ProductoBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:useBean id="mallCart" class="LatinMall.CartBean" scope="session" />

<% 
	ArrayList<ProductoBean> clist = mallCart.getAllProducts();

	int uid = (int)session.getAttribute("uid"); //세션 설정한거 가져와라
	
	OrdersDao odao = OrdersDao.getInstance();
	int cnt = odao.insertOrders(clist,uid);
	
	String msg, url;  
	if(cnt>=0) {
		msg = "Your order will be delivered soon.";
		url = request.getContextPath()+"/LatinShop/user/main.jsp";
		//주문 완료하고 장바구니 비우기
		mallCart.removeAllProduct();
	
%>
<script>
	alert("<%=msg %>");
	location.href= "<%=url %>";
</script>

<%
} //실패했을 때 출력할게 없으면 if문 여기에서 닫는다 else가 있을 떄는 위에 msg=null을 붙여야함
%>
