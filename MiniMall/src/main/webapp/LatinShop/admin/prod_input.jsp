<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!-- C:\JSP_ShoppingMall\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\MiniMall\images -->
<style>
th {
	background-color: #C9E4C5;
}
table {
margin: auto;
padding: auto;
border: 1px solid black;
width:500px;
height: 430px;

}
</style>

<% 
	String[] pcategory = { "select", "agricultural", "fishery", "grains", "coffee", "liquor", "etc" };
	String[] porigin = {"select", "Mexico", "Peru", "Chile", "Brazil", "Others"};
%>

<form action="prod_input_proc.jsp" method="post" enctype="multipart/form-data">
	<table>
		<caption> <h2>Sales Product register</h2>
		</caption>
		<tr>
			<th>Category</th>
			<td><select name="pcategory">
					<%
				for(int i=0; i<pcategory.length; i++) {
			%>
					<option value="<%=pcategory[i] %>">
						<%=pcategory[i] %>
					</option>
					<%
				}//for
			%>
			</select></td>
		</tr>
		<tr>
			<th>Origin</th>
			<td><select name="porigin">
					<%
				for(int i=0; i<porigin.length; i++) {
			%>
					<option value="<%=porigin[i] %>">
						<%=porigin[i] %>
					</option>
					<%
				}//for
			%>
			</select></td>
		</tr>
		<tr>
			<th>Name</th>
			<td><input type="text" name="pname"></td>
		</tr>
		<tr>
			<th>Image</th>
			<td><input type="file" name="pimage"> <span></span></td>
		</tr>
		<tr>
			<th>Stock</th>
			<td><input type="text" name="pqty"></td>
		</tr>
		<tr>
			<th>Price</th>
			<td><input type="text" name="price"></td>
		</tr>
		<tr>
			<th>Exp.Date</th>
			<td><input type="date" name="pdate"></td>
		</tr>
		<tr>
			<th>Detail</th>
			<td><textarea name="pcontents" rows=2 cols=50
					style="resize: none;"></textarea></td>
		</tr>
		<tr>
			<td colspan="2" align="center"><input type="submit" class="button" value="Register">
			</td>
		</tr>
	</table>
</form>

<%@ include file="footer.jsp"%>