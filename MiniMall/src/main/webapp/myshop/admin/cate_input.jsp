<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<style>
form {
	text-align: center;
	width: 500px;
	margin-top: 80px;
	margin-bottom: 250px;
	margin-left: auto;
	margin-right: auto;
	position: relative;
}

.bbox {
	border: 1px dotted black;
	background-color: #C9E4C5;
	height: 100px;
	width: 100%;
	align: "center"
}

.box {
	border: 1px dotted black;
	padding-top: 30px;
	padding-right: 50px;
	padding-bottom: 50px;
	padding-left: 50px;
	margin-bottom: 150px;
	font-size: 20px;
}
</style>

<%@ include file="header.jsp"%>

<%
String[] category = { "select", "agricultural", "fishery", "grains", "coffee", "liquor", "etc" };
%>
<br>
<br>
<form method="post" action="cate_input_proc.jsp">
	<div class="bbox">
		<h2>Origin & Category</h2>
		<br>
		<br>

		<div class="box">
			Origin: <select name="corigin">
				<option value="Select">Select</option>
				<option value="Mexico">Mexico</option>
				<option value="Peru">Peru</option>
				<option value="Chile">Chile</option>
				<option value="Brazil">Brazil</option>
				<option value="Others">Others</option>
			</select> <br>
			<br> Category: <select name="category">
				<%
				for (int i = 0; i < category.length; i++) {
				%>
				<option value="<%=category[i]%>"><%=category[i]%></option>

				<%
				}
				%>
			</select> <br>
			<br> <input type="submit" value="Register">
		</div>
	</div>
	<br>
	<br>

</form>

<%@ include file="footer.jsp"%>