<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="db.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>title</title>
	<script type="text/javascript" src="/js/jquery-3.3.1.min.js"></script>

	
	<link rel="shortcut icon" href="/images/favicon.ico" type="image/x-icon">
	<link rel="icon" href="images/favicon.ico" type="image/x-icon">
	
	
</head>
<body>



<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String email = request.getParameter("email");
	String tell = request.getParameter("tell");
	
	//db 연결 및 저장
	Connection con = null;
	PreparedStatement pstmt = null;
	String sql = "insert into dpacsdb values(?,?,?,?,sysdate)";
	int n = 0;
	
	try {
		con = DBConnection.getCon();
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		pstmt.setString(3, email);
		pstmt.setString(4, tell);
		
		n = pstmt.executeUpdate();
	} catch(SQLException se){
		System.out.println(se.getMessage());
	} finally{
		try{
			if(pstmt!=null) pstmt.close();
			if(con!=null) con.close();
		} catch(SQLException se){
			System.out.println(se.getMessage());
		}
	}

%>


		<script type="text/javascript">
		if(<%=n%> == 1){
			alert("가입이 완료되었습니다.");
			location.href="/board.jsp";
		} else {
			alert("정보를 잘못 입력하였습니다.");
			history.go(-1);
		}
	</script>

</body>
</html>