<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <script type="text/javascript">
 	$(document).ready(function(){
 		$("#contentForm :input[name=list]").click(function(){
 			location.href="${initParam.root}interceptor_freeBoard_list.do";
 		});
 		$("#contentForm :input[name=delete]").click(function(){
 			if(confirm("삭제하시겠습니까??")){
				location.href="${initParam.root}interceptor_freeBoard_contentDelete.do?freeBoardNo=${param.freeBoardNo }";
			}
 		});
 		$("#contentForm :input[name=update]").click(function(){
 			if(confirm("수정하시겠습니까??")){
				location.href="${initParam.root}interceptor_freeBoard_updateView.do?freeBoardNo=${requestScope.freeBoardVO.freeBoardNo }";
			}
 		});
 		
 		$("#replyForm").submit(function(){
 			var content = $("#content").val();
 			if(content==""){
				alert("내용을 입력해주세요!")
				return false;
 			}
 		})
 		
 	});
 	
	function rereplyButton(index,grp,lvl,ref){
		var rereplyform = "";
		rereplyform+="<form action='freeBoard_writeReply2.do' id='rereplyForm'>"; 
		rereplyform+="<textarea rows='7' cols='50' name='content' id='content'> </textarea>";
		rereplyform+="<input type='hidden' name='grp' value="+grp+">";
		rereplyform+="<input type='hidden' name='lvl' value="+lvl+"><br>";
		rereplyform+="<input type='hidden' name='ref' value="+ref+">";
		rereplyform+="<input type='hidden' name='id' value='${sessionScope.mvo.id }'>";
		rereplyform+="<input type='submit' value='작성'>";
		rereplyform+="<br>--------------------------------------------------------------";
		rereplyform+="</form>";
		$("#rereply"+index).html(rereplyform); 
	};
	
	function del_reply(grp,lvl,ref){
		if(confirm("댓글을 삭제하시겠습니까?")){
			location.href="${initParam.root}interceptor_freeBoard_deleteReply.do?grp="+grp+"&lvl="+lvl+"&ref="+ref;
		}
	};
	
	
	
	
 	
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
<%--댓글리스트 --%>
<table>
	<c:forEach items="${requestScope.replyList }" var="reply" varStatus="status">
		<tr>
			<td>
			<c:if test="${reply.reply_no==0}">
			>>
			</c:if>
			ID:${reply.id } 
			</td>
			<td>${reply.content }</td>
			<td>${reply.time_posted }</td>
			<td>
			<c:if test="${reply.reply_no>0}">
			<input type="button" value="댓글" onclick="rereplyButton(${status.index},${reply.grp },${reply.lvl},${reply.ref} )">
			</c:if>
			<c:if test="${reply.con==0}">
			<input type="button" value="삭제" onclick="del_reply(${reply.grp },${reply.lvl},${reply.ref})">
			</c:if>
			</td>
		</tr>
		<tr>
			<td colspan="4">--------------------------------------------------------------</td>
		</tr>
		<tr>
				<td colspan="4"><span id="rereply${status.index}"></span></td>
		</tr>
	</c:forEach>
</table>
<%--댓글작성란 --%>
<hr>
<form action="freeBoard_writeReply.do" id="replyForm">
	<table>
		<tr>
			<td><textarea rows="7" cols="50" name="content" id="content"></textarea></td>
		</tr>
		<tr>
			<td align="center"><input type="submit" value="댓글쓰기"></td>
		</tr>
	</table>
	<input type="hidden" name="id" value="${sessionScope.mvo.id }">
	<input type="hidden" name="ref" value="${requestScope.freeBoardVO.freeBoardNo }">
</form>

