<%@page import="org.apache.commons.collections.bag.SynchronizedSortedBag"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
 myshop-member-register.jsp <br>
 <% System.out.println(request.getContextPath()); %> <!-- /MiniMall -->
 
 
<style>

form{
text-align: center;
width: 600px;
border: 1px solid lightgray;
border-radius: 2px;
margin-top: 130px;
margin-left: auto;
margin-right: auto;
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
input[type="text"] {
	border: 2px solid lightgray;
	position: relative;
}
#checkLabel{
font-weight: lighter;
}
input[type="submit"] {
font-size: 15px; font-weight: bold;
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
			<input class="btn btn-secondary" type="button" id="email_check" value="Email check" onClick="duplicate()"><br><br>
			<span id="emailmessage"></span>
			<input type="text" class="form-control-sm" name="phone" placeholder="Enter your phone number"> <br>	<br>
			<input type="text" class="form-control-sm" name="password" placeholder="Enter your password"> <br> <br> 
			<input type="text" class="form-control-sm" name="repassword" placeholder="Confirm a password"> <br> <br> 
			<input type="checkbox" class="form-check-input"> 
			<label class="form-check-label" id="checkLabel">I accept all terms  &amp; conditions.</label><br><br>
			<input class="btn btn-primary" type="submit" onClick="return writeSave()" value="Sign up">
			<br>
		</div>
		
		<br>
		
		<div id="bottom" align="center">
			Already have an account? <a href="./main.jsp"> Login now </a> 
		</div>
		
	</div>

</form>