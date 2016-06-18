<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- 펫시터 승인 대기 리스트 보여주는 화면
	   승인 버튼을 누르면 petsitter_recognitionPetsitter.do로 petsitterNo 넘김
	   petsitterNo로 해당 펫시터 찾아서 recog -> "승인"으로 update
	 
	 펫시터 대기 리스트에서 각 이름을 클릭시 그 사람의 펫시터 신청서를 볼 수 있어야함
 -->
 <script>
	 $(document).ready(function(){;
		 $("#recogForm :input[name=recogBtn]").click(function(){
			//alert($(this).parent().parent().children().eq(6).html("승인됨"));
			 if(confirm("승인하시겠습니까?")){
				 $.ajax({
					 type:"post",
					 url:"interceptor_petsitter_recognitionPetsitter.do",
					 data:"petsitterNo="+$(this).parent().parent().children().eq(1).text(),
				 });
				$(this).parent().parent().children().eq(6).html("승인됨")
			 }
			 
		 });
		
	});
 </script>
 <a href="${initParam.root}interceptor_member_memberlist.do?rank=normal">일반회원 리스트</a> | <a href="${initParam.root}interceptor_petsitter_petsitterList.do?value=recog">펫시터 리스트</a> | 펫시터 신청자 리스트

 <h3>펫시터 신청자 리스트</h3>
 <form id="recogForm">
	<table border=1  id="recogTable">
		<c:forEach items="${requestScope.listVO.list }" var="l">
			<tr>
				<td>펫시터넘버:</td> 
				<td>${l.petsitterNo}</td> 
				<td>아이디:</td> 
				<td>${l.memberVO.id}</td> 
				<td>이름:</td> 
				<td><a href="interceptor_petsitter.getPetsitterVO.do?petsitterNo=${l.petsitterNo}&value=nonrecog">${l.memberVO.name}</a></td> 
				<td><input type="button"  name="recogBtn" value="승인"></td> 
			 </tr>
		</c:forEach>
	</table> 
 </form>
 <br>
<br>
<c:set var="pb" value="${listVO.pagingBean}"></c:set>
<c:if test="${pb.previousPageGroup}">
	<a href="interceptor_petsitter_petsitterList.do?value=nonrecog&pageNo=${pb.startPageOfPageGroup-1}">◀</a>
</c:if>
<c:forEach var="i" begin="${pb.startPageOfPageGroup}"
	end="${pb.endPageOfPageGroup}">
	<c:choose>
		<c:when test="${pb.nowPage!=i}">
			<a href="interceptor_petsitter_petsitterList.do?value=nonrecog&pageNo=${i}">${i}</a>
		</c:when>
		<c:otherwise>
		${i}
		</c:otherwise>
	</c:choose>
</c:forEach>
<c:if test="${pb.nextPageGroup}">
	<a href="interceptor_petsitter_petsitterList.do?value=nonrecog&pageNo=${pb.endPageOfPageGroup+1}">▶</a>
</c:if>



 
