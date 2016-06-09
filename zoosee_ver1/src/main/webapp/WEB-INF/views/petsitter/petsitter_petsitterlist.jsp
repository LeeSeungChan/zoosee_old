<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- 펫시터  리스트 보여주는 화면
	   
 -->
 <script>
	 $(document).ready(function(){;
		 $("#petsitterlistForm :input[name=deleteBtn]").click(function(){
			//alert($(this).parent().parent().children().eq(6).html("승인됨"));
			 if(confirm("펫시터를 추방하시겠습니까?")){
				 $.ajax({
					 type:"post",
					 url:"petsitter_deletePetsitter.do",
					 data:"petsitterNo="+$(this).parent().parent().children().eq(1).text(),
				 });
				$(this).parent().parent().children().eq(6).html("삭제됨")
			 }
			 
		 });
		
	});
 </script>
 
<a href="${initParam.root}member_memberlist.do?rank=nomal">일반회원 리스트</a> | 펫시터 리스트 | <a href="${initParam.root}petsitter_petsitterList.do?value=nonrecog">펫시터 신청자 리스트</a>

<h3>펫시터 리스트</h3>
 <form id="petsitterlistForm">
	<table border=1 cellpadding=5 id="petsitterlistTable">
		<c:forEach items="${requestScope.list }" var="l">
			<tr>
				<td>펫시터넘버:</td> 
				<td>${l.petsitterNo}</td> 
				<td>아이디:</td> 
				<td>${l.memberVO.id}</td> 
				<td>이름:</td> 
				<td><a href="petsitter.getPetsitterVO.do?petsitterNo=${l.petsitterNo}&value=recog">${l.memberVO.name}</a></td> 
				<td><input type="button"  name="deleteBtn" value="탈퇴"></td> 
			 </tr>
		</c:forEach>
	</table>
	 
 </form>



 
