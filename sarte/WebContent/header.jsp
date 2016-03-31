<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" type="text/css" href="/sarte/css/menu_component.css">

<header>
<section class="section section--menu" id="Valentine">

	<h2 class="section__title"></h2>

	<nav class="menu menu--valentine">

		<ul class="menu__list left">
			<li class="menu__item menu__item--current">
				<a class="menu__link" href="#">SARTE</a>
			</li>
			<li class="menu__item">
				<a class="menu__link" href="#">라이프 블럭</a>
			</li>
			<li class="menu__item">
				<a class="menu__link" href="#">라이프 모듈</a>
			</li>
		</ul>
		<ul class="menu__list right">
			<li class="menu__item">
				<a class="menu__link" href="#">회원 가입</a>
			</li>
			<li class="menu__item">
				<a class="menu__link" href="#">로그인</a>
			</li>
		</ul>
		
	</nav>

</section>
<script src="/sarte/js/classie.js"></script>
<script src="/sarte/js/clipboard.min.js"></script>
		<script>
		(function() {
			[].slice.call(document.querySelectorAll('.menu')).forEach(function(menu) {
				var menuItems = menu.querySelectorAll('.menu__link'),
					setCurrent = function(ev) {
						ev.preventDefault();

						var item = ev.target.parentNode; // li

						// return if already current
						if (classie.has(item, 'menu__item--current')) {
							return false;
						}
						// remove current
						classie.remove(menu.querySelector('.menu__item--current'), 'menu__item--current');
						// set current
						classie.add(item, 'menu__item--current');
					};

				[].slice.call(menuItems).forEach(function(el) {
					el.addEventListener('click', setCurrent);
				});
			});

			[].slice.call(document.querySelectorAll('.link-copy')).forEach(function(link) {
				link.setAttribute('data-clipboard-text', location.protocol + '//' + location.host + location.pathname + '#' + link.parentNode.id);
				new Clipboard(link);
				link.addEventListener('click', function() {
					classie.add(link, 'link-copy--animate');
					setTimeout(function() {
						classie.remove(link, 'link-copy--animate');
					}, 300);
				});
			});
		})(window);


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