<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<script type="text/javascript">
	$(document).ready(function() {
		$("#registerQNAForm").submit(function() {
			if ($("#title").val() == "") {
				alert("제목을 입력하세요.");
				$("#title").focus();
				return false;
			} else if ($("#question").val() == "") {
				alert("질문을 입력하세요.");
				$("#question").focus();
				return false;
			}
		});
	});
</script>

<link rel="stylesheet" type="text/css"
	href="${initParam.root}resources/css/sb.css">
<div class="BJMainDiv"
	style="border: 1px solid red; margin-bottom: 10%;">
	<div class="BJPanel" style="width: 80%; margin-left: 10%;">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title">1:1 Q&A 게시판</h3>
			</div>
			<div class="panel-body">1:1 Q&A 게시판은 고객님의 궁금증을 풀어드리기 위한 공간입니다.
			</div>
		</div>
		<div class="well well-sm">Question Write</div>
	</div>
	<div class="BJMain2Div">
		<div class="SBHrAllLine">
			<form id="registerQNAForm" action="interceptor_registerQNA.do">
				<table class="SBtable">
					<tr>
						<td style="width: 15%;"><label>Title</label></td>
						<td style="width: 85%;"><input class="SBform-text"
							type="text" id="title" name="title"></td>
					</tr>
					<tr>
						<td><label>Question</label></td>
						<td><textarea class="SBform-textarea" id="question"
								name="question" style="height: 400px; resize: none;"></textarea></td>
				</table>
				<div class="SBbtn_1">
					<input type="submit" class="active SBbtn btn-default" value="질문 등록">
				</div>
			</form>
		</div>
	</div>
</div>