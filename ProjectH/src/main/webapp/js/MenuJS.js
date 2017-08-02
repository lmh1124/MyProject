$(document).ready(function(e){
		var totalC = 0;
		$("#contact-submit").click(function(){
				qnaForm.submit();
		});		
		if($("#basketList li").length>0){
			$("#basketList li").each(function(i,e){
				totalC = parseInt(totalC) + parseInt($("#order_cost",this).val());
			});
			$("#totCost").val(totalC);
		}else{
			$("#totCost").val("0");
		}
		$('.scrollBlind').on('mousewheel', function (e) {
			  if (e.originalEvent.wheelDelta >= 120) {
			    this.scrollTop -= 50;
			  } else if (e.originalEvent.wheelDelta <= -120) {
			    this.scrollTop += 50;
			  }
			  return false;
			});
		
		$('#menuA').on('mousewheel', function (e) {
			  if (e.originalEvent.wheelDelta >= 120) {
			    this.scrollTop -= 50;
			  } else if (e.originalEvent.wheelDelta <= -120) {
			    this.scrollTop += 50;
			  }
			  return false;
			});
		var cont = 0;
		$("#menuList_main li").each(function(i,e){
			$(this).stop().animate({top: 210*cont ,left : (i%5)*230}, 500);
			if(((i+1)%5)==0){
				cont++;		
			}
		});
		$("#menuList_main #detailM").mouseleave(function(){
			$(this + " #countL").val("");
		});
		
		$("#menuList li a").click(function(e){
			e.preventDefault();
			cont = 0;
			if($(this).hasClass("selected")){
				return false;
			}
			$(this).parents("#menuList").find(".selected").removeClass("selected");
			$(this).addClass("selected");
			
			var paren = $(this).attr("href");
			var value = $(this).attr("data-option-value");
			if(value == '*'){
				
				$("#menuList_main li").each(function(i,e){
					$(this).animate({top:0, left:0},100);
				});
				
				$("#menuList_main li").removeClass("item-hidden").show("slow").each(function(i,e){
					$(this).stop().animate({top: 210*cont ,left : (i%5)*230}, 500);
					if(((i+1)%5)==0){
						cont++;		
					}
				});
			}
			else{
				$("#menuList_main li").not(value).addClass("item-hidden").each(function(i,e){
					$(this).animate({top:0, left:0},100);
				});;		
				$("#menuList_main li").filter(value).removeClass("item-hidden").show("slow").each(function(i, e){
					$(this).stop().animate({top: 210*cont ,left : (i%5)*230}, 500);
					if(((i+1)%5)==0){
						cont++;
					}
				});
			}
			
		});
		
		
	$(document).on('click',"ul#basketList li#ord",function(){
			
			if($(this).hasClass("sel")){
				alert('click');
				$(this).removeClass("sel");
			}else{
				$(this).addClass("sel");	
			}
		});
		
	
	$(".heart").click(function(){
		var paren = $(this).parents(".listM");
		if($(this).hasClass('pick')){
			$(this).removeClass("pick");
			$.ajax({
				type: "post",
				url : "http://localhost:9000/projectH/mypage_favorDelete",
				data: {
					"guest_id": $("#loginSession_ID").val(),
					"order_no": paren.find("#mSo").val(),
					"order_name": paren.find("#mName").val(),
					"order_cost": paren.find("#mCost").val(),
					"fname": paren.find("#mFname").val()
				}
			});
			
		}else{
			$(this).addClass("pick");			
			$.ajax({
				type: "post",
				url : "http://localhost:9000/projectH/mypage_favorInsert",
				data: {
					"guest_id": $("#loginSession_ID").val(),
					"order_no": paren.find("#mSo").val(),
					"order_name": paren.find("#mName").val(),
					"order_cost": paren.find("#mCost").val(),
					"fname": paren.find("#mFname").val()
				}
			});
		}
		$('#mypageFavorList').get(0).contentDocument.location.reload();
	});
	
	
});