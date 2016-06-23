<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="BJMainDiv" style="margin-bottom: 10%;">
	<div class="BJPanel" style="width: 80%; margin-left: 10%;">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h3 class="panel-title">돌보미 게시판</h3>
			</div>
			<div class="panel-body">고객님의 소중한 반려견을 위해 임시보호를 지원하는 돌보미 게시판입니다.
			</div>
		</div>
		<div class="well well-sm">돌보미 정보 확인 및 예약</div>
	</div>
	<c:set var="petsitterVO" value="${petsitterboardVO.petsitterVO }"></c:set>
	<c:set var="memberVO" value="${petsitterboardVO.petsitterVO.memberVO}"></c:set>
	<div class="BJMain2Div">
		<div style="float: right; width: 30%;">
		<!-- 리모콘 -->
			<div class="SBremote">
				<div class="SBremote_main">
					<div class="SBremote_Img_form">
						<img src="${initParam.root}${petsitterVO.petsitterImg}"
							class="SBImg">
					</div>
					<div class="SBremote_name">
						<h4 style="font-weight: bold; color: gray;">${memberVO.name}</h4>
						<h6 style="font-size:11px;">${memberVO.address}</h6>
					</div>
				</div>
				<br>
				<div class="SBremote_main2">
					<div align="center">
						<span class="SBrenote_price">${petsitterVO.price}원</span> / 1박
					</div>
					<table class="table"
						style="margin-top: 5%; border-bottom: 1px solid #DDDDDD;">
						<tr>
							<td><label style="float: left;">1박</label></td>
							<td><label style="float: right;">
									${petsitterVO.price}원</label></td>
						</tr>
						<tr>
							<td><label style="float: left;">부가세</label></td>
							<td><label style="float: right;">
									${petsitterVO.price%10}원</label></td>
						</tr>
						<tr>
							<td><label style="float: left;">총합계</label></td>
							<td><label style="float: right;">
									${petsitterVO.price+1*10}원</label></td>
						</tr>
					</table>
				</div>
				<div class="SBremote_main3">
						<input type="submit" class="active WJbtn btn-block btn-default "
							id="reserveBtn" value="예약요청하기">
				</div>
			</div>
		</div>
	</div>
</div>

<%-- 
<form method="post" action="reserveRegister.do" id="reserveRegForm">
	<!-- 게시물 번호 -->
	<input type="hidden" name="petsitterboard_no"
		value="${petsitterboardVO.petsitterboard_no}" />
	<!-- 예약자 아이디 (로그인) -->
	<input type="hidden" name="id" value="${sessionScope.mvo.id}" />
	<!-- 돌보미 아이디 (게시물 등록) -->
	<input type="hidden" name="petsitterId"
		value="${petsitterboardVO.petsitterVO.memberVO.id}" /> <input
		type="hidden" id="hidR_DAY" name="hidR_DAY">
	<!-- 예약일수 -->
	<input type="hidden" id="hidSTD_PRICE" name="hidSTD_PRICE">
	<!-- 기준가격 -->
	<input type="hidden" id="hidADD_PRICE" name="hidADD_PRICE">
	<!-- 추가금액 -->
	<input type="hidden" id="hidFLAG" name="hidFLAG" value="2">
	<!-- 예약하기 -->
	<input type="hidden" id="hidSERVICE_CD" name="hidSERVICE_CD">
	<!-- 서비스코드 -->
	<input type="hidden" id="hidSERVICE_NM" name="hidSERVICE_NM">
	<!-- 서비스명 -->
	<input type="hidden" id="hidR_STARTDATE" name="hidR_STARTDATE">
	<!-- 시작일 -->
	<input type="hidden" id="hidR_ENDDATE" name="hidR_ENDDATE">
	<!-- 종료일 -->
	<input type="hidden" id="hidDOG_NUM" name="hidDOG_NUM">
	<!-- 반려견수 -->
	<input type="hidden" id="hidCOMMISSION_PRICE"
		name="hidCOMMISSION_PRICE">
	<!-- 수수료 -->
	<input type="hidden" id="hidPAYMENT_AMT" name="hidPAYMENT_AMT">
	<!-- 결재금액 -->
	<input type="hidden" id="hidS_MEM_EMAIL" name="hidS_MEM_EMAIL">
	<!-- 돌보미이메일 -->
	<input type="hidden" id="hidMEM_NM" name="hidMEM_NM">
	<!-- 돌보미명 -->

	<div class="contents-form-date">
		<input class="form-control form-date form-date-start datepicker"
			id="datepickerStart_s" type="text" name="datepickerStart"
			placeholder="Start Date" readonly> <input
			class="form-control form-date datepicker" id="datepickerEnd_s"
			type="text" name="datepickerEnd" placeholder="End Date" readonly>
	</div>
	<div class="contents-form-price">
		<span class='fc-orange fs-big' id='ctlPrice'>${petsitterVO.price}</span>
		/ <span id='ctlService'>1박</span> 의뢰비용에 대한 부가가치세 10%입니다.
	</div>
	<div>
		시작일 <input type="text" class="datepicker" id="sdate" name="startDay">
		마감일 <input type="text" class="datepicker" id="edate" name="endDay">
	</div>
	<br /> 반려견 추가 <input type="number" name="petCheckNumber"
		id="petCheckNumber" value="0" min="0" max="9"><br /> <br />
	총 합계 <input type="text" name="reserve_price" id="reserve_price"><br />
	<input type="submit" id="reserveBtn" value="예약요청하기" />
</form>
 --%>

<div>
	<form action="">
		<table>
			<tr>
				<td><img src="${petsitterboardVO.petsitterVO.houseImg }"
					width="500" height="500"></td>
			</tr>
		</table>
		<table>
			<tr>
				<td>댓글 ㅣ</td>
				<td>후기 ㅣ</td>
				<td>평점</td>
			</tr>
		</table>
		<hr>
		<table>
			<tr>
				<td>펫시터이름 : ${petsitterboardVO.petsitterVO.memberVO.name }</td>
			</tr>
			<tr>
				<td>희망동물 크기 : ${petsitterboardVO.petsitterVO.petSize }</td>
			</tr>
			<tr>
				<td>희망종류 : ${petsitterboardVO.petsitterVO.petType }</td>
			</tr>
			<tr>
				<td>가능 서비스 : ${petsitterboardVO.petsitterVO.service }</td>
			</tr>
			<tr>
				<td>동물 키워본 경험 :
					${petistterboardVO.petsitterVO.memberVO.existance }</td>
			</tr>
		</table>
		<hr>
	</form>
	<form>
		<table>
			<tr>
				<td>제목</td>
			</tr>
			<tr>
				<td>${petsitterboardVO.petsitterboard_title }</td>
			</tr>
			<tr>
				<td>글내용</td>
			</tr>
			<tr>
				<td>${petsitterboardVO.petsitterboard_contents }</td>
			</tr>
		</table>
	</form>
</div>
<hr>
<div>
	<form>
		<table>
			<tr>
				<td>댓글</td>
			</tr>
		</table>
	</form>
</div>