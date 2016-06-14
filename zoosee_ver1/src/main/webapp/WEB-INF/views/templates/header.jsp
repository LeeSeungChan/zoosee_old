<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<a href="${initParam.root}home.do">홈</a>

<c:choose>
	<c:when test="${empty sessionScope.mvo}">
		<a href="${initParam.root}member_login.do">로그인</a>
		<a href="${initParam.root}member_register.do">회원가입</a>
	</c:when>
	<c:otherwise>
		${sessionScope.mvo.name}님 환영
		<a href="${initParam.root}logout.do">로그아웃</a>
		<a href="${initParam.root}pet_register.do">펫등록</a>
		<a href="${initParam.root}pet_list.do">펫목록</a>
		<a href="${initParam.root}petsitter_register.do">돌보미신청</a>
		<a href="${initParam.root}petsitter_updateform.do?id=${sessionScope.mvo.id}">돌보미정보수정</a>
		<a href="${initParam.root}qna_board_register.do">qna 등록</a>
		<a href="${initParam.root}qna_list.do">qna 목록</a><br>
		<a href="${initParam.root}member_detail.do">회원정보</a><!-- //관리자 페이지 -->
		<a href="${initParam.root}petsitter_petsitterList.do?value=recog">회원관리</a><!-- //관리자 페이지 -->
		<a href="${initParam.root}admin_qna_list.do?when=all">관리자qna 목록</a><!-- //관리자 페이지 -->
	</c:otherwise>
</c:choose>
