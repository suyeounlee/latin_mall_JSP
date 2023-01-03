<%@page import="LatinMall.ProductoBean"%>
<%@page import="LatinMall.ProductoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- prod_list 이미지 클릭 => 05_prod_view.jsp 상세보기 -->
<style>
td {
	width: 500;
}

table {
	margin: auto;
	padding: auto;
}

#last {
	height: 50px;
	background-color: #C9E4C5;
}


</style>
<%
	String pnum = request.getParameter("pnum");
	//out.println("넘어오는 번호pnum:" + pnum + "<br>");
	
	ProductoDao pdao = ProductoDao.getInstance();
	ProductoBean pb = pdao.selectByPnum(pnum);
%>
<%@ include file="header.jsp"%>
<table border="1" width="50%">
	<caption>
		<h2>Product Details</h2>
	</caption>
	<tr>
		<td>Num: <%=pb.getPnum() %></td>

		<% 
	String imgPath = request.getContextPath()+"/images/" + pb.getPimage();
		System.out.println("imgPath" + imgPath);
	%>
		<td rowspan="8" width="300" align="center"><img
			src="<%=imgPath %>" style="width: 250px; height: 300px;"></td>

	</tr>
	<tr>
		<td>Category: <%=pb.getPcategory() %></td>
	</tr>
	<tr>
		<td>Origin: <%=pb.getPorigin() %></td>
	</tr>
	<tr>
		<td>Name: <%=pb.getPname() %></td>
	</tr>
	<tr>
		<td>Qty: <%=pb.getPqty() %></td>
	</tr>
	<tr>
		<td>Price: $<%=pb.getPrice() %></td>
	</tr>
	<tr>
		<td>Exp.Date: <%=pb.getPdate() %></td>
	</tr>
	<tr>
		<td>Detail: <br> <%=pb.getPcontents() %></td>
	</tr>
	<tr>
		<td id="last" colspan="2" align="center">
		<input type="button" class="button" value="List" onClick="history.go(-1)"></td>
	</tr>
</table>

<%@ include file="footer.jsp"%>