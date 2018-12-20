<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%--

String url = "";

List imageUrlList = new ArrayList();
File imageDir = new File(url);
for(File imageFile : imageDir.listFiles()){
	String imageFileName = imageFile.getName();
	imageUrlList.add(imageFileName);
}
request.setAttribute("imageUrlList", imageUrlList);
--%>

<c:forEach var="img" items="${imageUrlList}">
	<img >
</c:forEach>