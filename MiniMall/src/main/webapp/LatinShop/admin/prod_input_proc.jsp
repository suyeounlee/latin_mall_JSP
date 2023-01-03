<%@page import="LatinMall.ProductoDao"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String uploadDir = config.getServletContext().getRealPath("/images");
	System.out.println("uploadDir:" + uploadDir);
	
	String encType = "UTF-8";
	int maxSize = 1024 * 1024 * 5;
	
	MultipartRequest mr = new MultipartRequest(request, uploadDir, maxSize, encType, new DefaultFileRenamePolicy());
	
	String pcategory = mr.getParameter("pcategory");
	String porigin = mr.getParameter("porigin");
	String pname = mr.getParameter("pname");
	System.out.println(pcategory + "+" + porigin + "+" + pname);
	String pimage = mr.getFilesystemName("pimage");
	System.out.println(pimage);
	
	
	ProductoDao pdao = ProductoDao.getInstance();
	int cnt = pdao.insertProducto(mr);
	String msg, url;
	if(cnt>0) {
		msg ="Insert Success";
		url="prod_list.jsp";
	}
	else {
		msg = "Insert Failure";
		url="prod_input.jsp";
	}
%>
<script>
	alert("<%=msg %>");
	location.href = "<%=url %>";
</script>


