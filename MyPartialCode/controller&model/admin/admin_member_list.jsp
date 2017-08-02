<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ page import="com.spring.vo.GuestVO" %>
<%@ page import="java.util.*" %>
<%
	ArrayList<GuestVO> list = (ArrayList<GuestVO>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link href="<c:url value='/css/bootstrap-combined.min.css'/>" rel="stylesheet">
<link href="<c:url value='/css/main.css'/>" rel="stylesheet">

<link href="<c:url value='/css/supersized.css'/>" rel="stylesheet">
<link href="<c:url value='/css/supersized.shutter.css'/>" rel="stylesheet">

<link href="<c:url value='http://fonts.googleapis.com/css?family=Titillium+Web:400,200,200italic,300,300italic,400italic,600,600italic,700,700italic,900'/>" rel='stylesheet' type='text/css'>

<style>
       a.board_font{
		color:black;
		text-decoration: none;
		cursor: pointer;
		
		-webkit-transition: color 0.1s linear 0s;	
		   -moz-transition: color 0.1s linear 0s;
			 -o-transition: color 0.1s linear 0s;
			    transition: color 0.1s linear 0s;
       }

		a.board_font:hover
		{
			outline: 0;
			color:#e69806;
			text-decoration:none;
		}
 		.title{
 			font-family: fantasy;
 			font-size:48px;
 		}
 		.titleDiv{
 			text-align: center;
    		margin-bottom: 20px;
 		}
		.memberTable{
		  width:80%;
		  height:auto;
		  margin:auto;
		  padding-top:40px;
		  padding-bottom:400px;	  
		  text-align:center;
		}
		
		.memberTh{
		  color:white;
		  font-size:16px;
		  background-color:#3e1c00;
		}
		
		.memberTd{
		  
		  color:black;
		  font-size:15px;
		}
		#member{
			padding: 100px 0 494px;
		}
		
		.mmail {width:; background-color:#3e1c00;}
		.mpass { width:;  background-color:#3e1c00;}
		.mpass { width:;  background-color:#3e1c00;}
		.mname { width:;  background-color:#3e1c00;}
		.mphone { width:;  background-color:#3e1c00;}	
		.maddr { width:;  background-color:#3e1c00;}	
		.mjdate { width:;  background-color:#3e1c00;}
		.mdelete { width:6%;  background-color:#3e1c00;}	
			
		.mmail1 {width:; background-color:white; }
		.mpass1 {width:; background-color:white;}
		.mname1 { width:; background-color:white; }
		.mphone1 { width:; background-color:white; }
		.maddr1 { width:; background-color:white;}
		.mjdate1 { width:; background-color:white;}
		.mdelete1 { width:6%;  background-color:white;}
		
		.delbut{
		  background-color:brown;
		  width:;
		}
</style>
</head>
<body>
	<div id="member" class="page-alternate">
		<div class="container">
	    	<div class="titleDiv">
	                <h2 class="title">Member List</h2>	         
	        </div>
			<table class="memberTable">
				<tr class="memberTh">
					<th class="mmail">이메일</th>
					<th class="mpass">패스워드</th>
					<th class="mname">이름</th>
					<th class="mphone">휴대폰</th>
					<th class="maddr">주소</th>
					<th class="mjdate">가입일</th>
					<th class="mdelete">삭제</th>
				</tr>
				<% for(GuestVO vo : list){ %>
				<tr class="memberTd">	
					<td class="mmail1"><a class="board_font" href="#"><%=vo.getEmail() %></a></td>
					<td class="mpass1"><%=vo.getPass() %></td>
					<td class="mname1"><%=vo.getGname() %></td>
					<td class="mphone1"><%=vo.getPhone() %></td>
					<td class="maddr1"><%=vo.getAddr() %></td>
					<td class="mjdate1"><%=vo.getJdate() %></td>
					<td class="mdelete1"><button class="delbut"><a href="admin_member_delete.do?no=<%=vo.getEmail()%>">삭제</button></td>
				</tr>
				<% } %>
			</table>
		</div>
	</div>
</body>
</html>