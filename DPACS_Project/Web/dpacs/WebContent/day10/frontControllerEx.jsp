<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!--  삽입 -->
	<a href="insert.do">insert</a>
	<hr />
	
	<!-- 업로드 -->
	<a href="http://localhost:8080<%=request.getContextPath()%>/update.do">update</a>
	<hr />
	
	<!--  선택 -->
	<a href="http://localhost:8080/mywebInfo/select.do">select</a>
	<hr />
	
	<!-- 삭제 -->
	<a href="<%=request.getContextPath()%>/delete.do">delete</a>

</body>
</html>