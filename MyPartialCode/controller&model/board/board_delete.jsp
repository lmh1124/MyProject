<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String no = (String)request.getAttribute("no");
%>
 
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>delete</title>	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  	<style>
  	  	body{
  			background:#6d4412;
  		}
  		div.content div.board {
			width:68%;
			margin:auto;  		
		}
		div.content div.board div.board_form {
			width:70%;
			margin:auto;
		}
		h1.boardtitle {		
			text-align:center;	
			color:white;
			font-weight:bold;
			font-family: fantasy;
			margin-top:100px;
		}
		hr{
			opacity:0.0;
		}
		div.board_form{
			text-align:center;
		}
		table{
			width:110%;
			border:1px solid gray;
			margin-bottom:20px;
			
		}
		th, td {
			border:1px solid gray;
			padding:7px 0px;
			text-align:center;			
		}
		th { 
			background:#A6A6A6;			
		}		
		td.ttile { 
			width:65%; 
			text-align:left;
			text-indent:10px;
			padding:10px;
			line-height:1.8;
		}
		.tno {width:5%;}
		.tdate { width:20%; }
		.thit { width:10%; }		
		span.btn_board {
	  		display:inline-block;
	  		width:20%; 		
	  		background:#1C1C1C;
	  		padding:5px 8px;
	  		color:white;
	  		font-weight:bold;	  		
	  		border-radius:4px;
	  		border:2px double white;
	  		text-align:center;
	  		float:right; 		
	  	}
	  	h2{
	  		margin-top:50px;
	  		color:white;
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
	  	}
	  	span.delete, span.list {
	  		width:20%;
	  		padding:8px 8px;
	  	}	
	  	
  	</style>	
</head>
<body>
 	
 	<!--  start of Content  -->
	<div class="content">
		<div class="board">
		<h1 class="boardtitle">Freeboard</h1>
		<hr>
		<div class="board_form">
			<h2>정말로 삭제하시겠습니까?</h2>	
			<a href="http://localhost:9000/projectH/board_delete_complete.do?no=<%=no%>">
			      <span class="delete">삭제하기</span></a>
			<a href="http://localhost:9000/projectH/board.do">
				<span class="list">목록으로</span>
			</a>
		</div>
	</div>
	</div>	
	<!--  end of Content  -->
	
	
</body>
</html>






