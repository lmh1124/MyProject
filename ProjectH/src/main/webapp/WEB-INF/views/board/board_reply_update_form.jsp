<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ page import="com.spring.vo.BoardReplyVO" %>
<%
	BoardReplyVO rvo = (BoardReplyVO)request.getAttribute("rvo");
	String no = (String)request.getAttribute("no");
	String reno = (String)request.getAttribute("reno");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>board</title>	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link href="css/fonts.css" rel="stylesheet">
	<link href="css/main.css" rel="stylesheet">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  	<style>
  		div.content div.board {
			width:650px;
			margin:auto;  		
		}
		div.content div.board div.board_form {
			width:100%;
			height:500px;
			margin:auto;			
		}
		h1.updateTitle {		
			text-align:center;	
			color:white;
			font-weight:bold;
			font-family: fantasy;
			padding-top:80px;
		}
		hr{
			opacity:0.0;
		}	
		ul.updateUl {
			display:block;
			width:75%;	
			margin-left:15%;
			margin-top: 50px;
		}
		li.updateLi1{
			margin-top:30px;
		}
		li.updateLi1, li.updateLi2, li.updateLi3, li.bform_btn {
			display:block;
			width:100%;
			list-style-type:none;
			margin-bottom:13px;
		}
		textarea#content{
			width:68%;
		}

		input {
			width:68%;
			padding:4px 10px;
			
		}
		
		input#bname{
			width:30%;
			float:right;
			margin-right:130px;
		}
		span.update, span.cancel, span.back {
	  		display:inline-block;	  		 		
	  		background:#1C1C1C;	  		
	  		color:white;
	  		font-size:20px;
	  		font-weight:bold;	  		
	  		border-radius:4px;
	  		border:2px double white;
	  		text-align:center;	  	
	  		margin-top:20px;
	  		margin-bottom:10px;	  
	  		width: 30%;
    		padding: 8px 8px;	
	  	}
	  	li.bform_btn {	  		
	  		padding-right:30%;
	  		text-align:center;
	  		margin-left: 50px;
	  	}  	
	  	label.updateLabel1, label.updateLabel2{
	  		font-weight: bold;
    		font-size: 18px;
    		margin-right:55px;
	  	}
	  	label.updateLabel2{
	  		float:left;
	  		margin-right:29px;
	  	}
	  	label.updateLabel3{
	  		font-weight: bold;
    		font-size: 18px;
	  		margin-right: 30px;
	  	}
  	</style>	
  	<script src="../js/jquery-3.1.1.min.js"></script>
  	<script>
  		$(document).ready(function(){
  			
  			$("#update").click(function(){
  				if($("#title").val() == ""){
  					alert("제목을 입력하세요");
  					$("#title").focus();
  					return false;
  				}
  				
  				boardReplyUpdateForm.submit();
  			});
  			
  			$("#cancel").click(function(){
  				$("#title").val("");
  				$("#content").val("");  				
  			});
  			
  			
  		});
  		
  	</script>	
</head>
<body>
 	
 	<!--  start of Content  -->
	<div class="content">
	<div class="board">
	
		<h1 class="updateTitle">Update</h1>
	
		<div class="board_form">
			<form name="boardReplyUpdateForm" action="board_reply_update_save.do" method="post">
				<ul class="updateUl">
					<li class="updateLi1">
						<label class="updateLabel1">작성자</label>
						<input type="text" name="writer" id="writer" value="<%=rvo.getRewriter()%>">
					</li>
					<li class="updateLi2">
						<label class="updateLabel2">댓글 내용</label>						
						<textarea rows="10" cols="50" name="comment" id="comment">
							<%=rvo.getRememo()%>				
						</textarea>
					</li>
					<li class="bform_btn">
						<a href="#"><span class="update" id="update">update</span></a>
						<a href="#"><span class="cancel" id="cancel">cancel</span></a>
						<a href="http://localhost:9000/projectH/board.do"><span class="back" id="back">back</span></a>							
					</li>
				</ul>	
				<!-- <input type="hidden" name="no" value="<%=rvo.getNo() %>"> -->
			</form>
		</div>
	</div>
	</div>	
	<!--  end of Content  -->
		

</body>
</html>






