<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<style>
.{
   font-family: 'Poppins', sans-serif;
}
.menu_wrap {
    font-family: 'Poppins', sans-serif;
    width: 100%;
    height: 40px;
    background-color: #494949;;
    text-align: right;
    font-size: 28px;
}

.menu_wrap a {
    text-decoration: none;
    color: beige;
    font-weight: bold;
    font-size: 22px;
    padding-inline: 45px;

}

.menu_wrap>ul>li {
    list-style: none;
    display: inline-block;
}

.dep1 {
    margin-top: -15px;

}

.menu_wrap a:hover {
    color: white;
}

.menu_wrap .dep1 > li {
    vertical-align: top;
}

.menu_wrap .dep1 > li:hover > .dep2 {
   display:block;
}

.menu_wrap .dep2 {
    display: none;
    list-style: none;
/*     background-color: #494949; */
    opacity: 0.7;
}

.menu_wrap .dep2 > li {
    text-align: center;
}

.menu_wrap .dep2 > li > a {
  padding-left: 40px;
  font: 10px;
}

#topHeader-index {
    color: white;
    font-family: 'Poppins', sans-serif;
    text-align: left;
    background-color: #494949;
    width: 100%;
    height: 70px;
    margin-top: 0px;
    padding-top: 15px;
    padding-bottom: 15px;
    padding-left: 5px;
    font-weight: bold;
    font-size: xx-large;
}

#topHeader-index > a {
text-decoration: none; 
 color: white;
}
</style>


<%
	String conPath = request.getContextPath();
%>

    <header id="topHeader-index">
        <a href="<%=conPath %>/myshop/admin/main.jsp">Latin Mall [Admin]</a>
  <nav class="menu_wrap">
        <ul class="dep1">
            <li>
                <a href="<%=conPath %>/myshop/admin/cate_list.jsp">Category</a>
                <ul class="dep2">
                    <li><a href="<%=conPath %>/myshop/admin/cate_input.jsp">Register</a></li>
                </ul>
            </li>

            <li>
                <a href="">Products</a>
            <ul class="dep2">
                <li><a href="">Register</a></li>
            </ul>
         </li>

         <li>
            <a href="">Sales History</a>
         </li>

         <li>
            <a href="findTutors.html">Shopping Mall</a>
         </li>

        </ul>
    </nav>
 
    </header>
    