<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	$(document).ready(function() {
		$("#update").click(function() {
			location.replace("${initParam.root}interceptor_member_update.do");
		});
		$("#delete").click(function() {
			if (confirm("탈퇴하시겠습니까?")) {
				location.replace("${initParam.root}interceptor_member_delete.do");
			}
		});
    	$("input:radio[name=existence][value=" + '<c:out value="${ mvo.existence }"/>' + "]").attr("checked","checked");
	});
</script>
아이디
<input type="text" name="id" value="${mvo.id }" readonly="readonly">
<br>
이름
<input type="text" name="name" value="${mvo.name }" readonly="readonly">
<br>
주소
<input type="text" name="address" value="${mvo.address }"
	readonly="readonly">
<br>
이메일
<input type="email" name="email" value="${mvo.email }"
	readonly="readonly">
<br>
연락처
<input type="text" name="tel" value="${mvo.tel }" readonly="readonly">
<br>
직업
<input type="text" name="job" value="${mvo.job }" readonly="readonly">
<br>
펫 양육 경험 <br>
<input type="radio" name="existence" value="키워본 경험이 없다." disabled="disabled" > 키워본 경험이 없다<br>
<input type="radio" name="existence" value="키워본 경험이 없다." disabled="disabled" > 키워본 경험이 있다<br>
<input type="radio" name="existence" value="현재 키우고 있다." disabled="disabled"> 현재 키우고 있다<br>
<input type="button" value="수정" id="update">
<input type="button" value="탈퇴" id="delete">