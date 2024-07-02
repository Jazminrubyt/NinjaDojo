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
<title>Dojos</title>
</head>
<body>>
	<div class="container text-center bg-dark">
		<h1 class="text-info">Dojo Details</h1>
		
		<nav>
			<a class="btn btn-sm btn-info mb-3" href="/addNinja">
				Add a Ninja </a>
			<a class="btn btn-sm btn-success mb-3" href="/">
				Home </a>
		</nav>
		<div class="d-flex justify-content-center">
			<div class="card text-bg-warning p-3 mb-3 " style="max-width: auto;">
				<div class="card-header">Ninjas</div>
				<div class="card-body">
				<table class="text-dark">
					<thead>
						<tr>
							<th class = "text-danger">First Name</th>
							<th class = "text-danger">Last Name</th>
							<th class = "text-danger">Age</th>
							<th class = "text-danger">Actions:</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="ninja" items="${dojo.ninjas}">
							<tr>
								<td ><c:out value="${ninja.firstName}" /></td>
								<td><c:out value="${ninja.lastName}" /></td>
								<td><c:out value="${ninja.ninjaAge}" /></td>
								<td>
									<form action="/ninja/delete/${ninja.id}" method="post">
										<input type="hidden" name="_method" value="delete"> <input
											type="submit" class="btn btn-danger btn-sm " value="Delete">
									</form>
									<a class="btn btn-sm btn-info mb-3"
										href="/ninja/${ninja.id}/edit"> Edit </a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				</div>
			</div>
			
		</div>
	</div>
</body>
</html>

