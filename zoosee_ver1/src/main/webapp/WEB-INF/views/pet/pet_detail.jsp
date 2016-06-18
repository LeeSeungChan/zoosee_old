<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
    $(document).ready(function(){
    	$("input:radio[name=petGender][value=" + '<c:out value="${ petVO.petGender }"/>' + "]").attr("checked","checked");
    	$("input:radio[name=petNeutral][value=" + '<c:out value="${ petVO.petNeutral }"/>' + "]").attr("checked","checked");
    	$("input:radio[name=petSize][value=" + '<c:out value="${ petVO.petSize }"/>' + "]").attr("checked","checked");
    	$("#update").click(function(){
    		if(confirm("수정하시겠습니까?")){
    			location.replace("interceptor_pet_update.do?petNo=${petVO.petNo}");
    		}
    	});
    	$("#delete").click(function(){
    		if(confirm("삭제하겠습니까?")){
    			location.replace("interceptor_pet_delete.do?petNo=${petVO.petNo}");
    		}
    	});
    });
</script>
	${mvo.name} 님의 가축<br/> 
	펫이름 <input type="text" name="petName" id="petName" value="${petVO.petName}" readonly="readonly"><br>
	펫나이 <input type="text" name="petAge" id="petAge" value="${petVO.petAge}" readonly="readonly"><br>
	펫종류 <input type="text" name="petType" id="petType" value="${petVO.petType}" readonly="readonly"><br>
	펫성별 <input type="radio" name="petGender" value="man" disabled="disabled"/>남자
	<input type="radio" name="petGender" value="woman" disabled="disabled"/>여자<br> 
	펫중성화<input type="radio" name="petNeutral" value="yes" disabled="disabled">네 
	<input type="radio" name="petNeutral" value="no" disabled="disabled" >아니오<br>
	펫이미지<img src="${initParam.root}${petVO.petImg}" width="175" height="250"> <br> 
	펫크기<input type="radio" name="petSize" value="s" disabled="disabled">소
	<input type="radio" name="petSize" value="m" disabled="disabled">중
	<input type="radio" name="petSize" value="l" disabled="disabled">대<br>
	특이사항 <input type="text" name="etc" id="petEtc" value="${petVO.etc}" readonly="readonly"><br> 
<input type="button" id="update" value="수정">
<input type="button" id="delete" value="삭제">