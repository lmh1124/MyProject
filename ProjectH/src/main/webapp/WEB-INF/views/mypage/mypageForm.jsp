<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>MyPage</title>
<link href="css/fonts.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
// 		주소 검색
		$("div.mypage_div #mypage_postcodify_search_button").click(	function() {
			window.open('/projectH/msearchPost','addr','width=400, height=600,top=200, left=500, scrollbars=no');
		});
		
// 		회원 정보 수정 취소
		$("#updatecancle").click(function(){
			
			parent.closePage();
		});
		
// 		회원 정보 수정 빈칸 확인
		$("#update_btn").click(
				function() {
					if ($("#uemail").val() == "") {
						$("#uemail").css("border-color", "red")
								.css("border-size", "3px");
						$("#uemail").siblings().css(
								"border-color", "#1a75ff").css(
								"border-size", "1px");
						return false;
					} else if ($("#pass").val() == "") {
						$("#pass").css("border-color", "red")
								.css("border-size", "3px");
						$("#pass").siblings().css(
								"border-color", "#1a75ff").css(
								"border-size", "1px");
						return false;
					} else if ($("#upass").val() == "") {
						$("#upass").css("border-color", "red")
								.css("border-size", "3px");
						$("#upass").siblings().css(
								"border-color", "#1a75ff").css(
								"border-size", "1px");
						return false;
					} else if ($("#gname").val() == "") {
						$("#gname").css("border-color", "red")
								.css("border-size", "3px");
						$("#gname").siblings().css(
								"border-color", "#1a75ff").css(
								"border-size", "1px");
						return false;
					} else if (($("#phone1").val() == "")
							|| ($("#phone2").val() == "")
							|| ($("#phone3").val() == "")) {
						$("#phone1, #phone2, #phone3").css(
								"border-color", "red").css(
								"border-size", "3px");
						return false;
					} else if ($("#addr1").val() == "") {
						$("#addr1").css("border-color", "red")
								.css("border-size", "3px");
						$("#addr1").siblings().css(
								"border-color", "#1a75ff").css(
								"border-size", "1px");
						return false;
					} else if ($("#pass").val() != $("#upass")
							.val()) {
						return false;
					} else if ($("#idch").val() == "fail") {
						alert('이메일 중복 확인하세요');
						return false;
					}
					mypageUpdate.submit();
				});
				
				$.ajax({
					type: "post",
					url : "http://localhost:9000/projectH/main.do"
				});
	});

</script>
<style>
	body{
		margin:0;
		padding:0;
	}
		/* mypage form*/
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
	
	.mypage_div div.mypage_f label {
		display: inline-block;
		font-size: 20px;
		font-weight: bold;
		margin-left: 70px;
		margin-right: 10px;
		width: 150px;
		margin-bottom: 30px;
	}
	
	.mypage_div div.mypage_f input {
		padding: 10px 15px;
		border-radius: 5px;
		border: 1px solid #1a75ff;
		width: 250px;
		margin: 0;
	}
	
	.mypage_div div.mypage_f input.postcode {
		width: 70px;
	}
	
	div.mypage_f input.postaddr,div.mypage_f input.postaddr2 {
		width: 400px;
	}
	
	div.mypage_f span.mypage_btn {
		display: inline-block;
		width: 100%;
		text-align: center;
		margin-top: 50px;
	}
	
	div.mypage_f button {
		background: -moz-linear-gradient(center top, #f3f3f3, #dddddd);
		background: -webkit-gradient(linear, left top, left bottom, from(#f3f3f3),
			to(#dddddd));
		background: -o-linear-gradient(top, #f3f3f3, #dddddd);
		filter: progid:DXImageTransform.Microsoft.gradient(startColorStr='#f3f3f3',
			EndColorStr='#dddddd');
		border-color: #000;
		border-radius: 4px 4px 4px 4px;
		-moz-border-radius: 4px;
		-webkit-border-radius: 4px;
		cursor: pointer;
		padding: 6px 6px 4px;
		font: 12px;
		font-weight: bold;
	}
	
	div.mypage_f button.postbtn {
		width: 50px;
		height: 35px;
		margin-left: 20px;
		font-size: 15px;
		text-align: center;
	}
	
	div.mypage_f button.update {
		width: 130px;
		height: 40px;
		font-size: 20px;
	}
	
	div.mypage_f button.cancle {
		width: 130px;
		height: 40px;
		font-size: 20px;
	}
	div.mypage_f input.phone {
			width: 60px;
			margin-right: 15px;
			padding: 7px 10px;
		}
</style>
</head>
<body>
	<div class="mypage_div" id="mypage1">
		<div class="mypage_c">
			<div class="mypage_f">
				<form name="mypageUpdate" action="update_mypage" method="post">
					<label>이메일</label><input type="text" readOnly name="email"	id="email" value="${vo.email }"><br> 
					<label>이름</label><input type="text"	readOnly name="gname" id="gname" value="${vo.gname }"><br>
					 <label>휴대폰번호</label><input	type="text" name="phone1" id="phone1" class="phone" maxlength="3" value="${vo.phone1 }">
					<input type="text" name="phone2" id="phone2" class="phone"	maxlength="4" value="${ vo.phone2}"> 
					<input type="text" name="phone3"	id="phone3" class="phone" maxlength="4" value="${vo.phone3 }"><br> 
					<label>우편번호</label><input	type="text" readOnly id="maddr1" name="addr1" class="postcode" value="${ vo.addr1}"/>
					<button type="button" class="postbtn"	id="mypage_postcodify_search_button">검색</button><br> 
					<label>주소</label><input type="text" readOnly id="maddr2"	name="addr2" class="postaddr" value="${vo.addr2 }"/><br> 
					<label>상세주소</label><input	type="text" id="maddr3" name="addr3" class="postaddr2" value="${vo.addr3 }"/><br>
					<span class="mypage_btn">
						<button class="update" id="update_btn">수정하기</button>
						<button type="button" class="cancle" id="updatecancle">취소하기</button>
					</span>
				</form>
			</div>
		</div>
	</div>
</body>
</html>