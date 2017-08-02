$(document).ready(function(e){
// 				������ ũ�⺯ȭ�� ���� �޴��� ��ġ ����		
		$(window).resize(function(){
			var widthW = $(window).width();	
			var widthM = widthW - 300;
			if(parseInt(widthW) > 1500){
					$("#navmenu").animate({
						'width' : widthM
					}, 200);
			}else{
				$("#navmenu").animate({
					'width' : '1200px'
				}, 200);
			}
			
		}).resize();
		
		//â ũ�� ����----------------------------------------------
		$("#joinFrame").load(function(){
			$(this).parent("#join_f").height(600);
			$(this).parent("#join_f").width(600); 
			$(this).parent("#join_f").height($(this).contents().find('body')[0].scrollHeight+"px");
			$(this).parent("#join_f").width($(this).contents().find('body')[0].scrollWidth+"px");
			
			var popMargTop = ($(this).parent("#join_f")
					.height() + 24) / 2;
			var popMargLeft = ($(this).parent("#join_f")
					.width() + 24) / 2;

			$(this).parent("#join_f")
					.css(
							{
								'margin-top' : -popMargTop,
								'margin-left' : -popMargLeft
							});
				
		});
		
						$('li.login #umenu').click(	function() {
							
											//Getting the variable's value from a link 
											$(".popup input").val("");
											$(".mypage_div input").val("");
											$(this).parent().toggleClass(
													"selected");
											
											/*MyPage ����*/
											$("ul#submenu li").removeClass("selected");
											$('body').off(".disableScroll");
											$("div.mypage_div").slideUp();
											$('#subm').slideUp();
											
											$('body').css('overflow' ,'hidden');
											var loginBox ="#"+ $(this).attr('href');
											if ($('#mask').length) {
												$('.popup').fadeOut();
												if ($(this).parent().hasClass(
														"selected")) {

													$(this).parent().siblings()
															.removeClass(
																	"selected");

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

												} else {
				
													$(loginBox).fadeOut();
													$('#mask').remove();
													$('body').off(
															".disableScroll");
													$('body').css('overflow' ,'auto');
												}
											} else {
												//Set the center alignment padding + border see css style
												var popMargTop = ($(loginBox)
														.height() + 24) / 2;
												var popMargLeft = ($(loginBox)
														.width() + 24) / 2;

												$(loginBox)
														.css(
																{
																	'margin-top' : -popMargTop,
																	'margin-left' : -popMargLeft
																});
												//Fade in the Popup
												$(loginBox).fadeIn(300);

												// Add the mask to body
												$('body')
														.append('<div id="mask"></div>')
														.on("mousewheel.disableScroll DOMMouseScroll.disableScroll touchmove.disableScroll",
																function(e) {
																	e.preventDefault();
																	return;
																});

												$('#mask').fadeIn(300);

												return false;

											}

										});
						
						// When clicking on the button close or the mask layer the popup closed
						$('a.l_close, #mask').click(function() {
							$('.popup').fadeOut(300, function() {
								$("#log_msg").text("");
								$("#email").val("");
								$("#password").val("");
								$('#mask').remove();
								$('li.login').removeClass("selected");
								$('body').off(".disableScroll");
								$('body').css('overflow' ,'auto');
							});
							return false;
						});
						$("#lpassword").keypress(function(event){
							if(event.which == 13){
								$("#sub_btn").click();
								return false;
							}
						});
						//Login Form  ---------------------------------------------------------------
						$("#sub_btn")
								.click(
										function() {
											if ($("#lemail").val() == "") {
												$("#log_msg").css("color",
														"red").text(
														"���̵� �Է��ϼ���");
												$("#lemail").focus();
											} else if ($("#lpassword").val() == "") {
												$("#log_msg").css("color",
														"red").text(
														"��й�ȣ�� �Է��ϼ���");
												$("#lpassword").focus();
												
											} else { //---------------------------------------------------------------
												var logResult = checkLog($("#lemail").val(),$("#lpassword").val());
											}
										});
						
						
						
						/* MyPage �ּ� �˻�*/
						$("div.mypage_div #mypage_postcodify_search_button").click(	function() {
							window.open('/projectH/msearchPost','addr','width=400, height=600,top=200, left=500, scrollbars=no');
					});
						/* ���̵�/��й�ȣ ã�� */
						$("#find_id")
								.click(
										function() {
											window
													.open(
															'/projectH/findIP',
															'',
															"width=445, height=200,top=200, left=500, location=no, toolbar=no, scrollbars=no, status=no, resizable=no, fullscreen=no");
										});
						/*mypage*/
						$("#menu_mypage").click(function() {
							/*Login Join �޴� ����*/
							$('.popup').fadeOut(300, function() {
								$("#log_msg").text("");
								$("#email").val("");
								$("#password").val("");
								$('#mask').remove();
								$('li.login').removeClass("selected");
								$('body').off(".disableScroll");
							});
							
							$("div.mypage_div").slideUp();
							$('body').css('overflow' ,'auto');
							$('body').off(".disableScroll");
							$("#submenu li").removeClass("selected");
							$('#subm').slideToggle();
							var sheight = $(this).offset().left - 160;
							$('#submenu').offset({
								left : sheight
							});
							$('#submenu li a').css("color", "#fff");

						});
						
						$("li #smen")
								.click(
										function() {
											$(this).parent().toggleClass(
													"selected");

											var mypa = "#"+$(this).attr("href");
											$("div.mypage_div").slideUp();
											if ($(this).parent().hasClass("selected")) {
												
												$(this)
														.parent()
														.siblings()
														.removeClass("selected");
												if($(this).parent().hasClass("logcheck")){
													
													var sessionCK = $("#loginSession_ID").val(); 
													if( sessionCK== 'null'){
														closeSlide();
													}else{

													$("#mypage_login").slideDown();
																
													//���������� �α��� / ��й�ȣ  üũ
													$('#my_log').unbind('click');
														$('#my_log').click(function(){
															$.ajax({
																type:"post",
																url: "http://localhost:9000/projectH/logCheck",
																data: {
																	"email" : $("#loginSession_ID").val(),
																	"pass" : $("#my_pass").val()
																},
																success : function(data){
																	if($.trim(data) == "Y"){
																		$("#my_pass").val('');
																		$("#mypage_login").slideUp();
																		$(mypa).slideDown();	
																		$("#pass_ck").text('');
																	}else{
																		$("#pass_ck").text('��й�ȣ�� Ȯ���ϼ���');
																	}
																}
															});
														
														});
														// ��й�ȣ üũ �Ϸ�
														
														//��й�ȣ ���� -------------------------------------------
														$("#ch_upass, #ch_pass").blur(function(){
															if ($("#ch_pass").val() == $("#ch_upass").val()) {
																$("#passcheck").text("��й�ȣ�� ��ġ�մϴ�");
															} else {
																$("#passcheck").text("��й�ȣ�� ��ġ���� �ʽ��ϴ�");
															}
														});

														$("#my_pass_update").click(function(){
															if($("#ch_pass").val() == $("#ch_upass").val()){
																
																if( $("#ch_pass").val().length< 8 || $("#ch_pass").val().length > 15 ){
																	alert('��й�ȣ�� ���̴� 8 ~ 15 �� ���̷� �����ּ���');
																	$("input[type=password]").val('');
																	$("#ch_pass").focus();
																	return false;
																}else{
																	$.ajax({
																		type:"post",
																		url: "http://localhost:9000/projectH/mypage_pass_update",
																		data : {
																			"email" :  $("#loginSession_ID").val(),
																			"pass" : $("#ch_pass").val()
																		},
																		success : function(data){
																			if($.trim(data) == "Y"){
																				$("ul#submenu li").removeClass("selected");
																				$('body').off(".disableScroll");
																				$("div.mypage_div").slideUp();
																				$('body').css('overflow' ,'auto');
																			}else{
																				alert('��й�ȣ�� Ʋ���ϴ�');
																			}
																		}
																	});
																}
															}else{
																window.alert('��й�ȣ�� ��ġ�ϴ��� Ȯ���ϼ���');
															}
															
														});
														// ��й�ȣ ���� end
														
													}
												}else{
													var sessionCK = $("#loginSession_ID").val(); 
													if( sessionCK== 'null'){
														closeSlide();
													}
													$(mypa).slideDown();	
												}
												
												$('body')
														.on(
																"mousewheel.disableScroll DOMMouseScroll.disableScroll",
																function(e) {
																	e
																			.preventDefault();
																	return;
																});
												$('body').css('overflow' ,'hidden');
									
											} else {
												$(mypa).slideUp();
												$('body').off(".disableScroll");
												$('body').css('overflow' ,'auto');
											}
											
										});

						$("#upass").blur(function() {
							if ($("#pass").val() == $("#upass").val()) {
								$("#pcheck").text("��й�ȣ�� ��ġ�մϴ�");
							} else {
								$("#pcheck").text("��й�ȣ�� ��ġ���� �ʽ��ϴ�");
							}
						});
						
						$("#logout_y").click(function(){
							location.replace('http://localhost:9000/projectH/logout');
						});
						
						$("#logout_n").click(function(){
							$('.popup').fadeOut(300, function() {
								$('#mask').remove();
								$('li.login').removeClass("selected");
								$('body').off(".disableScroll");
								$('body').css('overflow' ,'auto');
							});
						});
						
						//ȸ�� Ż��
				$("#del_ent").click(function(){
					
					$("ul#submenu li").removeClass("selected");
					$("div.mypage_div").slideUp();
					$("#subm").slideUp();
					
					var delBox = $("#del_box");
				
					var popMargTop = ($(delBox).height() + 24) / 2;
					var popMargLeft = ($(delBox).width() + 24) / 2;

					$(delBox).css({
						'margin-top' : -popMargTop,
						'margin-left' : -popMargLeft
					});

					$(delBox).fadeIn(300);
							
					$('body')	.append('<div id="mask"></div>').css('overflow','hidden');

					$('#mask').fadeIn();
					
					return false;
				});
						
				$("#del_cel").click(function(){
					$("ul#submenu li").removeClass("selected");
					$("div.mypage_div").slideUp();
					$("#my_pass").val("");
					$('body').css('overflow' ,'auto');
				});
				
				$('#del_subcel').click(function(){
					
					$('#del_box').fadeOut(300, function() {	
						$("ul#submenu li").removeClass("selected");
						$('#mask').remove();
						$('body').off(".disableScroll");
						$('body').css('overflow' ,'auto');
					});
					document.reload();
					return false;
				});
				
				$("#del_subent").click(function(){
							$(this).load("http://localhost:9000/projectH/deleteGuest");
							$(".sub_del_ck").css('display','none');
 							$(".sub_del_re").css('display','block');		
				});
				$("#del_btn").click(function(){
					$('#del_box').fadeOut(300, function() {	
						$("ul#submenu li").removeClass("selected");
						$('#mask').remove();
						$('body').off(".disableScroll");
						$('body').css('overflow' ,'auto');
					});
					location.reload();
				});
});