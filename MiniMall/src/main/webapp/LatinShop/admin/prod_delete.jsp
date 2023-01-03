<%@page import="java.io.File"%>
<%@page import="LatinMall.ProductoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<% 

	String pnum = request.getParameter("pnum");
	String pimage = request.getParameter("pimage");
	/* out.print("pnum" + pnum);
	out.print("pimage" + pimage); */
	
	ProductoDao pdao = ProductoDao.getInstance();
	int cnt = pdao.deleteProduct(pnum);
	
	String uploadDir = config.getServletContext().getRealPath("/images"); 
	File deleteDir = new File(uploadDir, pimage);
	//(삭제할 폴더 경로, 파일이름)을 가지고 File클래스의 객체를 만든다.
	//그러면 그 글자였던 파일이 진짜 파일로 존재하게끔 하는게 File클래스의 기능
	if(deleteDir.exists()) {
		deleteDir.delete(); //삭제하는 메서드
	}

	String msg, url;
	if(cnt>0) {
		msg = "Delete Success";
		url = "prod_list.jsp";
	}
	else { 
		msg = "Delete Failure";
		url = "prod_list.jsp";
	}
%>
<script>
	alert("<%=msg %>");
	location.href="<%=url %>";
</script>

