<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Order List</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	var reData1;
	var reData2;
	var index = null;
	var original = $('table').html();
	
	$("tr.oslist").click(function(){
		if($(this).hasClass(".selected")){
			$("#returnList").click();
			
		}
		else{
			$(this).addClass(".selected");
			var orderList = [];
			var selectedDate = $("#ordate", this).text();
			
			$.post('http://localhost:9000/projectH/mypage_orderDetail', {"ordate" : selectedDate }, function(retVal){
				orderList = retVal.deList;
				var oAddrs;
				var oPhones;
				var totSum = 0;
				$.each(orderList, function(index, value){
					var appendTable = "<tr class='details'> <td>"+(parseInt(index)+parseInt(1)) +"</td>" ;
					appendTable += "<td>"+value.order_name+"</td>";
					appendTable += "<td>"+value.order_count+"</td>";
					appendTable += "<td>"+value.order_cost+"</td></tr>";
					$("#orderDetailList").append(appendTable);
					totSum += parseInt(value.order_cost);
					oAddrs = value.addr1+"##"+value.addr2+"##"+value.addr3;
					oPhones = value.phone1+"-"+value.phone2+"-"+value.phone3;
				});
				var oAddrL = oAddrs.split('##');
				for(var i in oAddrL){
					var ids = "#addrs"+(parseInt(i)+parseInt(1));
					$(ids).val(oAddrL[i]);
				}
				var oPhoneL = oPhones.split('-');
				for(var i in oPhoneL){
					var ids = "#phones"+(parseInt(i)+parseInt(1));
					$(ids).val(oPhoneL[i]);
				}
				$("#costs").val(totSum);
			});
			index = $("tr.oslist").index(this);
			$("tr.oslist:lt("+index+")")
						.children('td').animate({padding:0}).wrapInner('<div class="wrapper" />').children().slideUp(function(){
							$(this).closest('tr').hide();
			});
			$("tr.oslist:gt("+index+")").children('td').animate({padding:0}).wrapInner('<div class="wrapper" />').children().slideUp(function(){
				$(this).closest('tr').hide();
			});
			$("#orderDetails").slideDown();
		}
	});
	$("#returnList").click(function(){
		$("tr.oslist").removeClass(".selected");
		index = parseInt(index) + 2;	
		$("tr.oslist:not(:nth-child("+index+"))").children('td').closest('tr').show().children()
		.children('.wrapper').slideDown(function(){
			$(this).contents().unwrap();
		}).parent('td').animate({padding:8});
		
		$("#orderDetails").slideUp(function(){
			$('tr:not(:first)',this).remove();
		});
});
	
});

</script>
<style>
	table {
		border-collapse : collapse;
		width: 100%;
	}
	th, td {
		text-align: left;
		padding: 8px;
		font-weight: bold;
	}
	tr:not(:first-child):hover{
		background: #ff4d4d;
		cursor: pointer;
		
	}
	tr{
		background: white;
	}
	tr:nth-child(even){
		background : #ffe0b3;
	}
	th{
		background: #663300;
		color: white;
	}
	div.wrapper{
		width: 100%;
	}
	div#orderDetails{
		display: none;
		width: 100%;
	}
	#orderDetailInform{
		display: block;
		background: #804000;
		width: 100%;
		line-height: 200%;
	}
	#orderDetailInform label{
		display: inline-block;
		width: 200px;
		padding: 10px 0;
		text-align: center;
		color: white;
	}
	#orderDetailInform label.detailTitle{
		width: 100%;
		background:#e67300;
	}
	#orderDetailInform input{
		display: inline-block;
		padding: 10px;
	}
	#orderDetailInform input#addrs1{
		width: 50px;
	}
	#orderDetailInform input#addrs2{
		width: 250px;
		margin-left: 200px;
	}
	#orderDetailInform input#addrs3{
		width: 250px;
		margin-left: 200px;
	}
	#orderDetailInform input#phones1, #phones2, #phones3{
		width:80px;
	}
	#orderDetailInform input#costs{
		width: 80px;
	}
	#returnList{
		display: block;
		float: right;
		padding: 10px;
	}
</style>
</head>
<body>
	
	<table>
		<tr>
			<th>No</th>
			<th>내용</th>
			<th>날짜</th>
		</tr>
		<c:if test="${not empty sessionScope.email }">
		<c:forEach items="${orList }" var="ord" varStatus="status">
		
		<tr class="oslist">
			<td>${status.count }</td>
			<td>${ord.oname } 포함 ${ord.ocount}건</td>
			<td id="ordate">${ord.odate }</td>
		</tr>
		</c:forEach>
		</c:if>
	</table>
	<div id="orderDetails">
		
		<table id="orderDetailList">
			<tr>
				<th>No</th>
				<th>내용</th>
				<th>개수</th>
				<th>가격</th>
			</tr>
		</table>
		<div id="orderDetailInform">
			<label class="detailTitle">주문자 정보</label><br>
			<label>주소</label><input type="text" id="addrs1"><br>
			<input type="text" id="addrs2"><br>
			<input type="text" id="addrs3"> <br>
			<label>번호</label><input type="text" id="phones1"> - <input type="text" id="phones2"> - <input type="text" id="phones3"><br>
			<label>총 가격</label><input type="text" readOnly id="costs"><br>
			<button type="button" id="returnList">Return</button>
		</div>
		
	</div>

</body>
</html>