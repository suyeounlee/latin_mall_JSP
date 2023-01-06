<%@page import="org.apache.commons.collections.bag.SynchronizedSortedBag"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="LatinMall.ProductoBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="LatinMall.ProductoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<style>
td {
	text-align: center;
}

a {
	text-decoration: none;
	color: black;
}

table {
	margin: auto;
	padding: auto;
	padding-bottom: 15px;

}


</style>

<script>
	function del(pnum, pimage) {
		//alert(pnum+ "," + pimage);
		var answer = window.confirm("Do you really want to delete this item?");
		//alert(answer); // true/false
			if(answer) { 
			location.href="prod_delete.jsp?pnum="+pnum+"&pimage="+pimage;
		}
		
	}
</script>

<%
ProductoDao pdao = ProductoDao.getInstance();
ArrayList<ProductoBean> list = pdao.getAllProducto();
System.out.println("list.size():" + list.size());

DecimalFormat df = new DecimalFormat("#,###");
%>

<table border="0" width="80%">
	<caption>
		<h2>Products List</h2>
	</caption>
	<tr bgcolor="#C9E4C5">
		<th>Num</th>
		<th>Name</th>
		<th>Category</th>
		<th>Origin</th>
		<th>Price</th>
		<th>Qty</th>
		<th>Exp.Date</th>
		<th>Image</th>
		<th>Update | Delete</th>
	</tr>
	<%
	if (list.size() == 0) {
		out.println("<tr><td colspan='9' align='center'>Not registered yet</td></tr>");
	}
	for (ProductoBean pb : list) { //list i(type: ProductBean)
	%>
	<tr>
		<td><%=pb.getPnum()%></td>
		<td><%=pb.getPname()%></td>
		<td><%=pb.getPcategory()%></td>
		<td><%=pb.getPorigin()%></td>
		<td>$<%=df.format(pb.getPrice())%></td>
		<td><%=df.format(pb.getPqty())%></td>
		<td><%=pb.getPdate()%></td>
		<%
		String imgPath = request.getContextPath() + "/images/" + pb.getPimage();
		System.out.println("contextPath:" + request.getContextPath());
		System.out.println("imgPath:" + imgPath);
		%>
		<td><a href="prod_view.jsp?pnum=<%=pb.getPnum()%>"> 
		<img src="<%=imgPath%>" width="50" height="50">
		</a></td>

		<td><a href="prod_update.jsp?pnum=<%=pb.getPnum()%>">Update |
		</a> <a
			href="javascript:del('<%=pb.getPnum() %>', '<%=pb.getPimage() %>')">Delete</a>
		</td>
	</tr>
	<%
	} //for
	%>
</table>
<%@ include file="footer.jsp"%>