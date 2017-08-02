<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ page import="com.spring.vo.BoardVO" %>
<%@ page import="com.spring.vo.BoardReplyVO" %>
<%@ page import="java.util.*" %>
<%
	BoardVO vo = (BoardVO)request.getAttribute("vo");
	BoardReplyVO rvo = (BoardReplyVO)request.getAttribute("rvo");
	
	String rno = (String)request.getAttribute("rno");
	String reno = (String)request.getAttribute("reno");

	ArrayList<BoardReplyVO> replylist = (ArrayList<BoardReplyVO>)request.getAttribute("replylist");
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
  		div.content div.board {
			width:68%;
			margin:auto;  		
		}
		div.content div.board div.board_form {
			width:70%;
			margin:auto;
		}
		h1.boardtitle {		
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
			height:300px; 
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
			margin-left:-18%;
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
	  	  	
	  	label.lbWriter, label.lbComment {	  		
	  		width:50px;
	  		margin-left:20px;
	  	}
	  	
	  	input#textWriter, textarea#taComment{
	  		margin-left:20px;
	  		width:300px;
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
	  		font-family: fantasy;
	  		
	  	}
	  	span.commentSave, span.commentCancel{
	  		width:100px;
	  	}
	  	span.commentUpdate, span.commentDelete{
	  		width:50px;
	  		font-size:12px;
	  	}
  	</style>	

  	<script src="../js/jquery-3.1.1.min.js"></script>
  	<script>
  		$(document).ready(function(){
  			
  			$("#commentSave").click(function(){
  				if($("#textWriter").val() == ""){
  					alert("작성자 입력하세요");
  					$("#textWriter").focus();
  					return false;
  				}else if($("#taComment").val() == ""){
  					alert("내용을 입력하세요");
  					$("#taComment").focus();
  					return false;
  				}
  				
  				boardReply.submit();
  			});
  			
  			$("#commentCancel").click(function(){
  				$("#textWriter").val("");
  				$("#taComment").val("");	
  			});  			

  		});
  		
		function fn_replyDelete(reno){
		    if (!confirm("삭제하시겠습니까?")) {
		        return;
		    }
  		    var form = document.boardReply;

  		    form.action="board_reply_delete.do";
  		    form.reno.value=reno;
  		    form.submit();    
  		}
		
		function fn_replyUpdate(reno){			
			window.open('/projectH/board_reply_update_form.do','replyUpdate','width=400, height=600,top=200, left=500, scrollbars=no');
		}
  	</script>

</head>
<body>
 	
 	<!--  start of Content  -->
	<div class="content">
		<div class="board">
		<h1 class="boardtitle">Freeboard</h1>
		<hr>
		<div class="board_form">
			<table>			
				<tr>
					<!-- <th class="tno"><%=rno%></th> -->
					<th class="tno"><h4>Content</h4></th>							
					<th class="ttile"><%=vo.getTitle() %></th>
					<th class="twriter"><%=vo.getBname() %></th>
					<th class="tdate"><%=vo.getBdate() %></th>
					<th class="thit"><%=vo.getHits() %></th>
				</tr>
				<tr>					
					<td class="ttile" colspan="5">					
						<p><%=vo.getContent() %></p>
					</td>					
				</tr>	
				<tr class="trReply">
					<td colspan="5">Reply</td>
				</tr>
					<c:forEach var="replylist" items="${replylist}" varStatus="status">
						<tr class="replyList">
							<td class="replyWriter" colspan="1">
								 <c:out value="${replylist.rewriter}"/>
							</td>
							<td class="replyComment" colspan="1">
								<div id="reply<c:out value="${replylist.reno}"/>"><c:out value="${replylist.rememo}"/></div>
							</td>
							<td class="replyTime" colspan="1">
								<c:out value="${replylist.redate}"/>
							</td>
							<td colspan="1">
								<a href="#" onclick="fn_replyUpdate('<c:out value="${replylist.reno}"/>')">
									<span class="commentUpdate" id="commentUpdate">수정</span>
								</a>
							</td>
							<td colspan="1">
							 	<a href="#" onclick="fn_replyDelete('<c:out value="${replylist.reno}"/>')">
									<span class="commentDelete" id="commentDelete">삭제</span>
								</a>
							</td>
						</tr>
					</c:forEach>
			</table>
			
			<form name="boardReply" action="board_reply_save.do" method="post">	
				<input type="hidden" name="no" value="<c:out value="${vo.no}"/>">
				<input type="hidden" name="reno">
				<table class="commentTable">						
					<tr class="commentTitle">
						<td colspan="5">comment</td>
					</tr>
					<tr class="trWriter">
						<td colspan="3"  >
							<label class="lbWriter">작성자</label>
							
						</td>
						<td colspan="2">
							<input type="text" size="48" name="rewriter" id="textWriter">
						</td>
					</tr>
					<tr class="trComment">
						<td colspan="2">
							<label class="lbComment">댓글</label>
						</td>
						<td colspan="3">
							<textarea rows="3" cols="50" name="rememo" id="taComment"></textarea>
						</td>
					</tr>
					<tr class="trBtn">
						<td colspan="5">
							 <a href="#"><span class="commentSave" id="commentSave">save</span></a>
							 <a href="#"><span class="commentCancel" id="commentCancel">cancel</span></a>
						</td>
					</tr>				
				</table>
			</form>
			<div class="btnContent">
				<a href="http://localhost:9000/projectH/board_update_form.do?no=<%=vo.getNo()%>&rno=<%=rno%>">
					<span class="update">수정</span></a>
				<a href="http://localhost:9000/projectH/board_delete.do?no=<%=vo.getNo()%>">
					<span class="delete">삭제</span></a>
				<a href="http://localhost:9000/projectH/board.do">
					<span id="btnList" class="btnList">목록으로</span></a>
			</div>
		</div>
	</div>
	</div>	
	<!--  end of Content  -->
</body>
</html>






