<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="LatinMall.CateDao"%>
<%@page import="LatinMall.CateBean"%>
<%@page import="java.util.ArrayList"%>
<%@ include file="header.jsp"%>

<style>

table {
	margin-top: 30px;
	margin-bottom: 100px;
	width: 800px;
	font-size: 20px;
}

td {
padding: 5px;
}

h2 {
	margin-top: 40px;
	text-align: center;
}
</style>

<%
CateDao cdao = CateDao.getInstance();
ArrayList<CateBean> list = cdao.getAllCates();
%>

<h2>Origin & Category List</h2>
<table border="1" width="600" align="center">
	<tr align="center" bgcolor="#C9E4C5">
		<th>Num</th>
		<th>Origin</th>
		<th>Category</th>
		<th>Delete</th>
	</tr>

	<%
	if (list.size() == 0) {
		out.println("<tr><td colspan=4 align=center>Nothing has been registered yet.</td></tr>");
	}
	for (int i = 0; i < list.size(); i++) {
		CateBean cb = list.get(i);
	%>
	<tr align="center">
		<td><%=cb.getCnum()%></td>
		<td><%=cb.getCorigin()%></td>
		<td><%=cb.getCategory()%></td>
		<td><a href="cate_delete.jsp?cnum=<%=cb.getCnum()%>">Delete</a></td>
	</tr>
	<%
	} //for
	%>
</table>

<%@ include file="footer.jsp"%>