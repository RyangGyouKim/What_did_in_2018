$(function() {
	console.log("check in");
	test2();
	
});

function test2(){
	auto_refresh = setTimeout(function() {
		console.log("check check");
		$('.reload').load('showImg.jsp');
		}, 2000); 	// 1000 마다 1초
					// 2000 = 2초
					// 2000 = 2초
}




/*
*	var auto_refresh = setInterval(function (){
*	$('.reload').load('showImg.jsp').fadeIn("slow");
*	}, 5000); // 새로고침 시간 1000은 1초를 의미합니다.
*	이 소스는 계속 증가 하여 1 2 3 4 ~ n 등차수열만큼 실행 횟수가 증가한다
*/