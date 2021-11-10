package com.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project.ConnectionProvider;

/**
 * Servlet implementation class editCategory
 */
@WebServlet("/editCategory")
public class editCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public editCategory() {
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
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		

		try {
			Connection con = ConnectionProvider.getcon();
			Statement st = con.createStatement();
			st.executeUpdate("update category set cname='" + name + "' where cid='" + id + "'");
			response.sendRedirect("admin/allCategoryEditCategory.jsp?msg=done");

		} catch (Exception e) {
			System.out.print("exception occurs" + e);
			response.sendRedirect("admin/allCategoryEditCategory.jsp?msg=invalid");

			//response.sendRedirect("forgotPassword.jsp?msg=invalid");
		}
	}

}
