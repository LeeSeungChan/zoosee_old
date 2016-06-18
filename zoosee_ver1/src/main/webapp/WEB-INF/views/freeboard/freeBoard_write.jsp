<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <script type="text/javascript">
	$(document).ready(function(){
		$("#wirteForm :input[name=freeBoardTitle]").focus();
	$("#wirteForm").submit(function(){
		if($("#wirteForm :input[name=freeBoardTitle]").val()==""){
			alert("제목을 입력하세요!!");
			$("#wirteForm :input[name=freeBoardTitle]").focus();
			return false;
		}
		if($("#wirteForm :input[name=freeBoardContents]").val()==""){
			alert("내용을 입력하세요!!");	
			$("#wirteForm :input[name=freeBoardContents]").focus();
			return false;
		}
	});
	
	$("#cancelBtn").click(function(){
		location.href="${initParam.root}interceptor_freeBoard_list.do";
	});
});
</script>
<h3>글쓰기</h3>
<form method="post" action="${initParam.root}interceptor_freeBoard_contentWrite.do" id="wirteForm">
	<table >
	<tr>
		<td>제목</td><td><input type="text" name="freeBoardTitle" size="48" ></td>
	</tr>
	<tr>
		<td>이름</td><td>${sessionScope.mvo.name }</td>
	</tr>
	<tr>
		<td>내용</td>
		<td  align="center"><textarea cols="53"rows="15" name="freeBoardContents"></textarea></td>
	</tr>
	<tr>
		<td colspan=2>
			<input type="submit" value="글쓰기" >
			<input type="button" value="목록으로가기" id="cancelBtn">
		</td>
	</tr>
</table>
</form>