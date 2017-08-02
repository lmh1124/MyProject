<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link href="css/fonts.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">
    <script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    
    <script>
    $(document).ready(function(){
    	
	    	$("#join_postcodify_search_button").click(	function() {
				window.open('/projectH/searchPost','addr','width=400, height=600,top=200, left=500, scrollbars=no');
		});
	    	
    	$("#idCheck").click(function() {
			if ($("#email").val() == "") {
				alert('아이디를 입력하세요');
				$("#email").focus();
				return false;
			} else {
				$.ajax({
					type : "get",
					url : "/projectH/EmailCk",
					data : {
						"email" : $("#email").val()
					},
					success : function(data) {
						if (data == 0) {
							alert('해당 아이디는 사용 가능합니다');
							$("#idch").val("ok");
						} else {
							alert('해당 아이디는 사용 불가능합니다');
							$("idch").val("fail");
							$("#email").focus();
						}
					},error: function(xhr, option, error){
						alert(xhr.status); //오류코드
						alert(error); //오류내용
					}
				});
			}
		});
		/*주소 검색*/
		
		$("#phone").bind("keyup", function() {
			$(this).val($(this).val().replace(/[^0-9]/gi, ""));
		});
		/* 빈칸 검색 */
		$("#joincheck").click(
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
					}else if( $("#pass").val().length< 8 || $("#pass").val().length > 15 ){
						alert('비밀번호의 길이는 8 ~ 15 자 사이로 정해주세요');
						$("input[type=password]").val('');
						$("#pass").focus();
						
						return false;
					}
					join_form.submit();
				});
		/* 비밀번호 일치 체크*/
		$("#upass").blur(function() {
			if ($("#pass").val() == $("#upass").val()) {
				$("#pcheck").text("비밀번호가 일치합니다");
			} else {
				$("#pcheck").text("비밀번호가 일치하지 않습니다");
			}
		});
		
		/*end*/

    });
    
    
    </script>
    <style>
    	body{
    		margin: 0;
    		padding: 0;
    	}
		fieldset.textbox {
			border: none;
			margin: auto;
		}
		
		img.btn_close2 {
			float: right;
			margin: -66px -28px 0 0;
		}
		
		form.joinin  button {
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
			color: #333;
			cursor: pointer;
			padding: 6px 6px 4px;
			font: 12px;
			font-weight: bold;
		}
		div#join_f label {
			display: inline-block;
			font-size: 20px;
			font-weight: bold;
			margin-left: 70px;
			margin-right: 10px;
			width: 200px;
			padding: 7px 10px;
			margin-bottom: 30px;
		}
		
		div#join_f input {
			padding: 7px 20px;
			border-radius: 5px;
			border: 1px solid #1a75ff;
			margin-bottom: 20px;
			width: 130px;
			font-weight: bold;
			margin: 0;
		}
		
		div#join_f input:focus {
			background-color: lightblue;
		}
		
		div#join_f input.email {
			width: 130px;
		}
		
		div#join_f input.postcode {
			width: 70px;
		}
		
		div#join_f input.postaddr,div#join_f input.postaddr2 {
			width: 300px;
		}
		
		div#join_f button.postbtn {
			width: 50px;
			height: 35px;
			background-color: #002733;
			border: 1px outset #00141a;
			margin-left: 20px;
			font-size: 15px;
			text-align: center;
		}
		
		div#join_f button.join {
			display: block;
			width: 130px;
			height: 40px;
			background-color: #006666;
			font-size: 20px;
			margin: auto;
		}
		
		div#join_f button.ref {
			width: 80px;
			height: 35px;
			margin-left: 20px;
			background-color: #006652;
			border: 1px outset #ccfff5;
		}
		
		div#join_f span#pcheck {
			display: block;
			width: 300px;
			height: 15px;
			margin: 0;
			color: red;
			margin: auto;
			margin-right: 40px;
			font-size: 15px;
			margin-top: -20px;
			margin-bottom: -10px;
			padding: 0;
		}
		
		form.joinin {
			width: 600px;
			border: none;
			margin: auto;
		}
		div#join_f input.phone {
			width: 60px;
			margin-right: 15px;
			padding: 7px 10px;
		}
		div#join_f label.adre{
			width: 150px;
		}
    </style>
    <body>
    <div id="join_f">
		<form class="joinin" name="join_form" action="join" method="post">
					<fieldset class="textbox">
						<label>Email</label><input type="text" name="email" id="email"
							class="uemail" maxlength="20">
						<button type="button" class="ref" id="idCheck">중복확인</button>
						<br> <input type="hidden" id="idch" value="fail"> <label>Password</label><input
							type="password" name="pass" id="pass" maxlength="15"><br>
						<label>Password Check</label><input type="password" name="upass"
							id="upass" maxlength="15"><br> <span id="pcheck"></span><br>
						<label>Name</label><input type="text" name="gname" id="gname"
							class=""><br> <label>Phone Number</label><input
							type="text" name="phone1" id="phone1" class="phone" maxlength="3">
						<input type="text" name="phone2" id="phone2" class="phone"
							maxlength="4"> <input type="text" name="phone3"
							id="phone3" class="phone" maxlength="4"><br>
							 <label>PostNumber</label><input type="text" readOnly id="addr1" name="addr1" class="postcode" value="" />
						<button type="button" class="postbtn" id="join_postcodify_search_button">검색</button><br> 
						<label class="adre">Address</label><input type="text" readOnly	id="addr2" name="addr2" class="postaddr" value="" /><br> 
						<label class="adre">Detail</label><input type="text" id="addr3" name="addr3" class="postaddr2" value="" /><br>
	
						<button class="join" id="joincheck">회원가입</button>
	
					</fieldset>
				</form>
		</div>
		</body>