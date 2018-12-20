<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>

* {
	box-sizing: border-box;
}

body{
margin: auto 0px;
}


/*  윗화면 - 프로필 부분 */
.profile{
text-align:center;
height: 250px;
padding: 30px;
padding-top:70px;
margin:auto 0px;
}
.w3-circle{
float:left;
width:150px;
height:150px;
text-align:center;

}
.profileSection{
float:left;
width:40%;
text-align:left;
padding-left: 50px; 
padding-top:30px;
}
.profileEmpty1{
float:left;
width:30%;
}
.profileEmpty2{
float:left;
width:10%;
}
.w3-container{
float:left;
width:20%;
padding-left:30px;
}
.line{
border:solid 0.8px #AAB7B8;
}
.reviewSection{
height: 1000px;
padding: 30px;
}

.nick{
width:100px;
height:30px;
background-color:#AAB7B8;
}

.btn{
width:70px;
height:30px;
margin:auto 0x;
margin-right: 10px;
background-color:#AAB7B8;
}
/*  윗화면 - 프로필 부분 */

/* 아래화면 - 지도/리뷰 부분 */
.review1{
float:left;
height:1000px;
width:10%;
}
.review2{
float:left;
height:1000px;
width:30%;
padding-top:50px;
}
.review3{
float:left;
height:1000px;
width:40%;
text-align:left;
padding-left:30px;
}
.review4{
float:left;
height:1000px;
width:10%;
}

.map{
width:500px;
height:600px;
border:1px solid red;
}

.reA{
padding-right:20px;
}

.imgSlide{
width:100%;
height:300px;
border:1px solid red;
}

.review{
width:100%;
height:150px;
border:1px solid red;
}

.mySlides {display: none}
img {vertical-align: middle;}

/* Slideshow container */
.slideshow-container {
  max-width: 1000px;
  position: relative;
  margin: auto;
}

/* Next & previous buttons */
.prev, .next {
  cursor: pointer;
  position: center;
  top: 50%;
  width: 420px;
  
   padding: 16px;
   
/*   margin-top: -20px;
 */  color: #AAB7B8;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
}

/* Position the "next button" to the right */
.next {
  right: 0;
/*   border-radius: 3px 0 0 3px; */
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
  background-color: rgba(0,0,0,0.8);
}



/* The dots/bullets/indicators */
.dot {
  cursor: pointer;
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active, .dot:hover {
  background-color: #717171;
}

/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}

@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .prev, .next,.text {font-size: 11px}
}

/* 아래화면 - 지도/리뷰 부분 */
</style>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>

<div class="profile">
	<div class="profileEmpty1">
		&nbsp;
	</div> <!-- 공백구간 3  -->
	<div class="w3-container"> <!--사진   2 -->
		<img src="/imgUp/siba16.jpg" class="w3-circle">
	</div>
	<div class="profileSection"> <!-- 프로필 4 -->
	<input value="nickName" readOnly placeholder="NickName" class="nick">
	&nbsp;&nbsp;&nbsp;&nbsp;
	<a><img src="">톱니바퀴 아이콘</a>
	<br>
	<br>
	<a><input value="nickName" readOnly placeholder="NickName" class="btn" id="btn1"></a>
	<a><input value="nickName" readOnly placeholder="NickName" class="btn" id="btn2"></a>	
	<a><input value="nickName" readOnly placeholder="NickName" class="btn" id="btn3"></a>
	</div>
	<div class="profileEmpty2">
		&nbsp;
	</div> <!-- 공백구간  1 -->
</div>
<hr class="line">

<div class="reviewSection">
	<div class="review1">&nbsp;</div>
	<div class="review2">
		<img src="" class="map">
		<br>지도
	</div>
	<div class="review3">
		<a class="reA"><input type="text" readonly class="date">날짜</a>
		<a><img src="">달력 아이콘</a>
		<br>
		<br>
		<a class="reA"><input type="text" readonly class="place">장소이름</a>
		<a><img src="">돋보기 아이콘</a>
		<br>
		<br>
		<!-- Slideshow container -->
		<div class="slideshow-container">

 		 <!-- Full-width images with number and caption text -->
  			<div class="mySlides fade">
    		
   			 	<img src="/imgUp/siba10.jpg" style="width:100%; height:400px;">
   			 
  			</div>

  			<div class="mySlides fade">
    		
    			<img src="/imgUp/siba11.jpg" style="width:100%; height:400px;">
    			
  			</div>

  			<div class="mySlides fade">
    		
    			<img src="/imgUp/siba12.jpg" style="width:100%; height:400px;">
    			
  			</div>

		  <!-- Next and previous buttons -->
  			

		</div>
		<br>

		<!-- The dots/circles -->
		<div style="text-align:center">
  			<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
  			<span class="dot" onclick="currentSlide(1)"></span> 
  			<span class="dot" onclick="currentSlide(2)"></span> 
  			<span class="dot" onclick="currentSlide(3)"></span> 
			<a class="next" onclick="plusSlides(1)">&#10095;</a>
		</div>
		<br>
		<div class="review">
			리뷰
		</div>
		
	</div>
	<div class="review4">&nbsp;</div>
	
</div>
<script>
var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  if (n > slides.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
}
</script>
</body>
</html>