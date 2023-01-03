<%@page import="LatinMall.CateDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
04_cate_delete.jsp <br>

<% 
	String cnum = request.getParameter("cnum");
	System.out.println(cnum);

	CateDao cdao = CateDao.getInstance();
	int cnt = cdao.deleteCates(cnum);
	
	String msg, url;
	if(cnt>0) {
		msg = "Delete Success";
		url = "cate_list.jsp";
	}
	else {
		msg = "Delete failure";
		url = "cate_list.jsp";
	}
%>
<script>
	alert("<%=msg %>");
	location.href="<%=url %>";
</script>

