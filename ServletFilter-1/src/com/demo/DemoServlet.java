package com.demo;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class DemoServlet
 */
@WebServlet("/DemoServlet")
public class DemoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private final String userID = "admin";
	private final String password = "1234";

	/**
	 * Default constructor.
	 */
	public DemoServlet() {
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException { 
		String user = request.getParameter("name");
		String pass = request.getParameter("pass");
		if (user.equals(userID) && pass.equals(password)) {
			response.setContentType("text/html");
			//PrintWriter out = response.getWriter();
			HttpSession session = request.getSession();  
			session.setAttribute("user", user);      
			// setting session to expiry in 30 mins
			session.setMaxInactiveInterval(30 * 60); 
			Cookie userName = new Cookie("user", user);  
			userName.setMaxAge(30 * 60); 
			response.addCookie(userName);  
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/index.jsp"); 
			rd.forward(request, response);  
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("login.html");
			response.getWriter().println("<p style='text-align:center; color:red'>Invalid Credential !<p>");
			rd.include(request, response);
		}
	}

}
