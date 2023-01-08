<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 04_toOrder.jsp -->

<jsp:useBean id="mallCart" class="LatinMall.CartBean" scope="session" />
<style>
table {
	border: 1;
	align: center;
	width: 90%;
	padding-top: 15px;
	margin:auto;
	padding: auto;
	margin-top: 20px;

}


table tr {
height: 40px;
text-align: center;
}
table tr:last-child {
height: 50px;

}
.button {
  background-color: white;
  color: black;
  border: 2px solid #4CAF50; /* Green */
  border-radius: 4px;
  font-size: 17px;
  font-weight:bold;
  padding: 8px 16px;
 display: inline-block;
 justify-content:center;
 align-items: center;
 margin-bottom: 50px;
	
}



.button:hover {
	background-color: #4CAF50; /* Green */
	color: white;
}


.btnContainer {
margin-left: 700px;
margin-right: 700px;
margin-top: 50px;



}
</style>
<% 
	String pnum = request.getParameter("pnum"); //상품번호
	String oqty = request.getParameter("oqty"); //수정할 주문수량
	//out.print("상품번호:" + pnum +"<br>");
	//out.print("주문수량:" + oqty +"<br>");
	
	if( !pnum.equals("0") && !oqty.equals("0")) {
		mallCart.addProduct(pnum,oqty);
		}
%>
<%@ include file="header.jsp"%>

<table>
	<tr style="background-color: #FAEBE0; ">
		<td align="center" colspan="6" style="padding-top: 15px;">
			<h3>My Cart</h3>
		</td>
	</tr>
	<tr>
		<th>Name</th>
		<th>Qty</th>
		<th>Price</th>
	</tr>

	<% 
 	DecimalFormat df = new DecimalFormat("#,###");
 	ArrayList<LatinMall.ProductoBean> list = mallCart.getAllProducts();
 	int totalPrice=0;
 	for(LatinMall.ProductoBean pb : list) {
 %>
	<tr>
		<td align="center"><%=pb.getPname() %></td>
		<td align="center"><%=pb.getPqty() %></td>
		<td align="center">$<%=df.format(pb.getTotalPrice()) %></td>
	</tr>
	<%
	totalPrice += pb.getTotalPrice();
 	}//for
%>
	<tr>
		<td colspan="3" align="center" style="background-color: #FAEBE0; font-size:25px;">
			<b>Total</b> : <font color="red">$<%=df.format(totalPrice) %></font><br>
		</td>
	</tr>
</table>

<div class="btnContainer">
<input type="button" class="button" value="proceed to checkout"
	onClick="location.href='toPay.jsp'">
</div>

<%@ include file="footer.jsp"%>