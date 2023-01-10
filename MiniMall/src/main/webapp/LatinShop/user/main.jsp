<%@page import="java.text.DecimalFormat"%>
<%@page import="LatinMall.ProductoBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="LatinMall.ProductoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>


/* img {
	object-fit: auto;
	opacity: 0.8;
	width: 100%;
	height: 71.5%;
	margin-bottom: 1px;
	margin-top: 1px;
	}

 */
 table {
margin-top: 0.2rem;
width: 100%;
border: 0px solid black;
}

.secondTable {
width: 100px;
margin-left: 25px;
text-align: center;
font-size: 20px;
auto-fit: cover;
}

.secondTable td {
height: 100px;
}

.category {
padding-right: 30px;
}

.itemSection {
background-color: #fcfcf2;
vertical-align: top;
}
 
img {
opacity: 0.8;
}

</style>

<%@ include file="header.jsp"%>

<% 
	request.setCharacterEncoding("UTF-8");
	DecimalFormat df = new DecimalFormat("#,###");  
	ProductoDao pdao = ProductoDao.getInstance();
	ArrayList<ProductoBean> list = pdao.getAllProducto();
%>
<body>
<div id="page-container">
<div id="content-wrap">
	<img src="../../images/portada1.PNG" width="100%" >
	
	
	<table class="fistTable">
	<tr>
		<td class="category" rowspan="5" align="center" width="100px" bgcolor="beige">
			<table class="secondTable" >
			<% 
			String[] pcategory = {"agricultural", "fishery", "grains", "coffee", "liquor", "etc" };
			for(int i=0; i<pcategory.length; i++) {
			%>
				<tr>
					<td>
					<a href="<%=conPath %>/LatinShop/user/by_cate.jsp?pcategory=<%=pcategory[i]%>"><%=pcategory[i] %>
					</a>
					</td>
				</tr>
			<%	
			} //for
			%>
			</table>
		</td>
	<td class="itemSection">
	<table class="thirdTable" >
		<caption><h1>New Items arrived</h1></caption>
		<tr>
		<%
			int count = 0;
			for(ProductoBean pb : list) {
				count ++;
				int pnum = pb.getPnum();
				String pname = pb.getPname();
				int price = pb.getPrice();
				String porigin = pb.getPorigin();
				String pimage = pb.getPimage();
				String imgPath = request.getContextPath()+"/images/"+pimage;
		 %>		
		 	<td align="center" style="padding-bottom: 30px">
		 	<a href="prodView.jsp?pnum=<%=pb.getPnum() %>">
		 	<img src="<%= imgPath %>" width=100 height=100>
		 	</a>
		 	<br>
		 	<%=pname %><br>
		 	$<%=df.format(price) %><br>
		 	<%=porigin %><br>
		 	</td>
		 <%
		 	if(count%6==0) {
		 		out.print("</tr><tr>");
		 	}//if
			}//for
		%>
		</tr>
	</table>
	</td>
</table>
</div>
</div>
</body>
<%@ include file="footer.jsp" %>

