<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<a href="${initParam.root}interceptor_message_list.do">전체 메세지 리스트</a> | 읽지 않은 메세지 리스트 

<br>
<br>
읽지않은 메세지 리스트
<br>
<br>
<c:choose>
<c:when test="${empty listVO.list }">
읽지 않은 메세지가 없습니다.
</c:when>
<c:otherwise>
<table border="1">
  <tr>
    <th>타이틀</th>
    <th>작성시간</th>
    <th>읽음표시</th>
  </tr>
  <c:forEach items="${listVO.list}"  var="messageVO">
  <tr>
    <td><a href="interceptor_message_content.do?message_no=${messageVO.message_no }">${messageVO.title}</a></td>
    <td>${messageVO.time_posted}</td>
    <td>
    <c:choose>
    <c:when test="${messageVO.checked==0}"> 읽지않음 </c:when>
    <c:otherwise>읽음</c:otherwise>
    </c:choose>
    </td>
  </tr>
  </c:forEach>
</table>
</c:otherwise>
</c:choose>
<br>
<br>
<c:set var="pb" value="${listVO.pagingBean}"></c:set>
<c:if test="${pb.previousPageGroup}">
	<a href="${initParam.root}interceptor_message_uncheckedlist.do?pageNo=${pb.startPageOfPageGroup-1}">◀</a>
</c:if>
<c:forEach var="i" begin="${pb.startPageOfPageGroup}"
	end="${pb.endPageOfPageGroup}">
	<c:choose>
		<c:when test="${pb.nowPage!=i}">
			<a href="${initParam.root}interceptor_message_uncheckedlist.do?pageNo=${i}">${i}</a>
		</c:when>
		<c:otherwise>
		${i}
		</c:otherwise>
	</c:choose>
</c:forEach>
<c:if test="${pb.nextPageGroup}">
	<a href="${initParam.root}interceptor_message_uncheckedlist.do?pageNo=${pb.endPageOfPageGroup+1}">▶</a>
</c:if>
<br>
<br>
<br>
<br>