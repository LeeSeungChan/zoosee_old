<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<h3>돌보미 신청양식</h3>
<form action="petsiter_registerPetsitter.do" method="post" enctype="multipart/form-data">
원하는 가격(1박) : <input type="text" name="price"><br><br>
가능한 펫 종류 : 
<input type="checkbox" name="petType" value="멍뭉이">멍뭉이
<input type="checkbox" name="petType" value="야옹이">야옹이<br><br>

원하는 펫 크기 : 
<input type="checkbox" name="size" value="소">소
<input type="checkbox" name="size" value="중">중
<input type="checkbox" name="size" value="대">대<br><br>
제공 가능한 서비스 : 
<input type="checkbox" name="service" value="목욕">목욕
<input type="checkbox" name="service" value="목욕">산책
<input type="checkbox" name="service" value="목욕">픽업<br><br>

집 사진 : <input type="file" name="uploadeHouseImg"><br><br>

돌보미사진 : <input type="file" name="uploadePetsitterImg"><br><br>

<input type="submit" value="신청하기">

</form>