<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link rel="stylesheet" type="text/css"
	href="${initParam.root}resources/css/sb.css">
			<!-- 더블헤더 -->
<div class="BJHeaderLayout0">
<div class="BJHeaderLayout" >
<div class="BJHeader2" >
	<a class="BJA"  href="${initParam.root}interceptor_admin_qna_list.do?when=all">모든 Q&A 목록</a>
	<a class="BJA" href="${initParam.root}interceptor_admin_qna_list.do?when=nonAnswer">답변 미등록 Q&A 목록</a>
	<a class="BJA" href="${initParam.root}interceptor_admin_qna_findbyid.do">아이디로 Q&A 검색</a>


	</div>
</div>
</div>
<div class="BJMainDiv" style="margin-bottom: 10%;">
	<div class="BJPanel" style="width: 80%; margin-left: 10%;">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title">1:1 Q&A 게시판</h3>
			</div>
			<div class="panel-body">1:1 Q&A 게시판은 고객님의 궁금증을 풀어드리기 위한 공간입니다.
			</div>
		</div>
		<div class="well well-sm">1:1 Question 게시물 리스트</div>
	</div>
	<div class="BJMain2Div" align="center">
<div class="BJWriteTableLine">
<div class="SBHrAllLine_1">
		
		<table class="table table-striped table-hover " style="width: 100%">
			<tr class="active">
				<th style="width: 5%;">No</th>
				<th style="width: 40%;">Title</th>
				<th style="width: 18%;">Writer</th>
				<th style="width: 27%;">Posted Time</th>
				<th style="width: 10%;">Answer</th>
			</tr>
			<c:forEach items="${listVO.list }" var="Question">
				<tr>
					<td>${Question.boardNo }</td>
					<td><a
						href="${initParam.root}interceptor_admin_showQuestion.do?boardNo=${Question.boardNo}">${Question.title }</a></td>
					<td><a
						href="${initParam.root}interceptor_member_getMemberVO.do?id=${Question.memberVO.id}">${Question.memberVO.name}(${Question.memberVO.id})</a></td>
					<td>${Question.timePosted }</td>
					<td><c:choose>
							<c:when test="${empty Question.answer}">X</c:when>
							<c:otherwise>O</c:otherwise>
						</c:choose></td>
				</tr>
			</c:forEach>
		</table>
		</div>
		</div>
		<ul class="pagination pagination-sm">
			<c:if test="${listVO.list!=null }">
				<c:set var="pb" value="${listVO.pagingBean}"></c:set>
				<c:if test="${pb.previousPageGroup}">
					<li><a
						href="interceptor_admin_qna_list.do?pageNo=${pb.startPageOfPageGroup-1}&when=${when}">&laquo;</a></li>
				</c:if>
				<c:forEach var="i" begin="${pb.startPageOfPageGroup}"
					end="${pb.endPageOfPageGroup}">
					<c:choose>
						<c:when test="${pb.nowPage!=i}">
							<li><a
								href="interceptor_admin_qna_list.do?pageNo=${i}&when=${when}">${i}</a></li>
						</c:when>
						<c:otherwise>
							<li class="active"><a>${i}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:if test="${pb.nextPageGroup}">
					<li><a
						href="interceptor_qna_list.do?pageNo=${pb.endPageOfPageGroup+1}&when=${when}">&laquo;</a></li>
				</c:if>
			</c:if>
		</ul>
	</div>
</div>