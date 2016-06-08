<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 펫시터 정보 보기 -->
 <script>
	 $(document).ready(function(){;
		 $("#petsitterInfoForm :input[name=backBtn]").click(function(){
			location.href="${initParam.root}petsitter_petsitterList.do";
			 
		 });
		
	});
 </script>
 
 <h3>${requestScope.pvo.memberVO.name }님의 회원정보</h3>
 <form id="petsitterInfoForm">
	<table border=1 cellpadding=5 id="petsitterInfoTable">
		<tr>
			<td colspan="1">사진</td> 
			<td colspan="3"><img src="${initParam.root }${requestScope.pvo.houseImg}"/></td> 
		</tr>
		<tr >
			<td >아이디</td> 
			<td>${requestScope.pvo.memberVO.id }</td>
			<td>이름</td> 
			<td>${requestScope.pvo.memberVO.name }</td> 
		</tr>
		<tr>
			<td>성별</td> 
			<td>${requestScope.pvo.memberVO.gender}</td>
			<td>직업</td> 
			<td>${requestScope.pvo.memberVO.job }</td> 
		</tr>
		<tr>
			<td colspan="1">전화번호</td> 
			<td colspan="3">${requestScope.pvo.memberVO.tel}</td>
		</tr>
		<tr>
			<td colspan="1">주소</td> 
			<td colspan="3">${requestScope.pvo.memberVO.address }</td>
		</tr>
	</table>
	 
	 
	 <h3>${requestScope.pvo.memberVO.name }님의 펫시터 신청서</h3>
	 <table border=1 cellpadding=5 id="petsitterTable">
		<tr>
			<td>돌봄 가능 마리수</td> 
			<td colspan="3" align="center">${requestScope.pvo.petNumber }</td> 
		</tr>
		<tr>
			<td>제공서비스</td> 
			<td>${requestScope.pvo.service}</td>
			<td>가격</td> 
			<td>${requestScope.pvo.price}</td>
		</tr>
		<tr>
			<td>펫사이즈</td> 
			<td>${requestScope.pvo.petSize}</td> 
			<td>펫종류</td> 
			<td>${requestScope.pvo.petType}</td> 
		</tr>
	<tr>
		<td colspan="4" align="center">
			<input type="button" name="backBtn" value="확인">
		</td>
	</tr>
	</table>
 </form>