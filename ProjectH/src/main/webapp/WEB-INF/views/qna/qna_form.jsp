<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>qna</title>	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link href="css/fonts.css" rel="stylesheet">
	<link href="css/main.css" rel="stylesheet">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  	<style>
  		div.content div.qna {
			width:650px;
			margin:auto;  		
		}
		div.content div.qna div.qna_form {
			width:100%;
			height:500px;
			margin:auto;			
		}
		h1.writeTitle {		
			text-align:center;	
			color:white;
			font-weight:bold;
			font-family: fantasy;
			padding-top:80px;
		}	
		hr{
			opacity:0.0;
		}	
		ul.writeUl {
			display:block;
			width:75%;	
			margin-left:15%;
			margin-top: 50px;
		}
		li.writeLi1{
			margin-top:30px;
		}
		li.writeLi1, li.writeLi2, li.writeLi3, li.bform_btn {
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
		span.save, span.cancel, span.back {
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
	  	label.writeLabel1, label.writeLabel2{
	  		font-weight: bold;
    		font-size: 18px;
    		margin-right:55px;
	  	}
	  	label.writeLabel2{
	  		float:left;
	  		margin-right:29px;
	  	}
	  	label.writeLabel3{
	  		font-weight: bold;
    		font-size: 18px;
	  		margin-right: 30px;
	  	}
  	</style>	
  	<script src="../js/jquery-3.1.1.min.js"></script>
  	<script>
  		$(document).ready(function(){
  			
  			$("#save").click(function(){
  				if($("#title").val() == ""){
  					alert("제목을 입력하세요");
  					$("#title").focus();
  					return false;
  				}else if($("#content").val() == ""){
  					alert("내용을 입력하세요");
  					$("#content").focus();
  					return false;
  				}else if($("#bname").val() == ""){
  					alert("작성자를 입력하세요");
  					$("#bname").focus();
  					return false;
  				}
  				
  				qnaForm.submit();
  			});
  			
  			$("#cancel").click(function(){
  				$("#title").val("");
  				$("#content").val("");
  				$("#bname").val("");
  				
  			});
  			
  			
  		});
  		
  	</script>	
</head>
<body>
 	
 	<!--  start of Content  -->
	<div class="content">
	<div class="qna">
	
		<h1 class="writeTitle">Q&A Answer</h1>
	
		<div class="qna_form">
			<form name="qnaForm" action="qna_save.do" method="post">
				<ul class="writeUl">
					<li class="writeLi1">
						<label class="writeLabel1">Title</label>
						<input type="text" name="title" id="title">
					</li>
					<li class="writeLi2">
						<label class="writeLabel2">Content</label>						
						<textarea rows="10" cols="50" name="content" id="content"></textarea>
					</li>
					<li class="writeLi3">
						<label class="writeLabel3">Writer</label>
						<input type="text" name="bname" id="bname">
					</li>
					<li class="bform_btn">
						<a href="#"><span class="save" id="save">save</span></a>
						<a href="#"><span class="cancel" id="cancel">cancel</span></a>
						<a href="http://localhost:9000/projectH/qna.do"><span class="back" id="back">back</span></a>							
					</li>
				</ul>	
			</form>
		</div>
	</div>
	</div>	
	<!--  end of Content  -->
		

</body>
</html>






