<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="${initParam.root}resources/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	$.ajax({
		type:"POST",
		url:"countMessage.do",
		data:id="id=${sessionScope.mvo.id}",
		dataType:"json", 
		success:function(result){
			if(result.count=="0"){
			$("#message").html("메세지");
			}else{
			$("#message").html("메세지"+result.count);
			}
		}
	})
</script>


<a href="${initParam.root}home.do">홈</a>

<c:choose>
	<c:when test="${empty sessionScope.mvo}">
		<a href="${initParam.root}member_login.do">로그인</a>
		<a href="${initParam.root}member_register.do">회원가입</a>
	</c:when>
	<c:otherwise>
		${sessionScope.mvo.name}님 환영
		<a href="${initParam.root}logout.do">로그아웃</a>
		<a href="${initParam.root}interceptor_pet_register.do">펫등록</a>
		<a href="${initParam.root}interceptor_pet_list.do">펫목록</a>
		<a href="${initParam.root}interceptor_petsitter_register.do">돌보미신청</a>
		<a href="${initParam.root}interceptor_petsitter_updateform.do?id=${sessionScope.mvo.id}">돌보미정보수정</a>
		<a href="${initParam.root}interceptor_qna_board_register.do">qna 등록</a>
		<a href="${initParam.root}interceptor_qna_list.do">qna 목록</a><br>
		<a href="${initParam.root}interceptor_member_detail.do">회원정보</a><!-- //관리자 페이지 -->
		<a href="${initParam.root}interceptor_petsitter_petsitterList.do?value=recog">회원관리</a><!-- //관리자 페이지 -->
		<a href="${initParam.root}interceptor_admin_qna_list.do?when=all">관리자qna 목록</a><!-- //관리자 페이지 -->
		<a href="${initParam.root}interceptor_freeBoard_list.do?">자유게시판</a>
		<a href="${initParam.root}interceptor_message_list.do" id="message">메세지</a>
		
		<c:if test="${sessionScope.mvo.rank == 'petsitter' || sessionScope.mvo.rank == 'petmaster'}">
			<a href="${initParam.root}interceptor_petsitterboard_registerform.do?id=${sessionScope.mvo.id}">글 등록</a>
		</c:if>
	</c:otherwise>
</c:choose>
