<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script	type="text/javascript">
$(document).ready(function(){
	$("#update").click(function(){
		var answer=$("#answer").val();
		if("${qnaBoardVO.answer}"!=answer){
			if("${qnaBoardVO.answer}"==""){
				iif(confirm("답변을 등록하시겠습니까?")){
					location.replace("${initParam.root}interceptor_admin_update_answer.do?memberVO.id=${qnaBoardVO.memberVO.id}&boardNo=${qnaBoardVO.boardNo}&answer="+answer);
				}
			}else {
				if(answer!=""){
					if(confirm("답변을 수정하시겠습니까?")){
						location.replace("${initParam.root}interceptor_admin_update_answer.do?memberVO.id=${qnaBoardVO.memberVO.id}&boardNo=${qnaBoardVO.boardNo}&answer="+answer);
					}
				}else{
					alert("답변을 공란으로 입력할 수 없습니다.");
					$("#answer").focus();
				}
			}
		}else{
			if("${qnaBoardVO.answer}"==""){
				alert("답변을 공란으로 입력할 수 없습니다.");
				$("#answer").focus();
			}else{
				alert("수정되지 않은 답변입니다. 확인하세요.");
				$("#answer").focus();
			}
		}
	});
	$("#check").click(function(){
		location.replace("${initParam.root}interceptor_admin_qna_list.do?when=all");
	});
});
</script>
<form>
<table border="1">
<tr>
	<th>제목</th><th>${qnaBoardVO.title}</th>
	<th>작성자</th><th>${qnaBoardVO.memberVO.name}(${qnaBoardVO.memberVO.id})</th>
</tr>
<tr>
	<th colspan="2">질문 </th>
	<th>작성시간</th><th>${qnaBoardVO.timePosted}</th>
</tr>
<tr>
	<th colspan="4">${qnaBoardVO.question}</th>
</tr>
<c:choose>
<c:when test="${empty qnaBoardVO.answer}">
<tr>
	<th colspan="4">답변</th>
</tr>
<tr>
	<th colspan="4"><textarea rows="3" cols="40" id="answer"></textarea></th>
</tr>
</c:when>
<c:otherwise>
<tr>
	<th colspan="2">답변 </th>
	<th>작성시간</th><th>${qnaBoardVO.timeAnswered}</th>
</tr>
<tr>
	<th><textarea rows="3" cols="4" id="answer">${qnaBoardVO.answer}</textarea></th>
</tr>
</c:otherwise>
</c:choose>
</table>
<input type="button" id="update" value="답변등록">
<input type="button" id="check" value="목록">
</form>