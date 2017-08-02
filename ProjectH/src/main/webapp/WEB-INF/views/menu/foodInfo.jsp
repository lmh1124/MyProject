<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ page import="com.spring.vo.BoardVO" %>  
<%@ page import="java.util.*" %>

<!DOCTYPE html>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Insert title here</title>
<link href="<c:url value='/css/bootstrap-combined.min.css'/>" rel="stylesheet">
<link href="<c:url value='/css/main.css'/>" rel="stylesheet">

<link href="<c:url value='/css/supersized.css'/>" rel="stylesheet">
<link href="<c:url value='/css/supersized.shutter.css'/>" rel="stylesheet">

<link href="<c:url value='http://fonts.googleapis.com/css?family=Titillium+Web:400,200,200italic,300,300italic,400italic,600,600italic,700,700italic,900'/>" rel='stylesheet' type='text/css'>

<style>
 	   a.board_font{
		color:black;
		text-decoration: none;
		cursor: pointer;
		
		-webkit-transition: color 0.1s linear 0s;	
		   -moz-transition: color 0.1s linear 0s;
			 -o-transition: color 0.1s linear 0s;
			    transition: color 0.1s linear 0s;
       }

		a.board_font:hover
		{
			outline: 0;
			color:#e69806;
			text-decoration:none;
		}
 		.title{
 			font-family: fantasy;
 		}
		.boardTable{
		  width:80%;
		  height:auto;
		  margin:auto;
		  padding-top:40px;
		  padding-bottom:400px;	  
		  text-align:center;
		}
		
		.boardTh{
		  color:white;
		  font-size:16px;
		  background-color:#3e1c00;
		}
		
		.boardTd{
		  
		  color:black;
		  font-size:15px;
		}
		
		.tno {width:10%;  background-color:#3e1c00;}
		.ttitle {width:60%; background-color:#3e1c00;}
		.twriter { width:20%;  background-color:#3e1c00;}
		.tbdate { width:20%;  background-color:#3e1c00;}
		.thit { width:15%;  background-color:#3e1c00;}	
		.tno1 {width:10%; background-color:white; }
		.ttitle1 {width:60%; background-color:white;}
		.twriter1 { width:20%; background-color:white; }
		.tbdate1 { width:20%; background-color:white; }
		.thit1 { width:15%; background-color:white;}	
		
		li.board_writer, li.to_main{
			list-style-type: none;
		}
		
		span.span_main {
	  		width:15%; 		
	  		background:#3e1c00;
	  		padding:5px 8px;
	  		color:white;
	  		font-weight:bold;	  		
	  		border-radius:4px;
	  		border:2px double white;
	  		text-align:center;
	  		float:right; 
	  		margin-bottom:10px;
	  		margin-right:117px;
	  	    font-size:25px;		
	  	    
	  	}
	  	
		span.board_write {
	  		width:30%; 		
	  		background:#3e1c00;
	  		padding:5px 8px;
	  		color:white;
	  		font-weight:bold;	  		
	  		border-radius:4px;
	  		border:2px double white;
	  		text-align:center;
	  		float:right; 
	  		margin-bottom:10px;
	  		margin-right:150px;
	  	    font-size:25px;		
	  	    
	  	}		
	
 	</style>
</head>
<body>
	<!--  start of Content  -->
	<div id="order" class="page-alternate">
		<div class="container">
	    	<div class="title-page">
	                <h2 class="title">FoodInfo</h2>	         
	        </div>
	        
	        <!-- 
			<li class="to_main">
				<a href="http://localhost:9000/projectH/main.do"  id="a_main"><span class="span_main">메인으로</span></a>
			</li>
			 -->
			 	               
	          <table class="boardTable">
					<tr class="boardTh">
						<th class="tno">No</th>
						<th class="ttitle">Title</th>
						<th class="twriter">Writer</th>
						<th class="tbdate">Date</th>
						<th class="thit">Hits</th>
					</tr>
					
				</table>
			
				
				<br>
				<li class="board_writer">
					<a href="http://localhost:9000/projectH/board_form.do"
					onclick="window.open(this.href, '_blanck', 'width=1200, height=800'); return false">
					<span class="board_write">글쓰기</span></a> 
					
				</li>
        
	    </div>
	</div>	
	<!--  end of Content  -->	

</body>
</html>