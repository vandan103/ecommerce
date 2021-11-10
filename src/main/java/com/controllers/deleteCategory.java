package com.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import project.ConnectionProvider;

/**
 * Servlet implementation class deleteCategory
 */
@WebServlet("/deleteCategory")
public class deleteCategory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteCategory() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		String email=session.getAttribute("email").toString();
		String id=request.getParameter("id");
		try{
			Connection con = ConnectionProvider.getcon();
			Statement st = con.createStatement();
			st.executeUpdate("delete from category where cid='"+id+"' ");
			response.sendRedirect("admin/allCategoryEditCategory.jsp?msg=removed");		
		}
		catch(Exception e){
			System.out.print(" error occurs"+e );
			response.sendRedirect("admin/allCategoryEditCategory.jsp?msg=invalid");		

		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
