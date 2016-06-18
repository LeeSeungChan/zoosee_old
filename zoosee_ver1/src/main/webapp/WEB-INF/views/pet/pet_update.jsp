<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <script type="text/javascript">
    $(document).ready(function(){
    	$("input:radio[name=petGender][value=" + '<c:out value="${ pvo.petGender }"/>' + "]").attr("checked","checked");
    	$("input:radio[name=petNeutral][value=" + '<c:out value="${ pvo.petNeutral }"/>' + "]").attr("checked","checked");
    	$("input:radio[name=petSize][value=" + '<c:out value="${ pvo.petSize }"/>' + "]").attr("checked","checked");
    });
    </script>
<form action="interceptor_pet_update_result.do" enctype="multipart/form-data" method="post">
	<input type="hidden" name="petNo" value="${pvo.petNo}">
	${mvo.name} 님의 가축<br/> 
	펫이름 <input type="text" name="petName" id="petName" value="${pvo.petName}" ><br>
	펫나이 <input type="text" name="petAge" id="petAge" value="${pvo.petAge}" ><br>
	펫종류 <input type="text" name="petType" id="petType" value="${pvo.petType}" ><br>
	펫성별 <input type="radio" name="petGender" value="man" />남자
	<input type="radio" name="petGender" value="woman" />여자<br> 
	펫중성화<input type="radio" name="petNeutral" value="yes" >네 
	<input type="radio" name="petNeutral" value="no" >아니오<br>
	펫이미지<img src="${pvo.petImg}" width="175" height="250">
	<input type="file" name="petImg3"> <br> 
	펫크기<input type="radio" name="petSize" value="s" >소
	<input type="radio" name="petSize" value="m" >중
	<input type="radio" name="petSize" value="l" >대<br>
	특이사항 <input type="text" name="etc" id="petEtc" value="${pvo.etc}"><br> 
	<input type="submit" value="수정하기">
</form>
