<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���̵�/��й�ȣ ã��</title>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		
		$("ul.panel li:not("+$("ul.tab li a.selected").attr("href")+")").hide()
		
		$("ul.tab li a").click(function(){
			$("ul.tab li a").removeClass("selected");
			$(this).addClass("selected");
			$("ul.panel li").hide();
			$($(this).attr("href")).show();
			$("input").val("");
			return false;
		});
		/*  ���̵� ã��*/
		$("#id_find").click(function(){
			$.ajax({
				type:"POST",
				url:"http://localhost:9000/projectH/findID",
				data:{
					"gname":$("#gname").val(),
					"phone1": $("#phone1").val(),
					"phone2" : $("#phone2").val(),
					"phone3" : $("#phone3").val()
				},
				success:function(data){
					if($.trim(data)=='fail'){
						console.log(data);
						alert('��ϵ� ����ڰ� �ƴϰų� �̸��̳� �޴��� ��ȣ�� �� ���Ǿ����ϴ�');
						$("input[type=text]").val("");
						$("#gname").focus();
					}else{
						$("ul.panel li").hide();
						$("#tab3").show();
						$("#r_id").val($.trim(data));
						return false;
					}
				}
			});
		});
		/* ���̵� ã�� �Ϸ� �� â �ݱ� */
		$('#w_close').click(function(){
			window.close();
		});
		/*  ��й�ȣ ã��*/
		$("#pass_find").click(function(){
			$.ajax({
				type:"POST",
				url:"http://localhost:9000/projectH/findPass",
				data:{
					"email":$("#pemail").val(),
					"gname":$("#pname").val(),
					"phone1": $("#sphone1").val(),
					"phone2" : $("#sphone2").val(),
					"phone3" : $("#sphone3").val()
				},
				success:function(data){
					if($.trim(data)==""){
						alert('��ϵ� ����ڰ� �ƴϰų� �Է��Ͻ� ������ �߸��Ǿ����ϴ�');
						$("input[type=text]").val("");
						$("#pemail").focus();
					}else{
						$("ul.panel li").hide();
						$("#p_email").val($.trim(data));
						$("#tab4").show();
						return false;
					}
				}
			});
		});
		/* ��й�ȣ ��ü*/
		$("#passChange").click(function(){
						
			if($("#r_pass").val() == $("#r_upass").val()){
				
				if( $("#r_pass").val().length< 8 || $("#r_pass").val().length > 15 ){
					alert('��й�ȣ�� ���̴� 8 ~ 15 �� ���̷� �����ּ���');
					$("input[type=password]").val('');
					$("#r_pass").focus();
				}else{
				
					$.ajax({
						type: "post",
						url: "http://localhost:9000/projectH/ChangePass",
						data:{
							"email":$("#p_email").val(),
							"pass":$("#r_pass").val()
						},
						success:function(data){
							alert('��й�ȣ�� ����Ǿ����ϴ�');
							window.close();
						}
					});
				
				}
			}else{
				alert('��й�ȣ�� ��ġ���� �ʽ��ϴ� Ȯ�����ּ���');
				$("input[type=password]").val('');
				return false;
			}
		});
	});
</script>
<style>
body{
	margin: 0px;
	padding: 0px;
	overflow: hidden;
}
	div.cont{
		width:510px;
		height: 250px;
		margin: 0px;
}

	ul.tab{
		padding:0;
		width: 450px;
		height: 40px;
		border-bottom: 2px solid #9FB7D4;
		margin:0 0 -17px 0;
	}
	ul.tab li{
		list-style-type: none;
		width:120px;
		height:40px;
		float:left;	
	}
	ul.tab li a{
		outline:none;
		display:block;
		color: #000080;
		font-weight: blod;
		line-height:40px;
		text-align:center;
		text-decoration:none;
		border: 1px solid #9FB7D4;
	}
	ul.tab li a.selected{
		font-weight: 900;
		color:#333;
		cursor:default;
		background-color: #99ffff;
		border-bottom: none;
	}
	ul.panel{
		width: 450px;
		height: 150px;
		clear:both;
		border:1px solid #9FB7D4;
		border-top:none;
		padding:0;
		padding-top: 15px;
		background-color: #99ffff;
	}
	ul.panel li{
		list-style-type: none;
		padding:10px;
		color:#333;
	}
	ul.panel li label{
		display: inline-block;
		font-size: 20px;
		font-weight: bold;
		margin-left: 10px;
		margin-right: 20px;
		width: 120px;
		text-align: center;
	}
	ul.panel section{
		display: block;
		height: 100px;
		width: 100%;
		margin: 0;
	}
	ul.panel button{
		display: block;
		margin: auto;
		background-color: #1a75ff;
		width: 90px;
		height: 30px;
		color: white;
		font-weight: bold;
		font-size: 20px;
		text-align: center;
	}
	ul.panel li input{
		border: 1px solid #001a33;
		padding: 5px 7px;
		border-radius: 5px;
	}
	ul.panel li label.leb3{
		display: block;
		margin: auto;
		width: 150px;	
	}
	ul.panel #tab3 input{
		display: block;
		margin: auto;
		width: 150px;
		background-color: #99ffff;
		border-radius: 0;
		border: none;
		font-size: 17px;
		text-align: center;
		color: #000080;
	}
	ul.panel li label.leb4{
		display: block;
		margin: auto;
		width: 300px;	
		fint-size: 15px;
	}
	ul.panel #tab4 input{
		display: block;
		margin: auto;
		margin-bottom: 10px;
		width: 150px;
		font-size: 15px;
		width: 230px;
		padding: 5px 15px;
	}
	ul.panel section.leb4_s{
		margin-top: -25px;
		height:125px;
	}
	input.phon{
		width: 60px;
		padding: 7px 10px;
		
	}
</style>
</head>
<body>
	<div class="cont">
		<ul class="tab">
			<li><a href="#tab1" class="selected">���̵� ã��</a></li>
			<li><a href="#tab2">��й�ȣ ã��</a></li>
		
		</ul>
		<ul class="panel">
			<li id="tab1">
				<section>
					<label>�̸�</label><input type="text" name="gname" id="gname"><br>
					<label>�޴��� ��ȣ</label><input type="text" name="phone" id="phone1" class="phon"  maxlength="3"> - 
																	<input type="text" name="phone" id="phone2"  class="phon"  maxlength="4"> - 
																	<input type="text" name="phone" id="phone3"  class="phon" maxlength="4"><br>
				</section>
					<button type="button" id="id_find">ã��</button>
				
			</li>
			<li id="tab2">
				<section>
					<label>�̸���</label><input type="text" name="email" id="pemail"><br>
					<label>�̸�</label><input type="text" name="gname" id="pname"><br>
					<label>�޴��� ��ȣ</label><input type="text" name="sphone" id="sphone1" class="phon" maxlength="3"> - 
																	<input type="text" name="sphone" id="sphone2"  class="phon" maxlength="4"> - 
																	<input type="text" name="sphone" id="sphone3"  class="phon" maxlength="4"><br>
				</section>
					<button type="button" id="pass_find">ã��</button>
				
			</li>
			<li id="tab3">
				<section class="leb3_s">
					<label class="leb3">ã���� ���̵�</label><br>
					<input type="text" readOnly name="r_id" id="r_id">
				</section>
				<button type="button" id="w_close">Ȯ��</button>
			</li>
			<li id="tab4">
				<section class="leb4_s">
					<label class="leb4">���ο� ��й�ȣ�� �Է��ϼ���</label><br>
					<input type="password" name="r_pass" id="r_pass" placeholder="��й�ȣ�� �Է��ϼ���">
					<input type="password" name="r_upass" id="r_upass" placeholder="��й�ȣ�� �ѹ� �� �Է��ϼ���">
					<input type="hidden" id="p_email">
				</section>
				<button type="button" id="passChange">Ȯ��</button>
			</li>
		</ul>
	</div>
</body>
</html>