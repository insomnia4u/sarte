<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<link rel="stylesheet" type="text/css" href="/sarte/css/menu_component.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/jquery-ui.min.js"></script>
<header>
<section class="section--menu" id="Valentine">

	<h2 class="section__title"></h2>

	<nav class="menu menu--valentine">

		<ul class="menu__list left">
			<li class="menu__item" id="home">
				<a class="menu__link" href="/sarte/index.jsp">SARTE</a>
			</li>
			<li class="menu__item"  id="block" >
				<a class="menu__link"href="#">라이프 블럭</a>
			</li>
			<li class="menu__item" id="module">
				<a class="menu__link" href="#">라이프 모듈</a>
			</li>
		</ul>
		<c:choose>
		<c:when test="${empty sessionScope.dto}">
		<ul class="menu__list right">
			<li class="menu__item"  id="join" >
				<a class="menu__link"href="joinForm.sarte">회원 가입</a>
			</li>
			<li class="menu__item"  id="login">
				<a class="menu__link" href="loginForm.sarte">로그인</a>
			</li>
		</ul>
		</c:when>
		<c:otherwise>
			<li class="menu__item" id="logout">
				<a class="menu__link"  href="logout.sarte">로그아웃</a>
			</li>
			<li class="menu__item"  id="myPage">
				<a class="menu__link" href="#">${sessionScope.dto.name} 님 환영합니다.</a>
			</li>
		</c:otherwise>
		</c:choose>
	</nav>

</section>
<script src="/sarte/js/classie.js"></script>
<script src="/sarte/js/clipboard.min.js"></script>
<script>


$(function(){ 
    var menupos = $("#Valentine").offset().top; 
    $(window).scroll(function(){ 
       if($(window).scrollTop() >= menupos) { 
          $("#Valentine").addClass('fixed');
         
          }
       else
       {
    	   $('#Valentine').removeClass('fixed');
       }
    }); 
 }); 
 </script>
</header>