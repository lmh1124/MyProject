<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ page import="com.spring.vo.QnaVO" %>  
<%@ page import="java.util.*" %>
<%
	ArrayList<QnaVO> list = (ArrayList<QnaVO>)request.getAttribute("list");
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
 		.title{
 			font-family: fantasy;
 		}
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
		.qnaTable{
		  width:80%;
		  height:auto;
		  margin:auto;
		  padding-top:40px;
		  padding-bottom:400px;	  
		  text-align:center;
		}
		
		.qnaTh{
		  color:white;
		  font-size:16px;
		  background-color:#3e1c00;
		}
		
		.qnaTd{
		  
		  color:black;
		  font-size:15px;
		}
		#qna{
			padding: 100px 0 494px;
		}
		
		.tno {width:10%;  background-color:#3e1c00;}
		.ttitle {width:60%; background-color:#3e1c00;}
		.twriter { width:20%;  background-color:#3e1c00;}
		.tbdate { width:20%;  background-color:#3e1c00;}
		.thit { width:15%;  background-color:#3e1c00;}	
		.tno1 {width:10%; background-color:white; }
		.ttitle1 {width:60%; background-color:white;}
		.twriter1 { width:20%; background-color:white; }
		.tbdate1 { width:20%; background-color:white; }
		.thit1 { width:15%; background-color:white;}	
		
		li.qna_writer, li.to_main{
			list-style-type: none;
		}
		
		span.span_main {
	  		width:15%; 		
	  		background:#3e1c00;
	  		padding:5px 8px;
	  		color:white;
	  		font-weight:bold;	  		
	  		border-radius:4px;
	  		border:2px double white;
	  		text-align:center;
	  		float:right; 
	  		margin-bottom:10px;
	  		margin-right:117px;
	  	    font-size:25px;		
}

 	</style>
</head>
<body>
	<!--  start of Content  -->
	<div id="qna" class="page-alternate">
		<div class="container">
	    	<div class="title-page">
	                <h2 class="title">Q&A</h2>	         
	        </div>
	        
	        <!-- 
			<li class="to_main">
				<a href="http://localhost:9000/projectH/main.do"  id="a_main"><span class="span_main">메인으로</span></a>
			</li>
			 -->
			 	               
	          <table class="qnaTable">
					<tr class="qnaTh">
						<th class="tno">No</th>
						<th class="ttitle">Title</th>
						<th class="twriter">Writer</th>
						<th class="tbdate">Date</th>
						<th class="thit">Hits</th>
					</tr>
					
					<% for(QnaVO vo : list){ %>
					<tr class="qnaTd">
						<td class="tno1"><%=vo.getRno() %></td>
						<td class="ttitle1">
							<a class="board_font" href="http://localhost:9000/projectH/qna_content.do?no=<%=vo.getNo()%>&rno=<%=vo.getRno()%>"
								onclick="window.open(this.href, '_blanck', 'width=1200, height=800'); return false">
								<%=vo.getTitle() %></a>  
								
						</td>				
						<td class="twriter1"><%=vo.getQname() %></td>		
						<td class="tbdate1"><%=vo.getQdate() %></td>
						<td class="thit1"><%=vo.getHits() %></td>
					</tr>
					<% } %>
				</table>
				
				<c:if test="${pageVO.totPage>1}">
					<div class="paging">
						<c:forEach var="i" begin="${pageVO.pageStart}" end="${pageVO.pageEnd}" step="1">
							<c:url var="pageLink" value="qna.do">
								<c:param name="page" value="${i}" />
							</c:url>						
				            <c:choose>
				                <c:when test="${i eq pageVO.page}">
				                	<c:out value="${i}"/>
				                </c:when>
				                <c:otherwise>
				                	<a href="${pageLink}"><c:out value="${i}"/></a>
				                </c:otherwise>
				            </c:choose>
				        </c:forEach>
					</div>
					<br>
				</c:if>	
        
	    </div>
	</div>	
	<!--  end of Content  -->	

</body>
</html>