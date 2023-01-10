<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/style.css">
<style>
span {
color: blue;
padding-right: 20px;
}
a {
text-decoration: none;
color: black;
}
</style>
<%
	String conPath = request.getContextPath();
%>
<%
	//id session 설정: loginProc.jsp
	String uemail = (String)session.getAttribute("uemail"); // loginProc에서 세션 설정한거 가져오는것
	String uname = (String)session.getAttribute("uname");
%>	
	<section>
	<span>Hello ★<%=uname %>★</span>
			<a href="<%=conPath %>/LatinShop/member/login.jsp"> Login | </a>
			<a href="<%=conPath %>/LatinShop/member/register.jsp"> Sign up | </a>
			<a href="<%=conPath %>/LatinShop/member/logout.jsp"> Logout </a>
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
            <a href="orderList.jsp">Sales History</a>
         </li>

         <li>
            <a href="<%=conPath %>/LatinShop/user/main.jsp">Shopping Mall</a>
         </li>

        </ul>
    </nav>
 
    </header>
    