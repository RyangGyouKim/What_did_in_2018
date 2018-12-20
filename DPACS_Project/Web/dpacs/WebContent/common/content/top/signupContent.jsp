<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="content" style="margin:auto 0px; background-color:#FDFEFE; height:100%; width: 90%; float:right;">
	<!-- startmain  -->		
	<div style="text-align:center; padding-left:100px; padding-top:80px;">
		<form method="post" action="signupOk.jsp">
			<filedset id="regbox">
				<legend>회원가입</legend>
				<label for="id">아이디</label> <input type="text" name="id"/><br>
				<label for="pw">비밀번호</label> <input type="password" name="pw"/><br>
				<label for="email">이메일</label> <input type="text" name="email"/><br>
				<label for="tel">휴대폰</label> <input type="text" name="tel"/> <br>
				<input type="submit" value="가입" />
				<input type="reset" value="취소"  />
			</filedset>
		</form>
	</div>