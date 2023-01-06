<%@page import="org.apache.commons.collections.bag.SynchronizedSortedBag"%>
<%@page import="java.util.ArrayList"%>
<%@page import="LatinMall.ProductoDao"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="LatinMall.ProductoBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 01_top.jsp 카테고리 클릭 => 02_by_cate.jsp -->
<style>
p {
font-size: 20px;
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
<%@ include file="header.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	//String[] pcategory = {"농산품", "수산품", "곡물", "커피", "술", "기타"};
	//01_top에 있음
	//String[] pcategory = request.getParameterValues("pcategory");
	
	String pcategory1 = request.getParameter("pcategory");
	System.out.println("pcategory1:" + pcategory1);

	DecimalFormat df = new DecimalFormat("#,###");
	ProductoDao pdao = ProductoDao.getInstance();
	ArrayList<ProductoBean> list = pdao.selectByCategory(pcategory1);
	System.out.println("list:" + list);
	System.out.println("list.size():" + list.size());
	    
%>
<%
	if(list.size()==0) {
		out.print("<b>Not ready yet.</b><br>");
	}
%>	
<body>
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
	
<%-- <h2><%=pcategory1 %></h2> --%>
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
		 	<td align="center" style="padding: 50px">
		 	<a href="prodView.jsp?pnum=<%=pnum%>">
		 	<img src="<%= imgPath %>" width=180 height=180 style="border: 1px solid beige">
		 	</a>
		 	<br>
		 	<p>
		 	<%=pname %><br>
		 	$<%=df.format(price) %><br>
		 	<font color="blue"><%=porigin %></font><br>
		 	</p>
		 	</td>
		 <%
		 	if(count%5==0) {
		 		out.print("</tr><tr>");
		 	}//if
			}//for
		%>
	
		</tr>
	</table>
</div>
</div>
</body>

<%@ include file="footer.jsp" %>