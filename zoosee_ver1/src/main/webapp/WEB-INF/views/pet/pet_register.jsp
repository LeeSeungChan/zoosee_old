<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
    $(document).ready(function(){
    	$("#regForm").submit(function(){ 
    		if($("#petName").val()==""){
    			alert("펫의 이름을 입력하세요!");
    			$("#petName").focus();
    			return false;
    		}else if($("#petAge").val()==""){
    			alert("펫의 나이를 입력하세요!");
    			$("#petAge").focus();
    			return false;
    		}else if($("#petType").val()==""){
    			alert("펫의 종류를 입력하세요!");
    			$("#petType").focus();
    			return false;
    		}else if($("input:radio[name=petGender]:checked").length==0){
    			alert("펫의 성별을 입력하세요!");
    			return false;
    		}else if($("input:radio[name=petNeutral]:checked").length==0){
    			alert("펫의 중성화 여부를 입력하세요!");
    			return false;
    		}else if($("#petImg").val()==""){
    			alert("펫의 이미지를 입력하세요!");
    			return false;
    		}else if($("input:radio[name=petSize]:checked").length==0){
    			alert("펫의 크기를 입력하세요!");
    			return false;
    		}else if($("#petEtc").val()==""){
    			alert("펫의 특이사항을 입력하세요!");
    			$("#petEtc").focus();
    			return false;
    		}else{
    			$("#regForm").submit();
    		}
    	});
    	/* $("#resetBtn").click(function(){    		
    		$("#regForm")[0].reset();
    	}); */
    });	
</script>
<form method="post" action="registerPet.do" id="regForm" enctype="multipart/form-data">
	${sessionScope.mvo.name}님 <br/>
	펫이름 <input type="text" name="petName" id="petName"><br>
	펫나이 <input type="text" name="petAge" id="petAge"><br>
	펫종류 <input type="text" name="petType" id="petType"><br>
	펫성별<input type="radio" name="petGender" value="man" >남자 
	<input type="radio" name="petGender" value="woman" >여자<br>
	펫중성화<input type="radio" name="petNeutral" value="yes" >네 
	<input type="radio" name="petNeutral" value="no" >아니오<br>
	펫이미지 <input type="file" name="petImg2"><br>
	펫크기<input type="radio" name="petSize" value="s" >소
	<input type="radio" name="petSize" value="m" >중
	<input type="radio" name="petSize" value="l" >대<br>
	특이사항 <input type="text" name="etc" id="petEtc"><br>
	<input type="submit" value="등록">
</form>