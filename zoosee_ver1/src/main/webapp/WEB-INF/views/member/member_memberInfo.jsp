<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 멤버 정보 보기 -->
 <script>
	 $(document).ready(function(){;
		 $("#memberInfoForm :input[name=backBtn]").click(function(){
			location.href="${initParam.root}member_memberlist.do?rank=nomal";
			 
		 });
		
	});
 </script>
 
 <h3>${requestScope.mvo.name }님의 회원정보</h3>
 <form id="memberInfoForm">
	<table border=1  id="memberInfoTable">
		<tr >
			<td >아이디</td> 
			<td>${requestScope.mvo.id }</td>
			<td>이름</td> 
			<td>${requestScope.mvo.name }</td> 
		</tr>
		<tr>
			<td>성별</td> 
			<td>${requestScope.mvo.gender}</td>
			<td>직업</td> 
			<td>${requestScope.mvo.job }</td> 
		</tr>
		<tr>
			<td colspan="1">전화번호</td> 
			<td colspan="3">${requestScope.mvo.tel}</td>
		</tr>
		<tr>
			<td colspan="1">주소</td> 
			<td colspan="3">${requestScope.mvo.address }</td>
		</tr>
		<tr>
		<td colspan="4" align="center"><input type="button" name="backBtn" value="확인"></td>
		</tr>
	</table>
	 
 </form>