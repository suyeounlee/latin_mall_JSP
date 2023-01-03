<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
th {
	background-color: #C9E4C5;
}

table {
	margin: auto;
	padding: auto;
	border: 1px solid black;
	width: 500px;
	height: 460px;
}
</style>

<%
String[] pcategory = { "select", "agricultural", "fishery", "grains", "coffee", "liquor", "etc" };
String[] porigin = { "select", "Mexico", "Peru", "Chile", "Brazil", "Others" };
String pnum = request.getParameter("pnum");
LatinMall.ProductoDao pdao = LatinMall.ProductoDao.getInstance();
LatinMall.ProductoBean pb = pdao.selectByPnum(pnum);
%>

<%@ include file="header.jsp"%>
<form action="prod_update_proc.jsp" method="post"
	enctype="multipart/form-data">
	<table>
		<caption>
			<h2>Sales Product Update</h2>
		</caption>

		<tr>
			<th>num</th>
			<td><%=pb.getPnum()%></td>
			<input type="hidden" name="pnum" value="<%=pb.getPnum()%>">
		</tr>
		<tr>
			<th>Category</th>
			<td><select name="pcategory">
					<%
					for (int i = 0; i < pcategory.length; i++) {
					%>
					<option value="<%=pcategory[i]%>"
						<%if (pb.getPcategory().equals(pcategory[i])) {%> selected <%}%>>
						<%=pcategory[i]%></option>
					<%
					} //for
					%>
			</select></td>
		</tr>
		<tr>
			<th>Origin</th>
			<td><select name="porigin">
					<%
					for (int i = 0; i < porigin.length; i++) {
					%>
					<option value="<%=porigin[i]%>"
						<%if (pb.getPorigin().equals(porigin[i])) {%> selected <%}%>>
						<%=porigin[i]%></option>
					<%
					} //for
					%>
			</select></td>
		</tr>
		<tr>
			<th>Name</th>
			<td><input type="text" name="pname" value="<%=pb.getPname()%>"></td>
		</tr>
		<tr>
			<th>Image</th>
			<td>
				<%
				String imgPath = request.getContextPath() + "/LatinShop/images/" + pb.getPimage();
				%> <img src="<%=imgPath%>" width="80px" height="80px"> <br>
				<input type="file" name="pimage"><br> <input
				type="text" name="pimage2" value="<%=pb.getPimage()%>"> <span></span>
			</td>
		</tr>
		<tr>
			<th>Stock</th>
			<td><input type="text" name="pqty" value="<%=pb.getPqty()%>"></td>
		</tr>
		<tr>
			<th>Price</th>
			<td><input type="text" name="price" value="<%=pb.getPrice()%>"></td>
		</tr>
		<tr>
			<th>Exp.Date</th>
			<td><input type="date" name="pdate" value="<%=pb.getPdate()%>"></td>
		</tr>
		<tr>
			<th>Detail</th>
			<td><textarea name="pcontents" rows=2 cols=50
					style="resize: none;"><%=pb.getPcontents()%></textarea></td>
		</tr>
		<tr>
			<td colspan="2" align="center"><input type="submit"
				value="Update"></td>
		</tr>
	</table>
</form>
<%@ include file="footer.jsp"%>
