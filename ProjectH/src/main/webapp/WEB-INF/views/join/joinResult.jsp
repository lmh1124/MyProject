<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link href="css/fonts.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">
<style>
	body{
		margin:0;
		padding:0;
	}
	div.res{
		text-align: center;
		padding: 50px 50px;
		width: 300px;
		height: 200px;
	}
	label{
		display: block;
		margin-bottom: 30px;
	}
	button{
		background: -moz-linear-gradient(center top, #f3f3f3, #dddddd);
		background: -webkit-gradient(linear, left top, left bottom, from(#f3f3f3),	to(#dddddd));
		background: -o-linear-gradient(top, #f3f3f3, #dddddd);
		filter: progid:DXImageTransform.Microsoft.gradient(startColorStr='#f3f3f3',
		EndColorStr='#dddddd');
		border-color: #000;
		border-width: 1px;
		border-radius: 4px 4px 4px 4px;
		-moz-border-radius: 4px;
		-webkit-border-radius: 4px;
		color: #333;
		cursor: pointer;
		display: inline-block;
		padding: 6px 6px 4px;
		margin-top: 15px;
		font: 12px;
		width: 214px;
	}
</style>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$('body').css({
			'width' : $('div.res').width(),
			'height' : $('div.res').height()
		});
		$("#logbtn").click(function(){
			$(location).attr('src','http://localhost:9000/projectH/joinForm');
			parent.closePopup();
		});
	});   
</script>
</head>
<body>

			<div class="res">
				<label>회원가입 성공</label><br>
				<button type="button" id="logbtn">로그인</button>
			</div>

</body>
</html>