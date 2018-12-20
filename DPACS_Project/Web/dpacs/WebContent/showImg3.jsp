<%@ page import="common.Util"%>
<%@ page import="java.util.Collections"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<link rel="shortcut icon" href="/images/favicon.ico" type="image/x-icon">
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
<script type="text/javascript" src="/js/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" href="/common/css/showImg3.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body class="reload3">


<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">Logo</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">Home</a></li>
        <li><a href="#">About</a></li>
        <li><a href="#">Projects</a></li>
        <li><a href="#">Contact</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      </ul>
    </div>
  </div>
</nav>
  
<div class="container-fluid text-center">    
  <div class="row content">
    <div class="col-sm-2 sidenav">
      <p><a href="#">Link</a></p>
      <p><a href="#">Link</a></p>
      <p><a href="#">Link</a></p>
    </div>
    <div class="col-sm-8 text-left"> 
      <h1>Welcome</h1>
      <p>	*AJax 방법은 <span style="color:red;">ctrl+f5</span> 누르는것과 같은 효과를 준다. 
				화면이 깜빡거리지 않는 효과로 화면이 갱신된다.
				이 프로젝트는 폴더에 있는 이미지 파일이 추가되면  새로고침 효과로 파일이 새로고침되고 추가된 이미지도
				화면에 출력된다. 이름은 역순으로
				<br>
				*파일 이름 <br>
				*이미지<br>
				이렇게 출력된다.
				<br>
				파일이름은 yyyy-MM-dd hh-mm-ss carNum 형식으로 되어있다.
				<br>
				현재 매 2초마다 자동 새로 고침되게끔 설정.</p>
      <hr>
   <%
   String servletPath = request.getServletPath();
   String ImgDirRealPath =  request.getSession().getServletContext().getRealPath(servletPath.substring(0,servletPath.lastIndexOf("/")+1)+"imgUp");
  
   System.out.println(ImgDirRealPath);

   File ImgDirObj = new File(ImgDirRealPath);
   //현재 jsp파일이 있는 폴더의 images폴더의 이미지 목록 가져오기
   List<File> imgFileList = Util.getImgFileList(ImgDirObj);
 
%>
   
      <div class="image_list" id="image_list" >
	<%
    	String strImgConFormat1 = "<div class=\"images\" align='center'>"
        + "<span class=\"imgTitle\">▒ %s ▒</span><br>"
        + "<img width='300px' height='300px' src=\"%s\"/></div><br><br>";

		for(int i = imgFileList.size()-1; i>=0;i--) {
			File f = imgFileList.get(i);
           	String title = Util.getFileNameNoExt(f.getName());
           	//System.out.println(f.getName()+"/"+title);
           	String url = Util.getImgSrc(f);
           	out.print(String.format(strImgConFormat1, title,  url ));
       }
   %> 
</div>
    </div>
    <div class="col-sm-2 sidenav">
      <div class="well">
        <p>ADS</p>
      </div>
      <div class="well">
        <p>ADS</p>
      </div>
    </div>
  </div>
</div>

<footer class="container-fluid text-center">
  <p><h5> All Rights Are Reserved By DYB Team and maker Ryan</h5></p>
</footer>
</body>
<script type="text/javascript" src="common/js/ajax3.js"> //ajax통신을 위해
</script>
</html>