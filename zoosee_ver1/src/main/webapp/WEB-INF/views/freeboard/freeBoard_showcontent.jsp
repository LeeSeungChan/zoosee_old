<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <script type="text/javascript">
 	$(document).ready(function(){
 		$("#contentForm :input[name=list]").click(function(){
 			location.href="${initParam.root} freeBoard_list.do";
 		});
 		$("#contentForm :input[name=delete]").click(function(){
 			if(confirm("삭제하시겠습니까??")){
				location.href="${initParam.root}freeBoard_contentDelete.do?freeBoardNo=${param.freeBoardNo }";
			}
 		});
 		$("#contentForm :input[name=update]").click(function(){
 			if(confirm("수정하시겠습니까??")){
				location.href="${initParam.root}freeBoard_updateView.do?freeBoardNo=${requestScope.freeBoardVO.freeBoardNo }";
			}
 		});
 		
 	});
	
</script>

<form id="contentForm">
<table border="1">
	<tr>
		<td>NO: ${requestScope.freeBoardVO.freeBoardNo }</td>
		<td colspan=2>제목: ${requestScope.freeBoardVO.freeBoardTitle }</td>
	</tr>
	<tr>
		<td>작성자: ${requestScope.freeBoardVO.memberVO.name }</td>
		<td>작성일자: ${requestScope.freeBoardVO.freeBoardTimePosted }</td>
		<td>조회수: ${requestScope.freeBoardVO.freeBoardHits }</td>
	</tr>
	<tr>
		<td colspan=3>내용: ${requestScope.freeBoardVO.freeBoardContents }</td>
	</tr>
	<tr>
	<c:choose>
		<c:when test="${sessionScope.mvo.id==requestScope.freeBoardVO.memberVO.id }">
			<td align="center" colspan=3>
			<input type="button" name="list" value="목록" >
			<input type="button" name="delete" value="삭제" >
			<input type="button" name="update" value="수정" >
			</td>
		</c:when>
		<c:otherwise>
			<td align="center" colspan=3><input type="button" name="list" value="목록" ></td>
		</c:otherwise>
	</c:choose>
	</tr>

</table>
</form>