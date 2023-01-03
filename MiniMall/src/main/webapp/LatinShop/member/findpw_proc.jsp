<%@page import="LatinMall.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- findpw_proc.jsp -->

<% 
	request.setCharacterEncoding("UTF-8");
	
	String email = request.getParameter("email");
	String name = request.getParameter("name");
	
	
	LatinMall.MemberDAO mdao  = LatinMall.MemberDAO.getInstance();
	String password  = 	mdao.searchPw(email,name); 
	
	String msg; 
	if(password == null){
		msg = "Userdata not found.";
	}else{
		msg = "Your password is " + password;
	}
%>	
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="login.jsp";
</script>
