<%@page import="org.apache.commons.collections.bag.SynchronizedSortedBag"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/style.css">
<style>

#topHeader-index{
	text-align: center;
}

a {
text-decoration: none;
color: black;
}

#cart {
width: 80px;
height: 70px;
float: right;
margin-right: 30px;
}


nav {  
padding-top: 10px;
padding-bottom: 10px;
text-align: center;
font-size: 18px;
background-color: beige;


}

nav >a {
    /* a tag for Login and Sign-in  */
    text-decoration: none;
    letter-spacing: 3px;
    padding-right: 150px;
    text-align: center;
    display:inline-flex;
}

span {
color: blue;
padding-right: 20px;
}

</style>
<%
	String conPath = request.getContextPath();
	System.out.println(conPath);
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
        <a href="<%=conPath %>/LatinShop/user/main.jsp">Latin Mall</a>
        <a href="<%=conPath %>/LatinShop/user/cartList.jsp">
        	<img id="cart" src="../../images/cart.jpg" width="50" height="50">
        </a>
    </header>
    
    <% 
	//System.out.println("conPath" + conPath);
	String[] porigin1 = {"Mexico", "Peru", "Chile", "Brazil", "Others"};
%>


<nav>
	<a href="<%=conPath %>/LatinShop/user/by_origin.jsp?porigin1=<%=porigin1[0] %>">
		Mexico</a>
		<a href="<%=conPath %>/LatinShop/user/by_origin.jsp?porigin1=<%=porigin1[1] %>">
		Peru </a>
		<a href="<%=conPath %>/LatinShop/user/by_origin.jsp?porigin1=<%=porigin1[2] %>">
		Chile </a>
		<a href="<%=conPath %>/LatinShop/user/by_origin.jsp?porigin1=<%=porigin1[3] %>">
		Brazil </a>
		<a href="<%=conPath %>/LatinShop/user/by_origin.jsp?porigin1=<%=porigin1[4] %>">
		Others </a>
</nav>


	
