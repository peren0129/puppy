<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<!-- writeForm.jsp -->
<br>

<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/jquery.realperson.css">
<script type="text/javascript" src="js/jquery.plugin.js"></script>
<script type="text/javascript" src="js/jquery.realperson.js"></script>


<script type="text/javascript">
	function back(pageNumber) {
		if (confirm("목록으로 돌아가시겠습니까?") == true) {
			location.href = "list.qna?pageNumber=" + pageNumber;
		} else {
			return;
		}
	}
  
	function popupOpen(){ //상품팝업
		  window.open("popup.qna", "_blank", "width=500, height=500");
	}
	
	//스마트에디터
	$(document).ready(function() {
		CKEDITOR.replace('content');
		CKEDITOR.config.height = 500;
		var content = CKEDITOR.instances.content.getData();

		create();

		$("#refreshBtn").click(function(e) {
			e.preventDefault();
			create();
		});

		$("#confirmBtn").click(function(e) {
			e.preventDefault();
			$("#frm").submit();
		});

		function create() {
			$("#captcha img").attr("src", "/captcha?" + Math.random());
		}
	});

</script>
<style type="text/css">
.err {
	color: red;
	font-weight: bold;
}

#captcha {
	width: 230px;
	height: 70px;
	border: 1px #DCDCDC;
	text-align: center;
	padding: 5px;
}

table {
	border-top: 1px solid #DCDCDC;
	border-collapse: collapse;
}

th, td {
	border-bottom: 1px solid #DCDCDC;
	padding: 10px;
}
</style>

<center>
	<hr>
	<h2>Q&A</h2>
	<hr><br><br>
	<form:form commandName="qna" action="write.qna" method="post"
		enctype="multipart/form-data">
		
		<table style="width: 1000px; height:130px;" border="1" align="center" >

			<tr>
				<td style="width : 100px;">상품이미지 넣기</td>
				<td>
					<button type="button" onclick="popupOpen();">상품정보선택</button>
				</td>
			</tr>
		</table>
		<br><br>
		<table style="width: 1000px;" border="1" align="center" >
			
<%-- 			<tr>
				<td>카테고리</td>
				<td><select name="cate">
						<option value="회원/정보관리">회원/정보관리</option>
						<option value="배송">배송</option>
						<option value="반품/환불/교환/AS">반품/환불/교환/AS</option>
						<option value="영수증/증빙서류">영수증/증빙서류</option>
						<option value="상품/이벤트">상품/이벤트</option>
						<option value="기타">기타</option>
					</select>
					<form:errors cssClass="err" path="cate" /></td>
			</tr> --%>
<%-- 			<tr>
				<td>작성자</td>
				<td><input type="hidden" name="writer" value="admin">
					admin</td>
				<td><input type="hidden" name="writer" value="${loginInfo.id }">
					${loginInfo.id }</td>
				<!-- 로그인 정보로 변경, 수정불가 -->
			</tr> --%>
			<tr>
				<td>제목</td>
				<td><input type="text" size="48" name="subject"
					value="${qna.subject }"> <form:errors cssClass="err"
						path="subject" /></td>
			</tr>
			<tr>
				<td>본문</td>
				<td><textarea name="content" rows="10" cols="51"
						placeholder="내용을 작성해주세요."></textarea> <form:errors
						cssClass="err" path="content" /></td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td><input type="file" name="upload" value=""></td>
			</tr>
			<tr>
				<td>공개여부</td>
				<td><select name="cateopen">
						<option value="전체공개">전체공개
						<option value="비공개">비공개
				</select></td>
			</tr>
		</table>
		<br>
		<br>
		<input type="button" value="이전"
			onclick="back('${pageInfo.pageNumber }')" class="btn btn-secondary">
		<input type="submit" value="등록" class="btn btn-primary ">
		<!-- 	<input type="button" value="등록" onclick="write()"> -->
	</form:form>
</center>
