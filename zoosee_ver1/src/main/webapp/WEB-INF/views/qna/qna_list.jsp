<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
${mvo.name }님이 작성하신 질문
<table border="1">
  <tr>
    <th>질문 제목</th>
    <th>답변여부</th>
    <th>작성시간</th>
  </tr>
<c:forEach items="${list}" var="qnaBoard">
  <tr>
    <td><a href="${initParam.root}qna_content.do?boardNo=${qnaBoard.boardNo}">${qnaBoard.title}</a></td>
    <td>
    <c:choose>
    <c:when test="${empty qnaBoard.answer}">X</c:when>
    <c:otherwise>O</c:otherwise>
    </c:choose>
    </td>
    <td>${qnaBoard.timePosted}</td>
  </tr>
</c:forEach>
</table>