<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
    $(document).ready(function(){
    	$("#updateForm").submit(function(){ 
    		if($("#updateForm :input[name=freeBoardTitle]").val()==""){
    			alert("제목을 입력하세요!");
    			$("#updateForm :input[name=freeBoardTitle]").focus();
    			return false;
    		}
    		if($("#updateForm :input[name=freeBoardContents]").val()==""){
    			alert("본문을 입력하세요!");
    			$("#updateForm :input[name=freeBoardContents]").focus();
    			return false;
    		}
    	});
    	
    	$("#cancelBtn").click(function(){
    		location.href="${initParam.root}interceptor_freeBoard_list.do";
    	});
    });	
</script>
<form method="post" id="updateForm" action="${initParam.root}interceptor_freeBoard_updateFreeBoard.do">
	<table border="1">
	<tr>
		<td>
			<table>
				<tr>
					<td>
					글번호: <input type="text" name="freeBoardNo" value=${freeBoardVO.freeBoardNo } readonly></input>
					| 작성자: ${requestScope.freeBoardVO.memberVO.name }
					</td>
				</tr>
				<tr>
					<td>제목: <input type="text" name="freeBoardTitle" value=${requestScope.freeBoardVO.freeBoardTitle }></input> </td>				
				</tr>
				<tr>
				
					<td>						
	<textarea rows="15" cols="75" name="freeBoardContents">${freeBoardVO.freeBoardContents }</textarea>
					</td>
				</tr>
				<tr>
				<td valign="middle">						
					<input type="submit" value="수정하기" class="action"></input>	
					<input type="button" value="목록으로가기" id="cancelBtn">		
					</td>				
				</tr>
			</table>
		</td>
	</tr>
</table>
</form>