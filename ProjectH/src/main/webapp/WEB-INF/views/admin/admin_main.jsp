<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true" %>
<%@ page import="java.util.*" %>
<%
	String sid = (String)session.getAttribute("sid");
	String rPage = request.getParameter("page");

%>
<!DOCTYPE html>
<head>
   
<script> 

</script>	    

<!-- Meta Tags -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />


<link href="<c:url value='/css/bootstrap-combined.min.css'/>" rel="stylesheet">

<link href="<c:url value='/css/main.css'/>" rel="stylesheet">

<link href="<c:url value='/css/supersized.css'/>" rel="stylesheet">
<link href="<c:url value='/css/supersized.shutter.css'/>" rel="stylesheet">

<link href="<c:url value='/css/fancybox/jquery.fancybox.css'/>" rel="stylesheet">

<link href="<c:url value='/css/fonts.css'/>" rel="stylesheet">

<link href="<c:url value='/css/shortcodes.css'/>" rel="stylesheet">

<link href="<c:url value='/css/supersized.css'/>" rel="stylesheet">
<link href="<c:url value='/css/supersized.shutter.css'/>" rel="stylesheet">

<link href="<c:url value='http://fonts.googleapis.com/css?family=Titillium+Web:400,200,200italic,300,300italic,400italic,600,600italic,700,700italic,900'/>" rel='stylesheet' type='text/css'>


<link href="css/ljForm.css" rel="stylesheet" type="text/css">
<link href="css/CustomProjectH.css" rel="stylesheet" type="text/css">

<link rel="shortcut icon" href="#">

<link rel="apple-touch-icon" href="#">
<link rel="apple-touch-icon" sizes="114x114" href="#">
<link rel="apple-touch-icon" sizes="72x72" href="#">
<link rel="apple-touch-icon" sizes="144x144" href="#">

<!-- navigator -->

<!-- Modernizr -->
<!-- <script src="/js/modernizr.js"></script> -->
<script src="<c:url value='/js/modernizr.js'/>"></script>

<!-- Analytics -->
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'Insert Your Code']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

  
  
</script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<style>
 	.admin_title{
 		font-family: fantasy;
 		font-size:100px;
 	}
</style>
<!-- End Analytics -->
</head>
<body>

<!-- This section is for Splash Screen -->
<div class="ole">
<section id="jSplash">
	<div id="circle"></div>
</section>
</div>
<!-- End of Splash Screen -->

<!-- Homepage Slider -->

<!-- End Homepage Slider -->

<!-- Header -->
<header>
    <div class="sticky-nav">
    	<a id="mobile-nav" class="menu-nav" href="#menu-nav"></a>
        <div id="navmenu">
	        <div id="logo">
	        </div>
	        
	        <nav id="menu">
	        	<ul id="menu-nav">
						<li class="to_main"><a href="#"
						onclick="location.href='http://localhost:9000/projectH/main.do'">메인으로</a></li>
					<li><a href="http://localhost:9000/projectH/Menu"
							onclick="window.open(this.href, '_blanck', 'width=1200, height=800'); return false">메뉴 관리</a></li>	        	    
	                <li><a href="http://localhost:9000/projectH/admin_member.do"
							onclick="window.open(this.href, '_blanck', 'width=1200, height=800'); return false">회원 관리</a></li>
	                <li><a href="http://localhost:9000/projectH/qna.do"
							onclick="window.open(this.href, '_blanck', 'width=1200, height=800'); return false">Q&A 관리</a></li>
	                <li><a href="http://localhost:9000/projectH/board.do"
							onclick="window.open(this.href, '_blanck', 'width=1200, height=800'); return false">게시판 관리</a></li>
	            </ul>
	        </nav>
        </div>
    </div>
 
 
</header>
<!-- End Header -->

<div id="adminMain" class="page-alternate">
	<div class="admin_container">
	    <div class="row">
	            <div class="title-page">
	            	<h2 class="admin_title">Admin Page</h2>            
	            </div>
	    </div>
	</div>
</div>



<!-- Footer -->
<footer>
	<p class="credits">&copy;2017 HambergerStore.</p>
</footer>
<!-- End Footer -->


<!-- Js -->
<script src="<c:url value='http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js'/>"> </script>
<script src="<c:url value='/js/bootstrap.min.js'/>"> </script>
<script src="<c:url value='/js/supersized.3.2.7.min.js'/>"> </script>
<script src="<c:url value='/js/waypoints.js'/>"> </script>
<script src="<c:url value='/js/waypoints-sticky.js'/>"> </script>
<script src="<c:url value='/js/jquery.isotope.js'/>"> </script>
<script src="<c:url value='/js/jquery.tweet.js'/>"> </script>
<script src="<c:url value='/js/plugins.js'/>"> </script>
<script src="<c:url value='/js/main.js'/>"  charset="UTF-8"> </script>
<!-- End Js -->

</body>
</html>