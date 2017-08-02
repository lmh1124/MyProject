<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�ּ� �˻�</title>
<style>
div.postmain{
	width:100%;
}
div.postmain span.title{
	font-size: 30px;
	font-weight: bold;
	
}
div.post{
	border: 2px double black;
	overflow: auto; 
	width: 300px; 
	height: 300px;
	background-color: #ccffff;
}
div.postform input{
	width: 250px;
	border-radius: 5px;
	border: 1px solid #1a75ff;
	padding: 5px 6px;
}
div.postform input.code{
	width: 100px;
}div.postform label{
		display: inline-block;
		font-size: 20px;
		font-weight: bold;
		margin-right: 10px;
		width: 100px;
}
div.postform button{
	width:70px;
	height: 30px;
	font-size: 15px;
	background-color: #002733;
	color: #ffffff;
	margin-top: 30px;
}
</style>
</head>
<body>
<div class="postmain">
	<span class="title">�ּ� �˻�</span>
	<div  class="post"id="postcodify"></div>
	<div class="postform">
		<label>�����ȣ</label><input type="text" class="code"readOnly id="postcode" value="" /><br />
		<label>�ּ�</label><input type="text" readOnly id="address" value="" /><br />
		<label>���ּ�</label><input type="text" id="details" value="" /><br />
		<button id="close">����</button>
	</div>
</div>
<!-- jQuery�� Postcodify�� �ε��Ѵ� -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>

<!-- ������ ������ <div>�� �˻� ����� ǥ���ϰ�, ����� �Է��� <input>��� �����Ѵ� -->
<script>
 
    $(document).ready(function(){
    	$("#postcodify").postcodify({
	        insertPostcode5 : "#postcode",
	        insertAddress : "#address",
	        insertDetails : "#details",
	        hideOldAddresses : false
	    }); 
    	$("#close").click(function(){
    		$(opener.document).find("#addr1").val($("#postcode").val());
    		$(opener.document).find("#addr2").val($("#address").val());
    		$(opener.document).find("#addr3").val($("#details").val());
        	self.close();
    	});
    });
</script>
</body>
</html>