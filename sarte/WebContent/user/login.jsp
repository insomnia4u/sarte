<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Title</title>
<link rel="stylesheet" type="text/css" href="/sarte/css/reset.css">
<link rel="stylesheet" type="text/css" href="/sarte/css/main.css">
<link rel="stylesheet" type="text/css" href="/sarte/css/buttons.css">
<link rel="stylesheet" type="text/css" href="/sarte/css/textinput.css">
<link rel="stylesheet" type="text/css" href="/sarte/css/component.css" />
</head>
<body>
<body class="content">
<%@ include file="/header.jsp" %>

	<section class="m_content">
	
		<h2 class="menu_title">로그인</h2>
		<form name="join_f" action="login.sarte"> 
		<div class="joincontent">
		<div class="input input--minoru">
			<input class="input__field input__field--yoko" id="userid" name="id" type="text" value="${requestScope.id}" /> <label
				class="input__label input__label--yoko" for="input-16"> <span
				class="input__label-content input__label-content--yoko" >아이디</span>
			</label>
			
		</div>
		<br>
		<div class="input input--minoru">
			<input class="input__field input__field--yoko" id="pw" name="pw" type="password" value="${requestScope.pw }" /> <label
				class="input__label input__label--yoko" for="input-17"> <span
				class="input__label-content input__label-content--yoko">비밀번호</span>
			</label>
		</div>
		<p id="varify"></p>
		
		<button type="submit" data-modal="modal-16" class="md-trigger button button--wayra button--border-thick button--text-upper button--size-s">로그인</button>
		</div>
		</form>
		<script>
		</script>
		<c:if test="${requestScope.act}">
			<div class="md-show md-modal md-effect-16" id="modal-16">
			<div class="md-content">
				<h3>로그인</h3>
				<div>
					<p>
					${requestScope.msg}
					</p>
					<button class="md-close" onclick="location.href='/sarte/index.jsp';">확인!</button>
				</div>
			</div>
		</div>

		<div class="md-overlay"></div><!-- the overlay element -->

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
		
		</c:if>
	</section>	
</body>
<script>
		$('#login').addClass('menu__item--current');
</script>
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
							varify.innerText='아이디를 입력해주세요.';
						}
						
					}
					if(ev.target.id==='pw')
					{
						pw=document.getElementById("pw");
					
						
						if(pw.value=='')
						{
							varify.innerText='비밀번호를 입력해주세요.';
						}

					}
				}
			})();
			
			
		</script>


</html>