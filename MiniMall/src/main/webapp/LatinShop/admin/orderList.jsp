<%@page import="java.text.DecimalFormat"%>
<%@page import="org.apache.commons.collections.bag.SynchronizedSortedBag"%>
<%@page import="LatinMall.OrdersBean"%>
<%@page import="java.util.Vector"%>
<%@page import="LatinMall.OrdersDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
table {
margin-left: auto;
margin-right: auto;
margin-top: 20px;
margin-bottom: 20px;

}

input[type="text"] {
margin-top: 10px;
height: 40px;
}

table tr:nth-child(2), table tr:last-child {
height: 40px;
font-size: 20px;
}

</style>
<% 
	request.setCharacterEncoding("UTF-8");

	OrdersDao odao = OrdersDao.getInstance();
	Vector<OrdersBean> list = new Vector<OrdersBean>();
	String porigin = request.getParameter("porigin");
	System.out.println("porigin1:" + porigin);
	
	if(porigin != null) {
		list = odao.getOrderList(porigin);
		System.out.println(list.size());
	}
%>

<%@ include file="header.jsp"%>
	<td colspan="6" align="center" valign="top">


<table border="1" width="70%" style="margin-bottom: 50px;">
	<caption><h2>	Sales by Origin: (Search for Mexico, Peru, Chile, Brazil, Others)<br></h2></caption>
	<tr style="background-color:#C9E4C5">
		<td colspan="5" align="center">
		<form action="orderList.jsp" method="post">
		
			<input type="text" name="porigin" value="">
			<input type="submit" value="click" class="button">
		</form>	
		</td>
	</tr>
	<tr>
		<th>Origin</th>
		<th>Product</th>
		<th>Price</th>
		<th>Sales</th>
		<th>Total Sales</th>
	</tr>
	
	<%
		int totalAmount = 0;
		DecimalFormat df = new DecimalFormat("#,###");
		for(OrdersBean ob : list) {
	%>
		<tr>
			<td align="center"><%=ob.getPorigin() %></td>
			<td align="center"><%=ob.getPname() %></td>
			<td align="center">$<%=df.format(ob.getPrice()) %></td>
			<td align="center"><%=ob.getQty() %></td>
			<td align="center">$<%=df.format(ob.getAmount()) %></td>
		</tr>
	<% 
		totalAmount += ob.getAmount();
		}
	%>

	<tr style="background-color:#C1AC95">
		<td colspan=4 align="center"><strong>Total</strong></td>
		<td align="center"><strong>$<%=df.format(totalAmount)%></strong></td>
	</tr>
	
</table>


<%@ include file="footer.jsp" %>