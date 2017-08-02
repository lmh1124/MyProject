<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>Moving</title>

    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <style type="text/css">
		.carousel {
		    margin-bottom: 0;
			padding: 0 40px 30px 40px;
		}
		/* Reposition the controls slightly */
		.carousel-control {
			left: -12px;
		}
		.carousel-control.right {
			right: -12px;
		}
		/* Changes the position of the indicators */
		.carousel-indicators {
			right: 50%;
			top: auto;
			bottom: 0px;
			margin-right: -19px;
		}
		/* Changes the colour of the indicators */
		.carousel-indicators li {
			background: #c0c0c0;
		}
		.carousel-indicators .active {
		background: #333333;
		}
		span{
		    margin-bottom:20px;
		}
		.hh1{
			font-size:30px;
			color:#6d4412;
			font-family:fantasy;	
			margin-top:10px;
		}
		.title {
		width:40%;
		color:black;
		font-size: 55px;
		margin: auto;
		border-top:5px double brown;
		border-bottom:5px double brown;
		font-family: 'Pacifico', cursive;
		}
   		ul.ulQna{
			display:block;
			list-style-type:none;
			margin:auto;
			width:600px;
			height:300px;
		}	
		div#map_canvas{
			display:block;
			margin:auto;
			width:80%;
			height:500px;
		}
		
    </style>
    
    <script src="//code.jquery.com/jquery-1.10.2.min.js"></script>

    <script type="text/javascript" src="http://maps.google.com/maps/api/js?key=AIzaSyDrpxa9-OrQYKe-oawkpe06iIjd5eALfi4"></script>
    <script>    
		function initialize() { 
			  var myLatlng = new google.maps.LatLng(37.569650, 126.986085); // y, x좌표값
			  var mapOptions = { 
			        zoom: 16, 
			        center: myLatlng, 
			        mapTypeId: google.maps.MapTypeId.ROADMAP 
			  } 
			 
			  var map = new google.maps.Map(document.getElementById('map_canvas'), mapOptions);
			  var marker = new google.maps.Marker({ 
			            position: myLatlng, 
			            map: map, 
			            title: "hamburger Store" 
			  }); 
			  var infowindow = new google.maps.InfoWindow( 
			          { 
			            content: '<h1 class="hh1" color="red" font-color="red">hamburger Store</h1>' +'<p>서울특별시 종로구 종로12길 15 코아빌딩 10층</p>',
			            maxWidth: 300 
			          } 
			  ); 
	
			  	infowindow.open(map, marker); 
			  			  
		}
		
		
        window.alert = function(){};
        var defaultCSS = document.getElementById('bootstrap-combined.min.css');
        function changeCSS(css){
            if(css) $('head > link').filter(':first').replaceWith('<link rel="stylesheet" href="'+ css +'" type="text/css" />'); 
            else $('head > link').filter(':first').replaceWith(defaultCSS); 
        }
        $( document ).ready(function() {
          var iframe_height = parseInt($('html').height()); 
          window.parent.postMessage( iframe_height, 'http://bootsnipp.com');
        });        
 
    </script>	    
</head>
<body onload="initialize()" class="homeBody" >
  
	
		<section class="secQna">
			<h2 class="title">HBGS Location</h2><br>
			<div id="map_canvas"></div> 
		
		</section>

	<script type="text/javascript">
	$(document).ready(function() {
    $('#myCarousel').carousel({
	    interval: 10000
	})
});
	</script>
</section>

</body>
</html>




