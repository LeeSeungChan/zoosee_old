<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script	type="text/javascript">
$(document).ready(function(){
	$("#updateForm").submit(function(){
		if($("#title").val()==""){
			alert("제목을 공란으로 수정할 수 없습니다.");
			$("#title").focus();
			return false;
		}else if($("#question").val()==""){
			alert("질문을 공란으로 수정할 수 없습니다.");
			$("#question").focus();
			return false;
		}
	});
});
</script>
<c:choose>
<c:when test="${empty qnaBoardVO.answer}">
<form id="updateForm" action="interceptor_qna_update_result.do">
<input type="hidden" name="boardNo" value="${qnaBoardVO.boardNo}"> 
<table border="1">
	<tr>
		<td>제목</td>
		<td><input type="text" value="${qnaBoardVO.title}" name="title" id="title"></td>
	</tr> 
	<tr>
		<td>내용</td>
		<td><input type="text" value="${qnaBoardVO.question}" name="question" id="question"></td>
	</tr>
</table>
<input type="submit" value="수정하기">
</form>
</c:when>
<c:otherwise>
	<script type="text/javascript">
		alert("답변이 등록된 질문은 수정이 불가 합니다. 새로 질문을 등록하세요.");
		location.href="${initParam.root}home.do";
	</script>
</c:otherwise>
</c:choose>