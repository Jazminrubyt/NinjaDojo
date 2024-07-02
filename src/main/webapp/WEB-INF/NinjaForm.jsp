<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>  
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="container text-center bg-dark">
		<h1 class="text-danger">Ninja Form</h1>
		<nav>
			<a class="btn btn-sm btn-warning mb-3" href="/">
				Home </a>
		</nav>
		<div class="d-flex justify-content-center">
			<div class="card text-bg-info p-3 mb-3 " style="max-width: auto;">
				<div class="card-header">Add New Ninja</div>
				<div class="card-body">
					<form:form action="/newNinja" method="post" modelAttribute="ninja">
						<form:select class="mb-3" path="dojo">
							<c:forEach var="dojo" items="${dojos}">
								<option value="${dojo.id}"><c:out value="${dojo.dojoName}"/></option>
							</c:forEach>
						</form:select>
						<div>
							<form:label path="FirstName">First Name</form:label>
							<form:errors class="text-light" path="FirstName" />
							<form:input class = "mb-3" path="FirstName" />
						</div>
						<div>
							<form:label path="LastName">Last Name</form:label>
							<form:errors class="text-light" path="LastName" />
							<form:input class = "mb-3" path="LastName" />
						</div>
						<div>
							<form:label path="NinjaAge">Age</form:label>
							<form:errors class="text-light" path="NinjaAge" />
							<form:input type="number" class = "mb-3" path="NinjaAge" />
						</div>
						<input type="submit" class="btn btn-warning mt-3" value="Submit" />
					</form:form>
				</div>
				
			</div>
			
		</div>
	</div>
</body>
</html>