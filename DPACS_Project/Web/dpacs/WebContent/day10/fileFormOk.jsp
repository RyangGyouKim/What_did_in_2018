<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="javax.servlet.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//절대경로
	String path = request.getRealPath("fileUpload");//파일이 저장되는 경로
	
	//상대 경로저장
	//String path = request.getSession().getServletContext().getRealPath("fileUpload");
	/*
	* 이 부분은 상대 경로로 저장하려고 했으나 상대 경로로 저장이 안되고, 절대 경로로 저장이 된다.
	* getContextPath()를 사용하면 Servlet2.5 이상부터 사용이 가능하다고 하는데, 이 부분은 어떻게 해결해야될지 감이 안잡힘.
	*/
	
	
	
	
	int size = 1024 * 1024 * 10; // 업로드 파일 용량: 10M
	String file = ""; //업로드 파일 이름(오리지널 파일이름이 있으면, 자동으로 1,2,3이 붙여진다.)
	String oriFile = ""; // 이전 업로드 파일 이름
	
	//상대경로
	//String file ="";	// 상대경로 업로드파일
	//String oriFile ="";	//
	try{
		// 정보를 갖고 있는 request객체, 서버쪽 경로, 업로드 용량, 파일이름깨지지않게,오리지널파일이름뒤에 1,2,3 붙이게하는 메소드)
		MultipartRequest multi = new MultipartRequest(request, path, size, "UTF-8", new DefaultFileRenamePolicy());
		//MultipartRequest multi = new MultipartRequest(request, path, size, "UTF-8", new DefaultFileRenamePolicy());
		
		Enumeration files = multi.getFileNames();
		String str = (String)files.nextElement();
		
		file = multi.getFilesystemName(str);// 실제 파일 이름
		oriFile = multi.getOriginalFileName(str); // 이전 파일 이름
		
		
		/* -- 상대 경로용 
		Enumeration files = multi.getFileNames();
		String str = (String)files.nextElement();
		
		
		file = multi.getFilesystemName(str);
		oriFile = multi.getOriginalFileName(str);
		
		*/
		
		
		
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>파일 업로드 결과</title>
</head>
<body>
<div align="center">
 	<%
 		if(file == null){
 			out.println("파일이 업로드 되지 않았습니다.");
 		} else{
 			out.print(file+"파일이 저장되었습니다");
 		}
 	%>
</div>

</body>
</html>