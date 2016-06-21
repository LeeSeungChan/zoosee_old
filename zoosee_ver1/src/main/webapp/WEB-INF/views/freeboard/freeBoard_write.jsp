<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <script type="text/javascript">
	$(document).ready(function(){
		$("#wirteForm :input[name=freeBoardTitle]").focus();
	$("#wirteForm").submit(function(){
		if($("#wirteForm :input[name=freeBoardTitle]").val()==""){
			alert("제목을 입력하세요!!");
			$("#wirteForm :input[name=freeBoardTitle]").focus();
			return false;
		}
		if($("#wirteForm :input[name=freeBoardContents]").val()==""){
			alert("내용을 입력하세요!!");	
			$("#wirteForm :input[name=freeBoardContents]").focus();
			return false;
		}
	});
	
	$("#cancelBtn").click(function(){
		location.href="${initParam.root}interceptor_freeBoard_list.do";
	});
});
</script>
<!-- 자유게시판 글쓰기 메인 -->
<div class="BJMainDiv" >

<form method="post" action="${initParam.root}interceptor_freeBoard_contentWrite.do" id="wirteForm">
<div class="BJMain2Div" >
<div class="panel panel-primary">
  <div class="panel-heading">
    <h3 class="panel-title">자유게시판</h3>
  </div>
  <div class="panel-body">
    자유게시판은 펫맘들과 펫시터들의 소통을 위한 공간입니다.
  </div>
</div>
<div class="well well-sm">
  글쓰기
</div>
<div class="form-group">
<div class="BJWriteTableLine">
	<table  class="BJFreeBoardWriteTableDiv" >
	<tr>
		<td>제목</td>
		<td>
		      <input class="BJform-control" id="focusedInput" type="text" name="freeBoardTitle" >
		  </td>
		 
		  
	</tr>
	<tr >
		<td>이름</td>
		<td style="float: left; margin-left: 3%; ">${sessionScope.mvo.name }</td>
	</tr>
	 

	<tr>
		<td>내용</td>
		<td  align="center" colspan="2"><textarea  name="freeBoardContents" id="inputLarge" class="BJform-controlBig input-lg" rows="10" ></textarea> </td>
	</tr>
	<tr>
		<td></td>
		<td 	style="margin-left:40%; " colspan="2">
		
			<!-- <input class="BJbtn btn-default" type="button" value="목록" id="cancelBtn"> -->
			<input class="BJbtn btn-default" type="submit" value="등록" >
		</td>
		
	</tr>
</table>
</div>
</div>
</div>
</form>
</div>
