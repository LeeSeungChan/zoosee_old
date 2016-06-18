<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
 	$(document).ready(function(){
 	      var rank="${sessionScope.mvo.rank}";
 	       if(rank=="petsitter"){
 	          alert("이미 승인된 회원입니다!");
 	          $(location).attr('href',"home.do");
 	       }
 		
		$("#registerPetsitterForm").submit(function(){
			var name = $("#name").val();
			var gender = $("input[name=gender]:checked").val();
			var price = $("#price").val();
			var petNumber = $("input[name=petNumber].checked").val();
			var service = $("input[name=service]:checked").val();
			var petType = $("input[name=petType]:checked").val();
			var petSize = $("input[name=petSize]:checked").val();
			var house_img = $("#house_img").val();
			var petsitter_img = $("#petsitter_img").val();
			var checkedAll = $("input[name=checkedAll]:checked").val();

			if(name==""){
				alert("이름을 입력해 주세요!");
				return false;
			}else if(gender==undefined){
				alert("성별을 선택해 주세요!");
				return false;
			}else if(price==""){
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
		});//submit
	});

</script>


<h3 align="center">ZOOSEE 돌보미 신청서</h3>
<br>
<br>
*지원하기전 확인해주세요!<br>
ZOOSEE 는 그 어떤 스킬이나 역량보다 "동물에 대한 진심과 사랑"을 최우선으로 돌보미분을 모시고 있습니다.<br>
따라서 강아지에 대한 진심을 담아 지원서를 진정성있게 작성해주시면 감사하겠습니다!
<br>
<br>
*잠깐! 회원가입은 하셨나요?<br>
<a href="member_register.do">ZOOSEE 가입하러가기</a><br><br>

*이런 분들은 지원이 어려워요<br>
1. 미성년자 / 2. 임산부 /  3. 열살미만의 아동과 함께 거주하시는 분 / 4. 한달 20일 이상 활동이 불가능한 경우<br><br>

<form action="interceptor_petsitter_registerPetsitter.do" method="post" enctype="multipart/form-data" id="registerPetsitterForm">
지원자 성명 *<br>
주민등록상의 실명을 기재해주세요.<br>
<input type="text" name="name" id="name" size=5><br><br>

지원자 성별 *<br>
<input type="radio" name="gender" value="male">남성! <br>
<input type="radio" name="gender" value="female">여성! <br><br>


원하시는 가격(1박)* <br>
 <input type="text" size=5 name="price" id="price">원<br><br>


가능한 펫 종류* <br>
<input type="radio" name="petType" value="dog">강아지
<input type="radio" name="petType" value="cat">야옹이<br><br>

원하는 펫 크기* <br>
<input type="radio" name="petSize" value="small"> 아기팻
<input type="radio" name="petSize" value="middle"> 보통
<input type="radio" name="petSize" value="big"> 커더란 팻!<br> <br>

돌봄 가능한 팻 * <br>
<input type="radio" name="petNumber" value="1">한마리
<input type="radio" name="petNumber" value="2">두마리
<input type="radio" name="petNumber" value="3">세마리<br><br>

제공 가능한 서비스* <br>
<input type="radio" name="service" value="목욕">목욕
<input type="radio" name="service" value="산책">산책
<input type="radio" name="service" value="픽업">픽업<br><br>

집 사진* <br>
 <input type="file" name="file[0]" id="house_img"><br><br>

돌보미사진* <br>
<input type="file" name="file[1]" id="petsitter_img"><br><br>

돌보미는 지원자 '본인에 한해서만' 활동 가능합니다. 확인하셨나요? *<br>
<input type="radio" name="checkedAll" >네 확인했습니다! <br><br>
<input type="submit" value="신청하기">

</form>