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
 * Servlet implementation class messageUs
 */
@WebServlet("/messageUs")
public class messageUs extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public messageUs() {
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
		HttpSession session=request.getSession(); 
		String email=session.getAttribute("email").toString(); 
		 String subject=request.getParameter("subject");
		 String body=request.getParameter("body");

		 try{
		 	Connection con=ConnectionProvider.getcon();
		 	PreparedStatement ps=con.prepareStatement("insert into message(email,subject,body)  values(?,?,?) ");
		 	ps.setString(1, email);
		 	ps.setString(2, subject);
		 	ps.setString(3, body);
		 	ps.executeUpdate();
		 	response.sendRedirect("messageUs.jsp?msg=valid");
		 	
		 }catch(Exception e){//out.print(e);	
			 response.sendRedirect("messageUs.jsp?msg=invalid");
		 }
	}

}
