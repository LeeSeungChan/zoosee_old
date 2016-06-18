<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
$(document).ready(function(){
	$("#update").click(function(){
		if(confirm("수정하시겠습니까?")){
			location.replace("interceptor_qna_update.do?boardNo=${qnaBoardVO.boardNo}");
		}
	});
	$("#delete").click(function(){
		if(confirm("삭제하겠습니까?")){
			location.replace("interceptor_qna_delete.do?boardNo=${qnaBoardVO.boardNo}");
		}
	});
});
</script>
<table border="1">
	<tr>
		<td>제목</td>
		<td>${qnaBoardVO.title}</td>
		<td>작성 시간</td>
		<td>${qnaBoardVO.timePosted}</td>
	</tr>
	<tr>
		<td colspan="4">${qnaBoardVO.question}</td>
	</tr>
	<c:choose>
		<c:when test="${empty qnaBoardVO.answer}">
			<tr>
				<td colspan="4">답변대기중</td>
			</tr>
		</c:when>
		<c:otherwise>
			<tr>
				<td>답변 시간</td>
				<td colspan="3">${qnaBoardVO.timeAnswered}</td>
			</tr>
			<tr>
				<td colspan="4">${qnaBoardVO.answer}</td>
			</tr>
		</c:otherwise>
	</c:choose>
</table>
<input type="button" id="update" value="수정">
<input type="button" id="delete" value="삭제">