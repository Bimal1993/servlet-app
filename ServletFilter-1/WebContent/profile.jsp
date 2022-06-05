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
	<div class="col">
		<form action="/filter-test3/LogoutServlet" method="post">
			<input type="submit" value="Logout" style="margin-left: 1090px;">
		</form>
	</div>
	<%
		String user = (String) session.getAttribute("user");
	//out.print("User Name : " + user);
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
	<div class="text-center">
		<img alt="Image Not Available" src="./image/profileimage.jpg"
			class="img-fluid img-thumbnail" style="height: 200px; width: auto;">
	</div>
	<div class="col"> 
		<%
			if (sessionID != null) { 
			out.println("<p>Name: " + userName.toUpperCase()+"</p>");
			out.println("<p>Session Id: " + sessionID+"</p>");
		} 
		%>
	</div>
</body>
</html>