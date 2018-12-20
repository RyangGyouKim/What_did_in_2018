<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
   String servletPath = request.getServletPath();
   String ImgDirRealPath =  request.getSession().getServletContext().getRealPath(servletPath.substring(0,servletPath.lastIndexOf("/")+1)+"imgUp");
  
   System.out.println(ImgDirRealPath);

   File ImgDirObj = new File(ImgDirRealPath);
   //현재 jsp파일이 있는 폴더의 images폴더의 이미지 목록 가져오기
   List<File> imgFileList = Util.getImgFileList(ImgDirObj);
 
%>
<div class="momTop">
	<div class="showImage_top">
		DPACS(Disabled parking area control system)<br><br>
		<div>
			<a href="/">Home</a>
			<a href="showImg.jsp">Ajax 방식</a>
			<a href="showImg2.jsp">Refresh 방식</a>
		</div>
	</div>
</div>