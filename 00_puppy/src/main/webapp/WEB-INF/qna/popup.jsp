<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!-- 상품 list에서 상품사진+상품이름+상품가격 검색 기능. list 만들어서 띄우기
선택 누르면 Q&A 창에 입력됨-->
<br><br>
	<table align="center">
		<tr>
			<td>
				<form action="popup.qna" method="get" class="d-flex">
					상품검색
					<input type="text" name="keyword" style=" width: 200px; height:25px; ">
					<input type="submit"
							value="검색하기" class="btn btn-outline-success" style=" width: 60px; height:25px;"> 
				</form>
			</td>
		</tr>
	</table>
	<table border="0" align="center">
		<tr>
			<td>
				<font color="#696969" style="margin: 20px;">
				<small>총 ${pageInfo.totalCount}개의 상품이 검색되었습니다.</small></font>
			</td>
		</tr>
		<tr>
			<td>
				상품 list 쫘라르르륵 
				<input type="button" value="선택" style=" width: 60px; height:25px;"/>
			</td>
		</tr>

</table>
