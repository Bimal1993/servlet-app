<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<body>
	<%
		String user = (String) session.getAttribute("user");
	String userName = null;
	String sessionID = null;
	Cookie[] cookies = request.getCookies();
	if (cookies != null) {
		for (Cookie cookie : cookies) {
			if (cookie.getName().equals("user")) {
		userName = cookie.getValue();
			}
			if (cookie.getName().equals("JSESSIONID")) {
		sessionID = cookie.getValue();
			}
		}
	}
	%>  
	<% 
		if (sessionID != null) {
		out.println("<h4>Name " + userName.toUpperCase()+"</h4>");
		out.println("<p>Session Id: " + sessionID+"</p>");
	}  
	%> 
	<div class="container"> 
		<div class="row">
			<a href="profile.jsp">Profile Page</a>
		</div> 
		<div class="row"> 
		<a href="registraction.jsp">New registration Page</a>
		</div> 

		<form action="/filter-test3/LogoutServlet" method="post">
			<div class="col">
				<input type="submit" value="Logout">
			</div>
		</form> 
	</div>
</body>
</html>
