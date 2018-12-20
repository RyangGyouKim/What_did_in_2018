<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>travelShow</title>
<script type="text/javascript">
var slideIndex = 1;
showSlides(slideIndex);

// Next/previous controls
function plusSlides(n) {
  showSlides(slideIndex += n);
}

// Thumbnail image controls
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
<style>
.profielMom{
marign:auto 0xp;
width:100%;
height:300px;
text-align:center;
border:1px solid black;
}
.profileSon{
margin: auto 0px;
display:inline-block; 
text-align:center;
}
.profileLeft{
margin: auto 0px;
width:100%;
float:left;
}
.profileImg{
margin: auto 0px;
width:30%;
align:right;
float:left;
}

#hr1{
border:solid 1px black;
}


.profileRight{
margin: auto 0px;
width:300px;
float:right;
}

.slideshow-container{
	max-width: 300px;
	max-height: 200px;
 	position: relative;
 	margin: auto;
}
.prev, .next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  margin-top: -22px;
  padding: 16px;
  color: white;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
}
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

.prev:hover, .next:hover {
  background-color: rgba(0,0,0,0.8);
}
.text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}
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
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}
.active, .dot:hover {
  background-color: #717171;
}
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}
@-webkit-keyframes fade {
  from {opacity: .3} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .3} 
  to {opacity: 1}
}
</style>
</head>
<body>
<!-- 프로필 부분 -->
<div class="profileMom">
<!-- 	<div class="profileSon"> -->
		<div class="profileLeft" style="">
			<div class="prifleImg" style="text-align:center; float:left; height:200px; width:700px; margin-left:200px;">
				<image src="/imgUpload/siba10.jpg" alt="profile pic" style="float:left;">
				<div style="float:left; margin:auto 0px; height:200px; width:700px;">
					<div>
						닉네임 톱니바퀴
					</div>
					<div>
						
					</div>
			</div>
			
				
			</div>
					</div>
 		<div class="prfileRight" style="text-align:center; ">
			
			<div>		
				<div>
					게시글 n
				</div>
				<div>
					팔로워 n	
				</div>
				<div>
					팔로우 n
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 프로필 부분 -->
<!-- 여기는 ------- 부분  -->
<hr id="hr1">
<!-- 여기는 ------- 부분  -->

<!-- main -->
<div class="reviewMom">
	<div class="reviewSon">
		<div class="reviewLeft">
			<div class="reviewMap">
				지도
			</div>
		</div>
		
		<div class="reviewRight">
			<div style="text-align:center;">
				<div style="text-align:center;">
					<div style="float:left;">
						날짜(4)
					</div>
					<div style="float:right;">
						달력(4)
					</div>
				</div>
				<div style="text-align:center;">
					<div style="float:left;">
						위치(5)
					</div>
					<div style="float:right;">
						돋보기(5)
					</div>
				</div>
			</div>
			<br>
			<br>
		
		
			<!-- Slideshow container -->
			<div class="slideshow-container">
			
  				<!-- Full-width images with number and caption text -->
  				<div class="mySlides fade">
    				<div class="numbertext">1 / 3</div>
    				<img src="/imgUp/siba10.jpg" style="width:300px; height:200px;" alt="1/3">
    				<div class="text">Caption One</div>
 				 </div>

 				 <div class="mySlides fade">
    				<div class="numbertext">2 / 3</div>
    				<img src="/imgUp/siba11.jpg" style="width:300px; height:200px;" alt="2/3">
    				<div class="text">Caption Two</div>
 				 </div>

				  <div class="mySlides fade">
				  	 <div class="numbertext">3 / 3</div>
    				 <img src="/imgUp/siba12.jpg" style="width:300px; height:200px;" alt="3/3">
    			  	 <div class="text">Caption Three</div>
				  </div>

 			   	  <!-- Next and previous buttons -->
  				  <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
  				  <a class="next" onclick="plusSlides(1)">&#10095;</a>
			</div>
			<br>

			<!-- The dots/circles -->
			<div style="text-align:center;">
  				<span class="dot" onclick="currentSlide(1)"></span> 
  				<span class="dot" onclick="currentSlide(2)"></span> 
  				<span class="dot" onclick="currentSlide(3)"></span> 
			</div>
		
		
		</div>
		<br>
		<br>
		<div style="text-align:center;">
			<textarea rows="10" name="text"  required="" readonly="readonly" style="resize:none; width:500px; word-break:break-all;
			background-image:url(); background-position:right top; background-repeat: no-repeat;" placeholder="review"></textarea>
		</div>	
		
	
	</div>
</div>
<!-- main -->

</body>
</html>