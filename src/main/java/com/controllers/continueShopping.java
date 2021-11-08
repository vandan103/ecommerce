package com.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;
import project.ConnectionProvider;

/**
 * Servlet implementation class continueShopping
 */
@WebServlet("/continueShopping")
public class continueShopping extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public continueShopping() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String email = session.getAttribute("email").toString();
		String status = "processing";
		try {

			Connection con = ConnectionProvider.getcon();
			PreparedStatement ps = con.prepareStatement("update cart set status=? where email=? and status='bill'");
			ps.setString(1, status);
			ps.setString(2, email);

			ps.executeUpdate();
			response.sendRedirect("home.jsp");

		} catch (Exception e) {
			//out.println(e);
		}
		;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
