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
 * Servlet implementation class addNewCategory
 */
@WebServlet("/addNewCategory")
public class addNewCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addNewCategory() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("admin/addNewCategory.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String category=request.getParameter("category");


		try{
		Connection con = ConnectionProvider.getcon();
		PreparedStatement ps = con.prepareStatement("insert into category (cname) values(?)");
		ps.setString(1, category);
		ps.executeUpdate();

		response.sendRedirect("admin/addNewCategory.jsp?msg=done");

		}
		catch(Exception e){
			System.out.println(e);
			response.sendRedirect("admin/addNewCategory.jsp?msg=invalid");

			
		}
	}

}
