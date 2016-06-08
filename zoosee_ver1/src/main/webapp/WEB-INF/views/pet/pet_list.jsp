<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table border="1">
	<c:forEach items="${list }" var="L">
		<tr>
			<td><a href="${initParam.root}pet_detail.do?petNo=${L.petNo}">${L.petName }</a></td>
			<td><img src="${L.petImg}" width="175" height="250"></td>
		</tr>
	</c:forEach>
</table>