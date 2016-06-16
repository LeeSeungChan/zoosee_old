<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div>
<form action="">
	<table>
		<tr>
			<td><img src="${petsitterboardVO.petsitterVO.houseImg }" width="500" height="500"></td>
		</tr>
	</table>
	<table>
	<tr>
		<td>댓글 ㅣ    </td><td>   후기 ㅣ   </td><td>   평점  </td>
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
		<td>동물 키워본 경험 : ${petistterboardVO.petsitterVO.memberVO.existance }</td>
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
			<td>
			${petsitterboardVO.petsitterboard_title }
			</td>
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
<div>
</div>
<div>
</div>