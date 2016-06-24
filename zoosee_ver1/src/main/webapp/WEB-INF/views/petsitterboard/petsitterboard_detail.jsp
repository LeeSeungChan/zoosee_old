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
      <!-- 리모콘 -->
      <div style="float: right; width: 30%;">
         <div class="SBremote">
            <div class="SBremote_main">
               <div class="SBremote_Img_form">
                  <img src="${initParam.root}${petsitterVO.petsitterImg}"
                     class="SBImg">
               </div>
               <div class="SBremote_name">
                  <h4 style="font-weight: bold; color: gray;">${memberVO.name}</h4>
                  <h6 style="font-size: 11px;">${memberVO.address}</h6>
               </div>
            </div>
            <br>
            <div class="SBremote_main2" >
               <div style="float: left; width: 50%;">
                  <input type="text" name="StartDate" placeholder="StartDate"
                     class="datepicker" style="width: 95%; margin-right: 5%">
               </div>
               <div style="float: right; width: 50%;">
                  <input type="text" name="EndDate" placeholder="EndDate"
                     class="datepicker" style="width: 95%; margin-left: 5%">
               </div>
            </div>
            <div class="SBremote_main3">
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
            <div class="SBremote_main4">
               <input type="submit" class="active WJbtn btn-block btn-default "
                  id="reserveBtn" value="예약요청하기">
            </div>
         </div>
      </div>
      <!-- 페이지화면 -->
      <div class="SBmainDivLeft">
         <div class="SBmainDivImg">
            <div class="SBremote_Img_form2">
               <img src="${initParam.root}${petsitterVO.houseImg}" class="SBImg2">
            </div>
         </div>
         <div class="SBmainDivImg2">
            <div style="float: left;" class="SBdiv">
               <img src="resources//image//SBdogImg.png"
                  class="SBremote_Img_form3">
               <div class="SBtextDiv">
                  <img src="resources//image//mmm.png" style="width: 15px;">
                  희망 동물 종류 : ${petsitterVO.petType } <br> <img
                     src="resources//image//mmm.png" style="width: 15px;"> 희망 동물
                  크기 : ${petsitterVO.petSize } <br> <img
                     src="resources//image//mmm.png" style="width: 15px;"> 가능한
                  서비스 : ${petsitterVO.service }
               </div>
            </div>
            <div style="float: right;" class="SBdiv">
               <img src="resources//image//c.png" class="SBremote_Img_form3">
               <div class="SBtextDiv2">
                  <img src="resources//image//mmm.png" style="width: 15px;">
                  체크인&체크 아웃:<br> 09:00 AM ~ 09:00PM
               </div>
            </div>
         </div>
         <div class="SBmainDivImg2" style="border-top: 1px solid #AFAFAF;">
            <div class="SBtextDiv3">
            <div class="SBtextDiv3_tiltle"> ${memberVO.name}돌보미소개</div>
            <br>
            <div class="SBtextDiv3_content">${memberVO.existence}</div>
            </div>
         </div>
         <div class="SBmainDivImg2" style="border-top: 1px solid #AFAFAF;">
            <div class="SBtextDiv3">
               <div class="SBtextDiv3_tiltle">
                  ${petsitterboardVO.petsitterboard_title }</div>
               <br>
               <div class="SBtextDiv3_content">
                  ${petsitterboardVO.petsitterboard_contents }</div>
            </div>
         </div>
      </div>
   </div>
</div>