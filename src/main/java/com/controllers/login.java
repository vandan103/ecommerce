package com.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.http.HttpSession;  
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.ConnectionProvider;

/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public login() {
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
        HttpSession session=request.getSession();
		String password = request.getParameter("password");

		if ("admin@gmail.com".equals(email) && "Admin@123".equals(password)) {
			session.setAttribute("email", email);

			response.sendRedirect("admin/adminHome.jsp");

		} else {
			try {
				Connection con = ConnectionProvider.getcon();
				Statement st = con.createStatement();
				System.out.println("heyy");
				ResultSet rs = st.executeQuery("select * from users where email='" + email + "' and password='" + password + "'  ");
				//System.out.println(rs);
				if (rs.next()) {
			        session.setAttribute("email", email);
			    	session.setAttribute("name", rs.getString(2));
					response.sendRedirect("home.jsp");
				} else {

			System.out.print("not exist");
			response.sendRedirect("login.jsp?msg=notexist");
				}

			} catch (Exception e) {
				System.out.print("exception occurs");
				response.sendRedirect("login.jsp?msg=invalid");
			}

		}
		
		
	}

}
