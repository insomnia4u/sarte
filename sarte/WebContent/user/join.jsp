<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/sarte/css/reset.css">
<link rel="stylesheet" type="text/css" href="/sarte/css/main.css">
<link rel="stylesheet" type="text/css" href="/sarte/css/buttons.css">
<link rel="stylesheet" type="text/css" href="/sarte/css/textinput.css">
<link rel="stylesheet" type="text/css" href="/sarte/css/component.css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/jquery-ui.min.js"></script>

</head>
<body class="content">
	<%@ include file="/header.jsp"%>
	<section class="m_content">
	
		<h2 class="menu_title">회원 가입</h2>
		<form name="join_f" action="join.sarte" method="post"> 
		<div class="joincontent">
		<div class="input input--minoru">
			<input class="input__field input__field--yoko" id="userid" name="id" type="text" value="${requestScope.id}${requestScope.dto.id}" /> <label
				class="input__label input__label--yoko" for="input-16"> <span
				class="input__label-content input__label-content--yoko" >아이디</span>
			</label>
			<p id="idVarify">${requestScope.msg}</p>
		</div>
		<br>
		<div class="input input--minoru">
			<input class="input__field input__field--yoko" id="pw" name="pw" type="password"  value="${requestScope.dto.pw}"/> <label
				class="input__label input__label--yoko" for="input-17"> <span
				class="input__label-content input__label-content--yoko">비밀번호</span>
			</label>
		</div>
		<br>
		<div class="input input--minoru">
			<input class="input__field input__field--yoko" id="pw2" type="password" value="${requestScope.dto.pw}"/> <label
				class="input__label input__label--yoko" for="input-18"> <span
				class="input__label-content input__label-content--yoko">비밀번호
					확인</span>
			</label>
			<p id="pwVarify"></p>
		</div>
		<br>
		<div class="input input--minoru">
			<input class="input__field input__field--yoko" name="name" type="text"  value="${requestScope.dto.name}"/> <label
				class="input__label input__label--yoko" for="input-17"> <span
				class="input__label-content input__label-content--yoko">이름</span>
			</label>
		</div>
		<br>
		<div class="input input--minoru">
			<input class="input__field input__field--yoko" name="email" type="text" value="${requestScope.dto.email}" /> <label
				class="input__label input__label--yoko" for="input-18"> <span
				class="input__label-content input__label-content--yoko">이메일</span>
			</label>
		</div>
		<br>
		<div class="input input--minoru">
			<input class="input__field input__field--yoko" name="phonenum" type="text" value="${requestScope.dto.phonenum}"/> <label
				class="input__label input__label--yoko" for="input-18"> <span
				class="input__label-content input__label-content--yoko">핸드폰
					번호</span>
			</label>
		</div>
		</div>
		<div class="box2 bg-1">
		<button type="submit" class="md-trigger button button--wayra button--border-thick button--text-upper button--size-s">가입하기</button>
		<button type="reset" class="button button--wayra button--border-thick button--text-upper button--size-s" >다시 작성</button>

		</div>		
		</form>
		<c:choose>
		<c:when test="${requestScope.act}">
		<div class="md-show md-modal md-effect-16" id="modal-16">
			<div class="md-content">
				<h3>회원 가입 성공</h3>
				<div>
					<p>${requestScope.joinMsg}</p>
					<button class="md-close" onclick="location.href='/sarte/index.jsp'">확인</button>
				</div>
			</div>
		</div>
		</c:when>
		<c:when test="${requestScope.act }==false">
		<div class="md-show md-modal md-effect-16" id="modal-16">
			<div class="md-content">
				<h3>회원 가입 실패</h3>
				<div>
					<p>${requestScope.joinMsg}</p>
					<button class="md-close">닫기</button>
				</div>
			</div>
		</div>	
		</c:when>
		</c:choose>
				<div class="md-overlay"></div><!-- the overlay element -->

	
		
	</section>
	<%@ include file="/footer.jsp"%>
</body>
<script>
$('#join').addClass('menu__item--current');
</script>
	<!-- classie.js by @desandro: https://github.com/desandro/classie -->
		<script src="/sarte/js/classie.js"></script>
		<script src="/sarte/js/modalEffects.js"></script>

		<!-- for the blur effect -->
		<!-- by @derSchepp https://github.com/Schepp/CSS-Filters-Polyfill -->
		<script>
			// this is important for IEs
			var polyfilter_scriptpath = '/js/';
		</script>
		<script src="/sarte/js/cssParser.js"></script>
		<script src="/sarte/js/css-filters-polyfill.js"></script>

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
						else if(ev.target.value.length<=4)
						{
							idVarify.innerText='아이디는 4자 이상이어야 합니다.';
							return;
						}
						else
						{
							location.href='idCheck.sarte?id='+ev.target.value;
						}
					}
					if(ev.target.id==='pw2'||ev.target.id=='pw')
					{
						pw1=document.getElementById("pw");
						pw2=document.getElementById("pw2");
						
						if(pw1.value.length<=6){
							pwVarify.innerText='비밀번호는 6자 이상으로 입력해 주세요';	
							
						}
						else if(pw1.value===pw2.value)
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

</html>