<%@page import="LatinMall.MemberDTO"%>
<%@page import="LatinMall.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
login_proc.jsp <br>

<% 
	request.setCharacterEncoding("UTF-8"); 
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	
	System.out.println("email:" + email);
	System.out.println("password:" + password);
	
	String contextPath = request.getContextPath(); //  /MiniMall
	
	LatinMall.MemberDAO mdao = LatinMall.MemberDAO.getInstance();
	LatinMall.MemberDTO dto = mdao.getmemberInfo(email, password);   
	   
 	String msg, viewPage;
 	if(dto == null) {
 		msg = "Userdata not found";
 		viewPage = contextPath + "/myshop/member/login.jsp";
 	}
 	else {
 		msg = "Welcome.";
 		String uemail = dto.getEmail();
 		int uid = dto.getId();
 		String uname = dto.getName();
 		
 		session.setAttribute("uemail", uemail);
 		session.setAttribute("uid", uid);
 		session.setAttribute("uname", uname);
 		
 		if(uemail.contains("admin")) {
 			viewPage = contextPath + "/myshop/admin/main.jsp";
 		}
 		else { //user
 			viewPage = contextPath + "/myshop/user/main.jsp";
 		}
 	}
%>

<script type="text/javascript">
	alert("<%=msg%>");
	location.href  = "<%=viewPage %>";
</script>
