<%@page import="org.apache.commons.collections.bag.SynchronizedSortedBag"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file=".././user/header.jsp"%>
 <% System.out.println(request.getContextPath()); %> <!-- /MiniMall -->
 
 
<style>

form{
text-align: center;
width: 800px;
border: 1px solid lightgray;
border-radius: 2px;
margin-top: 20px;
margin-bottom: 20px;
margin-left: auto;
margin-right: auto;
padding-bottom: 15px;
padding-top: 10px;
position:relative;
}

span {

}
#top {
	margin-top: 10px;
	font-size: 30px;
}
#middle {
	font-size:18px;
}
#bottom {
	font-size: 20px;
}
a {
	text-decoration: none;
}
input[type="text"], input[type="password"]{
	border: 2px solid lightgray;
	position: relative;
		height: 40px;
	width: 200px;
}

#checkLabel{
font-weight: lighter;
}

input[type="submit"] {
font-size: 15px; font-weight: bold;
margin-bottom: 12px;
margin-top: 12px;
}

#email_check {
	position: absolute;
	margin-right : 20px;
	margin-left: 10px;
}
</style>

<link rel="stylesheet" href="<%=request.getContextPath()%>/style.css" />
<!--  <script type="text/javascript" src="../../script.js"></script> relative path-->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script> 
<script type="text/javascript" src="<%=request.getContextPath() %>/script.js"></script> 

<form name="myform" method="post" action="register.proc.jsp">
		<div class="form-group">
		<div id="top" align="center">Sign up</div>
		<br>

		<div id="middle" align="center">
			<input type="text" class="form-control-sm" name="name" placeholder="Enter your name"> <br>	<br>
			<input type="text" class="form-control-sm" name="email" placeholder="Enter your email"> 
			<input class="btn btn-secondary" type="button" id="email_check" value="Email check" onClick="duplicate()">
			<br>
			<div id="emailmessage"></div><br>
			<input type="text" class="form-control-sm" name="phone" placeholder="Enter your phone number"> <br>	<br>
			<input type="password" class="form-control-sm" name="password" placeholder="Enter your password" onBlur="return pwcheck()"> <br> <br> 
			<input type="password" class="form-control-sm" name="repassword" placeholder="Confirm a password" onkeyup="return repwcheck()"> 
			<br>
			<div id="pwmessage"></div> <br>
			<input type="checkbox" class="form-check-input"> 
			<label class="form-check-label" id="checkLabel">I accept all terms  &amp; conditions.</label><br><br>
			<input class="btn btn-primary" type="submit" onClick="return writeSave()" value="Sign up">
			<br>
		</div>
		
		<br>
		
		<div id="bottom" align="center">
			Already have an account? <a href="./login.jsp"> Login now </a> 
		</div>
		
	</div>

</form>
<%@ include file=".././user/footer.jsp"%>