<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.spring.vo.BoardVO" %>
<%
	BoardVO vo = (BoardVO)request.getAttribute("vo");
	String rno = (String)request.getAttribute("rno");
%>
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
		width: 500px;
		height: 500px;
	}
	label.writeLb{
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
	ul.writeUl{
	    margin-right: 50px;
	    margin-top: 50px;
	}

	li.writeLi1, li.writeLi2, li.writeLi3 {
		list-style-type:none;
		margin-bottom: 40px;
		font-weight:bold;
	}
	
	label.titleLb, label.contentLb{
		color:white;
	}
</style>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
	resizeTo(440,375)
	
	$(document).ready(function(){
		$('body').css({
			'width' : $('div.res').width(),
			'height' : $('div.res').height()
		
		});		

	});   
	


</script>
</head>
<body>

	<div class="res">
		<label class="writeLb">게시글 작성 완료</label><br>
		
		<ul class="writeUl">
			<li class="writeLi1">
				<label>제목</label><br>
				<label class="titleLb"><%=vo.getTitle() %></label>
			</li>
			<li class="writeLi2">
				<label>내용</label><br>
				<label class="contentLb"><%=vo.getContent() %></label>
			</li>
		</ul>
	</div>

	
</body>
</html>