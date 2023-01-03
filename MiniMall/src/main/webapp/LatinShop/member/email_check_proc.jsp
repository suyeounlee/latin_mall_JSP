<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	//request.setCharacterEncoding("UTF-8");
	String user_email = request.getParameter("user_email");
	//System.out.println("user_email:" + user_email + "<br>");
%>

<%
		LatinMall.MemberDAO mdao = LatinMall.MemberDAO.getInstance();
			boolean flag = 	mdao.search_email(user_email);
			
			if(flag == true) {
				out.write("NO"); // success(data)
			}
			else {
				out.write("YES");
			}
	%>
