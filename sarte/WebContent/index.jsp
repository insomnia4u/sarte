<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/sarte/css/reset.css">
<link rel="stylesheet" type="text/css" href="/sarte/css/main.css">
<link rel="stylesheet" type="text/css" href="/sarte/css/buttons.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/jquery-ui.min.js"></script>
<script type="text/javascript"> 
			$(function(){
				$(document).ready(function(){
					var win = $(window);
                    var area = $('#index');
                    $('#index').css({
                        position: 'absolute',                       
                        left: (win.width() - area.outerWidth()) / 2,
                        top: (win.height() - area.outerHeight()) / 2
                    });
				})
			});
			
            $(function() {
                $(window).resize(function() {
                    var win = $(window);
                    var area = $('#index');
                    $('#index').css({
                        position: 'absolute',                       
                        left: (win.width() - area.outerWidth()) / 2,
                        top: (win.height() - area.outerHeight()) / 2
                    });

                    //$('body').append('<div>l=' + ((win.width() - area.outerWidth()) / 2) + '</div>');                     
                    //$('body').append('<div>w=' + area.outerWidth() + '</div>');
                    //$('body').append('<div>h=' + area.outerHeight() + '</div>');
                });

                $(window).resize();
            });
</script>

<title>Project SARTE</title> 
</head>
<body>
<%@ include file="/header.jsp" %>
	<video autoplay loop id="bgvid">
    <source src="/sarte/video/main2.mp4" type="video/mp4">
	</video>
<section id="index">
<article>

<h1>삶을 정복하세요!</h1>
<h2>SARTE는 나만의 삶을 실천하려는 분들을 위한 서비스입니다.</h2>
			
</article>
<div class="box bg-1 main-button-container">
<button class="button button--wayra button--border-thick button--text-upper button--size-s" onclick="location.href='/sarte/lblock.jsp'">시작하기</button>
<button class="button button--wayra button--border-thick button--text-upper button--size-s" onclick="location.href='joinForm.sarte'">가입하기</button>
</div>
</section>
<script>

$('#home').addClass('menu__item--current');


</script>
</body>
</html>