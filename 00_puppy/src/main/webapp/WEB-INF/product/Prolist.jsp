<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<!-- ListPro.jsp<br> -->

<br>
<hr>
    
<center>
<h2><b>상품관리</b></h2>
<hr>

<form action="list.pro" method="get">
		<select name="whatColumn">
			<option value="">전체검색</option>
			<option value="name">상품이름</option>
		</select>
		<input type="text" name="keyword">
		<input type="submit" value="검색">
</form>

	<table class="table table-dark table-striped" style="width: 70%;" border="1">
 		<c:if test="${fn:length(lists) eq 0}">
			<td colspan="18">등록된 상품이 없습니다</td>
		</c:if>
		
		<!-- list에서 필요한 것들만 보이게 만들자 -->
		
   		<tr class="table-info">
   			<td><strong>번호</strong></td>
   			<td><strong>이미지</strong></td>
   			<td><strong>상품구분</strong></td>
   			<td><strong>상품명</strong></td>
   			<td><strong>카테고리</strong></td>
   			<td><strong>가격</strong></td>
   			<!-- <td><strong>수량</strong></td> -->
   			<td><strong>재고수량</strong></td>
   			<td><strong>포인트</strong></td>
   			<!-- <td><strong>best</strong></td> -->
   			<!-- <td><strong>찜</strong></td> -->
   			<td><strong>설명</strong></td>
   			<td><strong>날짜</strong></td>
   			<!-- <td><strong>상세설명</strong></td> -->
   			<!-- <td><strong>상세이미지</strong></td> -->
   			<!-- <td><strong>조회수</strong></td> -->
   			<td>수정</td>
   			<td>삭제</td>
   		</tr>
   		<c:forEach var="p" items="${lists}">
   			<tr>
   				<td>${p.num}</td>
   				<td>${p.image}</td>
   				<td>
   					<c:set var="product" value="1"/><c:if test="${p.product eq '1'}"><c:out value="top"/></c:if>
   					<c:set var="product" value="2"/><c:if test="${p.product eq '2'}"><c:out value="outer"/></c:if>
   				</td>
   				<td>${p.name }</td>
   				<td>${p.category}</td>
   				<td>${p.price }</td>
   				<%-- <td>${p.qty}</td> --%>
   				<td>${p.stock}</td>
   				<td>${p.point }</td>
   				<%-- <td>${p.spec}</td> --%>
   				<%-- <td>${p.heart}</td> --%>
   				<td>${p.content}</td>
   				
   				<td>
	   				<fmt:parseDate var="input_date" value="${p.input_date}"
					pattern="yyyy-MM-dd"/>
					<fmt:formatDate var="formatDate" value="${input_date}" pattern="yyyy-MM-dd"/>${formatDate}
				</td>
   				<%-- <td>${p.delivery}</td> --%>
   				<%-- <td>${p.contentImage}</td> --%>
   				<%-- <td>${p.readcount}</td> --%>
   				<td>수정</td>
   				<td>삭제</td>
				<%--<td><a href="update.pro?id=${p.id }&pageNumber=${pageInfo.pageNumber}">수정</a></td>
   				<td><a href="delete.pro?num=${p.num }&pageNumber=${pageInfo.pageNumber}">삭제</a>삭제</td> --%>
   			</tr>
   		</c:forEach>
   		<!--
	   	<tr>
    	<td colspan="13">
   				<input type="button" value="상품추가" onClick="insert()" class="btn btn-primary btn-sm">
   			</td>
   		</tr>
   		 -->
	</table>
</center>
<center>
   	${pageInfo.pagingHtml }
</center>
