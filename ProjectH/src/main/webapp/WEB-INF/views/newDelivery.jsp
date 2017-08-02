<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<head>
<!-- GoogoleMap Asynchronously Loading the API ********************************************* -->
<script type="text/javascript" src="http://maps.google.com/maps/api/js?key=AIzaSyDrpxa9-OrQYKe-oawkpe06iIjd5eALfi4"></script>  

<!-- Meta Tags -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<title>Hamburger Store</title>   

<meta name="description" content="Insert Your Site Description" /> 

<!-- Mobile Specifics -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="HandheldFriendly" content="true"/>
<meta name="MobileOptimized" content="320"/>   

<link href="<c:url value='/css/bootstrap-combined.min.css'/>" rel="stylesheet">

<!-- Main Style -->
<link href="<c:url value='/css/main.css'/>" rel="stylesheet">

<!-- Supersized -->
<link href="<c:url value='/css/supersized.css'/>" rel="stylesheet">
<link href="<c:url value='/css/supersized.shutter.css'/>" rel="stylesheet">

<!-- FancyBox -->
<link href="<c:url value='/css/fancybox/jquery.fancybox.css'/>" rel="stylesheet">

<!-- Font Icons -->
<link href="<c:url value='/css/fonts.css'/>" rel="stylesheet">

<!-- Shortcodes -->
<link href="<c:url value='/css/shortcodes.css'/>" rel="stylesheet">

<link href="<c:url value='/css/supersized.css'/>" rel="stylesheet">
<link href="<c:url value='/css/supersized.shutter.css'/>" rel="stylesheet">

<!-- Custom Css -->
<link href="css/ljForm.css" rel="stylesheet" type="text/css">
<link href="css/CustomProjectH.css" rel="stylesheet" type="text/css">
<link href="css/MenuCSS.css" rel="stylesheet" type="text/css">

<!-- Google Font -->
<link href="<c:url value='http://fonts.googleapis.com/css?family=Titillium+Web:400,200,200italic,300,300italic,400italic,600,600italic,700,700italic,900'/>" rel='stylesheet' type='text/css'>

<!-- Fav Icon -->
<link rel="shortcut icon" href="#">
<link rel="apple-touch-icon" href="#">
<link rel="apple-touch-icon" sizes="114x114" href="#">
<link rel="apple-touch-icon" sizes="72x72" href="#">
<link rel="apple-touch-icon" sizes="144x144" href="#">

<!-- Modernizr -->
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
    .dd1{
    text-align:center;
    margin:auto;
    height:200px;
    width:600px;
    margin:auto; 
    }

	.tt1{
	text-align:center;
    margin:auto; 
	 width:90%;
	 height:80%;
	 
	 }
	.td1{
    border:1px solid gray;
	}
	.command0{
	text-align:center;
	margin:auto;
	 border:1px solid gray;
	 width:90%;
	 height:80%;
	}
</style>
</head>
<!-- Head End -->

<body>

	<div class="ole">
	<section id="jSplash">
		<div id="circle"></div>
	</section>
	</div>

<!-- Header -->
<header>
    <div class="sticky-nav">
    	<a id="mobile-nav" class="menu-nav" href="#menu-nav"></a>
        <div id="navmenu">
	        <div id="logo">
	<!--         	<a id="goUp" href="#home-slider" title="Brushed | Responsive One Page Template">Brushed Template</a> -->
	        </div>
	        <input type="hidden" id='loginSession_ID' value='<%=session.getAttribute("email")%>'>
	        <nav id="menu">
	        	<ul id="menu-nav">
	        	
		<c:choose>
		<c:when test="${empty sessionScope.email }">
      	   		<li class="login" id="loginM"><a href="login-box" id="umenu">Login</a></li>
      	   		<li class="login"><a href="join_f"  id="umenu">Register</a></li>
		</c:when>
		<c:when test="${not empty sessionScope.email }">
			<li class="login"><a href="logout_f" id="umenu">Logout</a></li>
			
		    <li class="login"><a href="submenu"  id="menu_mypage">Mypage</a>
     	    	<div class="subpage" id="subm">
				<ul class="sub_mypage" id="submenu">
					<li class="logcheck" id="my_update"><a class="sm" id="smen" href="mypage1">회원정보 수정</a></li>
					<li class="logcheck"><a class="sm" id="smen" href="mypage4">비밀번호 변경</a></li>
					<li><a class="sm" id="smen" href="mypage2">주문 내역</a></li>
					<li><a class="sm" id="smen" href="mypage3">선호 메뉴</a></li>
					<li  class="logcheck"><a class="sm" id="smen" href="mypage5">회원 탈퇴</a></li>
				</ul>
	<!-- MyPage -->
					<c:if test="${not empty sessionScope.email }">
						<div class="mypage_div" id="mypage_login">
							<label>비밀번호를 입력하세요</label><br>
							<input type="password"  id="my_pass"/>
							<button type="button" id="my_log">확인</button><br>
							<span id="pass_ck"></span>
						</div>
						<div class="mypage_div" id="mypage1">
							<iframe src="http://localhost:9000/projectH/mypageInfo" id="mypageFrame" frameBorder="0" height="100%" width="100%" scrolling=no></iframe>
						</div>
					</c:if>	        	    	
                <!-- 주문목록 -->
				<div class="mypage_div" id="mypage2">
					<div class="mypage_c">	
						<div class="mypage_f_list">
								<iframe src="http://localhost:9000/projectH/mypage_orderList" id="mypageOrderList" frameBorder="0" height="100%" width="100%" ></iframe>
						</div>
					</div>
				</div>
		        <!-- 선호목록 -->		
				<div class="mypage_div" id="mypage3">
					<div class="mypage_c">	
						<div class="mypage_f_favor">
								<iframe src="http://localhost:9000/projectH/mypage_favor" id="mypageFavorList" frameBorder="0" height="100%" width="100%" scrolling=no></iframe>
						</div>
					</div>
				</div>
				
				<div class="mypage_div" id="mypage4">
					<div class="mypage_c">
						<div class="mypage_f">
							<label id="ttop">비밀번호 변경</label><br>
							<label>비밀번호</label>
							<input type="password" id="ch_pass"/>
							<label>비밀번호 확인</label>
							<input type="password" id="ch_upass"/><br>
							<span id="passcheck"></span><br>
							<button type="button" id="my_pass_update">변경</button>
						</div>
					</div>
				</div>
				
				<div class="mypage_div" id="mypage5">
					<div class="mypage_c">
						<div class="mypage_f">
							<label>회원 탈퇴 하시겠습니까?</label><br>
							<button type="button" id="del_ent">확인</button>
							<button type="button" id="del_cel">취소</button>
						</div>
					</div>
				</div>
	<!-- End My Page -->
	        	    	</div>
	        	    </li>
		</c:when>
		</c:choose>
		
		        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	            	<li class="current"><a href="#home-slider">Home</a></li>
	                <li><a href="#work">Delivery</a></li>
	                <li><a href="#about">FoodInfo</a></li>
	                <li><a href="#contact">Q&A</a></li>
	                <li><a href="#order">FreeBoard</a></li>
	                <li><a href="#social-area">Map & SNS</a></li>
	                 <li><a href="#"
						onclick="location.href='http://localhost:9000/projectH/admin.do'">Admin</a></li>
	            </ul>
	        </nav>
        </div>
    </div>
 <!-- Login -->
	<div id="login-box" class="popup">
		<a href="#" class="l_close"><img
			src="http://localhost:9000/projectH/img/close_pop.png"
			class="btn_close" title="Close Window" alt="Close" /></a>
		<form method="post" class="signin" action="login">
			<fieldset class="textbox">
				<span id="log_msg"></span> <label class="username"> <span
					id="log">Email</span> <input id="lemail" name="email" value=""
					type="text" autocomplete="on" placeholder="Email">
				</label> <label class="password"> <span id="log">Password</span> <input
					id="lpassword" name="password" value="" type="password"
					placeholder="Password">
				</label>
				<button class="submit_btn" id="sub_btn" type="button">LOGIN</button>
				<p>
					<button type="button" id="find_id" class="forgot">FIND
						YOUR ID/PASSWORD</button>
				</p>
			</fieldset>
		</form>
	</div>
	<!-- End Login -->

	<!--Logout-->
	<div id="logout_f" class="popup">
		<label>로그아웃하시겠습니까?</label>
		<button type="button" id="logout_y">확인</button>
		<button type="button" id="logout_n">취소</button>
	</div>
	<!-- Join -->
	<div id="join_f" class="popup">
		<a href="#" class="l_close"><img
			src="http://localhost:9000/projectH/img/close_pop.png"
			class="btn_close2" title="Close Window" alt="Close" /></a>
		<iframe src="http://localhost:9000/projectH/joinForm" id="joinFrame"
			frameBorder=0 height="100%" width="100%" scrolling=no></iframe>
	</div>
	<!-- End Join -->
 
</header>
<!-- End Header -->


		<!-- Board Write -->
		<div id="write_f" class="popup">
			<a href="#" class="l_close"><img src="http://localhost:9000/projectH/img/close_pop.png" class="btn_close2" title="Close Window" alt="Close" /></a>
			
		<div class="board_form">
			<form name="boardForm" action="board_save.do" method="post">
				<ul class="writeUl">
				<li class="writeLi1">
					<label>제목</label>
					<input type="text" name="title" id="title">
				</li>
				<li class="writeLi2">
					<label>내용</label>
					<textarea rows="10" cols="50" name="content" id="content"></textarea>
				</li>
				<li class="writeLi3">
					<label>작성자</label>
					<input type="text" name="bname" id="bname">
				</li>
				<li class="bform_btn">
					<span class="save" id="save">저장</span>
					<a href="http://localhost:9000/projectH/board.do">
						<span class="cancel" id="cancel">취소</span>
					</a>
					<a href="http://localhost:9000/projectH/board.do">
						<span class="list">목록으로</span>
					</a>
				</li>
				</ul>				
			</form>
			</div>
		</div>


		<!-- Title Page -->
		<div id="home-slider">	
		    <div class="overlay"></div>
		
		    <div class="slider-text">
		    	<div id="slidecaption"></div>
		    </div>   
			
			<div class="control-nav">
		        <a id="prevslide" class="load-item"><i class="font-icon-arrow-simple-left"></i></a>
		        <a id="nextslide" class="load-item"><i class="font-icon-arrow-simple-right"></i></a>
		        <ul id="slide-list"></ul>
		        
		        <a id="nextsection" href="#work"><i class="font-icon-arrow-simple-down"></i></a>
		    </div>
		</div>   
		<!-- Our Work Section -->
		<div id="work" class="page">
			<div class="container">
		    	<!-- Title Page -->
		        <div class="row">
		            <div class="span12">
		                <div class="title-page">
		                    <h2 class="title">Delicious News</h2>
		                    
		                </div>
		            </div>
		        </div>
        <!-- End Title Page -->
        
        <!-- Portfolio Projects -->
		        <div class="row">
		        	
		            	<!-- Filter -->
		                <nav id="options" class="fancyMenu">
		                  	<ul id="menuList">
								<li><label>Menu List</label></li>
								<li><a href="#menuA" data-option-value="*" class="selected">All Menu</a></li>
								<li><a href="#menuA" data-option-value="#menuB">Berger Menu</a></li>
								<li><a href="#menuA" data-option-value="#menuD">Drink Menu</a></li>
								<li><a href="#menuA" data-option-value="#menuS">Side Menu</a></li>
							</ul>
							 <div class="basketform">
								<label class="basktitle">장바구니 리스트</label>
								<div class="baskIn">
									<label class="baskn">No</label><label class="baskn">이름</label><label class="baskn">개수</label><label class="baskn">가격</label>
									<div class="scrollView">
										<div class="scrollBlind">
		
												<ul id="basketList">
													<c:if test="${not empty sessionScope.baskList }">
														<c:forEach items="${sessionScope.baskList }" var="order">
															<li id="ord">
																<input type="text" readOnly id="order_number" name="order_number" value="${order.order_number}" style="margin-right:-3px">
																<input type="text" readOnly id="order_name" name="order_name" value="${order.order_name}" style="margin-right:-3px">
																<input type="text" readOnly id="order_count" name="order_count" value="${order.order_count}" style="margin-right:-4px">
																<input type="text" readOnly id="order_cost" name="order_cost" value="${order.order_cost}" style="margin-right:-3px">
																<input type="hidden" readOnly id="order_no" name="order_no" value="${order.order_no}">
															</li>
														</c:forEach>
													</c:if>
												</ul>
										</div>
									</div>
									<span class="basktot"><label class="tottitle">합계</label><label><input type="text" id="totCost" readOnly value="0"></label></span>
								</div>
								<button type="button" id="orderBas" onclick="orderBtn()">주문</button><button type="button" id="deleteSelected" onclick="basketSelDelete()">삭제</button><button type="button" id="deleteBask" onclick="basketDelete()">비우기</button>
							</div>
		                </nav>
		                <!-- End Filter -->
		                
    <div id="menuA">
    	<div class="menuA_blind">
			<ul id="menuList_main">
				<c:forEach items="${bList}" var="berger">
			<li class="listM" id="menuB">
				<a id="detailM">
			<span class="overImg">
				<c:if test="${not empty sessionScope.email }">
					<c:set var="check" value="false"/>
					<c:if test="${empty bList2 }">
						<div class="heart">
							<div id="d1"></div>
							<div id="d2"></div>
						</div>
					</c:if>
					<c:forEach items="${bList2 }" var="favor" varStatus="status">
						<c:if test="${not check }">							
							<c:if test="${berger.mname eq favor.order_name }">
								<c:set var="check" value="true"/>
								<div class="heart pick">
									<div id="d1"></div>
									<div id="d2"></div>
								</div>
							</c:if>
							<c:if test="${status.last and berger.mname ne favor.order_name}">
								<div class="heart">
									<div id="d1"></div>
									<div id="d2"></div>
								</div>
							</c:if>
						</c:if>
					</c:forEach>
				</c:if>
			</span>
			<span class="orderTab">		
				<label>${berger.mname }</label><br>
				<label>${berger.mcost }</label><br>
				<input type="number" id="countL" min=0 max=10 placeholder="수량">
				<button type="button" id="inputBt" onclick="clickBtn(this)">주문</button>
			</span>
				</a>
				<img src="http://localhost:9000/projectH/menuImg/${berger.pfname }"/>
				<input type="hidden" id="mSo" value=1>
				<input type="hidden" id="mFname" value="${berger.pfname }">
				<input type="hidden" id="mNo" value="${berger.mno }">
				<input type="hidden" id="mName" value="${berger.mname }">
				<input type="hidden" id="mCost"value="${berger.mcost }">
		</li>
		</c:forEach>
					
		<c:forEach items="${dList}" var="drink">
		<li  class="listM" id="menuD">
			<a id="detailM">
				<span class="overImg">
					<c:if test="${not empty sessionScope.email }">
					<c:set var="check" value="false"/>
					<c:if test="${empty dList2 }">
						<div class="heart">
							<div id="d1"></div>
							<div id="d2"></div>
						</div>
					</c:if>
						<c:forEach items="${dList2 }" var="favor" varStatus="status">
							<c:if test="${not check }">								
								<c:if test="${ drink.mname  eq favor.order_name }">
									<c:set var="check" value="true"/>
									<div class="heart pick">
										<div id="d1"></div>
										<div id="d2"></div>
									</div>
								</c:if>
								<c:if test="${ status.last and drink.mname ne favor.order_name}">
									<div class="heart">
										<div id="d1"></div>
										<div id="d2"></div>
									</div>
								</c:if>
							</c:if>
						</c:forEach>
					</c:if>
				</span>
				<span class="orderTab">
					<label>${drink.mname }</label><br>
					<label>${drink.mcost }</label><br>
					<input type="number" id="countL" placeholder="수량">
					<button type="button" id="inputBt" onclick="clickBtn(this)">주문</button>
				</span>
				</a>
				<img src="http://localhost:9000/projectH/menuImg/${drink.pfname }"/>
				<input type="hidden" id="mSo" value=2>
				<input type="hidden" id="mFname" value="${drink.pfname }">
				<input type="hidden" id="mNo" value="${drink.mno }">
				<input type="hidden" id="mName" value="${drink.mname }">
				<input type="hidden" id="mCost"value="${drink.mcost }">
			</li>
		</c:forEach>
											
		<c:forEach items="${sList}" var="side">
			<li class="listM" id="menuS">
				<a id="detailM">
					<span class="overImg">
						<c:if test="${not empty sessionScope.email }">
							<c:set var="check" value="false"/>
							<c:if test="${empty sList2 }">
								<div class="heart">
									<div id="d1"></div>
									<div id="d2"></div>
								</div>
							</c:if>
							<c:forEach items="${sList2 }" var="favor" varStatus="status">
								<c:if test="${not check }">
									<c:if test="${ side.mname eq favor.order_name }">
										<c:set var="check" value="true"/>
										<div class="heart pick">
											<div id="d1"></div>
											<div id="d2"></div>
										</div>
									</c:if>
									<c:if test="${status.last and side.mname ne favor.order_name}">
										<div class="heart">
											<div id="d1"></div>
											<div id="d2"></div>
										</div>
									</c:if>
								</c:if>
							</c:forEach>
						</c:if>
					</span>
					<span class="orderTab">						
						<label>${side.mname }</label><br>
						<label>${side.mcost }</label><br>
						<input type="number" id="countL" placeholder="수량">
						<button type="button" id="inputBt" onclick="clickBtn(this)">주문</button>
					</span>
						</a>
						<img src="http://localhost:9000/projectH/menuImg/${side.pfname }"/>
						<input type="hidden" id="mSo" value=3>	
						<input type="hidden" id="mFname" value="${side.pfname }">				
						<input type="hidden" id="mNo" value="${side.mno }">
						<input type="hidden" id="mName" value="${side.mname }">
						<input type="hidden" id="mCost"value="${side.mcost }">
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
      </div>
    
    </div>
</div>
		<!-- End Our Work Section -->
		
		<!-- About Section -->
		
		<div id="about" class="page-alternate">
		<div class="container">
		    <!-- Title Page -->
		    <div class="row">
		        <div class="span12">
		            <div class="title-page">
		            <h2 class="title">FoodInfo</h2>
		            
		            </div>
		        </div>
		    </div>
    	<!-- End Title Page -->
		    <div class="about">
			<jsp:include page="practice3.jsp" flush="false"></jsp:include>
		</div>

		</div>

	</div>
<!-- End About Section -->


<!-- Contact Section -->
<div id="contact" class="page">
<div class="container">

    <div class="row">
            <div class="title-page">
                <h2 class="title">Q & A</h2>
               
            </div>
    </div>

    <!-- Contact Form Q&A 보내기-->
    	<div class="span9">
        	<form name="qnaForm" action="qna_save.do" method="post" id="contact-form" class="contact-form" >
                <p class="contact-email">
                	<input id="qname" type="text" placeholder="이메일 입력" value="" name="qname" />
                </p>
                <p class="contact-name">
            		<input id="title" type="text" placeholder="제목 입력" value="" name="title" />
                </p>
                <p class="contact-message">
                	<textarea id="content" placeholder="메시지 입력" name="content" rows="15" cols="40"></textarea>
                </p>
                <p class="contact-submit">
                	<a id="contact-submit" class="submit"  href="#">Send Your Email</a>
                </p>
                <div id="response"> 
                </div>
            </form>

          <div class="span3">
        	<div class="contact-details">

            </div>
          </div>
    </div>
    <!-- End Contact Form -->
</div>
</div>
<!-- End Contact Section -->

<!-- Board List -->

<div id="order" class="page-alternate">
<div class="container">
    <!-- Title Page -->
    <div class="row">
        <div class="span12">
            <div class="title-page">
            	<h2 class="title">FreeBoard</h2>            
            </div>
            <div class="btnBoard">
                <p class="contact-submit-board">
                	<a id="contact-submit-board" class="submit" href="http://localhost:9000/projectH/board.do"
						onclick="window.open(this.href, '_blanck', 'width=1200, height=800'); return false">
						To the board</a>
                </p>
            </div>
        </div>
    </div>
    <!-- End Title Page -->

</div>

</div>

<!-- End Board List -->

<!-- Socialize -->
<div id="social-area" class="page">
	<div class="container">
	<jsp:include page="home.jsp" flush="false"></jsp:include>
	<br>
    	<div class="row">
            <div class="span12">
                <nav id="social">
                    <ul>
                 <li><a href="https://twitter.com" title="Follow Me on Twitter" target="_blank"><span class="font-icon-social-twitter"></span></a></li>
                 <li><a href="https://www.facebook.com" title="Follow Me on Facebook" target="_blank"><span class="font-icon-social-facebook"></span></a></li>
                 <li><a href="https://plus.google.com" title="Follow Me on Google Plus" target="_blank"><span class="font-icon-social-google-plus"></span></a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</div>
<!-- End Socialize -->


<!-- Footer -->
<footer>
	<p class="credits">&copy;2017 HamburgerStore.</p>
</footer>
<!-- End Footer -->


<!-- Back To Top -->
<a id="back-to-top" href="#">
	<i class="font-icon-arrow-simple-up"></i>
</a>
<!-- End Back to Top -->

<!-- Js -->
<script src="<c:url value='http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js'/>"> </script>
<script src="<c:url value='/js/bootstrap.min.js'/>"> </script>
<script src="<c:url value='/js/supersized.3.2.7.min.js'/>"> </script>
<script src="<c:url value='/js/waypoints.js'/>"> </script>
<script src="<c:url value='/js/waypoints-sticky.js'/>"> </script>
<script src="<c:url value='/js/jquery.isotope.js'/>"> </script>
<script src="<c:url value='/js/jquery.fancybox-media.js'/>"> </script>
<script src="<c:url value='/js/jquery.fancybox.pack.js'/>"> </script>
<script src="<c:url value='/js/LoginPart.js'/>"> </script>
<script src="<c:url value='/js/MenuJS.js'/>"> </script>
<script src="<c:url value='/js/OrderJS.js'/>"> </script>
<script src="<c:url value='/js/jquery.tweet.js'/>"> </script>
<script src="<c:url value='/js/plugins.js'/>"> </script>
<script src="<c:url value='/js/main.js'/>"  charset="UTF-8"> </script>
<!-- End Js -->

</body>
</html>