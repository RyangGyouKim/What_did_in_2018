<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>chatting</title>
<style>

/* body */
body{
margin:auto 0px;
padding:auto 0px;
}

/* 대화창 전체의 겉 부분  */
.momCon{
margin:auto 0px;
text-align:center;			/* 글자 가운데 정렬이나, 가끔 align 정렬이 잘 안먹혀 글자 오른쪽 정렬+inline-block을 이용해 정렬, 생략가능  */
position:fixed;				/* 대화창 전체 부분을 고정 시킴 , position:fixed > text-align:center  */
bottom:0px;					/* 아래쪽 0px 기준  */
right:0px;					/* 오른쪽 0px 기준  */
							/* 가장 오른쪽 아래에 배치 */

}

/* 대화창 전체 */
.ContainerChat{
display:inline-block; 		/* 가운데 정렬을 위해, 생략가능 */
text-align:left;			/* 글자 왼쪽 정렬  */
margin:auto 0px;
width:367px;				/* 넓이  */
height:500px;				/* 높이  */
border:5px solid black;		/* 테두리 */
overflow:scroll;			/* 스크롤바 우측, 하단 */
overflow-x:hidden;			/* 스크롤바 하단 숨김 */
}

/* 전체창의 외부 테두리 */
.border{
margin:auto 0px;
}

/* 상단부분 */
.MainChat{
margin:auto 0px;
height:450px;
}


/*하단부분 */
.Sending{
margin:auto 0px;
height:50px;
width:350px;
color:black;
}

/* 메세지 입력하는 부분 */
.sendingMsg{
height:44px;
width:196px;
float:left;
}


/* 3번째 아이콘 */
.buttonSending_1{
margin:auto 0px;
height:50px;
width:50px;
float:right;
background-image:url('/images/messageCogWheel.png');			/* 이미지 주소 */
background-size:50px 50px;										/* 이미지 크기 */
background-repeat: no-repeat;									/* 이미지 반복 여부 */
}

/* 2번째 아이콘 */
.buttonSending_2{
margin:auto 0px;
height:50px;
width:50px;
float:right;
background-image:url('/images/messagePerson.jpg');
background-size:50px 50px;
background-repeat: no-repeat;
}

/* 1번째 아이콘 */
.buttonSending_3{
margin:auto 0px;
height:50px;
width:50px;
float:right;
background-image:url('/images/messageWrite.png');
background-size:50px 50px;
background-repeat: no-repeat;
}
</style>


</head>
<body>
<div class="momCon">
	<div class="ContainerChat">			 <!-- 대화창 전체 부분 -->
	
		<div>	<!-- 대화 참가자 -->
			
		</div>
		<div class="MainChat"> 		 <!-- 대화 내용 부분 -->
			대화내용
		</div>
		
		
		<div class="Sending">		 <!-- 대화창 하단 부분 -->
			<div >
				<input class="sendingMsg" type="text" placeholder="대화내용 입력">
				<button type="button" value="전송" class="buttonSending_1" > <!--  세번째  수레바퀴 아이콘-->
				<button type="button" value="전송" class="buttonSending_2" > <!--  두번째  친추 아이콘-->
				<button type="button" value="전송" class="buttonSending_3" >	<!--  첫번째  글쓰기 아이콘-->
			<!-- 
			글쓰기 아이콘: 이 아이콘을 누르거나 Enter를 누르면 대화내용이 입력된다/
			친추 아이콘: 이 아이콘을 누르면 같이 대화할 친구를 정할 수 있다. 1:1 통신만 가능하도록 지정
			수레바퀴 아이콘: 이 아이콘을 누르면 대화창을 삭제하거나, 대화창을 숨길수 있다.
						 바 형태로 숨길 수 있다.
			 -->
			
			</div>
	
		</div>
	</div>
</div>
</body>
</html>