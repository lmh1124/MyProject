$(document).ready(function(e){
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
			            title: "Hamburger Store" 
			  }); 
			  var infowindow = new google.maps.InfoWindow( 
			          { 
			            content: "<h1>Hamburger Store</h1>" +
			            		 "<p>서울특별시 종로구 종로12길 15 코아빌딩 10층</p>",
			            maxWidth: 300 
			          } 
			  ); 
			  infowindow.open(map, marker); 
		}
		
		
        window.alert = function(){};
        var defaultCSS = document.getElementById('/css/bootstrap-combined.min.css');
        function changeCSS(css){
            if(css) $('head > link').filter(':first').replaceWith('<link rel="stylesheet" href="'+ css +'" type="text/css" />'); 
            else $('head > link').filter(':first').replaceWith(defaultCSS); 
        }
});	     
 		function loginBoxCall(){
 			var loginBox = "#"+$('li#loginM #umenu').attr('href');
			$(loginBox).parent().addClass("selected");

			var popMargTop = ($(
					loginBox).height() + 24) / 2;
			var popMargLeft = ($(
					loginBox).width() + 24) / 2;

			$(loginBox)
					.css(
							{
								'margin-top' : -popMargTop,
								'margin-left' : -popMargLeft
							});

			$(loginBox).fadeIn();
 		}
		function maskCall(){
			$('body')
			.append('<div id="mask"></div>')
			.on(
					"mousewheel.disableScroll DOMMouseScroll.disableScroll touchmove.disableScroll",
					function(e) {
						e.preventDefault();
						return;
					});

			$('#mask').fadeIn(300);
		}
    	//회원가입에서 로그인으로 전환--------------------------------------
    	function closePopup(){
    		$('.popup').fadeOut(300, function() {
    			$("#log_msg").text("");
    			$("#email").val("");
    			$("#password").val("");
    			$('li.login').removeClass("selected");
    			$('body').off(".disableScroll");
    			$('body').css('overflow' ,'auto');
    		});
    		
    	}
    	//마이페이지에서 로그인으로 전환-------------------------------------
    	function closeSlide(){
    		$("ul#submenu li").removeClass("selected");
    		$('body').off(".disableScroll");
    		$("div.mypage_div").slideUp();
    		$("#subm").slideUp();
    		$('body').css('overflow' ,'auto');
    		//alert('확인');
    		confirm('로그인이 필요합니다');
    		
    		loginBoxCall();
    		
    		maskCall();
	}
    	
		var checkLog = function(email, password){
		var logCk = 'fail';
		
		$.ajax({
			type : "POST",
			url : "http://localhost:9000/projectH/login",
			data : {
				"email" : email,
				"pass" : password
			},
			success : function(data) {
				if ($.trim(data) == "Y") {
					logCk = "success";
					console.log('login ID'+$("#loginSession_ID").val());
					window.location.reload();
					
				} else {
					logCk = "fail";
					$("#log_msg").css("color","red")
							.text('아이디 또는 비밀번호가 틀립니다');
					$("#email").focus();
				}
			}
		});		
		return logCk;
	}
	function closePage() {
		$("ul#submenu li").removeClass("selected");
		$('body').off(".disableScroll");
		$("div.mypage_div").slideUp();
		$('body').css('overflow', 'auto');
	}
	
	 var listcount = 0;
	  function clickBtn(e){
		  	var mno = $(e).parents(".listM").find("#mNo").val();
			var mname = $(e).parents(".listM").find("#mName").val();
			var mcost = $(e).parents(".listM").find("#mCost").val();
			var mcount = $(e).parents(".listM").find("#countL").val();
			var msno = $(e).parents(".listM").find("#mSo").val();
			
			var costSum = parseInt(mcount)* parseInt(mcost);
			var totC = $("#totCost").val();
			var listNum;

			if($("#basketList li").length > 0){
				listNum = $("#basketList li:last-child #order_number").val();
			}else{
				listNum = 0;
			}
			if(mcount == 0){
				confirm("수량을 정해주세요");
				return false;
			}
			if($("#basketList li").length >= 20){
				confirm("주문내역이 너무 많습니다");
				return false;
			}
			$("#orderBask, #deleteBask").click(function(){
				listNum = 0;
				totSum = 0;
				listcount = 0;
			});
			listNum = parseInt(listNum) + 1;
		
			var appList = "<li id='ord'><input type='text' readOnly id='order_number' name ='order_number' value="+ listNum+">";
			appList += "<input type='text' readOnly id='order_name' name=order_name' value="+mname+">";
			appList += "<input type='text' readOnly id='order_count' name='order_count' value="+mcount+">";
			appList += "<input type='text' readOnly id='order_cost' name='order_cost' value="+costSum+">";
			appList += "<input type='hidden' readOnly id='order_no' name='order_no' value="+msno+"></li>";
			
			$("#basketList").append(appList);
			listcount += 1;
			$("#mypageFavorList").contents().find("#basketList_sub").append(appList);
			totC = parseInt(totC) + parseInt(costSum);
			$("#totCost").val(totC);
			$("#mypageFavorList").contents().find("#totCost").val(totC);
			$.ajax({
				type: "post",
				url: "http://localhost:9000/projectH/basketSave",
				data : {
					"order_number" : listNum,
					"order_no" : msno,
					"order_name" : mname,
					"order_count" : mcount,
					"order_cost" : costSum
				}
			});
			$("#mypageFavorList").contents().find(".scrollBlind").scrollTop($(".scrollBlind")[0].scrollHeight);
			$(".scrollBlind").scrollTop($(".scrollBlind")[0].scrollHeight);
	  }
	  
	  function orderBtn(){
		  console.log(checkLog);
		  var sessionCK = $("#loginSession_ID").val(); 
			if( sessionCK== 'null'){
				var result = confirm('로그인이 필요합니다');
				if(result){
					loginBoxCall();
					maskCall();
					
				}else{return false;}
			}else{
				window.open('/projectH/orderPage','order','width=400, height=670,top=200, left=500, scrollbars=no');
			}
	  }
	  function basketDelete(){
			 
			var result = confirm('장바구니를 비우시겠습니까?');
			if(result){
				$("#basketList li").remove();
				$("#totCost").val("0");
				$.ajax({
					url : "http://localhost:9000/projectH/basketReset"
				});
				$('#mypageFavorList').get(0).contentDocument.location.reload();
			}
		 }
		 function basketSelDelete(){
			 var leng = $("ul#basketList_sub li.sel").length;
				//그 수만큼 sel 클래스를 가진 li 삭제 
				$("li.sel").each(function(){
					$(this).remove();
					$.ajax({
						type: "post",
						url: "http://localhost:9000/projectH/basketDelete",
						data : {
							"order_number" : $("#order_number",this).val(),
							"order_no" : $("#order_no",this).val(),
							"order_name" : $("#order_name",this).val(),
							"order_count" : $("#order_count",this).val(),
							"order_cost" : $("#order_cost",this).val()
						}
					});
					var totCo = $("#totCost").val();
					totCo = parseInt(totCo) - parseInt($("#order_cost",this).val());
					$("#totCost").val(totCo);
			});
				$('#mypageFavorList').get(0).contentDocument.location.reload();
				
		 }
	  
  