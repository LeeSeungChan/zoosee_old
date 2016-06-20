<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<table border="1">
	<tr>
		<td>제목 :</td><td>${message.title }</td> <td>받은날짜 :</td><td>${message.time_posted }</td>	
	</tr>
	<tr>
		<td>내용 :</td><td colspan="3">${message.content }</td>
	</tr>
</table>
<input type="button" value="목록으로" onclick="location.href='${initParam.root}interceptor_message_list.do' ">
