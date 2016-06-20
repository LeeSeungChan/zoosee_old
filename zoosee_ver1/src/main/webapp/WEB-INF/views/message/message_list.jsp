<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h4 align="center">
	전체 메세지 리스트 | <a
		href="${initParam.root}interceptor_message_uncheckedlist.do">읽지 않은
		메세지 리스트</a>
</h4>
<br>
<br>
<br>
${sessionScope.mvo.name } 님의 메세지입니다.
<a
	href="interceptor_message_updateCheckedAll.do?id=${sessionScope.mvo.id }">메세지
	모두 읽기</a>
<table border="1">
	<tr>
		<td>제목</td>
		<td>보낸사람</td>
		<td>날짜</td>
	</tr>
	<c:forEach items="${requestScope.list.list }" var="message">
		<tr>
			<td><a
				href="interceptor_message_content.do?message_no=${message.message_no }">${message.title}</a></td>
			<td>${message.id }</td>
			<td>${message.time_posted }</td>
		</tr>
	</c:forEach>
</table>

<c:set var="pb" value="${requestScope.list.pagingBean}"></c:set>

<c:if test="${pb.previousPageGroup}">
	<a
		href="${initParam.root}interceptor_message_list.do?pageNo=${pb.startPageOfPageGroup-1}">◀&nbsp;
	</a>
</c:if>

<c:forEach var="i" begin="${pb.startPageOfPageGroup}"
	end="${pb.endPageOfPageGroup}">
	<c:choose>
		<c:when test="${pb.nowPage!=i}">
			<a href="${initParam.root}interceptor_message_list.do?pageNo=${i}">${i}</a>
		</c:when>
		<c:otherwise>
			${i}
		</c:otherwise>
	</c:choose>
	&nbsp;
</c:forEach>

<c:if test="${pb.nextPageGroup}">
	<a href="${initParam.root}interceptor_message_list.do?pageNo=${pb.endPageOfPageGroup+1}">▶</a>
</c:if>




<br>
<br>
<br>
<br>
<br>