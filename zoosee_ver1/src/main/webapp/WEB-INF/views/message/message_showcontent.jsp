<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 


<div class="BJMainDiv" >

<div class="BJPanel" style="width:80%;	 margin-left:10%;">
<div class="panel panel-primary">
  <div class="panel-heading">
    <h3 class="panel-title">MESSAGE</h3>
  </div>
  <div class="panel-body">
    ${sessionScope.mvo.name } 님의 메세지입니다. <div style="text-align: right;">
 <a href="${initParam.root}interceptor_message_list.do">메세지 목록으로</a></div>
  </div>
</div>
<div class="well well-sm">
 메세지 상세보기
</div>
</div>

<div class="BJMain2Div" >
<div class="BJWriteTableLine" >
<div class="BJHrAllLine" >
<table   class="BJFreeBoardShowContentTable ">
	<tr>
		
		<td align="right">제목 : </td>
		<td align="left" colspan=3>${message.title }</td>

	</tr>
	<tr>
		<td align="right">보낸사람 : </td>
		<td align="left"> 관리자</td>
	</tr>
	<tr>
		<td align="right">받은시간 : </td>
		<td align="left" colspan=3>${message.time_posted }</td>
		</tr>
	
</table>
<hr class="BJHr" >
${message.content }

		

</div>
</div>
</div>







</div>
