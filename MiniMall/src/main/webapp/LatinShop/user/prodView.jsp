<%@page import="java.text.DecimalFormat"%>
<%@page import="LatinMall.ProductoDao"%>
<%@page import="LatinMall.ProductoBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
table td {
	font-size: 20px;
	height: 60px;
}

table {
	margin-top: 20px;
}

.button {
	background-color: white;
	color: black;
	border: 2px solid #4CAF50; /* Green */
	border-radius: 4px;
	font-size: 17px;
	font-weight: bold;
	padding: 8px 16px;
	display: inline-block;
	justify-content: center;
	align-items: center;
	margin-bottom: 50px;
}

.button:hover {
	background-color: #4CAF50; /* Green */
	color: white;
}
</style>
<script>
	function goCart(pnum) {
		//alert(pnum); //클릭한 상품의 번호 
		oqty = document.myform.oqty.value;
		//alert(oqty); //내가 입력한 수량 
		if(oqty<1) {
			alert("Please select at least 1 item.");
			return;
		}
		location.href="cartAdd.jsp?pnum="+pnum+"&oqty="+oqty;
	}//goCart

	function goOrder(pnum) {
		//alert(pnum);
		pnum = document.myform.pnum.value;
		oqty = document.myform.oqty.value;
		document.myform.action ="toOrder.jsp?pnum="+pnum+"&qoqty="+oqty;
		document.myform.submit();
	}
</script>

<%@ include file="header.jsp"%>
<%
String pnum = request.getParameter("pnum");
System.out.println("pnum:" + pnum);
ProductoDao pdao = ProductoDao.getInstance();
ProductoBean pb = pdao.selectByPnum(pnum);
DecimalFormat df = new DecimalFormat("#,###");

String imgPath = request.getContextPath() + "/images/" + pb.getPimage();
%>
<body>
	<div id="page-container">
		<div id="content-wrap">

			<table border="0" align="center">
				<caption>
					<h2><%=pb.getPname()%></h2>
				</caption>
				<tr>
					<td><img src="<%=imgPath%>" width="300" height="300"
						style="border: 1px solid beige"></td>
					<td style="padding-left: 30px;">
						<form name="myform">
							<input type="hidden" name="pnum" value="<%=pb.getPnum()%>">
							<table>
								<tr>
									<td>Name: <%=pb.getPname()%></td>
								</tr>
								<tr>
									<td>Origin: <%=pb.getPorigin()%></td>
								</tr>
								<tr>
									<td>Price: $<%=df.format(pb.getPrice())%></td>
								</tr>
								<tr>
									<td>Qty: <input type="text" name="oqty" value="1" size="3"></td>
								</tr>
							</table>
							
							<input type="button" class="button" value="Add to Cart"
								style="padding: 5px 15px;" onClick="goCart(<%=pnum%>)">
								<input type="button" class="button" value="checkout"
								style="padding: 5px 15px;" onClick="goOrder(<%=pnum%>)">
						</form>
					</td>
				</tr>
				<tr>
					<td style="padding-top: 20px;"><font color="blue">Detail
							of product: </font> <br> <%=pb.getPcontents()%> <br>
					<br> <%
 if (pb.getPdate() == null) {
 	out.println("");
 } else {
 	out.println("Expiration date is: " + pb.getPdate());
 }
 %></td>
				</tr>
			</table>

		</div>
	</div>
</body>
<%@ include file="footer.jsp"%>
