<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<form method="post" action="registerPet.do" id="regForm" enctype="multipart/form-data">
	${mvo.name} 님의 가축<br/> 
	펫이름 <input type="text" name="petName" id="petName" value="${pvo.petName}" readonly="readonly"><br>
	펫나이 <input type="text" name="petAge" id="petAge" value="${pvo.petAge}" readonly="readonly"><br>
	펫종류 <input type="text" name="petType" id="petType" value="${pvo.petType}" readonly="readonly"><br>
	펫성별<input type="text" name="petGender" value="${pvo.petGender}" readonly="readonly"><br>
	펫중성화<input type="text" name="petNeutral" value="${pvo.petNeutral}" readonly="readonly"><br> 
	펫이미지<img src="${pvo.petImg}"> <br> 
	펫크기<input type="text" name="petSize" value="${pvo.petSize}" readonly="readonly"><br> 
	특이사항 <input type="text" name="etc" id="petEtc" value="${pvo.etc}" readonly="readonly"><br> 
</form>