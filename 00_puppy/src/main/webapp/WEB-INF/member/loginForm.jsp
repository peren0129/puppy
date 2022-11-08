<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../mall_top.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
fieldset {
	border: none;
	width: 350px;
}

.textplace {
	height: 40px;
	width: 350px;
	border: none;
	margin: 3px 0px;
	text-indent: 10px; /* 들여쓰기 */
}

.inputplace {
	height: 50px;
	width: 350px;
	background-color: black;
	color: white;
	margin: 5px 0px;
}

.login-btn {
	border: none;
	height: 50px;
	width: 350px;
	margin: 5px 0px;
}

.login-btn:hover {
	background-color: green;
	transition-duration:1s; /* 천천히 */
}

.login-btn2 {
	border: none;
	height: 50px;
	width: 350px;
	margin: 5px 0px;
}

.login-btn2:hover {
	background-color: yellow;
	transition-duration:1s; /* 천천히 */
}
</style>
<body>
	<div align="center">
		<form action="login.mem" method="post">
			<fieldset>
				<div align="left">
					<h3 style="margin: 0;">MEMBER LOGIN</h3>
					<small>로그인</small>
				</div>
				<br>
				<input class="textplace" type="text" name="member_id"
					placeholder="Id"><br> <input class="textplace"
					type="text" name="passwd" placeholder="Pass word"><br>
				<input class="inputplace" type="submit" value="Sign in"><br>
				<div align="left" style="padding: 7px 0px;">
					<small> For got your <a href="###">ID</a> or <a href="###">Pass
							word</a> ?
					</small>
				</div>
				<input type="button" class="inputplace" value="Join"
					onclick="location.href='join.mem'">

			</fieldset>
		</form>
		<br>
		<br>
		<fieldset>
			<div align="left">
				<h3 style="margin: 0;">SNS LOGIN</h3>
				<small>회원가입 없이 간편하게 로그인하실 수 있습니다.</small>
			</div>

			<input type="button" value="네이버 로그인"
				onclick="MemberAction.snsLogin('naver', '%2Findex.html')"
				class="login-btn"><br> <input type="button"
				value="카카오계정 로그인"
				onclick="MemberAction.kakaosyncLogin('9c5abdc3a38decac4fe580c6759524d2')"
				class="login-btn2">

		</fieldset>
	</div>

</body>
</html>
<%@ include file="../mall_footer.jsp"%>