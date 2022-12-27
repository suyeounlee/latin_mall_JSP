<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
main.jsp
<br>

<style>

form{
text-align: center;
width: 500px;
border: 1px solid lightgray;
border-radius: 2px;
margin-top: 170px;
margin-left: auto;
margin-right: auto;
background-color: ;	
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
}

</style>
<form name="myform" method="post" action="login_proc.jsp">

<div class="login-form">
	<div class="form-group">
		<div id="top" align="center">Login<br>
		</div>
		<br>

		<div id="middle" align="center">
			<input type="text" class="form-control-sm" placeholder="Enter email" name="email"> <br><br>
			<input type="text" class="form-control-sm" placeholder="Password" name="password"> <br> <br> 
			<input class="btn btn-primary" type="submit" value="Login" style="font-size: 15px; font-weight: bold;">
			<br>
		</div>
		<br>

		<div id="bottom" align="center">
			<a href="register.jsp">Create account </a> | <a href="findpw.jsp">forgot password?</a>
		</div>
	</div>
</div>

</form>