<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--@ include file="/include-header.jsp"--%>
<head>
<meta charset="UTF-8">
<title>bootstrap4</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>-->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-bs4.js"></script>
<style>
.notice {
	border: 2px solid #D8D8D8;
	width: 100%;
	margin: 40px auto;
}

.outer {
	width: 90%;
	height: 90%;
}

.inner {
	border: 2px solid white;
	margin-left: 20px;
	margin-right: 20px;
	margin-top: 20px;
	margin-bottom: 20px;
}
.title {
	height: 16;
	width: 200%;
	font-family: '돋움';
	font-size: 12;
	text-align: center;
	margin-top: 10px;
}
.date {
	height: 16;
	width: 200%;
	font-family: '돋움';
	font-size: 12;
	text-align: center;
	margin-top: 10px;
}

#dropzone {
	border: 2px dotted #3292A2;
	width: 100%;
	height: 100px;
	color: #92AAB0;
	text-align: center;
	font-size: 24px;
	padding-top: 12px;
}

#board_subject {
	width: 100%;
}

$(document ).ready (function() { $('#content ').summernote({ height:700,
	fontNames : [ '맑은고딕', 'Arial', 'Arial Black', 'Comic Sans MS',
	'Courier New', ], fontNamesIgnoreCheck : [ '맑은고딕' ], focus : true
	
}
);
}
);
</style>


<script>
 
  $(function() {
    $('.summernote').summernote({
      height: 300,          // 기본 높이값
      minHeight: null,      // 최소 높이값(null은 제한 없음)
      maxHeight: null,      // 최대 높이값(null은 제한 없음)
      focus: true,          // 페이지가 열릴때 포커스를 지정함
      lang: 'ko-KR'         // 한국어 지정(기본값은 en-US)
    });
  });
</script>
<%--@ include file="/WEB-INF/include/include-bodyHeader.jspf"--%>

<br>
<b><font size="6" color="gray">공지사항 글쓰기</font></b>
<br>

<form method="post" action="BoardWriteAction.bo" name="boardForm"
	enctype="multipart/form-data">
	<input type="hidden" name="board_id" value="${sessionScope.sessionID}">
	<div class="notice">
		<div class="outer">
			<div class="inner">
				<div>
					<span id="title">작성자</span> <span>${sessionScope.sessionID}</span>
				</div>
				<div>
					<span class="date">작성일</span> 
					<span><script language="JavaScript"> 
					var today = new Date( ) 
					document.write(today.getYear( )+1900 , "년 " , 
               		today.getMonth( )+1 , "월 " , today.getDate( ) , "일") 
				  </script> </span>
				</div>
				<div class=noticetitle>
					<span class="title"> 제 목 </span>
						<span><input name="board_subject" type="text" size="200%" value=""placeholder='제목을 입력하세요',/>
					
				</div>
				<div>

					<span id="title"> 내용 </span>
				</div>
				<span id="summernote"></span>
	 <script>
      $('#summernote').summernote({
        placeholder: '내용을 입력하세요',
        tabsize: 3,
        height: 300
      });
      </script>
				<div>
					<span id="title"> 파일첨부 </span> 
					<span>
						<div id="dropzone">Drag & Drop Files Here</div>
					</span>
				</div>

				<div align="center" valign="middle">
					<span colspan="5"> <input type="submit" value="등록">
						<input type="reset" value="작성취소">

					</span>
				</div>
			</div>
		</div>
	</div>
</form>


<%--@ include file="/WEB-INF/include/include-bodyHeader.jspf"--%>
<section class="vbox main"></section>
<%--@ include file="/WEB-INF/include/include-bodyFooter.jspf"--%>