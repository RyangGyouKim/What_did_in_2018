/*$(function() {
	console.log("check in");
	test2();
	
});

function test2(){
	auto_refresh = setTimeout(function() {
		console.log("check check");
		$('.image_list').load('jsonImg.jsp');
		}, 3000); 	// 1000 마다 1초
					// 2000 = 2초
					// 2000 = 2초
}

*/

$('.image_list').html('');
var div = $(document.createElement('div'));
div.attr('id', 'container');
$('.image_list').append(div);

var load_data = function () {
   $.ajax({
      url: '/jsonImg.jsp', 
      type: 'GET', 
      cache: false,
      data: data,
      success: function (data) {
         data.forEach(val => {
            console.log(val);
            var div = $(document.createElement('/imgUp'));
            div.css('border', '1px solid red');
            div.attr('src', val);
            $(".image_list").append("<img src=\"+returnData.img_url+"\"/>");
         })
      },
      complete: function () {
         console.log('처리완료');
         setTimeout(() => {
            load_data();
         }, 3000);
      }
   });
};
load_data();