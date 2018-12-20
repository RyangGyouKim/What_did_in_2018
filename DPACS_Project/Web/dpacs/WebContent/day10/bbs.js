/**
 * 
 */

	function check(){
		if(!bbs.subject.value){
			alert("제목을 입력하세요");
			bbs.subject.focus();		
			return false;
		}
		if(!bbs.writer.value){
			alert("이름을 입력하세요");
			bbs.writer.focus();
			return false;
		}
		if(!bbs.pwd.value){
			alert("비밀번호를 입력하세요");
			bbs.pwd.focus();
			return false;
		}
		if(!bbs.content.value){
			alert("글내용을 입력하세요");
			bbs.content.focus();
			return false;
		}
		document.bbs.submit();
	}//check()---------------
