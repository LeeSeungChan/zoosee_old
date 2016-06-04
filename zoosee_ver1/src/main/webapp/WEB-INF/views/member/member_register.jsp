<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<form action="registerMember.do" method="post">
   아이디 <input type="text" name="id"><br>
   비밀번호 <input type="password" name="password"> <br>
   비밀번호 확인 <input type="password" name="passwordCheck"> <br>
   이름 <input type="text" name="name"><br>
   주소 <input type="text" name="address"><br>
   성별 <input type="radio" name="gender" value="man"> 남성
   <input type="radio" name="gender" value="woman"/>여성<br>
   이메일 <input type="email" name="email"> <br>
   연락처 <input type="text" name="tel"><br>
   직업 <input type="text" name="job"><br>
   <input type="submit" value="등록">
</form>