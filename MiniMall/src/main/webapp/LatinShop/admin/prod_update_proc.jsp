<%@page import="java.io.File"%>
<%@page import="LatinMall.ProductoDao"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 05_prod_update_proc.jsp -->
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="pb" class="LatinMall.ProductoBean"></jsp:useBean>
<jsp:setProperty property="*" name="pb"/>

<% 
	String uploadDir = config.getServletContext().getRealPath("/images");

	int maxSize = 1024 * 1024 * 5;
	String encType = "UTF-8";
	System.out.println("uploadDir:" + uploadDir);
	
	MultipartRequest mr = new MultipartRequest(request, uploadDir, maxSize, encType, new DefaultFileRenamePolicy());
	
	String pnum = mr.getParameter("pnum");
	String pcategory = mr.getParameter("pcategory");
	String porigin = mr.getParameter("porigin");
	String pname = mr.getParameter("pname");
	String pimage = mr.getFilesystemName("pimage");
	String pimage2 = mr.getFilesystemName("pimage2");
	String pqty = mr.getParameter("pqty");
	String price = mr.getParameter("price");
	String pdate = mr.getParameter("pdate");
	String pcontents = mr.getParameter("pcontents");
	
	ProductoDao pdao = ProductoDao.getInstance();
	int cnt = pdao.updateProduct(mr);
	
	if(pimage != null) {
		if(pimage2 != null) {
			File dirDelete = new File(uploadDir, pimage2);
			if(dirDelete.exists()) {
				dirDelete.delete();
			}
		}
	}
	
	String msg, url;
	if(cnt>0) {
		msg="Update success";
		url = "prod_list.jsp";
	}
	else {
		msg="Update failure";
		url = "prod_update.jsp?pnum="+pnum;
	}
%>
<script>
	alert("<%=msg %>");
	location.href="<%=url %>";
</script>


