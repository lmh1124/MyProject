<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>주문서</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
	function onDelete(e){
		$(e).closest("li").remove();
		
		var number =$(e).parents('li#orderL').find('#orderNumber').text();
		var name = $(e).parents('li#orderL').find("#orderName").text();
		var count = $(e).parents('li#orderL').find("#orderCount").text();
		var cost = $(e).parents('li#orderL').find("#orderCost").text();
		$.ajax({
			type: "post",
			url: "http://localhost:9000/projectH/basketDelete",
			data : {
				"order_number" : number,
				"order_no" : $("#orderNo",e).val(),
				"order_name" : name,
				"order_count" : count,
				"order_cost" : cost
			}
		});
		var totCo = $("#totCost").text();
		totCo -= cost;
		$("#totCost").text(totCo);
	}
	$(document).ready(function(){
		var totCo = 0;
		var totCou = 0;
		$("div ul li#orderL").each(function(i,e){
			var cost = $("#orderCost", this).text();
			var count = $("#orderCount", this).text();
			totCou = parseInt(totCou) + parseInt(count);
			totCo = parseInt(totCo) + parseInt(cost);
		});
		
		$("#totCost").text(totCo);
		$("#totCount").text(totCou);
		
		$("#orderBtn").click(function(){
			var result = confirm("결제하시겠습니까?");
			if(result){
			$("ul.ordList").find('li').each(function(i,e){
				$.ajax({
					type: "post",
					url: "http://localhost:9000/projectH/orderInsert",
					data: {
						"order_no" : $("#orderNo", this).val(),
						"order_name" : $("#orderName", this).text(),
						"order_count" :$("#orderCount", this).text(),
						"order_cost" : $("#orderCost", this).text(),
						"guest_id" : $("#guest_id").val(),
						"addr1" : $("#addr1").val(),
						"addr2" : $("#addr2").val(),
						"addr3" : $("#addr3").val(),
						"phone1" : $("#phone1").val(),
						"phone2" : $("#phone2").val(),
						"phone3" : $("#phone3").val()
					},
					success : function(data){
						if(data == "fail"){
							return false;
						}
					}
				}); //end ajax
				
			}).stop(100);	// end each
				opener.parent.location.reload();
				window.close();
			}
		});	//end click
		
		$("#cencleBtn").click(function(){
			window.close();
		});
	});
	
</script>
<style>
	body{
		padding: 0;
		margin: 0;
		background: #ffe6b3;
		overflow: hidden;
	}
	ul{
		list-style-type: none;
		width: 400px;
		padding:0;
		margin: 0;
	}

	.scrollView div.titleOrder{
		width: 400px;
		border-bottom: 1px solid black;
		margin: 0;
		padding:0;
		background: #664400;
		color: white;
		padding: 5px 0 5px 0;
	}
	.orderTable li{
		margin: 0;
		width: 100%;
		padding: 5px 0 5px 0;
	}
	.scrollView label{
		margin: 0;
		display: inline-block;
		text-align: center;
	}
	.scrollView label:first-child{
		width: 7%;
	}
	.scrollView label:nth-child(2){
		width: 40%;
	}
	.scrollView label:nth-child(3){
		width: 13%;
	}
	.scrollView label:nth-child(4){
		width: 20%;
	}
	div.scrollView{
		width: 400px;
		overflow: hidden;
		height: 300px;
		padding-bottom: 15px;
		border-top: none;
		border-top-right-radius: 10px;
	}
	div.scrollBlind{
		width: 430px;
		overflow-x: hidden;
		overflow-y: scroll;
		height: 100%;
	}
	ul.ordList{
		padding-bottom: 15px;
	}
	ul.ordList li:nth-child(2n){
		background: #ffb84d;
	}
	ul.ordList li:nth-child(2n-1){
		background: #ffdb4d;
	}
	div.totalM label{
		display: inline-block;
		font-weight: bold;
		color: white;
	}
	div.totalM{
		padding: 10px 0 10px 0;
		width: 400px;
		background: #996600;
		border-bottom-left-radius: 10px;
		border-bottom-right-radius: 10px;
	}
	.totalM label:first-child{
		width: 20%;
		padding-left: 10px;
	}
	.totalM label:nth-child(2){
		text-align: right;
		width: 10%;
	}
	.totalM label:nth-child(3){
		width: 20%;
	}
	.totalM label:nth-child(4){
		width: 15%;
	}
	.totalM label:nth-child(5){
		width: 20%;
		text-align: right;
	}
	.totalM label:nth-child(6){
		width: 10%;
	}
	div.guestTable{
		width: 402px;
		border-top-right-radius: 10px;
		border-bottom-right-radius: 10px;
		border-bottom-left-radius: 10px;
		background: #ac7339;
		padding: 5px 0 5px 0;
	}
	.guestTable label{
		width: 80px;
		display: inline-block;
		margin: 0;
		text-align: center;
		font-weight: bold;
		color: white;
	}
	.guestTable li{
		margin-top: 10px;
		margin-bottom: 10px;
	}
	.guestTable li.guestAd input{
		margin-left: 86px;
		width: 250px;
	}
	.guestTable li.guestAd input#postcode{
		width: 50px;
		margin: 0;
	}
	.guestTable li.guestPh input[type=text]{
		width: 40px;
		text-align: center;
	}
	label.orderTitle{
		display: block;
		font-weight: bold;
		text-size: 20px;
		width: 80px;
		background:#664400;
		border-top-left-radius: 50% 50%;
		border-top-right-radius: 50% 50%;
		padding: 5px 10px 5px 10px;
		color: white;
		border-bottom: none;
		text-align: center;
	}
	label.guestTitle{
		margin-top: 20px;
		display: block;
		font-weight: bold;
		text-size: 20px;
		width: 100px;
		background:#ac7339;
		border-top-left-radius: 50% 50%;
		border-top-right-radius: 50% 50%;
		padding: 5px 10px 5px 10px;
		color: white;
		border-bottom: none;
		text-align: center;
	}
	div.btnTable{
		margin-top: 10px;
		text-align: right;
		padding-right: 10px;
	}
	.btnTable button{
		padding: 5px;
		width: 50px;
		text-align: center;
		font-weight: bold;
		color: white;
		background: #332600;
		border: none;
	}
	.btnTable button:hover{
		background: #994d00;
	}
	.btnTable button#orderBtn{
		border-top-left-radius: 10px;
		border-bottom-left-radius: 10px;
	}
	.btnTable button#cencleBtn{
		border-top-right-radius: 10px;
		border-bottom-right-radius: 10px;
	}
	.ordList li button#deleteLists{
		display: inline-block;
		border-radius: 50%;
		background: #331a00;
		color: white;
		border-color:#1a0d00;
	}
</style>
</head>
<body>
	<!--  주문 목록 -->
	<label class="orderTitle">주문 목록</label>
	<div class="orderTable">
		<div class="scrollView">
			<div class="titleOrder">
				<label>No</label>
				<label>상품이름</label>
				<label>개수</label>
				<label>가격(:원)</label>
				<label></label>
			</div>
			<div class="scrollBlind">
				<ul class="ordList">
					
					<c:if test="${not empty baskList }">
					<c:forEach items="${baskList }" var="order">
						<li id="orderL">
							<label id="orderNumber" >${order.order_number }</label>
							<label id="orderName" >${order.order_name }</label>
							<label id="orderCount">${order.order_count }</label>
							<label id="orderCost" >${order.order_cost }</label>
							<button type="button" id="deleteLists" onClick="onDelete(this)">삭제</button>
							<input type="hidden" id="orderNo" value="${order.order_no}">
						</li>
					</c:forEach>
					</c:if>
				</ul>
			</div>
		</div>
		<div class="totalM">
			<label>총 개수</label><label id="totCount">0</label><label>개</label>
			<label>총 가격</label><label id="totCost">0</label><label>원</label>
		</div>
	</div>
	<!--  주문자 정보 -->
	<label class="guestTitle">주문자 정보</label>
	<div class="guestTable">
		
			<c:if test="${not empty gvo }">
			<ul>
				<li class="guestNa">
					<label>이름</label>
					<input type="text" name="gname" value="${gvo.gname }">
					<input type="hidden" name="guest_id" id="guest_id" value="${gvo.email }">
				</li>
				<li class="guestAd">
					<label>주소</label>
					<input type="text" name="addr1" id="addr1" value="${gvo.addr1 }" id="postcode"><br>
					<input type="text" name="addr2" id="addr2" value="${gvo.addr2 }"><br>
					<input type="text" name="addr3" id="addr3" value="${gvo.addr3 }"><br>
				</li>
				<li class="guestPh">
					<label>전화번호</label>
					<input type="text" name="phone1" id="phone1" value="${gvo.phone1 }" maxlength="3"> - 
					<input type="text" name="phone2" id="phone2" value="${gvo.phone2 }" maxlength="4"> - 
					<input type="text" name="phone3" id="phone3" value="${gvo.phone3 }" maxlength="4">
				</li>
			</ul>
			</c:if>
		
	</div>
	<div class="btnTable">
		<button type="button" id="orderBtn">결제</button><button type="button" id="cencleBtn">취소</button>
	</div>
</body>
</html>