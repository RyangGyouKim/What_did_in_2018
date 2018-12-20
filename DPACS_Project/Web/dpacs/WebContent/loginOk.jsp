<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>

<% request.setCharacterEncoding("UTF-8"); %>

<%@ page import="user.UserDao" %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty property="id" name="user"/>
<jsp:setProperty property="pw" name="user"/>




<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>title</title>
	<link rel="shortcut icon" href="/images/favicon.ico" type="image/x-icon">
	<link rel="icon" href="images/favicon.ico" type="image/x-icon">
	

</head>
<body>

<%
	UserDao userDao = new UserDao();
	int result = userDao.login(user.getId(), user.getPw());
	if(result ==1 ){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href='/board.jsp'");
		script.println("</script>");
	}else if(result == 0 ){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호 틀림')");
		script.println("history.back(-1)");
		script.println("</script>");
	} else if(result == -1 ){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('가입하세요')");
		script.println("history.back(-1)");
		script.println("</script>");
	}else if(result == -2 ){
		PrintWriter script = response.getWriter();
 		script.println("<script>");
		script.println("alert('db error')");
		script.println("history.back(-1)");
		script.println("</script>");
	}
%>


</body>
</html>