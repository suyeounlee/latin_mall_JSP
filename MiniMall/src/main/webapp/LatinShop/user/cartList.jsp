<%@page import="LatinMall.ProductoBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
	#firstrow, #secondrow {
	background-color: #FAEBE0;
	}
table {
 border:1px solid black; 
 width:70%; 
 align:center;
 margin: auto;
padding: auto;
margin-bottom: 50px;
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

table tr:last-child {
font-size: 30px;
text-align: center;
float: right;
padding: 30px;
}

.button:hover {
	background-color: #4CAF50; /* Green */
	color: white;
}


.btnContainer {
margin-left: 600px;
margin-right: 400px;
}

</style>

<jsp:useBean id="mallCart" class="LatinMall.CartBean" scope="session"/>
<%@ include file="header.jsp" %>

<% 
	DecimalFormat df = new DecimalFormat("#,###");
	ArrayList<ProductoBean> clist = mallCart.getAllProducts();
	
	int cartTotalPrice = 0;
%>


<table>
<caption><h2>Cart</h2></caption>
	
	<tr id="secondrow">
		<th align="center">Image</th>
		<th align="center">Name</th>
		<th align="center">Qty</th>
		<th align="center">Price</th>
		<th align="center">Delete</th>
	</tr>
	
	<tr>
	<% 
		if(clist.size()==0) {
    %>
    	<tr>
    	<td colspan="5" align="center">Please add items to cart.</td>
    	</tr>
    <%
		}
		else {
			for(ProductoBean pb : clist) {
				int pnum = pb.getPnum();
				String pname = pb.getPname();
				int price = pb.getPrice();
				int pqty = pb.getPqty();
				String pimage = pb.getPimage();
				String imgPath = request.getContextPath() + "/images/" + pimage;
		%>
		<tr>
			<td align="center"><img src="<%=imgPath %>" width="200" height="200"></td>
			<td align="center"><%=pname %></td>
			<td align="center">
			<form name="miform" method="post" action="cartEdit.jsp">
			<input type="text" name="oqty" size="1" value="<%=pqty %>">
			<input type="hidden" name="pnum" value="<%=pnum %>" >
			<input type="submit" value="Edit"><br><br>
			[$<%=df.format(price) %>]
			</form>
			</td>
	
			<td align="center">$<%=df.format(pb.getTotalPrice()) %></td>
			<td align="center"><a href="cartDel.jsp?pnum=<%=pnum %>">Delete</a></td>
		</tr>
		<% 	
			cartTotalPrice += pb.getTotalPrice();
			} //for
		%>

	<tr>
		<td>Total: $<%=df.format(cartTotalPrice) %> </td>
	</tr>
		<%
		}//else
	%>

	</table>
	<div class="btnContainer">
	<input type="button" class="button" value="Add more items" onClick="location.href='main.jsp'">
	<input type="button" class="button" value="Proceed to checkout" onClick="location.href='toOrder.jsp?pnum=0&oqty=0'">
	</div>

<%@ include file="footer.jsp" %>
