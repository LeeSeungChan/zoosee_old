<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<a href="${initParam.root}admin_qna_list.do?when=all">모든 qna 목록</a>|
<a href="${initParam.root}admin_qna_list.do?when=nonAnswer">답변 미등록 qna 목록</a>|
<a href="${initParam.root}admin_qna_findbyid.do">아이디로 Q&A 검색</a>
<table border="1">
	<tr>
		<th>글번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성시간</th>
		<th>답변여부</th>
	</tr>
	<c:forEach items="${listVO.list }" var="Question">
		<tr>
			<td>${Question.boardNo }</td>
			<td><a href="${initParam.root}admin_showQuestion.do?boardNo=${Question.boardNo}">${Question.title }</a></td>
			<td><a href="${initParam.root}member_getMemberVO.do?id=${Question.memberVO.id}">${Question.memberVO.name}(${Question.memberVO.id})</a></td>
			<td>${Question.timePosted }</td>
			<td>
				<c:choose>
					<c:when test="${empty Question.answer}">X</c:when>
					<c:otherwise>O</c:otherwise>
				</c:choose>
			</td>
		</tr>
	</c:forEach>
</table>
<br>
<br>
<c:set var="pb" value="${listVO.pagingBean}"></c:set>
<c:if test="${pb.previousPageGroup}">
	<a href="admin_qna_list.do?pageNo=${pb.startPageOfPageGroup-1}&when=${when}">◀</a>
</c:if>
<c:forEach var="i" begin="${pb.startPageOfPageGroup}"
	end="${pb.endPageOfPageGroup}">
	<c:choose>
		<c:when test="${pb.nowPage!=i}">
			<a href="admin_qna_list.do?pageNo=${i}&when=${when}">${i}</a>
		</c:when>
		<c:otherwise>
		${i}
		</c:otherwise>
	</c:choose>
</c:forEach>
<c:if test="${pb.nextPageGroup}">
	<a href="qna_list.do?pageNo=${pb.endPageOfPageGroup+1}&when=${when}">▶</a>
</c:if>