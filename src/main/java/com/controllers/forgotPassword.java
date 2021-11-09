package com.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import project.ConnectionProvider;
/**
 * Servlet implementation class forgotPassword
 */
@WebServlet("/forgotPassword")
public class forgotPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public forgotPassword() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String number = request.getParameter("number");
		String question = request.getParameter("question");
		String answer = request.getParameter("answer");
		String password = request.getParameter("password");

		try {
			Connection con = ConnectionProvider.getcon();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from users where email='" + email + "' and mobile_no='" + number
			+ "'  and question='" + question + "' and answer='" + answer + "' ");
			if (rs.next()) {
				st.executeUpdate("update users set password='" + password + "'  where email='" + email + "' ");
				response.sendRedirect("forgotPassword.jsp?msg=done");
			} else {
				response.sendRedirect("forgotPassword.jsp?msg=invalid");
			}
			
		} catch (Exception e) {
			System.out.print("exception occurs");
			response.sendRedirect("forgotPassword.jsp?msg=invalid");
		}	
	}

}
