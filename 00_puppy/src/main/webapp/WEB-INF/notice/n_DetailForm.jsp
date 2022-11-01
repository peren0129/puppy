<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<!-- detailForm.jsp -->
<br>
<script>
	function del(num, pageNumber) {
		var chk = confirm("삭제하시겠습니까?");
		if (chk) {
			location.href = "delete.no?num=" + num + "&pageNumber=" + pageNumber;
		}
	}
</script>
<center>
	<br><br>
	<h1>NOTICE</h1>
	<br>
	<hr>
	<table class="table" style="width: 1000px;" border="0">
		<tr align="left">
			<td>
				<h2 style="margin: 10px">${notice.subject}</h2>
				<br>
			</td>
		</tr>
		<tr align="left" style="font-size:small">
			<td>
				${notice.writer} |
				<fmt:parseDate var="reg_date" value="${notice.reg_date}"
										pattern="yyyy-MM-dd"/>
				<fmt:formatDate var="formatDate" value="${reg_date}" pattern="yyyy-MM-dd"/>
				${formatDate} | 조회수 : ${notice.readcount}
			</td>
		</tr>
	</table><br><hr>
	
	<table class="table" border="0" style="width: 1000px;">
	
		<c:if test="${notice.image != null}">
			<tr style="height: 700px;">
				<td align="center"><img height=auto width=700
					onclick="javascript:popupImage(this.src);"
					src="<%=request.getContextPath()%>/resources/notice/${notice.image}">
				</td>
			</tr>
		</c:if>
		<c:if test="${notice.content != null}">
			<tr valign="top" style="height: 100px;">
				<td align="left"><br>${notice.content}<br></td>
			</tr>
		</c:if> 

		<tr>
			<!-- admin으로 로그인시 -->
			<c:choose>
				<c:when test="${fn:contains(loginInfo.id, 'admin')}">
					<td align="center" colspan="2"><br> <br> 
						<input type="button" value="목록" class="btn btn-secondary "
							onClick="document.location.href='list.no?pageNumber=${pageNumber}'">
		 					<input
								type="button" value="글수정" class="btn btn-primary "
								onClick="location.href='update.no?num=${notice.num}&pageNumber=${pageNumber}'">
								<input type="button" value="글삭제" class="btn btn-primary "
								onClick="del('${notice.num}','${pageInfo.pageNumber }')">
					</td>
				</c:when>
				<c:otherwise>
					<td align="center" colspan="2">
						<input type="button"
						value="목록"  style=" width: 100px; height:40px;"
						onClick="document.location.href='list.no?pageNumber=${pageNumber}'">
					</td>
				</c:otherwise>
			</c:choose>
		</tr>
	</table><br><br>
</center>
