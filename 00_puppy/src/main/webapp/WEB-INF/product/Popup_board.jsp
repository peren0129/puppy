<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>


<script>

	function goClose(){
		window.close();
	}
	

</script>

<style>

	tr, td{
		font-size: 13px;
	}

</style>

<br><br>

	<div align="left" style="margin-left: 130;">
		<font color="#696969" style="margin: 20px;">
		<small>총 ${pageInfo.totalCount}개의 상품이 검색되었습니다.</small></font>
	</div>
	
	<center>
	<table style="width: 90%;" border="0">
		<tr align="center">
			<td>
				<form action="popuplist.pro" method="get">
						<select name="whatColumn">
							<option value="name">상품이름</option>
						</select>
						<input type="text" name="keyword">
						<input type="submit" value="검색">
				</form>
			</td>
		</tr>
	</table>
	<table style="width: 90%;" border="0">
		 <c:if test="${fn:length(lists) eq 0}">
			<td colspan="18"><font color="#696969" style="margin: 20px;">등록된 상품이 없습니다</font></td>
		</c:if>

		 <tr align="center">
		 	<th width="20%">이미지<hr></td>
		 	<th width="60%">상품정보<hr></td>
		 	<th width="10%">선택<hr></td>
		 </tr>
		 
		 
		<c:forEach var="p" items="${lists}">
			<tr>
	   			<td align="center" name="image">${p.image}</td>
	   			<td name="namenprice">${p.name}<br>
	   				<strong><font color="#f996a8">${p.price}원</font></strong></td>
				<td align="center">
					<input type="button" name="p_click" id="p_click" value="선택" style=" width: 60px; height:25px;"
					onClick="setResList()"/></td>
			</tr>
		</c:forEach>
		
</table>
</center>
<br>
<center>
	${pageInfo.pagingHtml }
<br><br>
<div>
	<input type="button" value="닫기" onClick="goClose()">
</div>
</center>
