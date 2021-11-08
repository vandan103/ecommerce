package com.controllers;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import project.ConnectionProvider;
/**
 * Servlet implementation class addChangeAddress
 */
@WebServlet("/addChangeAddress")
public class addChangeAddress extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addChangeAddress() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("admin/addChangeAddress.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		String email=session.getAttribute("email").toString();
		String address=request.getParameter("address");
		String city=request.getParameter("city");
		String state=request.getParameter("state");
		String country=request.getParameter("country");
		try{
			Connection con = ConnectionProvider.getcon();
			PreparedStatement ps=con.prepareStatement(" update users set address=?,city=?,state=?,country=? where email=? ");
			ps.setString(1, address);
			ps.setString(2, city);
			ps.setString(3, state);
			ps.setString(4, country);
			ps.setString(5, email);
			ps.executeUpdate();
			response.sendRedirect("addChangeAddress.jsp?msg=valid");

		}catch (Exception e){
			//out.println(e);
			response.sendRedirect("addChangeAddress.jsp?msg=invalid");

		}
	}

}
