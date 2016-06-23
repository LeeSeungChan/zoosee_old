<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<!-- 메인레이아웃 -->
<div class="BJMainDiv" >
<div class="BJPanel" style="width:80%;	 margin-left:10%;">
<div class="panel panel-primary">
  <div class="panel-heading">
    <h3 class="panel-title">자유게시판</h3>
  </div>
  <div class="panel-body">
    자유게시판은 펫맘들과 펫시터들의 소통을 위한 공간입니다.
  </div>
</div>
</div>
<!-- 자유게시판레이아웃 -->
<div class="BJMain2Div" >
	<div class="BJWriteTableLine">
				<div class="SBHrAllLine">

	<table class="table table-striped table-hover ">
  <thead>
    <tr>
      <th style="width: 10%;">No</th>
      <th style="width: 50%;">Title</th>
      <th>Name</th>
      <th>TimePosted</th>	
      <th>Hit</th>
    </tr>
  </thead>
  <tbody>
   <c:forEach var="freeBoardList" items="${requestScope.listVO.list}">				
			<tr>
			    <td>${freeBoardList.freeBoardNo }</td>				
				<td>
				<c:choose>
				<c:when test="${sessionScope.mvo!=null}">
				<a href="${initParam.root}interceptor_freeBoard_showFreeBoardContent.do?freeBoardNo=${freeBoardList.freeBoardNo }">
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
</table>

<!-- 자유게시판 페이징 -->
<div class="BJFreeBoardListPagingDiv" style=" text-align: center;">
<!-- 자유게시판 글쓰기 버튼 -->
<div class="BJFreeBoardListWriteBtnDiv" >
<c:if test="${sessionScope.mvo!=null }">
		<a href="${initParam.root}interceptor_freeBoard_write.do" style="font-size:18px;">+ 글쓰기</a>
</c:if>
</div>
<ul class="pagination pagination-sm">
  <c:set var="pb" value="${requestScope.listVO.pagingBean}"></c:set>
  <c:choose>
		<c:when test="${pb.previousPageGroup}">
		<li><a href="${initParam.root}interceptor_freeBoard_list.do?pageNo=${pb.startPageOfPageGroup-1}">&laquo;</a></li>
		</c:when>
		<c:otherwise>
		<li class="disabled"><a >&laquo;</a></li>
		</c:otherwise>
	</c:choose>
  
  <c:forEach var="i" begin="${pb.startPageOfPageGroup}" end="${pb.endPageOfPageGroup}">
		<c:choose>
			<c:when test="${pb.nowPage!=i}">
				<li><a href="${initParam.root}interceptor_freeBoard_list.do?pageNo=${i}">${i}</a></li>
			</c:when>
			<c:otherwise>
				<li class="active"><a >${i}</a></li>
			</c:otherwise>
		</c:choose>
	</c:forEach>	 

	
	
	<c:choose>
		<c:when test="${pb.nextPageGroup}">
		<li><a href="${initParam.root}interceptor_freeBoard_list.do?pageNo=${pb.endPageOfPageGroup+1}">&raquo;</a></li>
		</c:when>
		<c:otherwise>
		<li class="disabled"><a >&raquo;</a></li>
		</c:otherwise>
	</c:choose>

  
</ul>
	
</div>

</div>
</div>

</div>
</div>


	
