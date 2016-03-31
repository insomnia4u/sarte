<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/semi/css/jquery.fullPage.css">

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/jquery-ui.min.js"></script>

<script src="/semi/js/jquery.fullPage.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="fullpage">
<section class="section">
	<article>
	
	<h1>시간을 정복하세요!</h1>
	<video autoplay loop id="bgvid">
    <source src="/sarte/video/main2.mp4" type="video/mp4">
</video>
	
	</article>
</section>
<section class="section">
	<article>
		<h2>제목 2</h2>
		<p>내용 2</p>
	</article>
</section>
<section class="section" style="height: 800px;">
	<article>
		<h2>제목 3</h2>
		<p>내용 3</p>
	</article>
	<%@ include file="/footer.jsp" %>
</section>
</div>
</body>
	<script>
		$(document).ready(function() {
			$('#fullpage').fullpage({
				sectionsColor: ['#f2f2f2', '#4BBFC3', '#7BAABE', 'whitesmoke', '#000'],
				scrollBar: true
			});
		});
	</script>

</body>
</html>