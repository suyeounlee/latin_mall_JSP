<%@page import="java.text.DecimalFormat"%>
<%@page import="LatinMall.ProductoBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="LatinMall.ProductoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 02_by_origen.jsp -->

<%@ include file="header.jsp"%>
<%
request.setCharacterEncoding("UTF-8");

String porigin2 = request.getParameter("porigin1");
System.out.println("porigin2:" + porigin2);

DecimalFormat df = new DecimalFormat("#,###");
ProductoDao pdao = ProductoDao.getInstance();
ArrayList<ProductoBean> list = pdao.selectByOrigin(porigin2);
System.out.println("list:" + list);
System.out.println("list.size():" + list.size());
%>

<%
if (list.size() == 0) {
	out.print("<b>Not ready yet.</b><br>");
}
%>
<style>
img {
	margin: auto;
}

p {
	font-size: 20px;
}

table {
/* 	padding-top: 0.2rem; */
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


</style>
<body>

	<%-- <h2><%=porigin2 %></h2> --%>

	<div id="page-container">
		<div id="content-wrap">
			<table border="0" class="fistTable" width=100%>
				<tr>
					<td class="category" rowspan="5" align="center" width="100px"
						bgcolor="beige">

						<table class="secondTable">
							<%
							String[] pcategory = { "agricultural", "fishery", "grains", "coffee", "liquor", "etc" };
							for (int i = 0; i < pcategory.length; i++) {
							%>
							<tr>
								<td><a
									href="<%=conPath%>/LatinShop/user/by_cate.jsp?pcategory=<%=pcategory[i]%>"><%=pcategory[i]%>
								</a></td>
							</tr>
							<%
							} //for
							%>
						</table>
						</td>
					<td>
						<%
						int count = 0;
						for (ProductoBean pb : list) {
							count++;
							int pnum = pb.getPnum();
							String pname = pb.getPname();
							int price = pb.getPrice();
							String porigin = pb.getPorigin();
							String pimage = pb.getPimage();
							String imgPath = request.getContextPath() + "/images/" + pimage;
						%>
				
					<td align="center" style="padding: 50px"><a
						href="prodView.jsp?pnum=<%=pnum%>"> <img src="<%=imgPath%>"
							width=180 height=180 style="border: 1px solid beige">
					</a>
						<p>
							<%=pname%><br> $<%=df.format(price)%><br>
						</p>
						</td>
					<%
					if (count % 5 == 0) {
						out.print("</tr><tr>");
					} //if
					} //for
					%>
		
				</tr>	
				
			</table>
		
		</div>
	</div>
</body>

<%@ include file="footer.jsp"%>