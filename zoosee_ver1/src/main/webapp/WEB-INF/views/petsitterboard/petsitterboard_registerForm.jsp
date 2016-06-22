<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
	<script type="text/javascript">
		$(document).ready(function(){
			
			// 공란체크하기
			$("#petsitterboardregForm").submit(function(){
				if($("#petsitterboardregForm :input:radio[name=service]:checked").length == 0){
					alert("서비스를 선택하세요.");
					return false;
				}else if($("#petsitterboardregForm :input[name=petsitterboard_title]").val() == ""){
					alert("제목을 입력하세요.");
					return false;
				}else if($("#petsitterboardregForm #ta").val() == ""){
					alert("내용을 입력하세요.");
					return false;
				}
			});
			
			$(".datepicker").datepicker(); 
			
			$.datepicker.regional['ko'] = {
				closeText: '닫기',
			    prevText: '이전달',
			    nextText: '다음달',
			    //currentText: '오늘',
			    monthNames: ['1월(JAN)','2월(FEB)','3월(MAR)','4월(APR)','5월(MAY)','6월(JUN)',
			      			 '7월(JUL)','8월(AUG)','9월(SEP)','10월(OCT)','11월(NOV)','12월(DEC)'],
			    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			    dayNames: ['일','월','화','수','목','금','토'],
			    dayNamesShort: ['일','월','화','수','목','금','토'],
			    dayNamesMin: ['일','월','화','수','목','금','토'],
			    weekHeader: 'Wk',
			    dateFormat: 'yy-mm-dd',
			    firstDay: 0,
			    isRTL: false,
			    showMonthAfterYear: true,
			    yearSuffix: '',
			    showOn: 'both',
			    //buttonText: "달력",
			    buttonImage:'${initParam.root}resources/image/calendar-1.jpg',
			    buttonImageOnly: true,
			    changeMonth: true,
			    changeYear: true,
			    showButtonPanel: true,
			   	yearRange: ':c+10',
			};
			$.datepicker.setDefaults($.datepicker.regional['ko']);
			    
			$('#sdate').datepicker();
			$('#sdate').datepicker("option", "maxDate", $("#edate").val());
			$('#sdate').datepicker("option", "onClose", function ( selectedDate ) {
				$("#edate").datepicker( "option", "minDate", selectedDate );
			});
			 
			$('#edate').datepicker();
			$('#edate').datepicker("option", "minDate", $("#sdate").val());
			$('#edate').datepicker("option", "onClose", function ( selectedDate ) {
				$("#sdate").datepicker( "option", "maxDate", selectedDate );
			});
			
			$("input:radio[name=service][value=" + "<c:out value='${petsitterVO.service}'/>" + "]").attr("checked","checked");
	    	$("input:radio[name=petSize][value=" + "<c:out value='${petsitterVO.petSize}'/>" + "]").attr("checked","checked");
	    	$("input:radio[name=petType][value=" + "<c:out value='${petsitterVO.petType}'/>" + "]").attr("checked","checked");
	    
	    	$("#clickb").click(function(){
	    		alert($("#sdate").val() + typeof $("#sdate").val());
	    		alert($("#edate").val() + typeof $("#edate").val());
	    	})
		});
	</script>

	글 등록<br/>
	<form method="post" action="interceptor_petsitterboardRegister.do" id="petsitterboardregForm">
		<input type="hidden" name="petsitterNo" value="${petsitterVO.petsitterNo}" />
		
		<div>
			시작일 <input type="text" class="datepicker" id="sdate" name="startDay">
			마감일 <input type="text" class="datepicker" id="edate" name="endDay">
		</div>
		<input type="button" id="clickb" />
		
		가능 동물수 <input type="text" name="petNumber" value="${petsitterVO.petNumber}" /><br/>
		
		서비스
		<input type="radio" name="service" value="목욕"/>목욕
		<input type="radio" name="service" value="산책"/>산책
		<input type="radio" name="service" value="픽업"/>픽업<br/>
		
		가격 <input type="text" name="price" value="${petsitterVO.price}" /><br/>
		
		펫사이즈<br/> 
		<input type="radio" name="petSize" value="small" />소형
		<input type="radio" name="petSize" value="middle" />중형 
		<input type="radio" name="petSize" value="laarge" />대형 <br/>
		
		펫타입<br/>
		<input type="radio" name="petType" value="dog"/>강아지
		<input type="radio" name="petType" value="cat"/>고양이
		<input type="radio" name="petType" value="bird"/>조류
		<input type="radio" name="petType" value="fish"/>어류 
		<input type="radio" name="petType" value="etc"/>기타<br/>
		
		제목 <input type="text" name="petsitterboard_title" /><br/>
		내용<textarea id="ta" name="petsitterboard_contents" cols="70" rows="10" ></textarea><br/>
		<input type="submit" value="등록" />
	</form>
	