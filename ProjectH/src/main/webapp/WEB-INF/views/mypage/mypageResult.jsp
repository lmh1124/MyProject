<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
	div.mypage_div {
		width: 100%;
		height: 750px;
		background-color: #1a1a1a;
	}
	
	div.mypage_c {
		width: 800px;
		margin: auto;
		border-radius: 20px;
	}
	
	.mypage_div div.mypage_f {
		width: 700px;
		margin: auto;
		height: 600px;
		padding-top: 100px;
	}
	div.res{
		margin: auto;
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
		$("#mybtn").click(function(){
			$("#mypageFrame", parent.document).attr('src','http://localhost:9000/projectH/mypageInfo');
			
			parent.closePage();
		});
	});   
</script>
</head>
<body>
	<div class="mypage_div">
		<div class="mypage_c">
			<div class="mypage_f">
				<div class="res">
					<label>회원 정보 수정 완료</label><br>
					<button type="button" id="mybtn">닫기</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>