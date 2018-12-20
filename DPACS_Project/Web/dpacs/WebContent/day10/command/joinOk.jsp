<%@page import="java.sql.Timestamp"%>
<%@page import="my.ex.member.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="dto" class="my.ex.member.MemberDto"/> 
<jsp:setProperty name="dto" property="*" />
<%
		dto.setrDate(new Timestamp(System.currentTimeMillis()));
		MemberDao dao = MemberDao.getInstance();
		if(dao.confirmId(dto.getId()) == 1) {
%>
		<script language="javascript">
			alert("아이디가 이미 존재 합니다.");
			history.back();
		</script>
<%
		} else {
			int ri = dao.insertMember(dto);
			if(ri == 1) {
				session.setAttribute("id", dto.getId());
%>
			<script language="javascript">
				alert("회원가입을 축하 합니다.");
				document.location.href="login.jsp";
			</script>
<%
			} else {
%>
			<script language="javascript">
				alert("회원가입에 실패했습니다.");
				document.location.href="login.jsp";
			</script>
<%
			}
		}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>a
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8R">
<title>Insert title here</title>
</head>
<body>
	
</body>
</html>