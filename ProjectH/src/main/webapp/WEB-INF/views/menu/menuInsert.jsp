<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert Menu</title>
<link href="<c:url value='/css/bootstrap-combined.min.css'/>" rel="stylesheet">
<link href="<c:url value='/css/main.css'/>" rel="stylesheet">

<link href="<c:url value='/css/supersized.css'/>" rel="stylesheet">
<link href="<c:url value='/css/supersized.shutter.css'/>" rel="stylesheet">

<link href="<c:url value='http://fonts.googleapis.com/css?family=Titillium+Web:400,200,200italic,300,300italic,400italic,600,600italic,700,700italic,900'/>" rel='stylesheet' type='text/css'>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		
		$("#insert_M").click(function(){
			if($("#mname").val()==''){
				alert('추가 할 상품의 이름을 넣어주세요');
				return false;
			}else if($("#mcost").val()==''){
				alert('추가 할 상품의 가격을 넣어주세요');
				return false;
			}
			
			var result = confirm('추가하시겠습니까?');
			
			if(result){
				insert_menu.submit();
			}else{
				$('input[type=text], select[name="sno"]').remove();
			}
			
		});
		
		$("#commentCancel").click(function(){
 			$("#mname").val("");
 			$("#mcost").val("");	
 		});  
	});
</script>
<style>
	div#menu{
		text-align:center;
		height: 80%;
	}
	.title{	
		text-align: center;
 		font-family: fantasy;
 		font-size:48px;
 	}
	.titleDiv{
  		margin-bottom: 100px;
	}
	.sortLb, .pictureLb, .nameLb, .priceLb{
		font-size:20px;
		font-family: fantasy;
    	font-weight: bold;
    	color:white;
    	display: inline-flex;
	}
	.sortLb{
		
	}
	.pictureLb, .priceLb{
		margin-left:20px;
	}
	#file{
		background:white;
		border-radius:4px;
		width:220px;
		margin-bottom:10px;
	}
	span {
  		display:inline-block;	  		 		
  		background:#3e1c00;	  		
  		color:white;
  		font-size:17px;
  		font-weight:bold;	  		
  		border-radius:20px;
  		border:2px double white;
  		text-align:center;	  	
 		margin-top:20px;
 		margin-bottom:10px;	  
 		width:100px;		 			
	 }	
</style>
</head>
<body>
	<div id="menu" class="page-alternate">
		<div class="container">
	    	<div class="titleDiv">
	                <h2 class="title">Menu Insert</h2>	         
	        </div>
				<form name="insert_menu" action="insertMenu" method="post" enctype="multipart/form-data">
					<label class="sortLb">종류</label>
							<select name="sno">
								<option value="1">Berger</option>
								<option value="2">Drink</option>
								<option value="3">Side</option>
								<option value="4">Set</option>
							</select>
							
					<label class="pictureLb">사진</label>
						<input type="file" name="file" id = "file">
					<br><br>
						
					<label class="nameLb">이름</label>
						<input type="text" name="mname" id="mname">
						
					<label class="priceLb">가격</label>
						<input type="text" name="mcost" maxlength="6" id="mcost">
					
					<br>	
					<!--  
					<button type="button" id="insert_M">추가</button>
					<button type="reset">취소</button>
					-->
					<a href="#"><span id="insert_M">추가</span></a>
					<a href="#"><span id="insert_C">취소</span></a>
				</form>
			</div>
		</div>
</body>
</html>