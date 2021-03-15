<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>Insert title here</title>
</head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<c:set var="userId" value="${UserId}" />

<style><%@include file="../css/logout.css" %></style>	
<style>
.modal-body {
	height: 400px;
}

.modal-content {
	width: 700px;
}
.examTable{
column-width: 250px;
column-height: 200px;
text-align: center;
}
.title{
font-weight:bold;
font-size: 16px;

column-width: 150px;
column-height: 200px;
text-align: center;
}
.navbar {
  min-height: 80px;
}

.navbar-brand {
  padding: 0 15px;
  height: 80px;
  line-height: 80px;
  font-size:25px;
}

.navbar-toggle {
  /* (80px - button height 34px) / 2 = 23px */
  margin-top: 23px;
  padding: 9px 10px !important;
}

@media (min-width: 768px) {
  .navbar-nav > li > a {
    /* (80px - line-height of 27px) / 2 = 26.5px */
    padding-top: 26.5px;
    padding-bottom: 26.5px;
    line-height: 27px;
  }
}
</style>

<body>
<nav class="navbar navbar-inverse">
	<div class="container-fluid">
	
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#alignment-example" aria-expanded="false">
			</button>
		<a class="navbar-brand" href="#">Online Exam</a>
		</div>
		
		<div class="collapse navbar-collapse" id="alignment-example">
			<ul class="nav navbar-nav">
				<li><a href="/success-login" style="font-size:20px">Home</a></li>
			</ul>
			<ul class="logout">
				<li><font size="5px"color="white">${User} </font></li>
     			<li><a href="/logout" style="font-size:20px "><span class="glyphicon glyphicon-log-out"></span> Log Out</a></li>
 		 	</ul>
		</div>
	</div>
</nav>

<h1 align="center">Exam List</h1>
<div>

<table class="table table-hover">
	<tr class ="title">
		<td class="examTable">Exam Name</td>
		<td class="examTable">Module Name</td>
		<td class="examTable">Module Code</td>
		<td class="examTable">Date Taken</td>
		<td class="examTable">View Result</td>

	</tr>
	
		<c:forEach var="exam" items="${ExamList}">
		<tr class="examTable">
		    		<td class="examTable">${exam.examName} </td>
					<td class="examTable">${exam.module.moduleName}</td>
					<td class="examTable">${exam.module.moduleCode}</td>
					<td class="examTable">${exam.startTime}</td>
					
					<c:if test="${exam.release == 1}">
					 	<c:forEach var="mark" items="${exam.markList}">
						<c:if test="${mark.user_Id.userId != userId}">
							<td><h5>No result</h5></td>
						</c:if> 
						
						<c:if test="${mark.user_Id.userId == userId}">
						<form:form method ="POST" commandName="dto" action="/student/ExamList/Result" >
	    					<form:input  path="exam" type="hidden" value="${exam.examID}"/>
	    					<td><input  type="submit" class="btn btn-primary" value ="View Result" id="submit"/></td>
	    				</form:form>
	    				</c:if>
	    				
	    				</c:forEach>
    				</c:if>
    				
    				<c:if test="${exam.release == 0}">
    					<td><h5>Please wait for the release</h5></td>
    				</c:if>
    	</tr>		
		</c:forEach>
		
	
</table>
</div>

</body>
</html>