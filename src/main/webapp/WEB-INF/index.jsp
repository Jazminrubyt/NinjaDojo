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
		<h1 class="text-light">Dojos & Ninjas</h1>
		<nav>
			<a class="btn btn-sm btn-warning mb-3" href="/addNinja">
				Add a Ninja </a>
		</nav>
		<div class="d-flex justify-content-center">
			<div class="card text-bg-success p-3 mb-3 " style="max-width: auto;">
				<div class="card-header">Add New Dojo</div>
				<div class="card-body">
					<form:form action="/newDojo" method="post" modelAttribute="dojo">
						<div>
							<form:label path="DojoName">Name</form:label>
							<form:errors class="text-light" path="DojoName" />
							<form:input path="DojoName" />
						</div>
						<input type="submit" class="btn btn-warning mt-3" value="Submit" />
					</form:form>
				</div>
				<h2 class = "text-light">Dojos Added!</h2>
				<table class="text-light">
					<thead>
						<tr>
							<th class = "text-warning">Name</th>
							<th class = "text-warning">Actions:</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="dojo" items="${dojos}">
							<tr>
								<td><c:out value="${dojo.dojoName}" /></td>
								<td><a class="btn btn-sm btn-primary"
									href="/dojo/${dojo.id}"> Details </a></td>
								<td>
									<form action="/dojo/delete/${dojo.id}" method="post">
										<input type="hidden" name="_method" value="delete"> <input
											type="submit" class="btn btn-danger btn-sm " value="Delete">
									</form>
									<a class="btn btn-sm btn-warning mb-3"
										href="/dojo/${dojo.id}/edit"> Edit </a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			
		</div>
	</div>
</body>
</html>