<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ page import="com.spring.vo.QnaVO" %>
<%@ page import="java.util.*" %>
<%
	QnaVO vo = (QnaVO)request.getAttribute("vo");
	
	String rno = (String)request.getAttribute("rno");
	String reno = (String)request.getAttribute("reno");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="EUC-KR">
	<title>content</title>	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  	<style>
  		body{
  			background:#6d4412;
  		}
  		div.content div.qna {
			width:68%;
			margin:auto;  		
		}
		div.content div.qna div.qna_form {
			width:70%;
			margin:auto;
		}
		h1.qnatitle {		
			text-align:center;	
			color:white;
			font-weight:bold;
			font-family: fantasy;
		}
		hr{
			opacity:0.0;
		}
		table{
			width:100%;
			border:1px solid gray;
			margin-bottom:20px;
			
		}
		th, td {
			padding:7px 0px;
			text-align:center;			
		}
		th { 
			background:#e6e6f2;			
		}	
		th.ttile{
			width:40%;
		}	
		th.twriter{
			width:15%;
		}
		td.ttile { 
			width:65%;			
			height:200px; 
			text-align:left;
			text-indent:10px;
			padding:10px;
			line-height:1.8;
			background-color:#eccf82;
		}
		tr.replyList{
			background-color:#eccf82;
		}
		.tno {width:5%; padding:20px; font-family:fantasy;}
		.tdate { width:10%; font-size:11px; }
		.thit { width:10%; }		
		 		
		div.btnContent{
		    width: 110%;
    		margin-left: -5%;
			text-align:center
		}
	  	span {
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
	  	}	

	  	span.update, span.delete, span.btnList {
	  		width:15%;
	  		padding:8px 8px;
	  	}
	  	span.update {	margin-left:120px; }	
	  	table.commentTable{
	  		margin:auto;
	  		width:80%;
	  	}
	  	
	  	tr.trWriter, tr.trComment, tr.trBtn{
	  		background:#eccf82;
	  	}
	  	  	
	  	label.lbComment {	  	
	  		font-weight:bold;	
	  		width:50px;
	  		margin-left:20px;
	  	}
	  	
	  	textarea#taComment{
	  		margin-left:20px;
	  		width:300px;
	  		height:200px
	  	}
	  	tr.trReply{
	  		background:#e6e6f2;
	  		font-family:fantasy;
	  	}
	  	td.replyWriter{
	  		width:20%;
	  		font-weight:bold;	
	  	}
	  	td.replyComment{
	  		width:20%;
	  	}
	  	td.replyTime{
	  		width:20%;
	  	}
	  	
	  	tr.commentTitle{
	  		background: #e6e6f2;
	  		font-weight: bold;
	  		font-family: fantasy;
	  		
	  	}
	  	span.commentSave, span.commentCancel{
	  		width:100px;
	  	}
	  	span.commentUpdate, span.commentDelete{
	  		width:50px;
	  		font-size:12px;
	  	}
	  	.lbFrom{
	  		margin-right:10%;
	  		padding-right:20px;
	  	}
	  	.lbTo{
	  		margin-right:10%;
	  		padding-right:35px;
	  	}
	  	.lbSubject{
	  		margin-right:10%;
	  	}
	  	.ipFrom{
	  		width:200px;
	  	}
	  	.ipTo{
	  		width:200px;
	  	}
	  	.ipSub{
	  		width:200px;
	  	}
  	</style>	

  	<script src="../js/jquery-3.1.1.min.js"></script>
  	<script>
  		$(document).ready(function(){
  			
  			$("#commentSave").click(function(){
  				if($("#taComment").val() == ""){
  					alert("내용을 입력하세요");
  					$("#taComment").focus();
  					return false;
  				}
  				
  				qnaAnswer.submit();
  			});
  			
  			$("#commentCancel").click(function(){
  				$("#taComment").val("");	
  			});  			

  		});
  	</script>

</head>
<body>
 	
 	<!--  start of Content  -->
	<div class="content">
		<div class="qna">
		<h1 class="qnatitle">Q&A</h1>
		<hr>
		<div class="qna_form">
			<table>			
				<tr>
					<!-- <th class="tno"><%=rno%></th> -->
					<th class="tno"><h4>Content</h4></th>							
					<th class="ttile"><%=vo.getTitle() %></th>
					<th class="twriter"><%=vo.getQname() %></th>
					<th class="tdate"><%=vo.getQdate() %></th>
					<th class="thit"><%=vo.getHits() %></th>
				</tr>
				<tr>					
					<td class="ttile" colspan="5">					
						<p><%=vo.getContent() %></p>
					</td>					
				</tr>
			</table>
			
			<form name="qnaAnswer" action="sendMail.do" method="post">	
				<table class="commentTable">						
					<tr class="commentTitle">
						<td colspan="5">답변하기</td>
					</tr>
					<tr class="trComment">
						<td>
							<label class="lbFrom">from</label>
							<input type="text" name="from" class="ipFrom" value="projecth1234@naver.com">
						</td>
					</tr>
					<tr class="trComment">
						<td>
							<label class="lbTo">to</label>
							<input type="text" name="to" class="ipTo" value="<%=vo.getQname() %>">
						</td>
					</tr>
					<tr class="trComment">
						<td>
							<label class="lbSubject">subject</label>
							<input type="text" name="subject" class="ipSub">
						</td>
					</tr>
					<tr class="trComment">
						<td colspan="3">
							<textarea rows="3" cols="50" name="content" id="taComment"></textarea>
						</td>
					</tr>
					<tr class="trBtn">
						<td colspan="5">
							 <a href="#"><span class="commentSave" id="commentSave">보내기</span></a>
							 <a href="#"><span class="commentCancel" id="commentCancel">취소</span></a>
						</td>
					</tr>				
				</table>
			</form>
			<div class="btnContent">
				<a href="http://localhost:9000/projectH/qna_delete.do?no=<%=vo.getNo()%>">
					<span class="delete">삭제</span></a>
				<a href="http://localhost:9000/projectH/qna.do">
					<span id="btnList" class="btnList">목록으로</span></a>
			</div>
		</div>
	</div>
	</div>	
	<!--  end of Content  -->
</body>
</html>






