<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Insert title here</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 	<script src="../js/jquery.pagenavigator.js"></script>	
 	<style>
 		body{
			background-image:url(../image/darth_stripe.png);
		}
		h1{
			text-align:center;		
			font-family:fantasy;
			color:white;
		}
		div.orderfull{
			border-radius:10px;
			background-color:white;
			padding-top:20px;
			width:70%;
			margin:auto;
		}
		div.content{
			margin-left:24%;
			margin-top:30px;
		}

		table.orderTable{
			width:100%;
			text-align:center;
			margin-left:-17%;
			border-bottom:1px solid gray;			
		}
		th.title, th.addr{
			border:px solid blue;
			text-align:center;
		}
		
		td.title, td.addr{
			border:px solid red;
			text-align:center;
		}
		td.title{
		}
		td.addr{
		
		}
		img.burgerImg{
			width:100px;
			margin-top:20px;
		}
		.deleteBtn{
			margin-left:20px;
		}
		.divBtn{
			margin-top:30px;
			text-align:center;
			border:px solid skyblue;
		}
 	</style>
</head>
<body>
	<c:import url="http://172.16.13.2:9000/projectH/main/header.jsp"/>
	<!--  start of Content  -->
	<h1 class="ordertitle">Order</h1>
	<div class="orderfull">
	<div class="content">		
		<table class="orderTable">
			<tr>
				<th class="title"><h3>제품</h3></th>
				<th class="addr"><h3>주소</h3></th>
				<th></th>
			</tr>
			<tr>
				<td class="title"><img src="../image/burger1.png" class="burgerImg" alt="burger1"></img></td>
				<td class="addr">서울특별시 종로구 종로12길 15 코아빌딩 10층</td>
				<td><button class="deleteBtn">제거</button></td>
			</tr>
		</table>			
	</div>	
	<div class="divBtn">
		<button class="orderBtn">주문하기</button>&nbsp
		<button class="cancelBtn">취소</button>
	</div>
	</div>
	<!--  end of Content  -->
	<c:import url="http://172.16.13.2:9000/projectH/main/footer.jsp"/>
</body>
</html>