<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(document).ready(function() {
		$("#id").keyup(function() {
			$("#idView").empty();
			if ($("#id").val().length < 4 || $("#id").val().length > 11) {
				$("#idView").html("아이디는 4자 이상 11자 이하 가능");
			} else {
				$("#idView").html("사용가능");
			}
		});
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
		$("#memberRegisterForm").submit(function(){
			 if($("#id").val()==""){
				alert("아이디를 입력하세요.");
				return false;
			}else if($("#password").val()==""){
				alert("비밀번호를 입력하세요.");
				return false;
			}else if($("#passwordCheck").val()==""){
				alert("비밀번호확인란을 입력하세요.");
				return false;
			}else if($("#name").val()==""){
				alert("이름을 입력하세요.");
				return false;
			}else if($("#address").val()==""){
				alert("주소를 입력하세요.");
				return false;
			}else if($("input:radio[name=gender]:checked").length==0){
				alert("성별을 선택하세요.");
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
			}else if($("#idView").html()!="사용가능"){
				alert("사용가능한 아이디를 입력하세요.");
				return false;
			}else if($("#passView").html()!="비밀번호 사용 가능"){
				alert("사용가능한 비밀번호를 입력하세요.");
				return false;
			}else if($("#passCheckView").html()!="비밀번호 일치"){
				alert("비밀번호를 일치하세요.");
				return false;
			}
		});
	});
</script>

	<form action="registerMember.do" method="post" id="memberRegisterForm">
		아이디 <input type="text" name="id" id="id">
		<span id="idView"></span><br>
		비밀번호 <input type="password" name="password" id="password">
		<span id="passView"></span> <br>
		비밀번호 확인 <input type="password" name="passwordCheck" id="passwordCheck">
		<span id="passCheckView"></span>
		<br> 이름 <input type="text" name="name" id="name"><br>
		주소 <input type="text" name="address" id="address"><br> 
		성별<input type="radio" name="gender" value="man" >남성 
		<input type="radio" name="gender" value="woman" >여성<br>
		이메일 <input type="email" name="email" id="email"> <br> 
		연락처 <input type="text" name="tel" id="tel"><br> 
		직업 <input type="text" name="job" id="job"><br>
		<input type="submit" value="등록">
	</form>