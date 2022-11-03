<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../mall_top.jsp"%>
<div class="ec-base-table typeWrite">
	<h2 align="center">회원가입</h2>
	<br><hr><br>
	<table border="1" summary="" align="center">
		<caption>회원 기본정보</caption>
		<colgroup>
			<col style="width: 150px;" />
			<col style="width: auto;" />
		</colgroup>
		<tbody>
			<tr>
				<th scope="row" class="list_name">아이디 <img
					src="//img.echosting.cafe24.com/skin/base/common/ico_required_blue.gif"
					alt="필수" /></th>
				<td><input id="member_id" name="member_id"
					fw-filter="isFill&isFill&isMin[4]&isMax[16]&isIdentity"
					fw-label="아이디" fw-msg="" class="inputTypeText" placeholder=""
					value="" type="text" /> <span id="idMsg"></span> (영문소문자/숫자, 4~16자)</td>
			</tr>
			<tr>
				<th scope="row">비밀번호 <img
					src="//img.echosting.cafe24.com/skin/base/common/ico_required_blue.gif"
					alt="필수" /></th>
				<td>
					<div class="eTooltip">
						<input id="passwd" name="passwd"
							fw-filter="isFill&isMin[4]&isMax[16]" fw-label="비밀번호" fw-msg=""
							autocomplete="off" maxlength="16" 0="disabled" value=""
							type="password" />
					</div> (영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 10자~16자)
				</td>
			</tr>
			<tr>
				<th scope="row">비밀번호 확인 <img
					src="//img.echosting.cafe24.com/skin/base/common/ico_required_blue.gif"
					alt="필수" /></th>
				<td><input id="user_passwd_confirm" name="user_passwd_confirm"
					fw-filter="isFill&isMatch[passwd]" fw-label="비밀번호 확인"
					fw-msg="비밀번호가 일치하지 않습니다." autocomplete="off" maxlength="16"
					0="disabled" value="" type="password" /> <span id="pwConfirmMsg"></span></td>
			</tr>
			<!-- 							<tr class="displaynone">
								<th scope="row">비밀번호 확인 질문 <img
									src="//img.echosting.cafe24.com/skin/base/common/ico_required_blue.gif"
									alt="필수" /></th>
								<td><select id="hint" name="hint" fw-filter=""
									fw-label="hint" fw-msg="">
										<option value="hint_01">기억에 남는 추억의 장소는?</option>
										<option value="hint_02">자신의 인생 좌우명은?</option>
										<option value="hint_03">자신의 보물 제1호는?</option>
										<option value="hint_04">가장 기억에 남는 선생님 성함은?</option>
										<option value="hint_05">타인이 모르는 자신만의 신체비밀이 있다면?</option>
										<option value="hint_06">추억하고 싶은 날짜가 있다면?</option>
										<option value="hint_07">받았던 선물 중 기억에 남는 독특한 선물은?</option>
										<option value="hint_08">유년시절 가장 생각나는 친구 이름은?</option>
										<option value="hint_09">인상 깊게 읽은 책 이름은?</option>
										<option value="hint_10">읽은 책 중에서 좋아하는 구절이 있다면?</option>
										<option value="hint_11">자신이 두번째로 존경하는 인물은?</option>
										<option value="hint_12">친구들에게 공개하지 않은 어릴 적 별명이 있다면?</option>
										<option value="hint_13">초등학교 때 기억에 남는 짝꿍 이름은?</option>
										<option value="hint_14">다시 태어나면 되고 싶은 것은?</option>
										<option value="hint_15">내가 좋아하는 캐릭터는?</option>
								</select></td>
							</tr>
							<tr class="displaynone">
								<th scope="row">비밀번호 확인 답변 <img
									src="//img.echosting.cafe24.com/skin/base/common/ico_required_blue.gif"
									alt="필수" /></th>
								<td><input id="hint_answer" name="hint_answer" fw-filter=""
									fw-label="비밀번호 확인시 답변" fw-msg="" class="inputTypeText"
									placeholder="" value="" type="text" /></td>
							</tr> -->
			<tr>
				<th scope="row" id="nameTitle">이름 <img
					src="//img.echosting.cafe24.com/skin/base/common/ico_required_blue.gif"
					alt="필수" /></th>
				<td><span id="nameContents"><input id="name" name="name"
						fw-filter="isFill&isMax[30]" fw-label="이름" fw-msg=""
						class="ec-member-name" placeholder="" maxlength="30" value=""
						type="text" /></span> <span id="under14Msg" class="displaynone">14세
						미만 사용자는 법정대리인 동의가 필요합니다.</span></td>
			</tr>
			<tr class="displaynone">
				<th scope="row">이름(영문) <img
					src="//img.echosting.cafe24.com/skin/base/common/ico_required_blue.gif"
					class="displaynone" alt="필수" /></th>
				<td><input id="name_en" name="name_en"
					fw-filter="isMax[30]&isAlphaSpace" fw-label="이름(영문)" fw-msg=""
					class="ec-member-name" placeholder="" maxlength="30" value=""
					type="text" /> (이름 - 성 형식으로 입력해 주세요.)</td>
			</tr>
		</tbody>
	</table>
</div>

<%@ include file="../mall_footer.jsp"%>