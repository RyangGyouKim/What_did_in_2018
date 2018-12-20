<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="common.Util"%>
<%@ page import="java.util.Collections"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="java.io.File"%>
<%
   String servletPath = request.getServletPath();
   String ImgDirRealPath =  request.getSession().getServletContext().getRealPath(servletPath.substring(0,servletPath.lastIndexOf("/")+1)+"imgUp");
   System.out.println(ImgDirRealPath);
   File ImgDirObj = new File(ImgDirRealPath);
   List<File> imgFileList = Util.getImgFileList(ImgDirObj);
 
%>
