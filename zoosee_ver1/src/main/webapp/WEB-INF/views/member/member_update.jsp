<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
	$(document).ready(function(){
		$("input:radio[name=existence][value=" + '<c:out value="${ mvo.existence }"/>' + "]").attr("checked","checked");
		$("#password").keyup(function(){
			$("#passCheckView").empty();
			$("#passView").empty();
			if($("#password").val().length<6){
				$("#passView").html("비밀번호는 6자 이상 가능");
			} else{
				$("#passView").html("비밀번호 사용 가능");
				if($("#passwordCheck").val()==""){
					$("#passCheckView").html("비밀번호를 재확인하세요.");
				}else{
					if($("#passwordCheck").val()==$("#password").val()){
						$("#passCheckView").html("비밀번호 일치");
					}else{
						$("#passCheckView").html("비밀번호 불일치");
					}
				}
			}
		});
		$("#passwordCheck").keyup(function(){
			$("#passCheckView").empty();
			if($("#passwordCheck").val()==$("#password").val()){
				$("#passCheckView").html("비밀번호 일치");
			}else{
				$("#passCheckView").html("비밀번호 불일치");
			}
		});
		$("#updateForm").submit(function(){
			if($("#name").val()==""){
				alert("이름를 입력하세요.");
				return false;
			}else if($("#password").val()==""){
				alert("비밀번호를 입력하세요.");
				return false;
			}else if($("#passwordCheck").val()==""){
				alert("비밀번호를 확인하세요.");
				return false;
			}else if($("#address").val()==""){
				alert("주소를 입력하세요.");
				return false;
			}else if($("#email").val()==""){
				alert("메일을 입력하세요.");
				return false;
			}else if($("#tel").val()==""){
				alert("전화번호를 입력하세요.");
				return false;
			}else if($("#job").val()==""){
				alert("직업을 입력하세요.");
				return false; 
			}else if($("#passView").html()!="비밀번호 사용 가능"){
				alert("사용가능한 비밀번호를 입력하세요.");
				return false;
			}else if($("#passCheckView").html()!="비밀번호 일치"){
				alert("비밀번호를 일치하세요.");
				return false;
			}else if($("input:radio[name=existence]:checked").length==0){
				alert("펫 양육 경험을 선택하세요.");
				return false;
			}
		});
		$("#cancle").click(function(){
			if(confirm("회원 정보 수정을 취소하시겠습니까?")){
				location.href="member_detail.do";
			}
		});
	});
</script>
<form action="member_update_result.do" method="post" id="updateForm">
	<table border="1">
		<tr>
			<td>아이디 </td><td><input type="text" name="id" value="${mvo.id}" readonly="readonly"></td>
		</tr>
		<tr>
			<td>비밀번호 </td>
			<td>
			<input type="password" name="password" id="password"  >
			<span id="passView"></span>
			</td>
		</tr>
		<tr>
			<td>비밀번호 확인 </td>
			<td>
			<input type="password" id="passwordCheck" >
			<span id="passCheckView"></span>
			</td>
		</tr>
		<tr>
			<td>이름 </td><td><input type="text" name="name" value="${mvo.name}" id="name" ></td>
		</tr>
		<tr>
			<td>주소 </td><td><input type="text" name="address" value="${mvo.address}" id="address"></td>
		</tr>
		<tr>
			<td>이메일 </td><td><input type="email" name="email" value="${mvo.email}" id="email"></td>
		</tr>
		<tr>
			<td>연락처 </td><td><input type="text" name="tel" value="${mvo.tel}" id="tel"></td>
		</tr>
		<tr>
			<td>직업 </td><td><input type="text" name="job" value="${mvo.job}" id="job"></td>
		</tr>
		<tr>
			<td> 펫 양육 경험 </td>
			<td>
			<input type="radio" name="existence" value="A" id="existence"> 키워본 경험이 없다<br>
			<input type="radio" name="existence" value="B" id="existence"> 키워본 경험이 있다<br>
			<input type="radio" name="existence" value="C" id="existence"> 현재 키우고 있다<br>
			</td>
		</tr>
	</table>
	<input type="submit" value="수정" > <input type="button" value="취소" id="cancle">
</form>