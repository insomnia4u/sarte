<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/sarte/css/textinput.css">
<link rel="stylesheet" type="text/css" href="/sarte/css/buttons.css">
<link rel="stylesheet" type="text/css" href="/sarte/css/main.css">
<link rel="stylesheet" type="text/css" href="/sarte/css/reset.css">
</head>
<body>
<%@ include file="/header.jsp" %>
	<section class="content bgcolor-5">
		<h2>회원가입</h2>
		<div class="input input--minoru">
			<input class="input__field input__field--yoko" type="text"/>
		<label class="input__label input__label--yoko" for="input-16">
			<span class="input__label-content input__label-content--yoko">아이디</span>
		</label>
		</div>
		<div class="input input--minoru">
			<input class="input__field input__field--yoko" type="password"/>
			<label class="input__label input__label--yoko" for="input-17">
		<span class="input__label-content input__label-content--yoko">비밀번호</span>
		</label>
		</div>
		<div class="input input--minoru">
			<input class="input__field input__field--yoko" type="password" />
			<label class="input__label input__label--yoko" for="input-18">
				<span class="input__label-content input__label-content--yoko">비밀번호 확인</span>
			</label>
		</div>
		<div class="input input--minoru">
			<input class="input__field input__field--yoko" type="text" />
			<label class="input__label input__label--yoko" for="input-18">
				<span class="input__label-content input__label-content--yoko">이메일</span>
			</label>
		</div>
		<div class="input input--minoru">
			<input class="input__field input__field--yoko" type="text" />
			<label class="input__label input__label--yoko" for="input-18">
				<span class="input__label-content input__label-content--yoko">핸드폰 번호</span>
			</label>
		</div>
</section>
<%@ include file="/footer.jsp" %>
</body>
</html>