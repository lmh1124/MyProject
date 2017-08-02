<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
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
			            title: "Burger Load" 
			  }); 
			  var infowindow = new google.maps.InfoWindow( 
			          { 
			            content: "<h1>Hamburger Store</h1>" +
			            		 "<p>서울특별시 종로구 종로12길 15 코아빌딩 10층</p>",
			            maxWidth: 300 
			          } 
			  ); 
	
			  /*
			  google.maps.event.addListener(marker, 'click', function() { 
			  	infowindow.open(map, marker); 
			  });
			  */
			  
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
  <style>
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
			width:100%;
			height:500px;
		}
  </style>   
</head>
 
<body>
<h2>Location</h2>
			<div id="map_canvas"></div>
 
</body>
</html>
