<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="w3-container">
  <button onclick="document.getElementById('id01').style.display='block'" class="w3-button w3-blue w3-tiny">
   회원가입
  </button>

  <div id="id01" class="w3-modal">
   <!-- 모달창 사이즈 -->
    <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:600px">
  
  
      <div class="w3-center"><br>
       <!-- 모달창 x 클릭  -->
        <span onclick="document.getElementById('id01').style.display='none'" class="w3-button w3-xlarge w3-transparent w3-display-topright" title="Close Modal">×</span>
       <!-- 모달창 이미지 -->
        <img src="/imgUp/siba16.jpg" alt="profileImg" style="width:30%" class="w3-circle w3-margin-top">
      </div>

      <form id="form1" name="form1" method="post" class="w3-container" action="/loginOk.jsp">
        <div class="w3-section">
          <label><b>아이디</b></label>
          <input class="w3-input w3-border w3-margin-bottom" type="text" placeholder="아이디 입력하세요" name="usrname">
          <label><b>비번</b></label>
          <input class="w3-input w3-border" type="text" placeholder="비밀번호 입력하세요" name="psw">
          <br>
          <div style="text-align:center;">
          	<button type="submit">로그인</button>
          	<input type="button" onclick="location.href='/signup.jsp'" value="회원가입"/><br>
          </div>
          <input class="w3-check w3-margin-top" type="checkbox" checked="checked"> 아이디 저장
        </div>
      </form>

      <div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
        <button onclick="document.getElementById('id01').style.display='none'" type="button" class="w3-button w3-red">취소</button>
        <span class="w3-right w3-padding w3-hide-small">분실 <a href="#">비밀번호?</a></span>
      </div>

    </div>
  </div>
</div>