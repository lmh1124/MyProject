<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>

$(document).ready(function(e){
	var totalC = 0;
			
	if($("#basketList_sub li").length>0){
		$("#basketList_sub li").each(function(i,e){
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
	
	$('#favorList').on('mousewheel', function (e) {
		  if (e.originalEvent.wheelDelta >= 120) {
		    this.scrollTop -= 50;
		  } else if (e.originalEvent.wheelDelta <= -120) {
		    this.scrollTop += 50;
		  }
		  return false;
		});
	var cont = 0;
	$("#menuList_main li").each(function(i,e){
		$(this).stop().animate({top: 130*cont ,left : (i%4)*160}, 500);
		if(((i+1)%4)==0){
			cont++;		
		}
	});
	$("#menuList_main #detailM").mouseleave(function(){
		$(this + " #countL").val("");
	});
	
	$("#menuLists li a").click(function(e){
		e.preventDefault();
		cont = 0;
		if($(this).parent().hasClass("selected")){
			return false;
		}
		$(this).parents("#menuLists").find(".selected").removeClass("selected");
		$(this).parent().addClass("selected");
		
		var paren = $(this).attr("href");
		var value = $(this).attr("data-option-value");
		if(value == '*'){
			
			$("#menuList_main li").each(function(i,e){
				$(this).animate({top:0, left:0},100);
			});
			
			$("#menuList_main li").removeClass("item-hidden").show("slow").each(function(i,e){
				$(this).stop().animate({top: 130*cont ,left : (i%4)*160}, 500);
				if(((i+1)%4)==0){
					cont++;		
				}
			});
		}
		else{
			$("#menuList_main li").not(value).addClass("item-hidden").each(function(i,e){
				$(this).animate({top:0, left:0},100);
			});;		
			$("#menuList_main li").filter(value).removeClass("item-hidden").show("slow").each(function(i, e){
				$(this).stop().animate({top: 130*cont ,left : (i%4)*160}, 500);
				if(((i+1)%4)==0){
					cont++;
				}
			});
		}
		
	});
	
	$(document).on('click',"ul#basketList_sub li#ord",function(){
		
		if($(this).hasClass("sel")){
			$(this).removeClass("sel");
		}else{
			$(this).addClass("sel");	
		}
	});
	$("#deleteSelected").click(function(){
		$("li.sel").each(function(i){
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
				},
				success : function(){
				}
			});
			
			
			var totCo = $("#totCost").val();
			totCo = parseInt(totCo) - parseInt($("#order_cost",this).val());
			$("#totCost").val(totCo);
			$("#totCost", parent.document).val(totCo);
		});
		$("#basketList li#ord", parent.document).remove();
		var sclone = $("#basketList_sub li").clone();
		sclone.insertAfter($("#basketList li", parent.document));
		
		
	});
	
	
	
});

</script>
<style>
body{
	height: 100%;
	width: 100%;
}
div.favorFrame{
	position: relative;
}
ul#menuLists{
	list-style-type: none;
	writing-mode: vertical-lr;
	-webkit-writing-mode: vertical-lr;
	padding: 0;
	position: absolute;
	top: 0;
	left: 10px;
}
#menuLists li{
	position: absolute;
	display: inline-block;
	width: 30px;
	height: 100px;
	font-size: 25px;
	transform: rotate(180deg);
	-webkit-transform: rotate(180deg);
	text-align: center;
	background: yellow;
	border:1px solid black;
	border-top-right-radius: 100% 40%;
}
#menuLists li:first-child{
	z-index: 4;
}
#menuLists li:nth-child(2){
	z-index: 3;
	top: 80px;
}
#menuLists li:nth-child(3){
	z-index: 2;
	top: 160px;
}
#menuLists li:nth-child(4){
	z-index: 1;
	top: 240px;
}
#menuLists li.selected{
	z-index: 5;
}
#menuLists li a{
	text-decoration: none;
	width:5px;	
}
div#favorList{
	position: absolute;
	top: 0;
	left: 57px;
	height: 350px;
	width: 110%;
	
}
div.basketform{
	position: absolute;
	top: 370px;
	
}
	div.menuA_blind{
		height: 500px;
		width:110%;
		overflow-y:scroll;
	}
	ul#menuList_main{
		position: absolute;
		display: block;
		margin:0;
		margin-left: 10px;
		height: 500px;
	}
	
	li.listM{
		display: inline-block;
		position: absolute;
		list-style-type: none;
		margin: 0;
		text-align: center;
		width: 150px;
		height: 120px;
		-webkit-transition: all 450ms ease-out 0s;	
	   -moz-transition: all 450ms ease-out 0s;
		 -o-transition: all 450ms ease-out 0s;
		    transition: all 450ms ease-out 0s;
	}
	li.listM input[type=number]{
		width: 50px;
	}
	li #detailM{
		width: 100%;
		height: 100%;
		position: absolute;
		display: block;
		opacity: 0;
		margin: 0;
		padding: 0;

		transform: rotateY(180deg) scale(0.5, 0.5);
		-webkit-transform: rotateY(180deg) scale(0.5, 0.5);
		-webkit-transition: all 450ms ease-out 0s;	
	   -moz-transition: all 450ms ease-out 0s;
		 -o-transition: all 450ms ease-out 0s;
		    transition: all 450ms ease-out 0s;
	}
	li:hover #detailM{
		 -webkit-transform: rotateY( 0deg ) scale(1,1);
         -moz-transform: rotateY( 0deg ) scale(1,1);
         -o-transform: rotateY( 0deg ) scale(1,1);
         transform: rotateY( 0deg ) scale(1,1);
         opacity : 1;
	}
	li #detailM span.overImg{
		margin: 0;
		padding: 0;
		position: absolute;
		display: block;
		opacity : 0.6;
		width : 100%;
		height: 100%;
		background-color: black;
	}
	li #detailM span.orderTab{
		position: absolute;
		top:25%;
		left:0;
		z-index: 1;
		opacity : 1;
		text-align: center;
		width: 150px;
		height: 120px;
	}
	li #detailM span label{
		color: white;
		font-size: 20px;
	}
	#menuList_main li img{
		width: 100%;
		height: 100%;
	}
	ul#menuList_main li.item-hidden{
		transform: scale3d(0,0,0);
	}
	
	div.basketform{
		position: relative;
		margin:0;
		margin-left: 26px;
		background: #6d4412;
		display: block;
		padding: 0;
		text-align: center;
		text-transform: uppercase;
		width: 732px;
		border-top-left-radius: 50% 30%;
		border-bottom-left-radius: 50% 30%;
		border-top-right-radius: 10% 35px;
		border-bottom-right-radius: 10px;
		z-index: 5;
	}
	div.basketform label.basktitle{
		position: absolute;
		left: 0;
		top: 0;
		margin-bottom: 15px;
		background: black;
		color: white;
		padding: 0 5px;
		letter-spacing: 8px;
		border-top-left-radius: 100% 30%;
		border-bottom-left-radius: 100% 30%;
		width: 25px;
		height: 100%;
		cursor: default;
		font-weight: bold;
		font-size: 25px;
		writing-mode: vertical-lr;
		-webkit-writing-mode: vertical-lr;
	}
	div.basketform div.scrollBlind{
		width: 559px;
		height: 100%;
		overflow-y: scroll;
	}
	div.basketform .scrollView{
		width: 540px;
		height: 200px;
		overflow: hidden;
		background: #c68c53;
	}
	div.basketform ul{
		display: block;
		margin : 0;
		padding: 0;
		list-style-type: none;
		border-radius: 5px;
		overflow: hidden;
	}
	div.baskIn {

		text-align: left;
		width:550px;
		background: #392613;
		margin: 0;
		margin-left: 35px;
		padding: 5px;
	}
	div.basketform label.baskn{
		display: inline-block;
		border: none;
		color: white;
		text-align: center;
		cursor: default;
	}
	div.basketform label.baskn:first-child{
		width: 15%;
	}
	div.basketform label.baskn:nth-child(2){
		width: 35%;
	}
	div.basketform label.baskn:nth-child(3){
		width: 20%;
	}
	div.basketform label.baskn:nth-child(4){
		width: 29%;
	}
	div.basketform li input[type=text]{
		cursor: default;
		border: none;
		background: none; 
		border-radius: 0;
		margin: 0;
		padding:0;
		text-align: center;
		height: 30px;
    	font-size: 20px;
	}
	div.basketform span.basktot label{
		display: block;
		width:100%;
		margin: 0;
	}
	div.basketform span.basktot label.tottitle{
		margin: 0;
		padding:5px;
		margin-left: 10px;
		margin-right:10px;
		font-size: 17px;
		cursor: default;
		color: white;
		width: 100%;
	}
	div.basketform input[type=text]:first-child{
		width: 15%;
	}
	div.basketform input[type=text]:nth-child(2){
		width: 35%;
	}
	div.basketform input[type=text]:nth-child(3){
		width: 20%;
	}
	div.basketform input[type=text]:nth-child(4){
		width: 29%;
	}
	div.basketform span.basktot label input#totCost{
		margin: 0;
		width: 90%;
		cursor: default;
		text-align: right;
		padding: 5px 5px;
		border: none;
		border-bottom: 2px inset #1a0d00;
		border-top-left-radius: 100% 100%; 
		font-weight: bold;
	}
	div.basketform button{
		border-radius: 100%;
		padding: 3px;
		margin: 7px 5px;
		font-weight: bold;
		width: 100%;
		font-size: 17px;
	}
	div.basketform #orderBask{
		margin-left: 50px;
	}
	ul#basketList_sub li{
		border-bottom: 1px solid black;
		background: #ffbf80;
	}
	.basketform span.basktot{
		display: block;
		margin: 0;
		padding: 0;
		padding-top: 10px;
		cursor: default;
		text-align: left;
	}
	.basketform span.basktot label{
		width: 100%;
	}
	#favorList input[type=number]{
		width: 45px;
		text-align: center;
		font-size: 13px;
		padding: 3px;
		margin: 0;
	}
	ul#basketList_sub li.sel{
		background: #ff8080;
	}
	#resultBtn{
		position: absolute;
		bottom : 0;
		right: 10px;
		text-align: right;
		width:120px;
	}
</style>
</head>
<body>
	<div class="favorFrame">
	 <nav id="menuOptions" class="menuSelect">
		                  	<ul id="menuLists">
								<li><a href="#menuA" data-option-value="*" class="selected">All</a></li>
								<li><a href="#menuA" data-option-value="#menuB">Berger</a></li>
								<li><a href="#menuA" data-option-value="#menuD">Drink</a></li>
								<li><a href="#menuA" data-option-value="#menuS">Side</a></li>
							</ul>
							 <div class="basketform">
								<label class="basktitle">장바구니</label>
								<div class="baskIn">
									<label class="baskn">No</label><label class="baskn">이름</label><label class="baskn">개수</label><label class="baskn">가격</label>
									<div class="scrollView">
										<div class="scrollBlind">
		
												<ul id="basketList_sub">
													<c:if test="${not empty sessionScope.baskList }">
														<c:forEach items="${sessionScope.baskList }" var="order">
															<li id="ord">
																<input type="text" readOnly id="order_number" name="order_number" value="${order.order_number}" style="margin-right:-3px">
																<input type="text" readOnly id="order_name" name="order_name" value="${order.order_name}" style="margin-right:-3px">
																<input type="text" readOnly id="order_count" name="order_count" value="${order.order_count}" >
																<input type="text" readOnly id="order_cost" name="order_cost" value="${order.order_cost}" style="margin-right:-6px">
																<input type="hidden" readOnly id="order_no" name="order_no" value="${order.order_no}">
															</li>
														</c:forEach>
													</c:if>
												</ul>
										</div>
									</div>
									
								</div>
								<div id="resultBtn">
									<span class="basktot"><label class="tottitle">합계</label>
									<label><input type="text" id="totCost" readOnly value="0"></label></span><br>
									<button type="button" id="orderBas" onclick="window.parent.orderBtn()">주문</button><br>
									<button type="button" id="deleteSelected">삭제</button><br>
									<button type="button" id="deleteBask" onclick="window.parent.basketDelete()">비우기</button>
								</div>
							</div>
		                </nav>
	
	<div id="favorList">
				    	<div class="menuA_blind">
							<ul id="menuList_main">
								<c:forEach items="${listB}" var="berger">
									<li class="listM" id="menuB">
										<a id="detailM">
											<span class="overImg">
												
											</span>
											<span class="orderTab">
												
												<label>${berger.order_name }</label><br>
												<label>${berger.order_cost }</label><br>
												<input type="number" id="countL" min=0 max=10 placeholder="수량">
												<button type="button" id="inputBt" onclick="window.parent.clickBtn(this)">주문</button>
											</span>
										</a>
										<img src="http://localhost:9000/projectH/menuImg/${berger.fname }"/>
										<input type="hidden" id="mSo" value=1>
										<input type="hidden" id="mNo" value="${berger.order_no }">
										<input type="hidden" id="mName" value="${berger.order_name }">
										<input type="hidden" id="mCost"value="${berger.order_cost }">
									</li>
								</c:forEach>
									
								<c:forEach items="${listD}" var="drink">
									<li  class="listM" id="menuD">
										<a id="detailM">
											<span class="overImg">
												
											</span>
											<span class="orderTab">
												<label>${drink.order_name }</label><br>
												<label>${drink.order_cost }</label><br>
												<input type="number" id="countL" placeholder="수량">
												<button type="button" id="inputBt" onclick="window.parent.clickBtn(this)">주문</button>
											</span>
										</a>
										<img src="http://localhost:9000/projectH/menuImg/${drink.fname }"/>
										<input type="hidden" id="mSo" value=2>
										<input type="hidden" id="mNo" value="${drink.order_no }">
										<input type="hidden" id="mName" value="${drink.order_name }">
										<input type="hidden" id="mCost"value="${drink.order_cost }">
									</li>
								</c:forEach>
											
								<c:forEach items="${listS}" var="side">
									<li class="listM" id="menuS">
										<a id="detailM">
											<span class="overImg">
											
											</span>
											<span class="orderTab">
												
												<label>${side.order_name }</label><br>
												<label>${side.order_cost }</label><br>
												<input type="number" id="countL" placeholder="수량">
												<button type="button" id="inputBt" onclick="window.parent.clickBtn(this)">주문</button>
											</span>
										</a>
										<img src="http://localhost:9000/projectH/menuImg/${side.fname }"/>
										<input type="hidden" id="mSo" value=3>					
										<input type="hidden" id="mNo" value="${side.order_no }">
										<input type="hidden" id="mName" value="${side.order_name }">
										<input type="hidden" id="mCost"value="${side.order_cost }">
									</li>
								</c:forEach>
							</ul>
						</div>
					</div>
			</div>
</body>
</html>
