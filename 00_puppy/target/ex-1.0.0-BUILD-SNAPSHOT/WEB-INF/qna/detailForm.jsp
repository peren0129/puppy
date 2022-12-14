<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>

<!-- detailForm.jsp -->
<br>
<script type="text/javascript">
	function del(num, pageNumber) {
		var chk = confirm("삭제하시겠습니까?");
		if (chk) {
			location.href = "delete.qna?num=" + num + "&pageNumber="
					+ pageNumber;
		}
	}

</script>
<style> /* 모든 파일 스타일은 부트스트랩 적용하면서 삭제 */
/* 
th, td {
	border-bottom: 1px solid #DCDCDC;
	padding: 10px;
} */
.err {
	color: red;
	font-weight: bold;
}
</style>

<center>
	<br><br>
	<h1>Q&A</h1>
	<br>
	<hr>
	<br>
		<table style="width: 1000px; height:130px;" border="1" align="center" >

			<tr>
				<td style="width : 150px;">상품이미지 넣기</td>
				<td>
					<button type="button" onclick="popupOpen();">상품정보선택</button>
				</td>
			</tr>
		</table>
		<br><br>
	<table class="table table-hover" style="width: 1000px;" border="1">
		<tr align="left">
			<td colspan="2">
				<h2 style="margin: 10px">${qna.subject}</h2>
				<br>
			</td>
		</tr>
		<tr align="left" style="font-size:small">
			<td colspan="3">
				${qna.writer} |
				<fmt:parseDate var="reg_date" value="${qna.reg_date}"
										pattern="yyyy-MM-dd"/>
				<fmt:formatDate var="formatDate" value="${reg_date}" pattern="yyyy-MM-dd"/>
				${formatDate} | 조회수 : ${qna.readcount}
			</td>
		</tr>
		
		<tr height="200" valign="top">
			<td colspan="2"><br>${qna.content}</td>
		</tr>
		<tr>
			<td valign="top">첨부파일</td>
			<td><c:if test="${qna.image != null}">
					<img height=auto width=800
						onclick="javascript:popupImage(this.src);"
						src="<%=request.getContextPath()%>/resources/qna/${qna.image}">
				</c:if> <c:if test="${qna.image == null}">
					<small> 첨부된 파일이 없습니다.</small>
				</c:if><br> <br></td>
		</tr>
		
		<tr>
			<!-- admin으로 로그인시 -->
			<c:if test="admin">
		<table>
				<tr>
					<td colspan="2">admin님, 답변을
						작성하세요.</td>
				</tr>
				<tr>
					<td colspan="2"><form:form action="insertComment.qna"
							method="post">
							<div>
								<input type="hidden" name="pnum" th:value="*{pnum}" /> <input
									type="hidden" name="writer" value="admin " />
								<textarea name="content" rows="4" cols="70"></textarea>
								<form:errors cssClass="err" path="content" />
							</div>
							<div align="right"> 
								<input type="button" value="제출" class="btn btn-primary btn-sm"
									onclick="location.href='reply.qna?num=${qna.num}&pageNumber=${pageNumber}'">
							</div>
						</form:form></td>
		</table>
			</c:if>
		</tr>
		<tr>
			<c:choose>
				<c:when test="${loginInfo.id eq qna.writer}">
					<td align="center" colspan="2"><br> <br> <input
						type="button" value="이전" class="btn btn-secondary"
						onClick="document.location.href='list.qna?pageNumber=${pageNumber}'"> 
						<input type="button" value="글수정" class="btn btn-primary"
						onClick="location.href='update.qna?num=${qna.num}&pageNumber=${pageNumber}'">
						<input type="submit" value="글삭제" class="btn btn-primary"
						onClick="del('${qna.num}','${pageInfo.pageNumber }')"></td>
				</c:when>
				<c:when test="${fn:contains(loginInfo.id, 'admin')}">
					<td align="center" colspan="2"><br> <br> <input
						type="button" value="이전" class="btn btn-secondary"
						onClick="document.location.href='list.qna?pageNumber=${pageNumber}'">
						<input type="button" value="글삭제" class="btn btn-primary"
						onClick="del('${qna.num}','${pageInfo.pageNumber }')"></td>
				</c:when>

				<c:otherwise>
					<td align="center" colspan="2"><input type="button"
						value="글목록" class="btn btn-primary"
						onClick="history.back();">
					</td>
				</c:otherwise>
			</c:choose>
		</tr>
	</table>
</center>
<br>
