<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %> 
<!-- 멤버  리스트 보여주는 화면 -->
 <script>
	 /* $(document).ready(function(){;
		 $("#memberlistForm :input[name=deleteBtn]").click(function(){
			//alert($(this).parent().parent().children().eq(6).html("승인됨"));
			 if(confirm("멤버를 추방하시겠습니까?")){
				 $.ajax({
					 type:"post",
					 url:"member_deleteMember.do",
					 data:"id="+$(this).parent().parent().children().eq(1).text(),
				 });
				$(this).parent().parent().children().eq(6).html("삭제됨")
			 }
		 });
	}); */
 </script>
 
일반회원 리스트 | <a href="${initParam.root}interceptor_petsitter_petsitterList.do?value=recog">펫시터 리스트</a> | <a href="${initParam.root}interceptor_petsitter_petsitterList.do?value=nonrecog">펫시터 신청자 리스트</a>

<h3>일반회원 리스트</h3>
 <form id="memberlistForm">
	<table border=1  id="memberlistTable">
		<c:forEach items="${requestScope.list }" var="l">
			<tr>
				<td>아이디:</td> 
				<td>${l.id}</td> 
				<td>이름:</td> 
				<td><a href="interceptor_member_getMemberVO.do?id=${l.id}">${l.name}</a></td> 
				<!-- <td><input type="button"  name="deleteBtn" value="탈퇴"></td>  -->
			 </tr>
		</c:forEach>
	</table>
	 
 </form>



 
