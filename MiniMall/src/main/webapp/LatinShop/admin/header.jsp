<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/style.css">

<%
	String conPath = request.getContextPath();
%>

	<section>
	Logout
	</section>
<br>
	
    <header id="topHeader-index">
        <a href="<%=conPath %>/LatinShop/admin/main.jsp">Latin Mall [Admin]</a>
  <nav class="menu_wrap">
        <ul class="dep1">
            <li>
                <a href="<%=conPath %>/LatinShop/admin/cate_list.jsp">Category</a>
                <ul class="dep2">
                    <li><a href="<%=conPath %>/LatinShop/admin/cate_input.jsp">Register</a></li>
                </ul>
            </li>

            <li>
                <a href="prod_list.jsp">Products</a>
            <ul class="dep2">
                <li><a href="prod_input.jsp">Register</a></li>
            </ul>
         </li>

         <li>
            <a href="">Sales History</a>
         </li>

         <li>
            <a href="<%=conPath %>/LatinShop/user/main.jsp">Shopping Mall</a>
         </li>

        </ul>
    </nav>
 
    </header>
    