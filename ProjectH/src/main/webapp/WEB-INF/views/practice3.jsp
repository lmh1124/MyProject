<%@ page language="java" contentType="text/html; charset=EUC-KR"
pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<head>
    <title>CarouselMenu</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
    <style type="text/css">
    /* Removes the default 20px margin and creates some padding space for the indicators and controls */
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
    padding-bottom:60px; 
}
</style>
    <script src="//code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
    <script type="text/javascript">
        window.alert = function(){};
        var defaultCSS = document.getElementById('bootstrap-css');
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
<body>
	<div class="container">
	<div class="row">
		<div class="span12">
    	    <div class="well"> 
                <div id="myCarousel" class="carousel slide">
                 
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                    <li data-target="#myCarousel" data-slide-to="2"></li>
                    <li data-target="#myCarousel" data-slide-to="3"></li>
                </ol>
                 
                <!-- Carousel items -->
                <div class="carousel-inner">
                    
                <div class="item active">
                	<div class="row-fluid">
                  	  <div class="span3"><a class="hover-wrap2 fancybox2" id="menu" data-fancybox-group="gallery" title="BLT��ġŲ����" href="http://localhost:9000/projectH/image/hamberger/HB1.png?fno=1"><img src="http://localhost:9000/projectH/image/hamberger/HB1.png" alt="Image" style="max-width:100%;" /><div class="strapline2">BLT��ġŲ����</div></a></div>
                	  <div class="span3"><a class="hover-wrap2 fancybox3" id="menu" data-fancybox-group="gallery" title="X-Traũ��ġ����" href="http://localhost:9000/projectH/image/hamberger/HB2.png?fno=2"><img src="http://localhost:9000/projectH/image/hamberger/HB2.png" alt="Image" style="max-width:100%;" /><div class="strapline2">X-Traũ��ġ����</div></a></div>
                	  <div class="span3"><a class="hover-wrap2 fancybox4" id="menu" data-fancybox-group="gallery" title="ũ��ġġŲ����" href="http://localhost:9000/projectH/image/hamberger/HB3.png?fno=3"><img src="http://localhost:9000/projectH/image/hamberger/HB3.png" alt="Image" style="max-width:100%;" /><div class="strapline2">ũ��ġġŲ����</div></a></div>
                	  <div class="span3"><a class="hover-wrap2 fancybox5" id="menu" data-fancybox-group="gallery" title="��������" href="http://localhost:9000/projectH/image/hamberger/HB4.png?fno=4"><img src="http://localhost:9000/projectH/image/hamberger/HB4.png" alt="Image" style="max-width:100%;" /><div class="strapline2">��������</div></a></div>
                	</div><!--/row-fluid-->
                	<br>
                	<div class="row-fluid">
                	  <div class="span3"><a class="hover-wrap2 fancybox6" id="menu" data-fancybox-group="gallery" title="����콺����ũ����" href="http://localhost:9000/projectH/image/hamberger/HB5.png?fno=5"><img src="http://localhost:9000/projectH/image/hamberger/HB5.png" alt="Image" style="max-width:100%;" /><div class="strapline2">����콺����ũ����</div></a></div>
                	  <div class="span3"><a class="hover-wrap2 fancybox7" id="menu" data-fancybox-group="gallery" title="��ŷ����" href="http://localhost:9000/projectH/image/hamberger/HB6.png?fno=6"><img src="http://localhost:9000/projectH/image/hamberger/HB6.png" alt="Image" style="max-width:100%;" /><div class="strapline2">��ŷ����</div></a></div>
                	  <div class="span3"><a class="hover-wrap2 fancybox8" id="menu" data-fancybox-group="gallery" title="�Ұ��ġ�����" href="http://localhost:9000/projectH/image/hamberger/HB7.png?fno=7"><img src="http://localhost:9000/projectH/image/hamberger/HB7.png" alt="Image" style="max-width:100%;" /><div class="strapline2">�Ұ��ġ�����</div></a></div>
                	  <div class="span3"><a class="hover-wrap2 fancybox9" id="menu" data-fancybox-group="gallery" title="����" href="http://localhost:9000/projectH/image/hamberger/HB8.png?fno=8"><img src="http://localhost:9000/projectH/image/hamberger/HB8.png" alt="Image" style="max-width:100%;" /><div class="strapline2">����</div></a></div>
                	</div><!--/row-fluid-->
                </div><!--/item-->
                 
                <div class="item">
                	<div class="row-fluid">
                	  <div class="span3"><a class="hover-wrap2 fancybox10" id="menu" data-fancybox-group="gallery" title="�Ұ�����" href="http://localhost:9000/projectH/image/hamberger/HB9.png?fno=9"><img src="http://localhost:9000/projectH/image/hamberger/HB9.png" alt="Image" style="max-width:100%;" /><div class="strapline2">�Ұ�����</div></a></div>
                	  <div class="span3"><a class="hover-wrap2 fancybox11" id="menu" data-fancybox-group="gallery" title="������Կ���" href="http://localhost:9000/projectH/image/hamberger/HB10.png?fno=10"><img src="http://localhost:9000/projectH/image/hamberger/HB13.png" alt="Image" style="max-width:100%;" /><div class="strapline2">������Կ���</div></a></div>
                	  <div class="span3"><a class="hover-wrap2 fancybox12" id="menu" data-fancybox-group="gallery" title="��Ʈ��ġ�����" href="http://localhost:9000/projectH/image/hamberger/HB11.png?fno=11"><img src="http://localhost:9000/projectH/image/hamberger/HB11.png" alt="Image" style="max-width:100%;" /><div class="strapline2">��Ʈ��ġ�����</div></a></div>
                	  <div class="span3"><a class="hover-wrap2 fancybox13" id="menu" data-fancybox-group="gallery" title="�����ִϾ�" href="http://localhost:9000/projectH/image/hamberger/HB12.png?fno=12"><img src="http://localhost:9000/projectH/image/hamberger/HB12.png" alt="Image" style="max-width:100%;" /><div class="strapline2">�����ִϾ�</div></a></div>
                	</div><!--/row-fluid-->
                	<br>
                	<div class="row-fluid">
                	  <div class="span3"><a class="hover-wrap2 fancybox14" id="menu" data-fancybox-group="gallery" title="������ġŲ������" href="http://localhost:9000/projectH/image/sideMenu/Side1.png?fno=13"><img src="http://localhost:9000/projectH/image/sideMenu/Side1.png" alt="Image" style="max-width:100%;" /><div class="strapline2">������ġŲ������</div></a></div>
                	  <div class="span3"><a class="hover-wrap2 fancybox15" id="menu" data-fancybox-group="gallery" title="ġŲ������" href="http://localhost:9000/projectH/image/sideMenu/Side2.png?fno=14"><img src="http://localhost:9000/projectH/image/sideMenu/Side2.png" alt="Image" style="max-width:100%;" /><div class="strapline2">ġŲ������</div></a></div>
                	  <div class="span3"><a class="hover-wrap2 fancybox16" id="menu" data-fancybox-group="gallery" title="��Ͼ�" href="http://localhost:9000/projectH/image/sideMenu/Side3.png?fno=15"><img src="http://localhost:9000/projectH/image/sideMenu/Side3.png" alt="Image" style="max-width:100%;" /><div class="strapline2">��Ͼ�</div></a></div>
                	  <div class="span3"><a class="hover-wrap2 fancybox17" id="menu" data-fancybox-group="gallery" title="���ϸ�(10����)" href="http://localhost:9000/projectH/image/sideMenu/Side4.png?fno=16"><img src="http://localhost:9000/projectH/image/sideMenu/Side4.png" alt="Image" style="max-width:100%;" /><div class="strapline2">���ϸ�(10����)</div></a></div>
                	</div><!--/row-fluid-->
                </div><!--/item-->
                 
                <div class="item">
                	<div class="row-fluid">
                	  <div class="span3"><a class="hover-wrap2 fancybox18" id="menu" data-fancybox-group="gallery" title="���ϸ�(6����)" href="http://localhost:9000/projectH/image/sideMenu/Side5.png?fno=7"><img src="http://localhost:9000/projectH/image/sideMenu/Side5.png" alt="Image" style="max-width:100%;" /><div class="strapline2">���ϸ�(6����)</div></a></div>
                	  <div class="span3"><a class="hover-wrap2 fancybox19" id="menu" data-fancybox-group="gallery" title="���ϸ�(4����)" href="http://localhost:9000/projectH/image/sideMenu/Side6.png?fno=8"><img src="http://localhost:9000/projectH/image/sideMenu/Side6.png" alt="Image" style="max-width:100%;" /><div class="strapline2">���ϸ�(4����)</div></a></div>
                	  <div class="span3"><a class="hover-wrap2 fancybox20" id="menu" data-fancybox-group="gallery" title="����ġ������(R)" href="http://localhost:9000/projectH/image/sideMenu/Side7.png?fno=9"><img src="http://localhost:9000/projectH/image/sideMenu/Side7.png" alt="Image" style="max-width:100%;" /><div class="strapline2">����ġ������(R)</div></a></div>
                	  <div class="span3"><a class="hover-wrap2 fancybox21" id="menu" data-fancybox-group="gallery" title="����ġ������(L)" href="http://localhost:9000/projectH/image/sideMenu/Side8.png?fno=10"><img src="http://localhost:9000/projectH/image/sideMenu/Side8.png" alt="Image" style="max-width:100%;" /><div class="strapline2">����ġ������(L)</div></a></div>
                	</div><!--/row-fluid-->
                	<br>
                	<div class="row-fluid">
                	  <div class="span3"><a class="hover-wrap2 fancybox22" id="menu" data-fancybox-group="gallery" title="������" href="http://localhost:9000/projectH/image/Drink/Drink1.png"><img src="http://localhost:9000/projectH/image/Drink/Drink1.png" alt="Image" style="max-width:100%;" /><div class="strapline2">������</div></a></div>
                	  <div class="span3"><a class="hover-wrap2 fancybox23" id="menu" data-fancybox-group="gallery" title="���̽�ī���" href="http://localhost:9000/projectH/image/Drink/Drink2.png"><img src="http://localhost:9000/projectH/image/Drink/Drink2.png" alt="Image" style="max-width:100%;" /><div class="strapline2">���̽�ī���</div></a></div>
                	  <div class="span3"><a class="hover-wrap2 fancybox24" id="menu" data-fancybox-group="gallery" title="ī���" href="http://localhost:9000/projectH/image/Drink/Drink3.png"><img src="http://localhost:9000/projectH/image/Drink/Drink3.png" alt="Image" style="max-width:100%;" /><div class="strapline2">ī���</div></a></div>
                	  <div class="span3"><a class="hover-wrap2 fancybox25" id="menu" data-fancybox-group="gallery" title="���̽��Ƹ޸�ī��" href="http://localhost:9000/projectH/image/Drink/Drink4.png"><img src="http://localhost:9000/projectH/image/Drink/Drink4.png" alt="Image" style="max-width:100%;" /><div class="strapline2">���̽��Ƹ޸�ī��</div></a></div>
                	</div><!--/row-fluid-->
                </div><!--/item-->
                
                  <div class="item">
                	<div class="row-fluid">
                	  <div class="span3"><a class="hover-wrap2 fancybox26" id="menu" data-fancybox-group="gallery" title="�Ƹ޸�ī��" href="http://localhost:9000/projectH/image/Drink/Drink5.png"><img src="http://localhost:9000/projectH/image/Drink/Drink5.png" alt="Image" style="max-width:100%;" /><div class="strapline2">�Ƹ޸�ī��</div></a></div>
                	  <div class="span3"><a class="hover-wrap2 fancybox27" id="menu" data-fancybox-group="gallery" title="�ݶ�R" href="http://localhost:9000/projectH/image/Drink/Drink6.png"><img src="http://localhost:9000/projectH/image/Drink/Drink6.png" alt="Image" style="max-width:100%;" /><div class="strapline2">�ݶ�R</div></a></div>
                	  <div class="span3"><a class="hover-wrap2 fancybox28" id="menu" data-fancybox-group="gallery" title="�ݶ�L" href="http://localhost:9000/projectH/image/Drink/Drink7.png"><img src="http://localhost:9000/projectH/image/Drink/Drink7.png" alt="Image" style="max-width:100%;" /><div class="strapline2">�ݶ�L</div></a></div>
                	  <div class="span3"><a class="hover-wrap2 fancybox29" id="menu" data-fancybox-group="gallery" title="�����ݶ�R " href="http://localhost:9000/projectH/image/Drink/Drink8.png"><img src="http://localhost:9000/projectH/image/Drink/Drink8.png" alt="Image" style="max-width:100%;" /><div class="strapline2">�����ݶ�R</div></a></div>
                	</div><!--/row-fluid-->
                	<br>
                	<div class="row-fluid">
                	  <div class="span3"><a class="hover-wrap2 fancybox30" id="menu" data-fancybox-group="gallery" title="�����ݶ�L" href="http://localhost:9000/projectH/image/Drink/Drink9.png"><img src="http://localhost:9000/projectH/image/Drink/Drink9.png" alt="Image" style="max-width:100%;" /><div class="strapline2">�����ݶ�L</div></a></div>
                	  <div class="span3"><a class="hover-wrap2 fancybox31" id="menu" data-fancybox-group="gallery" title="��������ƮR" href="http://localhost:9000/projectH/image/Drink/Drink10.png"><img src="http://localhost:9000/projectH/image/Drink/Drink10.png" alt="Image" style="max-width:100%;" /><div class="strapline2">��������ƮR</div></a></div>
                	  <div class="span3"><a class="hover-wrap2 fancybox32" id="menu" data-fancybox-group="gallery" title="��������ƮL" href="http://localhost:9000/projectH/image/Drink/Drink11.png"><img src="http://localhost:9000/projectH/image/Drink/Drink11.png" alt="Image" style="max-width:100%;" /><div class="strapline2">��������ƮL</div></a></div>
                	  <div class="span3"><a class="hover-wrap2 fancybox33" id="menu" data-fancybox-group="gallery" title="ȯŸ������R" href="http://localhost:9000/projectH/image/Drink/Drink12.png"><img src="http://localhost:9000/projectH/image/Drink/Drink12.png" alt="Image" style="max-width:100%;" /><div class="strapline2">ȯŸ������R</div></a></div>
                	</div><!--/row-fluid-->
                </div><!--/item-->
                </div><!--/carousel-inner-->
                 
                <span><a class="left carousel-control" href="#myCarousel" data-slide="prev">L</a></span>
                <span><a class="right carousel-control" href="#myCarousel" data-slide="next">R</a></span>
                </div><!--/myCarousel-->
                 
            </div><!--/well-->   
		</div>
	</div>
</div>
	<script type="text/javascript">
	$(document).ready(function() {
    $('#myCarousel').carousel({
	    interval: 10000
	})
});
	</script>
</body>
</html>
