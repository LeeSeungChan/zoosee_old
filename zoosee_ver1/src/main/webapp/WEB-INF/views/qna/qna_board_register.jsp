<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
$(document).ready(function(){
	$("#registerQNAForm").submit(function(){
		if($("#title").val()==""){
			alert("제목을 입력하세요.");
			$("#title").focus();
			return false;
		}else if($("#question").val()==""){
			alert("질문을 입력하세요.");
			$("#question").focus();
			return false;
		}
	});
});
</script>
<form id="registerQNAForm" action="registerQNA.do">
 제목 <input type="text" id="title" name="title" >
질문 <input type="text" id="question" name="question" >
<input type="submit" value="질문 등록">
</form>