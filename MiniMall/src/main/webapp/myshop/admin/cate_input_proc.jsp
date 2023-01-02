<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="LatinMall.CateDao"%>   


<% 
	request.setCharacterEncoding("UTF-8");
	String cnum = request.getParameter("cnum");
	String corigin = request.getParameter("corigin");
	String category = request.getParameter("category");
	
	System.out.println(cnum);
	System.out.println(corigin);
	System.out.println(category);
%>

<jsp:useBean id="cb" class="LatinMall.CateBean" />    
<jsp:setProperty property="*" name="cb" />

<% 
	CateDao cdao = CateDao.getInstance();
	int cnt = cdao.insertCate(cb);     
	
	String msg, url;
	if(cnt>0) {
		msg = "Register Success";
		url = "cate_list.jsp";
	}
	else {
		msg = "Register failure";
		url = "cate_input.jsp";
	}
%>

<script>
	alert("<%=msg %>");
	location.href="<%=url %>";
</script>
