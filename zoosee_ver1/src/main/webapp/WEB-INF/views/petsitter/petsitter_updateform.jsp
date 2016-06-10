<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(document).ready(function(){
	 	
	       $("#updateForm").submit(function(){
	    	    var price = $("#price").val();
				var petNumber = $("input[name=petNumber].checked").val();
				var service = $("input[name=service]:checked").val();
				var petType = $("input[name=petType]:checked").val();
				var petSize = $("input[name=petSize]:checked").val();
				var house_img = $("#house_img").val();
				var petsitter_img = $("#petsitter_img").val();
				var checkedAll = $("input[name=checkedAll]:checked").val();
				
				 if(price==""){
						alert("가격을 입력해주세요!");
						return false;
					}else if(isNaN(price)){
						alert("가격을 숫자로 입력해주세요!");
						return false;
					}else if(service==undefined){
						alert("제공 가능한 서비스를 선택해주세요!")
						return false;
					}else if(petType==undefined){
						alert("팻 종류를 선택해주세요!");
						return false;
					}else if(petSize==undefined){
						alet("팻 사이즈를 선택해주세요!");
						return false;
					}else if(house_img==""){
						alert("집 사진을 등록해주세요!");
						return false;
					}else if(petsitter_img==""){
						alert("본인 사진을 등록해주세요!");
						return false;
					}else if(checkedAll==undefined){
						alert("필수사항에 체크해주세요!");
						return false;
					}
				 if (confirm("수정 하시겠습니까?")){
					 	return true;
					}else{
					 	return false;
					}
	       });//submit
	});//ready

</script>

<form name="updateForm" action="petsitter_update.do" style="text-align: center;"
method="post" enctype="multipart/form-data" id="updateForm">
<h3>ZOOSEE 돌보미 정보 수정</h3>
<br>
<br>
*수정하기전 확인해주세요!<br>
회원정보 수정시 일반등급의 회원으로 재조정되며 관리자의 승인을 다시 받아야 합니다.<br>
승인신청은 자동으로 되며 관리자 승인 후 돌보미게시판을 이용하실 수 있습니다!<br>
<br>
<br>
사진파일1<br>
<img src="${petsitterVO.houseImg}" style="max-width: auto; height: auto;"> <br><br>
사진파일2<br>
<img src="${petsitterVO.petsitterImg}" style="max-width: auto; height: auto;"> <br><br>
돌보미 아이디*<br>
<input type="text" size=5 readonly="readonly" value="${petsitterVO.memberVO.id}"><br><br>

돌보미 성명*<br>
<input type="text" size=5 readonly="readonly" value="${petsitterVO.memberVO.name} ">님<br><br>

원하시는 가격(1박)* <br>
 <input type="text" size=5 name="price" id="price">원<br><br>

돌봄 가능한 펫 종류*<br>
<input type="checkbox" name="petType" value="멍뭉이">멍뭉이
<input type="checkbox" name="petType" value="야옹이">야옹이<br><br>

원하시는 크기*<br>
<input type="radio" name="petSize" value="small"> 아기팻
<input type="radio" name="petSize" value="normal"> 보통
<input type="radio" name="petSize" value="big"> 커더란 팻!<br> <br>

돌봄 가능한 팻*<br>
<input type="radio" name="petNumber" value="1">한마리
<input type="radio" name="petNumber" value="2">두마리
<input type="radio" name="petNumber" value="3">세마리 이상<br><br>

제공 가능한 서비스*<br>
<input type="checkbox" name="service" value="목욕">목욕
<input type="checkbox" name="service" value="산책">산책
<input type="checkbox" name="service" value="픽업">픽업<br><br>

돌보미 서식지의 사진* <br>
 <input type="file" name="file[0]" id="house_img" ><br><br>
 
돌보미사진* <br>
<input type="file" name="file[1]" id="petsitter_img"><br><br>

공지사항 확인하셨나요? *<br>
<input type="radio" name="checkedAll" >네 확인했습니다! <br><br>
<input type="submit" value="수정하기">

<input type="hidden" name="petsitterNo" value="${petsitterVO.petsitterNo}">

</form>    
  
    