<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(document).ready(function(){
		$("#findForm").submit(function(){
			if($("#id").val().length<4||$("#id").val().length>11){
				alert("아이디는 4자 이상 11자 이하만 가능합니다. 정확한 아이디를 입력하세요.");
				$("#id").focus();
				return false;
			}
		});
	});
</script>
<a href="${initParam.root}interceptor_admin_qna_list.do?when=all">모든 qna 목록</a>|
<a href="${initParam.root}interceptor_admin_qna_list.do?when=nonAnswer">답변 미등록 qna 목록</a>|
<a href="${initParam.root}interceptor_admin_qna_findbyid.do">아이디로 Q&A 검색</a>

<form id="findForm" action="${initParam.root}interceptor_admin_qna_find_view.do">
	<input type="text" id="id" name="id">
	<input type="submit" value="검색">
</form>