<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
myshop-member-registerProc.jsp
<br>

<jsp:useBean id="mb" class="LatinMall.MemberDTO" />
<jsp:setProperty property="*" name="mb" />

<% 
 	LatinMall.MemberDAO mdao = LatinMall.MemberDAO.getInstance();
 	int cnt = mdao.insertMember(mb);
 	String msg, url = null;
 	
 	if(cnt > 0) {
 		msg = "Register Success";
 		url = "login.jsp";
 	} else {
 		msg="Register failure";
 		url = "register.jsp";
 	}
 	
 %>
 <script>
 alert("<%=msg%>");
 location.href="<%=url%>";
 </script>