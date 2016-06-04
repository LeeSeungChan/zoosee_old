<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
펫등록
<form method="post" action="registerPet.do" id="regForm">
아이디 <input type="text" name="id"><br>
펫이름 <input type="text" name="petName"><br>
펫나이 <input type="text" name="petAge"><br>
펫종류 <input type="text" name="petType"><br>
펫성별 <input type="text" name="petGender"><br>
펫중성화 <input type="text" name="petNeutral"><br>
펫이미지 <input type="text" name="petImg"><br>
펫사이즈 <input type="text" name="petSize"><br>
<input type="submit" value="등록하기">
</form>