<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<a href="${initParam.root}admin_qna_list.do?when=all">모든 qna 목록</a>
|
<a href="${initParam.root}admin_qna_list.do?when=nonAnswer">답변 미등록
	qna 목록</a>
|
<a href="${initParam.root}admin_qna_findbyid.do">아이디로 Q&A 검색</a>


<hr>
아이디 ${param.id} (으)로 검색하신 정보 입니다.

<c:choose>
	<c:when test="${empty list}">
		<br>검색하신 이용자의 질문 내역이 없습니다.
	</c:when>
	<c:otherwise>
		<table border="1">
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성시간</th>
				<th>답변여부</th>
			</tr>
			<c:forEach items="${list }" var="Question">
				<tr>
					<td>${Question.boardNo }</td>
					<td><a
						href="${initParam.root}admin_showQuestion.do?boardNo=${Question.boardNo}">${Question.title }</a></td>
					<td><a
						href="${initParam.root}member_getMemberVO.do?id=${Question.memberVO.id}">${Question.memberVO.name}(${Question.memberVO.id})</a></td>
					<td>${Question.timePosted }</td>
					<td><c:choose>
							<c:when test="${empty Question.answer}">X</c:when>
							<c:otherwise>O</c:otherwise>
						</c:choose></td>
				</tr>
			</c:forEach>
		</table>
	</c:otherwise>
</c:choose>