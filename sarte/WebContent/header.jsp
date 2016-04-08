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
				<a class="menu__link" onclick="FB.logout()" href="logout.sarte">로그아웃</a>
			</li>
			<li class="menu__item"  id="myPage">
				<a class="menu__link" id="status" href="#">${sessionScope.dto.name} 님 환영합니다.</a>
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
 <script id="facebook-jssdk" async src="//connect.facebook.net/ko_KR/all.js#xfbml=1"></script>
      <script>
      // 로그인
      var fabceloginChk = 0;
      function loginFB(){
         if(fabceloginChk == 0){ 
            FB.login(function(response) {
               if (response.authResponse) {
   					document.location.reload();
                   fabceloginChk  = 1;
                   
               }else{   
                  alert('로그인에 실패했습니다!');
                  fabceloginChk  = 0;
                   }
              }
          ,{scope: "user_about_me,email,user_birthday"} 
         );
      }
   }
      
      //SDK 설정
      window.fbAsyncInit = function() {
            FB.init({
              appId      : '1313822138632979', // 앱 ID
              status     : true,          // 로그인 상태를 확인
              cookie     : true,          // 쿠키허용
              xfbml      : true           // parse XFBML
            });
            
            FB.Event.subscribe('auth.logout', function(response) {
               document.location.reload();
            });
            
            // 추가적인 코드는 여기에 작성해주세요.
            FB.getLoginStatus(function(response) {
                if (response.status === 'connected') {
                    FB.api('/me', function(user) {
                        if (user) {
                            var imgpath = document.getElementById('imgpath');
                            imgpath.value='http://graph.facebook.com/' + user.id + '/picture';
                            var name = document.getElementById('name');
                            name.value = user.name;
                            var id = document.getElementById('id');
                            id.value = user.id;
                            var email = document.getElementById('email');
                            email.value = user.email;
                            document.forms['f1'].submit();
                            
                        }
                    });    
                     
                } else if (response.status === 'not_authorized') {
                	 
                } else {
                
                }
            });
            
/*             FB.Event.subscribe('auth.login', function(response) {
                
            }); */
            
          };
          
      
        // Load the SDK Asynchronously
        (function(d){
           var js, id = 'facebook-jssdk', ref = d.getElementsByTagName('script')[0];
           if (d.getElementById(id)) {return;}
           js = d.createElement('script'); js.id = id; js.async = true;
           js.src = "//connect.facebook.net/ko_KR/all.js#xfbml=1";
           ref.parentNode.insertBefore(js, ref);
         }(document));
</script>
</header>