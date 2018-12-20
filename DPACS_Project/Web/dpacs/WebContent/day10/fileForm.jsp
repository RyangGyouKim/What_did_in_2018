<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>파일 업로드 예제</title>
</head>
<body>
	<h2>파일 업로드 예제/절대경로 저장</h2>
	<form action="fileFormOk.jsp" method="post" enctype="multipart/form-data">
		첨부 파일 : <input type="file" name="file"><br />
	<input type="submit" value="File Upload">
	</form>


</body>
</html>