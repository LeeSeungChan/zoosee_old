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
<form action="pet_update.do" >
	${mvo.name} 님의 가축<br/> 
	<input type="hidden" name="petNo" value="${pvo.petNo}">
	펫이름 <input type="text" name="petName" id="petName" value="${pvo.petName}" readonly="readonly"><br>
	펫나이 <input type="text" name="petAge" id="petAge" value="${pvo.petAge}" readonly="readonly"><br>
	펫종류 <input type="text" name="petType" id="petType" value="${pvo.petType}" readonly="readonly"><br>
	펫성별 <input type="radio" name="petGender" value="man" disabled="disabled"/>남자
	<input type="radio" name="petGender" value="woman" disabled="disabled"/>여자<br> 
	펫중성화<input type="radio" name="petNeutral" value="yes" disabled="disabled">네 
	<input type="radio" name="petNeutral" value="no" disabled="disabled" >아니오<br>
	펫이미지<img src="${initParam.root}${pvo.petImg}" width="175" height="250"> <br> 
	펫크기<input type="radio" name="petSize" value="s" disabled="disabled">소
	<input type="radio" name="petSize" value="m" disabled="disabled">중
	<input type="radio" name="petSize" value="l" disabled="disabled">대<br>
	특이사항 <input type="text" name="etc" id="petEtc" value="${pvo.etc}" readonly="readonly"><br> 
	<input type="submit" value="수정">
</form>
<form action="pet_delete.do">
<input type="submit" value="삭제">
</form>