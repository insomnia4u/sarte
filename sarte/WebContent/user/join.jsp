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
<body class="content">
	<%@ include file="/header.jsp"%>
	<section class="m_content">
	
		<h2 class="menu_title">회원 가입</h2>
		<form name="join_f" action="join.sarte"> 
		<div class="joincontent">
		<div class="input input--minoru">
			<input class="input__field input__field--yoko" id="userid" name="id" type="text" value="${requestScope.id}" /> <label
				class="input__label input__label--yoko" for="input-16"> <span
				class="input__label-content input__label-content--yoko" >아이디</span>
			</label>
			${requestScope.msg}
		</div>
		<br>
		<div class="input input--minoru">
			<input class="input__field input__field--yoko" id="pw" name="pw" type="password" /> <label
				class="input__label input__label--yoko" for="input-17"> <span
				class="input__label-content input__label-content--yoko">비밀번호</span>
			</label>
		</div>
		<br>
		<div class="input input--minoru">
			<input class="input__field input__field--yoko" id="pw2" type="password" /> <label
				class="input__label input__label--yoko" for="input-18"> <span
				class="input__label-content input__label-content--yoko">비밀번호
					확인</span>
			</label>
			<p id="pwVarify"></p>
		</div>
		<br>
		<div class="input input--minoru">
			<input class="input__field input__field--yoko" name="name" type="text" /> <label
				class="input__label input__label--yoko" for="input-17"> <span
				class="input__label-content input__label-content--yoko">이름</span>
			</label>
		</div>
		<br>
		<div class="input input--minoru">
			<input class="input__field input__field--yoko" name="email" type="text" /> <label
				class="input__label input__label--yoko" for="input-18"> <span
				class="input__label-content input__label-content--yoko">이메일</span>
			</label>
		</div>
		<br>
		<div class="input input--minoru">
			<input class="input__field input__field--yoko" name="phonenum" type="text" /> <label
				class="input__label input__label--yoko" for="input-18"> <span
				class="input__label-content input__label-content--yoko">핸드폰
					번호</span>
			</label>
		</div>
		</div>
		<div class="box2 bg-1">
		<button type="submit" class="button button--wayra button--border-thick button--text-upper button--size-s">가입하기</button>
		<button type="reset" class="button button--wayra button--border-thick button--text-upper button--size-s" >다시 작성</button>
		</div>		
		</form>

	</section>
	<%@ include file="/footer.jsp"%>
</body>
<script>
			(function() {
				// trim polyfill : https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/Trim
				if (!String.prototype.trim) {
					(function() {
						// Make sure we trim BOM and NBSP
						var rtrim = /^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g;
						String.prototype.trim = function() {
							return this.replace(rtrim, '');
						};
					})();
				}

				[].slice.call( document.querySelectorAll( 'input.input__field' ) ).forEach( function( inputEl ) {
					// in case the input is already filled..
					if( inputEl.value.trim() !== '' ) {
						classie.add( inputEl.parentNode, 'input--filled' );
					}

					// events:
					inputEl.addEventListener( 'focus', onInputFocus );
					inputEl.addEventListener( 'blur', onInputBlur );
				} );

				function onInputFocus( ev ) {
					classie.add( ev.target.parentNode, 'input--filled' );
				}

				function onInputBlur( ev ) {
					if( ev.target.value.trim() === '' ) {
						classie.remove( ev.target.parentNode, 'input--filled' );
					}
					if(ev.target.id==='userid')
					{
						if(ev.target.value=='')
						{
							return;
						}
						location.href='idCheck.sarte?id='+ev.target.value;
					}
					if(ev.target.id==='pw2')
					{
						pw1=document.getElementById("pw");
						pw2=document.getElementById("pw2");
						
						if(pw1.value===pw2.value)
						{
							pwVarify.innerText='비밀번호가 일치합니다.';
						}
						else if(pw1.value==''||pw2.value=='')
						{
							pwVarify.innerText='비밀번호를 입력해주세요.';
						}
						else
						{
							pwVarify.innerText='비밀번호를 확인해주세요.';
						}
					}
				}
			})();
			
			
		</script>
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/jquery-ui.min.js"></script>
</html>