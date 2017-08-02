<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		$("#menuSelect").change(function(){
			
			$("#menuList").empty(); //List 값 비움
			
			$.ajax({
				type:"get",
				url : '/projectH/menuSelect',
				data : {
					"select" : $("#menuSelect option:selected").val()
				},
				success : function(data){
				}
			});
		});
	});
</script>

</head>
<body>
	<select name="sno" id="menuSelect">
		<option value="" selected style="display:none">선택</option>
		<option value="1">Berger</option>
		<option value="2">Drink</option>
		<option value="3">Side</option>
		<option value="4">SetMenu</option>
	</select>
	<label>리스트</label>
	<c:forEach items="${list }" var="vo">
		<c:out value="${ vo.mname}"/>
	</c:forEach>
	<label>ddd</label>
	<select name="mno" id="menuList" style="width:100px">
	
	</select>
	
	
</body>
</html>