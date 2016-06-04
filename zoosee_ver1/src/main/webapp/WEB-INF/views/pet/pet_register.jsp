<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
펫등록
<script src="${initParam.root}resources/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
    	$("#registerBtn").click(function(){ 
    		if($("#petName").val()==""){
    			alert("펫의 이름을 입력하세요!");
    		}else if($("#petAge").val()==""){
    			alert("펫의 나이를 입력하세요!");
    		}else if($("#petType").val()==""){
    			alert("펫의 종류를 입력하세요!");
    		}else if($("#petGender").val()==""){
    			alert("펫의 성별을 입력하세요!");
    		}else if($("#petNeutral").val()==""){
    			alert("펫의 중성화 여부를 입력하세요!");
    		}else if($("#petImg").val()==""){
    			alert("펫의 이미지를 입력하세요!");
    		}else if($("#petSize").val()==""){
    			alert("펫의 크기를 입력하세요!");
    		}else{
    			$("#regForm").submit();
    		}
    	});
    	$("#resetBtn").click(function(){    		
    		$("#regForm")[0].reset();
    	});
    });	
</script>
<form method="post" action="${initParam.root}registerPet.do" id="regForm">
${sessionScope.mvo.id}
펫이름 <input type="text" name="petName"><br>
펫나이 <input type="text" name="petAge"><br>
펫종류 <input type="text" name="petType"><br>
펫성별 <input type="text" name="petGender"><br>
펫중성화 <input type="text" name="petNeutral"><br>
펫이미지 <input type="text" name="petImg"><br>
펫사이즈 <input type="text" name="petSize"><br>
<input type="submit" value="등록하기" name="registerBtn">
<input type="button" value="reset" name="resetBtn">
</form>