<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Insert title here</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  	<style>
  	  	body{
  			background:#6d4412;
  		}
  		
  		label.admin_login{
  			font-family:fantasy;
  			font-weight:bold;
  			font-size:70px;
  			color:white;
  		}
  		
  		form.form_admin{
  			text-align:center;
  			margin-top:250px;
  		}
  		
  		span.btn_span {
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
	  		width:200px; 			
	  	}
  	</style>
  	<script src="../js/jquery-3.1.1.min.js"></script>
  	<script>
  		$(document).ready(function(){
  			
  			$(".btn_span").click(function(){
  				if ($("#email").val()=="admin@naver.com" && $("#pass").val()=="qwer1234"){
  					admin_login.submit();	
  				}else{
  					alert("�����ڸ� ������ �� �ֽ��ϴ�.");
  					return false;
  				}
  				
  			});			

  		});
  	</script>
</head>
<body>
		<form name="admin_login" action="admin_login.do" method="post" class="form_admin">
		
			<label class="admin_login">Admin Page</label>
			<p>
				<input type="text" name="email" id="email" placeholder="������ �̸��� �Է�">
			</p>
			<p>
				<input type="password" name="pass" id="pass" placeholder="��й�ȣ �Է�">
			</p>
			<a href="#"><span class="btn_span">�α���</span></a>	
		</form>
</body>
</html>









