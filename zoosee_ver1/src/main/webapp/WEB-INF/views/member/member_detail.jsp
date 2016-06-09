<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(document).ready(function() {
		$("#update").click(function() {
			location.replace("${initParam.root}member_update.do");
		});
		$("#delete").click(function() {
			if (confirm("탈퇴하시겠습니까?")) {
				location.replace("${initParam.root}member_delete.do");
			}
		});
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
<input type="button" value="수정" id="update">
<input type="button" value="탈퇴" id="delete">