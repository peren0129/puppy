<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>

<head>
<!-- bootstrap css -->
<link rel="skylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">

</head>

<center>
	<br><br>
	<h1>NOTICE</h1>
	<br>
	<table class="table table-dark table-striped" style="width: 70%;" border="0">
		<tr align="right">
			<td colspan="4">
		<%-- <c:if test="${loginInfo.id eq 'admin'}"> --%>
		<input type="button" value="글쓰기" style=" width: 60px; height:25px;"
			onclick="window.location='write.no'">
			</td>
		<%-- </c:if> --%>
		</tr>
		
		<tr align="center">
			<td width="10%">번호</td>
			<td>제목</td>
			<td width="10%">작성자</td>
			<td width="10%">작성일</td>
		</tr>
		
		<c:if test="${fn:length(lists) eq 0 }">
			<td colspan="4" align="center">작성된 게시글이 없습니다.</td>
		</c:if>
		<c:if test="${fn:length(lists) > 0 }">
			<c:forEach var="list" items="${lists}">
				<c:choose>
					<c:when test="${fn:contains(loginInfo.id, 'admin')}">
						<c:if test="${list.cateopen eq '전체공개'}">
							<tr style="text-align:center;">
								<td>${list.num}</td>
								<td style="text-align: left !important;">
									<c:if test="${list.cate eq '공지사항'}">
										<img src="resources/images/00_event.png" align="absmiddle"
											height="20px" width="30px">
									</c:if>
									<!-- 비공개 -->
									<c:if test="${list.cateopen eq '비공개'}">
										<img src="resources/images/00_secret.png" align="absmiddle">
									</c:if>
										<a href="detail"></a>
									<!-- 파일 업로드 -->
									<c:if test="${list.image != null}">
										<img src="resources/images/00_attach_file.png"
												align="absmiddle">
									</c:if></td>
								<td>
									<fmt:parseDate var="reg_date" value="${list.reg_date}"
									pattern="yyyy-MM-dd"/>
									<fmt:formatDate var="formatDate" value="${reg_date}" pattern="yyyy-MM-dd"/>${formatDate}</td>
									<td>${list.writer}</td>
									<td>${list.readcount}</td>								
								</tr>
							</c:if>
					</c:when>
					<c:when test="${not fn:contains(loginInfo.id, 'admin')}">
						<c:if test="${list.cateopen eq '전체공개'}">
							<tr style="text-align: center;">
								<td align="center">${list.num }</td>
								<td style="text-align: left !important;"><c:if
										test="${fn:contains(list.cate, '이벤트')}">
										
										<img src="resources/images/03_event.png" align="absmiddle"
											height="15px" width="50px">
									</c:if> <a
									href="detail.no?num=${list.num}&pageNumber=${pageInfo.pageNumber}">${list.subject}</a>
									<!-- 파일 업로드 --> <c:if test="${list.image != null}">
										<img src="resources/images/00_attach_file.png"
											align="absmiddle">
									</c:if></td>
								<td><fmt:parseDate var="reg_date"
										value="${ list.reg_date }" pattern="yyyy-MM-dd" /> <fmt:formatDate
										var="formatDate" value="${ reg_date }" pattern="yyyy-MM-dd" />
									${formatDate}</td>
								<td>${list.writer}</td>
							</tr>
						</c:if>
					</c:when>
				</c:choose>
			</c:forEach>
		</c:if>
	</table>
	<br>
	
	<form action="list.no" method="get">
		   	<select name="whatColumn" style=" width: 90px; height:25px;" >
		   		<option value="">전체검색</option>
		   		<option value="subject">제목</option>
		   		<option value="writer">작성자</option>
		   	</select>
		   	<input type="text" name="keyword" style=" width: 200px; height:25px; ">
		   	<input  class="btn btn-primary" type="submit" value="찾기" style=" width: 60px; height:25px;"><br>
	</form>
</center>
<br>
<center>${pageInfo.pagingHtml }</center>