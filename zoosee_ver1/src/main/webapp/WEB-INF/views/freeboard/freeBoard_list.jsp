<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
	$(document).ready(function(){
		$("#listForm :input[name=writeBtn]").click(function(){
			location.href="${initParam.root}freeBoard_write.do";
		});
	});
</script>
<form method="post" id="listForm">
<table border="1" >
		<caption>자유게시판</caption>
		<thead>
		<tr>
			<th class="no">NO</th>
			<th class="title">제목</th>
			<th class="name">이름</th>
			<th class="date">작성일</th>
			<th class="hit">HIT</th>
			</tr>
		</thead>
		<tbody>			
		<c:forEach var="freeBoardList" items="${requestScope.listVO.list}">				
			<tr>
			    <td>${freeBoardList.freeBoardNo }</td>				
				<td>
				<c:choose>
				<c:when test="${sessionScope.mvo!=null}">
				<a href="${initParam.root}freeBoard_showFreeBoardContent.do?freeBoardNo=${freeBoardList.freeBoardNo }">
				${freeBoardList.freeBoardTitle}</a>
				</c:when>
				<c:otherwise>
				${freeBoardList.freeBoardTitle}
				</c:otherwise>
				</c:choose>
				</td>
				<td>${freeBoardList.memberVO.name }</td>
				<td>${freeBoardList.freeBoardTimePosted }</td>
				<td>${freeBoardList.freeBoardHits }</td>
			</tr>	
			</c:forEach>
		</tbody>	
		<tr>
			<td>			
				<c:if test="${sessionScope.mvo!=null }">
					<input type="button" name="writeBtn" value="글쓰기" >	
				</c:if>
			</td>
			<td colspan="3" align="center">
				<c:set var="pb" value="${requestScope.listVO.pagingBean}"></c:set>
			    
				<c:if test="${pb.previousPageGroup}">
					<a href="${initParam.root}freeBoard_list.do?pageNo=${pb.startPageOfPageGroup-1}">◀&nbsp; </a>	
				</c:if>
				
				<c:forEach var="i" begin="${pb.startPageOfPageGroup}" end="${pb.endPageOfPageGroup}">
					<c:choose>
						<c:when test="${pb.nowPage!=i}">
							<a href="${initParam.root}freeBoard_list.do?pageNo=${i}">${i}</a> 
						</c:when>
						<c:otherwise>
							${i}
						</c:otherwise>
					</c:choose>
					&nbsp;
				</c:forEach>	 
				
				<c:if test="${pb.nextPageGroup}">
					<a href="${initParam.root}freeBoard_list.do?pageNo=${pb.endPageOfPageGroup+1}">▶</a>
				</c:if>
			</td>
		</tr>
	</table><br></br>
</form>

	
