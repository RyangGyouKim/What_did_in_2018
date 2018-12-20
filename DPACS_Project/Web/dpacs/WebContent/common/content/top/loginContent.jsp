<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="content" style="margin:auto 0px; background-color:#FDFEFE; height:100%; width: 90%; float:right;">
			<!-- startmain  -->
		
			<div style="text-align:center; padding-left:100px; padding-top:70px;"> 
				<form action="loginOk.jsp" method="post">
					<h3 style="text-algin:center;">로그인 화면</h3>
					<div>
						<input type="text" placeholder="아이디" name="id" maxlength="20" />
					</div>
					<div>
						<input type="password" placeholder="비밀번호" name="pw" maxlength="20" />
					</div>
					<div>
						<input type="submit" value="로그인" />
						<a href="href="signup.jsp"><input type="reset"  value="회원가입"/></a>
					</div>
				</form>
			</div> 