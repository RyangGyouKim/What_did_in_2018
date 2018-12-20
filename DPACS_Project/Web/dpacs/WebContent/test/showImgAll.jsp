<%-- <%@page import="java.util.Collections"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String servletPath = request.getServletPath();
    String ImgDirRealPath = request.getRealPath(servletPath.substring(0,servletPath.lastIndexOf("/")+1)+"images");​
    System.out.println(ImgDirRealPath);
    
    File ImgDirObj = new File(ImgDirRealPath);            
    //현재 jsp파일이 있는 폴더의 images폴더의 이미지 목록 가져오기
    List<File> imgFileList = Util.getImgFileList(ImgDirObj); 
    
%>
    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>이미지 목록</title>
<style>
 span.imgTitle {
     font-weight:bold;
     display:block;
     margin:15px;
 }
</style>
</head>
<body>

    
    <div class="image_list" id="image_list">
        
    <%
     String strImgConFormat1 = "<div class=\"images\">" 
                               + "<span class=\"imgTitle\">▒ %s ▒</span>"
                               + "<img width='200' src=\"%s\"/></div>";

        for(int i = 0; i<imgFileList.size();i++) {
            
            File f = imgFileList.get(i);                
            /* String title = Util.getFileNameNoExt(f.getName()); */
            //System.out.println(f.getName()+"/"+title);            
            String url = Util.getImgSrc(f);
            out.print(String.format(strImgConFormat1,/*  title, */  url ));
            
        }
    %>
        
        </div>   
    

            
</body>
</html> --%>