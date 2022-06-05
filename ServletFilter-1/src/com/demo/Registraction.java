package com.demo;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Registraction
 */
@WebServlet("/Registraction")
public class Registraction extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Registraction() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Map<String, String> map = new LinkedHashMap<String, String>();
		map.put("Name", request.getParameter("name"));
		map.put("Email", request.getParameter("email"));
		map.put("Password", request.getParameter("pwd"));
		map.put("Gander", request.getParameter("gander"));

		response.getWriter().print(map);
	}

}
